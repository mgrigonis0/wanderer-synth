// Wanderer engine: slice detection and slice features. Runs on a worker thread on a mono copy of the file.
//   Hits:  loudness jumps (drums, percussion)
//   Notes: spectral change (melodic material: a new note without a loudness jump)
#pragma once
#include <algorithm>
#include <cmath>
#include <complex>
#include <vector>

#include "params.h"

namespace wnd {

struct Attack { long p; double s; };

struct Analysis {
    // input
    std::vector<float> mono;   // the file, mixed to mono
    double sr = 44100;
    // results
    std::vector<long> starts;
    std::vector<Attack> attacks;

    // ---- attacks: peak per 64-sample block; an attack is a block at least twice as loud (+6 dB) as the ~23 ms
    // before it, louder than -30 dB under the file's peak, at least 60 ms after the previous one ----
    void findAttacks() {
        attacks.clear();
        const int B = 64;
        const long nb = (long)mono.size() / B;
        std::vector<float> env((size_t)std::max<long>(nb, 0));
        float top = 0;
        for (long i = 0; i < nb; i++) {
            float pk = 0;
            for (int j = 0; j < B; j++) pk = std::max(pk, std::fabs(mono[(size_t)(i * B + j)]));
            env[(size_t)i] = pk;
            top = std::max(top, pk);
        }
        const int W = 16;
        const long gap = std::max<long>(1, std::lround(0.06 * sr / B));
        const double floor = top * 0.003, minLvl = top * 0.03;
        double sum = 0;
        long last = -1000000;
        for (long i = 0; i < nb; i++) {
            const double before = i >= W ? sum / W : (i > 0 ? sum / i : 0);
            const double e = env[(size_t)i];
            if (i > 0 && e >= minLvl && e > 2 * (before + floor) && i - last >= gap) {
                attacks.push_back({(i - 1) * B, e / (before + floor)});
                last = i;
            }
            sum += e;
            if (i >= W) sum -= env[(size_t)(i - W)];
        }
    }

    // ---- Hits ----
    std::vector<long> detectHits(double sens, double minSamps) const {
        const int B = 64;
        const long nb = (long)mono.size() / B;
        // two energies per block: the plain signal and a brightened one (first difference), so a hat or a snare
        // on top of a kick's tail still shows as a jump
        std::vector<double> e((size_t)std::max<long>(nb, 0)), eh((size_t)std::max<long>(nb, 0));
        double top = 1e-12, toph = 1e-12, prev = 0;
        for (long i = 0; i < nb; i++) {
            double s = 0, sh = 0;
            for (int j = 0; j < B; j++) {
                double x = mono[(size_t)(i * B + j)], y = x - 0.95 * prev;
                prev = x;
                s += x * x; sh += y * y;
            }
            e[(size_t)i] = s / B; eh[(size_t)i] = sh / B;
            top = std::max(top, e[(size_t)i]); toph = std::max(toph, eh[(size_t)i]);
        }
        const double thr = 14 - 11 * sens;          // rise in dB that counts as a hit
        std::vector<double> d((size_t)std::max<long>(nb, 0), 0.0);
        auto rise = [&](const std::vector<double>& en, double tp, long i) {
            double fast = 0, slow = 0;
            for (int k = 0; k < 4; k++) fast += en[(size_t)(i + k)];
            for (int k = 1; k <= 16; k++) slow += en[(size_t)(i - k)];
            fast /= 4; slow /= 16;
            if (fast < tp * 1e-4) return 0.0;      // quieter than -40 dB under the peak
            const double fl = tp * 1e-6;
            return 10 * std::log10((fast + fl) / (slow + fl));
        };
        for (long i = 16; i + 4 <= nb; i++) d[(size_t)i] = std::max(rise(e, top, i), rise(eh, toph, i));
        std::vector<long> out;
        bool armed = true;
        long last = -1000000000;
        for (long i = 1; i + 1 < nb; i++) {
            const double v = d[(size_t)i];
            if (!armed && v < thr * 0.5) armed = true;
            if (!armed || v < thr) continue;
            bool peak = true;
            for (int k = -3; k <= 3 && peak; k++) if (k && i + k >= 0 && i + k < nb && d[(size_t)(i + k)] > v) peak = false;
            if (!peak) continue;
            long pos = i * B;
            // move to the first block of the rise
            long j = i;
            while (j > 0 && i - j < 8 && e[(size_t)(j - 1)] < e[(size_t)j] * 0.5) j--;
            pos = j * B;
            if (pos - last >= minSamps) { out.push_back(pos); last = pos; armed = false; }
        }
        return out;
    }

    // ---- Notes: spectral flux on log magnitudes, adaptive threshold ----
    std::vector<long> detectNotes(double sens, double minSamps) const {
        const int N = 2048, H = 256;
        const long n = (long)mono.size();
        if (n < N) return {};
        const long nf = (n - N) / H + 1;
        std::vector<double> win(N);
        for (int i = 0; i < N; i++) win[i] = 0.5 - 0.5 * std::cos(2 * M_PI * i / N);
        const int maxBin = std::min(N / 2, (int)std::lround(11000.0 / (sr / N)));
        std::vector<double> prev((size_t)maxBin, 0.0), cur((size_t)maxBin, 0.0);
        std::vector<double> flux((size_t)nf, 0.0), lvl((size_t)nf, 0.0);
        std::vector<std::complex<double>> buf(N);
        double peakLvl = 1e-12;
        for (long t = 0; t < nf; t++) {
            double en = 0;
            for (int i = 0; i < N; i++) {
                double x = mono[(size_t)(t * H + i)];
                en += x * x;
                buf[(size_t)i] = std::complex<double>(x * win[(size_t)i], 0);
            }
            fft(buf);
            double fx = 0;
            for (int k = 1; k < maxBin; k++) {
                cur[(size_t)k] = std::log1p(100 * std::abs(buf[(size_t)k]));
                if (t > 0) fx += std::max(0.0, cur[(size_t)k] - prev[(size_t)k]);
            }
            flux[(size_t)t] = fx / maxBin;
            lvl[(size_t)t] = en / N;
            peakLvl = std::max(peakLvl, lvl[(size_t)t]);
            std::swap(prev, cur);
        }
        double mx = 1e-12;
        for (double v : flux) mx = std::max(mx, v);
        for (double& v : flux) v /= mx;
        const double lambda = 0.25 * (1 - sens) * (1 - sens) + 0.02;
        std::vector<long> out;
        long last = -1000000000;
        const int M = 8;
        std::vector<double> tmp;
        for (long t = 1; t + 1 < nf; t++) {
            const double v = flux[(size_t)t];
            if (lvl[(size_t)t] < peakLvl * 1e-4) continue;   // silence
            bool peak = true;
            for (int k = -3; k <= 3 && peak; k++) if (k && t + k >= 0 && t + k < nf && flux[(size_t)(t + k)] > v) peak = false;
            if (!peak) continue;
            tmp.clear();
            for (long k = std::max(0L, t - M); k <= std::min(nf - 1, t + M); k++) tmp.push_back(flux[(size_t)k]);
            std::nth_element(tmp.begin(), tmp.begin() + tmp.size() / 2, tmp.end());
            const double med = tmp[tmp.size() / 2];
            if (v < med + lambda) continue;
            const long pos = std::max(0L, t * H + N / 2 - H);   // the new frame's half: where the change came in
            if (pos - last >= minSamps) { out.push_back(pos); last = pos; }
        }
        return out;
    }

    // ---- the whole pass: raw cuts -> moved onto attacks -> quiet cuts dropped -> min length ----
    std::vector<long> slice(int method, double sens, double minSamps) {
        const long frames = (long)mono.size();
        std::vector<long> on = method == 0 ? detectHits(sens, minSamps) : detectNotes(sens, minSamps);
        std::sort(on.begin(), on.end());
        // move each cut to the nearest attack within 25 ms
        const double win = 0.025 * sr, mingap = std::max(0.01 * sr, minSamps);
        std::vector<long> st{0};
        size_t k = 0;
        for (long s : on) {
            while (k < attacks.size() && attacks[k].p < s - win) k++;
            long best = s;
            double bd = win + 1;
            for (size_t j = k; j < attacks.size() && attacks[j].p <= s + win; j++) {
                double dd = std::fabs((double)(attacks[j].p - s));
                if (dd < bd) { bd = dd; best = attacks[j].p; }
            }
            if (best - st.back() >= mingap && best > 0 && best < frames - 64) st.push_back(best);
        }
        // cuts that land in near-silence: -40 dB under the loudest cut
        std::vector<double> pk(st.size(), 0.0);
        double top = 0;
        for (size_t i = 0; i < st.size(); i++) {
            const long a = st[i], b = std::min(frames, a + 1024);
            for (long j = a; j < b; j++) pk[i] = std::max(pk[i], (double)std::fabs(mono[(size_t)j]));
            top = std::max(top, pk[i]);
        }
        std::vector<long> kept{0};
        for (size_t i = 1; i < st.size(); i++) if (pk[i] >= top * 0.01) kept.push_back(st[i]);
        if ((int)kept.size() > MAXS) kept.resize(MAXS);
        return kept;
    }

    // opening loudness (RMS of the first 4096 samples) of each slice
    double openingRms(long a, long b) const {
        const long n = std::min(b - a, 4096L);
        if (n <= 0) return 0;
        double s = 0;
        for (long j = a; j < a + n; j++) { double x = mono[(size_t)j]; s += x * x; }
        return std::sqrt(s / n);
    }

    // up to NATK of the strongest attacks inside [a, b) (not its own start), in time order
    void innerAttacks(long a, long b, float* out) const {
        const double edge = 0.02 * sr;
        std::vector<Attack> l;
        for (const Attack& at : attacks) if (at.p > a + edge && at.p < b - edge) l.push_back(at);
        std::sort(l.begin(), l.end(), [](const Attack& x, const Attack& y) { return x.s > y.s; });
        if ((int)l.size() > NATK) l.resize(NATK);
        std::sort(l.begin(), l.end(), [](const Attack& x, const Attack& y) { return x.p < y.p; });
        for (int i = 0; i < NATK; i++) out[i] = i < (int)l.size() ? (float)l[(size_t)i].p : (float)a;
    }

    static void fft(std::vector<std::complex<double>>& a) {
        const size_t n = a.size();
        for (size_t i = 1, j = 0; i < n; i++) {
            size_t bit = n >> 1;
            for (; j & bit; bit >>= 1) j ^= bit;
            j ^= bit;
            if (i < j) std::swap(a[i], a[j]);
        }
        for (size_t len = 2; len <= n; len <<= 1) {
            const double ang = -2 * M_PI / (double)len;
            const std::complex<double> wl(std::cos(ang), std::sin(ang));
            for (size_t i = 0; i < n; i += len) {
                std::complex<double> w(1, 0);
                for (size_t j = 0; j < len / 2; j++) {
                    const std::complex<double> u = a[i + j], v = a[i + j + len / 2] * w;
                    a[i + j] = u + v;
                    a[i + j + len / 2] = u - v;
                    w *= wl;
                }
            }
        }
    }
};

}  // namespace wnd
