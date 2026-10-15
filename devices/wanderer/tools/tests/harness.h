// Test harness: the real engine (player + model) with a fake host that "loads" synthetic audio files,
// runs slicing synchronously and keeps the saved state. Time advances in 64-sample blocks.
#pragma once
#include <cmath>
#include <cstdio>
#include <functional>
#include <map>
#include <memory>
#include <string>
#include <vector>

#include "../../source/engine/model.h"

namespace test {
using namespace wnd;

struct Audio { std::vector<float> data; int chans = 1; double sr = 44100; long frames() const { return (long)data.size() / chans; } };

// ---- synthetic files ------------------------------------------------------------------------------
inline uint32_t lcg(uint32_t& s) { s = s * 1664525u + 1013904223u; return s; }
inline double noise(uint32_t& s) { return (lcg(s) >> 8) / double(1 << 24) * 2 - 1; }

// a drum loop: kick / snare / hat pattern at `bpm`, `bars` bars; returns the true hit positions
inline Audio drumLoop(double bpm, int bars, std::vector<long>* truth, uint32_t seed = 7) {
    Audio a; a.sr = 44100; a.chans = 2;
    const double spb = 60.0 / bpm * a.sr;          // samples per beat
    const long n = (long)(spb * 4 * bars);
    a.data.assign((size_t)n * 2, 0.f);
    uint32_t s = seed;
    const char* pat = "K.h.S.h.K.hKS.hh";            // 16 sixteenths
    for (int b = 0; b < bars; b++)
        for (int i = 0; i < 16; i++) {
            char c = pat[i];
            if (c == '.') continue;
            const long st = (long)((b * 16 + i) * spb / 4);
            if (truth) truth->push_back(st);
            const double amp = c == 'K' ? 0.9 : (c == 'S' ? 0.7 : 0.35);
            for (long j = 0; j < (long)(0.25 * a.sr) && st + j < n; j++) {
                const double t = j / a.sr;
                double v;
                if (c == 'K') v = std::sin(2 * M_PI * (50 + 120 * std::exp(-t * 40)) * t) * std::exp(-t * 12);
                else if (c == 'S') v = (0.6 * noise(s) + 0.4 * std::sin(2 * M_PI * 190 * t)) * std::exp(-t * 18);
                else v = noise(s) * std::exp(-t * 60);
                a.data[(size_t)(st + j) * 2] += (float)(v * amp);
                a.data[(size_t)(st + j) * 2 + 1] += (float)(v * amp * 0.95);
            }
        }
    return a;
}

// legato notes (a sine-ish tone that changes pitch without a loudness jump); returns note starts
inline Audio legato(double noteSec, int notes, std::vector<long>* truth) {
    Audio a; a.sr = 44100; a.chans = 1;
    const long per = (long)(noteSec * a.sr), n = per * notes;
    a.data.assign((size_t)n, 0.f);
    static const int semis[] = {0, 3, 7, 5, 10, 8, 12, 7, 3, 5, 0, -2, 2, 9, 4, 11};
    double phs = 0;
    for (int k = 0; k < notes; k++) {
        if (truth) truth->push_back(k * per);
        const double f = 220 * std::pow(2.0, semis[k % 16] / 12.0);
        for (long j = 0; j < per; j++) {
            phs += 2 * M_PI * f / a.sr;
            const double v = 0.5 * std::sin(phs) + 0.2 * std::sin(2 * phs) + 0.1 * std::sin(3 * phs);
            a.data[(size_t)(k * per + j)] = (float)(v * 0.6);
        }
    }
    return a;
}

inline Audio sine(double f, double sec, double amp = 0.5) {
    Audio a; a.sr = 44100; a.chans = 1;
    const long n = (long)(sec * a.sr);
    a.data.resize((size_t)n);
    for (long i = 0; i < n; i++) a.data[(size_t)i] = (float)(amp * std::sin(2 * M_PI * f * i / a.sr));
    return a;
}

// ---- the fake host --------------------------------------------------------------------------------
struct Rig;
struct TestHost : Host {
    Rig* rig = nullptr;
    std::vector<Out> outs;
    StateDoc saved;
    int saves = 0;
    void ui(const Out& o) override { outs.push_back(o); if (outs.size() > 20000) outs.erase(outs.begin(), outs.begin() + 10000); }
    void loadBuffer(int f, const std::string& path) override;
    void clearBuffer(int f) override;
    void analyze(int f, int gen, const SliceJob& job) override;
    void askRelink(int) override {}
    void saveState() override;
    bool fileExists(const std::string& path) override;
};

struct Rig {
    std::unique_ptr<Player> pl{new Player()};
    TestHost host;
    std::unique_ptr<Model> m;
    std::map<std::string, Audio> disk;      // path -> audio
    Audio buf[NF];                          // what each slot's buffer holds
    double sr = 44100, bpm = 120;
    double phase = 0;                       // bar phase
    long sample = 0;
    double ms = 0;
    std::vector<float> L, R;                // everything rendered
    bool keep = true;
    std::vector<Report> seen;               // (copies of the R_PLAYED reports would be consumed by the model)

    Rig() { host.rig = this; m.reset(new Model(pl.get(), &host)); m->noState(); }

    void msg(const std::string& sel, std::vector<double> nums = {}, std::string s = "") {
        std::vector<Model::Atom> a;
        for (double d : nums) { Model::Atom x; x.d = d; a.push_back(x); }
        if (!s.empty()) { Model::Atom x; x.num = false; x.s = s; a.push_back(x); }
        m->message(sel, a);
    }
    void play(bool on) { msg("playing", {on ? 1.0 : 0.0}); }
    void tempo(double b) { bpm = b; msg("tempo", {b}); }

    // run for `sec` seconds
    void run(double sec) {
        const int B = 64;
        const long n = (long)(sec * sr);
        std::vector<float> ph(B), l(B), r(B);
        for (long done = 0; done < n; done += B) {
            const double inc = bpm / 60.0 / 4.0 / sr;   // bars per sample
            for (int i = 0; i < B; i++) {
                ph[(size_t)i] = (float)phase;
                if (pl->g[G_PLAYING] > 0.5 || true) { phase += inc; if (phase >= 1) phase -= 1; }
            }
            for (int f = 0; f < NF; f++) {
                Source& s = pl->src[f];
                s = Source();
                if (buf[f].frames() > 1) { s.data = buf[f].data.data(); s.frames = buf[f].frames(); s.chans = buf[f].chans; s.sr = buf[f].sr; }
            }
            pl->process(ph.data(), l.data(), r.data(), B, sr);
            if (keep) { L.insert(L.end(), l.begin(), l.end()); R.insert(R.end(), r.begin(), r.end()); }
            sample += B;
            const double nms = sample / sr * 1000;
            if (nms - ms >= 15) { ms = nms; m->tick(ms); }
        }
    }
    void load(int slot, const std::string& path, const Audio& a) {
        disk[path] = a;
        m->select(slot);
        m->drop(path);
        run(0.2);
    }
};

inline void TestHost::loadBuffer(int f, const std::string& path) {
    auto it = rig->disk.find(path);
    if (it == rig->disk.end()) { rig->m->bufferLoaded(f, false, 0, 0); return; }
    rig->buf[f] = it->second;
    rig->m->bufferLoaded(f, true, it->second.frames(), it->second.sr);
}
inline void TestHost::clearBuffer(int f) { rig->buf[f] = Audio(); }
inline void TestHost::analyze(int f, int gen, const SliceJob& job) {
    const Audio& a = rig->buf[f];
    Analysis an;
    an.sr = a.sr;
    an.mono.resize((size_t)a.frames());
    for (long i = 0; i < a.frames(); i++) {
        double s = 0;
        for (int c = 0; c < a.chans; c++) s += a.data[(size_t)(i * a.chans + c)];
        an.mono[(size_t)i] = (float)(s / a.chans);
    }
    SliceResult r = runSliceJob(an, job);
    rig->m->analysisDone(f, gen, r);
}
inline void TestHost::saveState() { saves++; rig->m->writeState(saved); }
inline bool TestHost::fileExists(const std::string& path) { return rig->disk.count(path) > 0; }

// ---- measurements ------------------------------------------------------------------------------
// clicks: a jump in the second difference far above what the signal's own content allows
struct ClickStats { long count = 0; double worst = 0; long worstAt = -1; };
inline ClickStats findClicks(const std::vector<float>& x, double ratio = 0.02, double absFloor = 2e-3) {
    ClickStats cs;
    const size_t n = x.size();
    // running peak over ~10 ms
    double pk = 0;
    for (size_t i = 2; i < n; i++) {
        pk = std::max(pk * 0.9995, (double)std::fabs(x[i]));
        const double d2 = std::fabs(x[i] - 2 * x[i - 1] + x[i - 2]);
        const double lim = std::max(absFloor, ratio * std::max(pk, 0.05));
        if (d2 > lim) {
            cs.count++;
            if (d2 / lim > cs.worst) { cs.worst = d2 / lim; cs.worstAt = (long)i; }
        }
    }
    return cs;
}

inline int expect(bool ok, const char* what) {
    std::printf("  [%s] %s\n", ok ? " ok " : "FAIL", what);
    return ok ? 0 : 1;
}

}  // namespace test
