// Wanderer engine: the player. Runs on the audio thread only. Everything it plays arrives as commands
// (see types.h); everything the model must know comes back as reports. No allocation, no locks.
#pragma once
#include <cmath>
#include <cstring>

#include "types.h"

namespace wnd {

struct Voice {
    bool act = false, kill = false, isg = false;
    double pos = 0, a = 0, b = 0, la = 0, lb = 0;
    int dir = 1;
    double age = 0, gl = 0, at = 0, dc = 0;
    double gain = 0, pl = 0, pr = 0, wid = 1;
    double semi = 0, pe = 0, pd = 1, gfrom = 0, gt = 0;
    double cut = 20000, res = 0, fe = 0, fd = 1, trk = 0;
    int ft = 0;
    double duck = 1;
    int ddir = 0;
    double scan = 1, gsz = 1000, gj = 0, gsp = 0, seed = 0;
    int gd = 1;
    double s1l = 0, s2l = 0, s1r = 0, s2r = 0;
    double gph[4] = {}, gst[4] = {}, grt[4] = {}, gln[4] = {1, 1, 1, 1};
    bool buzz = false;
    bool gal[4] = {};
    // control rate (every CR samples)
    int crc = 0;
    double ratio = 1, sm = 0, fg = 0, fk = 2, fa1 = 1, fa2 = 0, fa3 = 0;
    bool filt = false;
};

struct FilePlayer {
    ParamSet A, B;
    const SliceTable* st = nullptr;
    Pattern* pat = nullptr;
    Pattern* pending = nullptr;   // swapped in at the start of the next pass
    bool lock = false, mute = false;
    double flen = 1;              // file length in bars (Position order)
    float dw[6] = {1, 1, 1, 1, 1, 1};
    Voice v[NVOICE];
    // free clock
    double nextgrid = 0, firetime = 0, lastlen = 0.0625;
    int lastslice = -1;
    double lastsemis = 0;
    bool nudge = false;
    // locked playback
    bool waslock = false, seek = true;
    double lpass = -1, lastlq = -1;
    int lptr = 0;
    // repeats
    int rn = 0, ri = 0, rslice = -1, rstepv = 0, rtotal = 1;
    double rpt[16] = {}, rgap[16] = {};
    double rseed = 0, rfade = 0;
    float O[NK] = {}, OP[NK] = {}, WK[NK] = {};
    double mgain = 1;
    Rng rng;
};

// ---------------------------------------------------------------------------------------------------
// output dynamics: lookahead compressor (ported from the 10-12e device), then the Limit stage:
// drive into a 2 ms lookahead limiter with a -0.3 dB ceiling, optional soft clipping, a soft knee as the last guard
struct Dynamics {
    static constexpr int DL = 8192, LL = 512;
    float dlL[DL] = {}, dlR[DL] = {};
    int w = 0;
    double grs = 0, amtS = 0;
    float lL[LL] = {}, lR[LL] = {}, rawL[LL] = {}, rawR[LL] = {}, pk[LL] = {};
    int lw = 0;
    double genv = 1, drv = 1, clip = 0, mx = 1, limGr = 0;
    void reset() {
        std::memset(dlL, 0, sizeof dlL); std::memset(dlR, 0, sizeof dlR); w = 0; grs = 0;
        std::memset(lL, 0, sizeof lL); std::memset(lR, 0, sizeof lR); std::memset(rawL, 0, sizeof rawL);
        std::memset(rawR, 0, sizeof rawR); std::memset(pk, 0, sizeof pk); lw = 0; genv = 1; limGr = 0;
    }
};

class Player {
public:
    FilePlayer fp[NF];
    Source src[NF];
    double g[NGLOBAL] = {};

    Ring<Cmd, 8192> cmds;          // main -> audio
    Ring<Report, 8192> reps;       // audio -> main
    std::atomic<double> posNow{0}, tempoNow{120};
    std::atomic<float> grNow{0}, lvlL{0}, lvlR{0};
    std::atomic<int> playingNow{0};

    Player() {
        for (int f = 0; f < NF; f++) {
            fp[f].A.reset();
            fp[f].B = fp[f].A;
            fp[f].rng.reseed(1 + f * 7919 + 12345);
        }
        g[G_CHAOS] = 50; g[G_MACRO] = 100;   // every Allow switch starts off
        g[G_QHIT] = 2; g[G_STEREO] = 100; g[G_VOLUME] = 0; g[G_LIMIT] = 10; g[G_TEMPO] = 120; g[G_LOCKLEN] = 2;
        volS = 1; stereoS = 1;
    }

    // ---- per block ------------------------------------------------------------------------------
    // phase: bar phase 0..1 (phasor~ 1n @lock 1), one value per sample. outL/outR: n samples.
    void process(const float* phase, float* outL, float* outR, int n, double sr) {
        this->sr = sr;
        smooth20 = 1 - std::exp(-1 / (0.02 * sr));
        drainCommands();
        const bool playing = g[G_PLAYING] > 0.5;
        const int lan = (int)std::floor(LOOKAHEAD_S * sr + 0.5);
        double peakL = 0, peakR = 0;
        for (int i = 0; i < n; i++) {
            // ---- song position (whole notes from the play start), the slide ramp ----
            const double ph = phase ? phase[i] : 0;
            double d = 0;
            if (playing) {
                if (!wasplayT) { P = ph; }
                else {
                    d = ph - prevph;
                    if (d < -0.5) d += 1;
                    if (d > 0 && d < 0.01) { P += d; wnps = d; }
                    else d = 0;
                }
            }
            const double sh = (playing && wasplayT) ? lan * wnps : 0;
            prevph = ph;
            wasplayT = playing;
            if (sliding) {
                double adv = playing ? d : (wnps > 0 ? wnps : 0.5 / sr);
                sl = std::min(1.0, sl + adv / std::max(1e-4, sldur));
                if (sl >= 1) commitSlide();
            }
            const double pos = P + sh;
            if (playing && !wasplayF) { Report r; r.type = R_START; r.t = pos; report(r); }

            double L = 0, R = 0;
            for (int f = 0; f < NF; f++) {
                FilePlayer& F = fp[f];
                if (!F.st && !anyActive(F)) continue;
                tickFile(f, F, pos, playing);
                renderFile(f, F, L, R);
            }
            wasplayF = playing;
            // ---- master: stereo width, compressor (5 ms lookahead), volume, limiter ----
            stereoS += (g[G_STEREO] / 100.0 - stereoS) * smooth20;
            double m = (L + R) * 0.5, s = (L - R) * 0.5 * stereoS;
            L = m + s; R = m - s;
            compress(L, R);
            double vt = g[G_VOLUME] <= -69.9 ? 0 : dbtoa(g[G_VOLUME]);
            volS += (vt - volS) * smooth20;
            L *= volS; R *= volS;
            limit(L, R);
            outL[i] = (float)L; outR[i] = (float)R;
            peakL = std::max(peakL, std::fabs(L)); peakR = std::max(peakR, std::fabs(R));
        }
        posNow.store(P);
        if (wnps > 0) tempoNow.store(wnps * sr * 240.0);
        grNow.store((float)(dyn.grs + dyn.limGr));
        lvlL.store((float)std::max<double>(peakL, lvlL.load() * 0.85));
        lvlR.store((float)std::max<double>(peakR, lvlR.load() * 0.85));
        playingNow.store(playing ? 1 : 0);
    }

    double sr = 44100;
    double P = 0, prevph = 0, wnps = 0;
    bool wasplayT = false, wasplayF = false;
    double sl = 0, sldur = 0;
    double minRepGapMs = 1e9, minLoopMs = 1e9;   // measured by the tests
    bool sliding = false;

private:
    Dynamics dyn;
    double volS = 1, stereoS = 1;
    double smooth20 = 1 - std::exp(-1 / (0.02 * 44100));
    static constexpr int CR = 8;   // voice control rate (samples)

    static bool anyActive(const FilePlayer& F) {
        for (int k = 0; k < NVOICE; k++) if (F.v[k].act) return true;
        return false;
    }

    void report(const Report& r) { reps.push(r); }
    void garbage(int type, void* p) {
        if (!p) return;
        Report r; r.type = type; r.ptr = p;
        if (!reps.push(r)) { /* the main thread is behind: leak rather than free on the audio thread */ }
    }

    // ---- commands ------------------------------------------------------------------------------
    void drainCommands() {
        Cmd c;
        while (cmds.pop(c)) {
            if (c.f < 0 || c.f >= NF) c.f = 0;
            FilePlayer& F = fp[c.f];
            switch (c.type) {
                case C_PARAMS: {
                    ParamSet* ps = (ParamSet*)c.ptr;
                    if (c.i & 1) F.A = *ps;
                    if (c.i & 2) F.B = *ps;
                    garbage(R_GARBAGE_PARAMS, ps);
                    break;
                }
                case C_PARAM: {
                    int p = c.i;
                    if (p < 0 || p >= NP) break;
                    F.A.b[p] = F.B.b[p] = c.a;
                    if (p < NK) { F.A.r[p] = F.B.r[p] = c.b; F.A.m[p] = F.B.m[p] = (unsigned char)c.c; }
                    break;
                }
                case C_SLICES:
                    garbage(R_GARBAGE_SLICES, (void*)F.st);
                    F.st = (const SliceTable*)c.ptr;
                    F.lastslice = -1;
                    break;
                case C_TIMING:
                    F.flen = std::max(0.25f, c.a);
                    for (int k = 0; k < 6; k++) F.dw[k] = c.v[k];
                    break;
                case C_PATTERN: {
                    Pattern* np = (Pattern*)c.ptr;
                    if (c.i == 1 && F.pat) { garbage(R_GARBAGE_PATTERN, F.pending); F.pending = np; }
                    else if (c.i == 2 && F.pat && np && np->cnt == F.pat->cnt) {   // Mutate: same hits, new draws; keeps its place
                        garbage(R_GARBAGE_PATTERN, F.pat); F.pat = np;
                    }
                    else { garbage(R_GARBAGE_PATTERN, F.pat); garbage(R_GARBAGE_PATTERN, F.pending); F.pending = nullptr; F.pat = np; F.seek = true; }
                    break;
                }
                case C_LOCK: F.lock = c.i != 0; break;
                case C_MUTE: F.mute = c.i != 0; break;
                case C_NUDGE: F.nudge = true; break;
                case C_SILENCE:
                    for (int k = 0; k < NVOICE; k++) if (F.v[k].act) { F.v[k].kill = true; F.v[k].ddir = -1; }
                    F.rn = F.ri = 0;
                    break;
                case C_GLOBAL:
                    if (c.i >= 0 && c.i < NGLOBAL) g[c.i] = c.a;
                    break;
                case C_SLIDE:
                    if (sliding) commitSlide();
                    sldur = c.a;
                    if (c.a > 0) { sliding = true; sl = 1e-6; }
                    else { sl = 0; sliding = false; for (int f = 0; f < NF; f++) fp[f].A = fp[f].B; }
                    break;
                case C_SLICEON:
                    if (F.st && c.i >= 0 && c.i < F.st->ns) const_cast<SliceTable*>(F.st)->en[c.i] = c.a > 0.5f;
                    break;
                case C_SLICEW:
                    if (F.st && c.i >= 0 && c.i < F.st->ns) const_cast<SliceTable*>(F.st)->w[c.i] = c.a;
                    break;
            }
        }
    }

    void commitSlide() {
        for (int f = 0; f < NF; f++) fp[f].A = fp[f].B;
        sl = 0; sliding = false;
    }

    // ---- slice choice. mode: 0 random, 1 walk, 2 weighted, 3 position -----------------------------
    int choose(const SliceTable* st, int mode, double spread, double wstr, int prev, double u1, double u2, double ph) const {
        if (!st || st->ns <= 0) return -1;
        const int ns = st->ns;
        int cnt = 0, post = 0;
        double tot = 0;
        for (int i = 0; i < ns; i++) {
            if (st->en[i]) { cnt++; tot += 1 + (st->w[i] - 1) * wstr; }
            if (st->pos[i] <= ph) post = i;
        }
        if (cnt == 0) return -1;
        if (mode == 0 || mode == 2) {
            int kk = (int)std::floor(u1 * cnt);
            double x = u1 * tot, acc = 0;
            for (int i = 0; i < ns; i++) {
                if (!st->en[i]) continue;
                if (mode == 0) { if (kk-- == 0) return i; }
                else { acc += 1 + (st->w[i] - 1) * wstr; if (acc >= x) return i; }
            }
            for (int i = ns - 1; i >= 0; i--) if (st->en[i]) return i;
            return -1;
        }
        int target;
        if (mode == 1) {
            int mx = std::max(1, (int)std::floor(spread * ns * 0.5 + 0.5));
            int sp = (int)std::floor((u1 * 2 - 1) * mx + 0.5);
            if (sp == 0) sp = u2 < 0.5 ? -1 : 1;
            target = wrapi(prev + sp, ns);
        } else {
            int pt = post;
            if (u2 < spread) pt = post + (int)std::floor((u1 * 2 - 1) * 2.5 + 0.5);
            target = wrapi(pt, ns);
        }
        for (int d = 0; d < ns; d++) {
            int ia = wrapi(target + d, ns), ib = wrapi(target - d, ns);
            if (st->en[ia]) return ia;
            if (st->en[ib]) return ib;
        }
        return -1;
    }
    static int wrapi(int x, int n) { return ((x % n) + n) % n; }

    static double swingoff(double tg, double sw) {
        double x = tg * 16, k = std::floor(x + 0.5);
        if (std::fabs(x - k) < 1e-4 && ((long)k % 2 + 2) % 2 == 1) return sw / 48;
        return 0;
    }

    // ---- the clock of one file, one sample ------------------------------------------------------
    void tickFile(int f, FilePlayer& F, double pos, bool playing) {
        const double sr = this->sr;
        if (wnps <= 0) wnps = 0.5 / sr;
        const bool started = playing && !wasplayF;
        const bool stopped = !playing && wasplayF;
        const double dp = pos - lastPos[f];
        const bool backjump = playing && dp < -0.001;
        lastPos[f] = pos;
        bool seek = F.seek;
        F.seek = false;
        if (started || backjump) {
            F.nextgrid = std::ceil(pos - 0.03125);
            F.firetime = F.nextgrid;
            F.rn = F.ri = 0;
            seek = true;
        }
        if (stopped) {
            F.rn = F.ri = 0;
            for (int k = 0; k < NVOICE; k++) if (F.v[k].act) { F.v[k].kill = true; F.v[k].ddir = -1; }
        }
        if (playing && (F.firetime > pos + 2 || std::isnan(F.firetime))) {   // watchdog: never a wait longer than any real wait
            F.nextgrid = (std::floor(pos * 16) + 1) / 16;
            F.firetime = F.nextgrid;
        }
        // ---- Free / Lock ----
        const bool lockon = F.lock && F.pat;
        if (lockon && !F.waslock) seek = true;
        if (!lockon && F.waslock) {
            F.nextgrid = (std::floor(pos * 16) + 1) / 16;
            F.firetime = F.nextgrid;
        }
        F.waslock = lockon;

        const double qa = clampd(g[G_QUANT] / 100.0, 0, 1);
        double qgh = 0.03125;
        if (g[G_QHIT] < 2.5) qgh = 0.0625;
        if (g[G_QHIT] < 1.5) qgh = 0.125;
        if (g[G_QHIT] < 0.5) qgh = 0.25;
        const bool qtr = g[G_TRIP] > 0.5;
        const double swb = mixd(F.A.b[SWING], F.B.b[SWING], sl) * (1 - qa);   // Quant takes Swing out: 100 % = straight

        int hit = 0;          // 0 none, 1 free, 2 locked, 3 repeat
        int hslice = -1, hk = 0;
        double hgrid = pos, hseed = 0, hurep = 1;
        const Hit* lh = nullptr;

        // ---- locked playback ----
        const bool lplay = lockon && playing;
        if (lplay) {
            Pattern* pt = F.pat;
            const double lkl = std::max(0.25, pt->len);
            const double lp = std::floor(pos / lkl), lph = pos - lp * lkl;
            if (!seek && lp != F.lpass) {
                if (F.pending) {   // a mutated or recalled loop waiting for the pass to end
                    garbage(R_GARBAGE_PATTERN, F.pat);
                    F.pat = F.pending; F.pending = nullptr; pt = F.pat;
                }
                Report r; r.type = R_PASS; r.f = f; r.t = pos; report(r);
                F.lpass = lp; F.lptr = 0;
            }
            if (seek) {
                F.lpass = lp; F.lptr = 0; F.lastlq = -1;
                const double stol = started ? 0.03125 : 0;   // Live reports Play a few ms late: the downbeat still plays
                while (F.lptr < pt->cnt && pt->hits[F.lptr].ph < lph - stol) F.lptr++;
            }
            const double lkl2 = std::max(0.25, pt->len);
            if (F.lptr < pt->cnt) {
                const Hit& h = pt->hits[F.lptr];
                const double leph = h.ph;
                const double qt3 = qgh * 2 / 3;
                const double lqs = std::floor(leph / qgh + 0.5) * qgh, lqt = std::floor(leph / qt3 + 0.5) * qt3;
                const double lwt = std::max<double>(h.wait, 1e-6);
                const double l3 = std::log2(lwt * 3);
                const bool ltri = qtr && std::fabs(l3 - std::floor(l3 + 0.5)) < 0.01;
                double lqn = ltri ? lqt : lqs;
                const double lqprev = F.lptr == 0 ? -1 : F.lastlq;
                const double lna = (std::floor(lqprev / qgh + 1e-6) + 1) * qgh, lnb = (std::floor(lqprev / qt3 + 1e-6) + 1) * qt3;
                lqn = std::max(lqn, ltri ? lnb : lna);                       // two hits on one grid line: the later one moves on
                const double lfr = leph + swingoff(leph, swb), lfq = lqn + swingoff(lqn, swb);
                const double leoff = std::min(lkl2 - 1e-4, mixd(lfr, lfq, qa));
                if (leoff <= lph) {
                    F.lastlq = lqn;
                    hit = 2; lh = &h;
                    hslice = h.slice;
                    hgrid = leph + std::floor(pos / lkl2) * lkl2;
                    hurep = h.rep; hseed = h.seed;
                    F.lptr++;
                }
            }
        }

        // ---- Random pressed: the free clock plays on the next 1/16 line ----
        if (F.nudge) {
            F.nudge = false;
            if (!lockon && playing) {
                double rtg = (std::floor(pos * 16 + 1e-6) + 1) / 16;
                if (rtg < F.firetime) { F.nextgrid = rtg; F.firetime = rtg; }
            }
        }
        // ---- free clock ----
        if (!lockon && playing && hit == 0 && pos >= F.firetime) {
            hit = 1;
            hgrid = F.nextgrid;
            hurep = F.rng.u();
            hseed = std::floor(F.rng.u() * 100000) / 100;
        }
        // ---- pending repeats ----
        if (hit == 0 && playing && F.ri < F.rn && pos >= F.rpt[F.ri]) {
            hit = 3; hk = F.ri + 1; hseed = F.rseed; F.ri++;
        }
        if (hit) trigger(f, F, hit, hslice, hk, hgrid, hseed, hurep, lh, pos, swb, qa, qgh, qtr);
    }

    // ---- one hit: resolve the parameters, pick the slice, start a voice, plan the next wait ----
    void trigger(int f, FilePlayer& F, int hit, int hslice, int hk, double hgrid, double hseed, double hurep,
                 const Hit* lh, double pos, double swb, double qa, double qgh, bool qtr) {
        const double sr = this->sr;
        const double cs = g[G_CHAOS] / 50.0;
        const double mkfull = clampd(g[G_MACRO], 0, 175) / 100.0, mkrisk = std::min(mkfull, 1.25), mkone = std::min(mkfull, 1.0);
        double HV[NP];
        double pitchoff = 0, pfile = 0;
        for (int p = 0; p < NK; p++) {
            const ParamDef& q = PDEF[p];
            double bb = mixd(F.A.b[p], F.B.b[p], sl), rr = mixd(F.A.r[p], F.B.r[p], sl);
            double km = 1;
            if (q.mkind > 0) km = q.mkind == 3 ? mkone : (q.mkind == 2 ? mkrisk : mkfull);
            if (q.mbase) bb = clampd(q.mclean + (bb - q.mclean) * km, 0, 1);
            rr = clampd(rr * km, 0, 1);
            const int md = F.rng.u() < sl ? F.B.m[p] : F.A.m[p];
            const double u = F.rng.u() * 2 - 1;
            double oo = 0;
            if (md > 0) {
                if (hit == 1) {
                    if (md > 1) { oo = clampd(F.WK[p] + u * 0.35, -1, 1); F.WK[p] = (float)oo; }
                    else oo = u;
                } else if (hit == 2) oo = lh ? lh->off[p] : 0;
                else oo = F.OP[p];
            }
            F.O[p] = (float)oo;
            const double nn = clampd(bb + oo * rr * cs, 0, 1);
            HV[p] = denormOf(p, nn);
            if (p == PITCH) { pfile = denormOf(p, bb); pitchoff = oo * rr * cs * 48; }
        }
        for (int p = NK; p < NP; p++) HV[p] = F.rng.u() < sl ? F.B.b[p] : F.A.b[p];

        double hvSpread = HV[SPREAD] / 100, hvWstr = HV[WSTR] / 100, hvStart = HV[START] / 100, hvLen = HV[LENGTH] / 100;
        double hvRev = HV[REV] / 100, hvLoop = HV[LOOP] / 100, hvPenv = HV[PENV], hvPdec = HV[PDEC], hvGlide = HV[GLIDE];
        double hvAtt = HV[ATT], hvDec = HV[DEC], hvGate = HV[GATE] / 100, hvVol = HV[VOL], hvPan = HV[PAN] / 100;
        double hvWidth = HV[WIDTH] / 100, hvCut = HV[CUT], hvRes = HV[RES] / 100, hvFenv = HV[FENV] / 100, hvFdec = HV[FDEC];
        double hvTrack = HV[TRACK] / 100, hvRchance = HV[RCHANCE] / 100, hvRcount = HV[RCOUNT], hvRshape = HV[RSHAPE] / 100;
        double hvRfade = HV[RFADE] / 100, hvRstep = HV[RSTEP], hvGsize = HV[GSIZE], hvGdens = HV[GDENS], hvScan = HV[SCAN] / 100;
        double hvGjit = HV[GJIT] / 100, hvGspread = HV[GSPREAD];
        int hvTrip = HV[TRIP] > 0.5 && g[G_TRIP] > 0.5, hvDot = HV[DOT] > 0.5 && g[G_DOT] > 0.5, hvDerived = HV[DERIVED] > 0.5;
        int hvSmode = (int)std::lround(HV[SMODE]), hvEngine = (int)std::lround(HV[ENGINE]), hvFtype = (int)std::lround(HV[FTYPE]);
        int hvRspace = (int)std::lround(HV[RSPACE]);
        const bool ptch = g[G_PTCH] > 0.5;
        if (!ptch) { hvPenv = 0; hvGlide = 0; hvGspread = 0; }    // Pitch off: no pitch change of any kind (global Pitch still applies)
        if (g[G_REV] < 0.5) hvRev = 0;
        if (g[G_REP] < 0.5) hvLoop = 0;            // Allow Rep off: no loops (and no bursts, below)
        if (hvRspace == 2 && g[G_TRIP] < 0.5) hvRspace = 0;
        // global Length: + fuller (Start to 0, Length, Gate and release toward full), - shorter
        const double lgk = clampd(g[G_GLEN] / 100, -1, 1), lgp = std::max(lgk, 0.0), lgn = std::min(lgk, 0.0);
        hvStart *= 1 - lgp;
        hvLen = (hvLen + (1 - hvLen) * lgp) * (1 + lgn * 0.85);
        hvGate = (hvGate + (1 - hvGate) * lgp) * (1 + lgn * 0.85);
        hvDec = hvDec * (1 + lgp * 3) * (1 + lgn * 0.75);
        // per-hit filter type (Type var), seeded so Lock replays it
        const double ftv = clampd(mixd(F.A.b[FTVAR], F.B.b[FTVAR], sl) * mkfull, 0, 1);
        const double ftu = hash2(hseed, 17.3), ftsel = hash2(hseed, 23.9), ftc = hash2(hseed, 31.7);
        int ftr = ftsel < 0.7 ? 0 : (ftsel < 0.85 ? 1 : 2);
        double tcut = ftr == 0 ? 3000 * std::pow(6.6667, ftc) : (ftr == 1 ? 40 * std::pow(37.5, ftc) : 500 * std::pow(8.0, ftc));
        const bool ftvary = ftu < ftv;
        if (ftvary) { hvCut = tcut; hvFtype = ftr; }
        // Macro on the sound-character menus: a per-hit coin, seeded
        if (!(hash2(hseed, 71.3) < mkone)) hvEngine = 0;
        if (!(hash2(hseed, 77.9) < mkone || ftvary)) hvFtype = 0;
        if (!ftvary) {   // cutoff blends toward the clean value of the type this hit uses
            double ncur = std::pow(clampd((hvCut - 20) / 19980, 0, 1), 1.0 / 3);
            double ncl = hvFtype == 0 ? 1 : (hvFtype == 1 ? 0 : ncur);
            double nnew = clampd(ncl + (ncur - ncl) * mkrisk, 0, 1);
            hvCut = 20 + 19980 * std::pow(nnew, 3);
        }
        // pitch: file pitch + per-hit offset on the scale; repeats step through the scale
        const int mask = SCALE_MASK[(int)clampd(std::floor(g[G_GSCALE] + 0.5), 0, NSCALE - 1)];
        const int pq = quantToScale(pitchoff, mask);
        const int qdeg = degreeOf(pq, mask);
        const int rsteps = hit == 3 ? hk * F.rstepv : 0;
        const int rq = noteOfDegree(qdeg + rsteps, mask);

        // ---- slice ----
        const SliceTable* st = F.st;
        const int ns = st ? st->ns : 0;
        const double fph = (hgrid - std::floor(hgrid / F.flen) * F.flen) / F.flen;
        if (hit == 1) hslice = choose(st, hvSmode, hvSpread, hvWstr, F.lastslice, F.rng.u(), F.rng.u(), fph);
        else if (hit == 3) hslice = F.rslice;
        if (hslice >= 0 && (hslice >= ns || !st->en[hslice]))
            hslice = choose(st, 1, 0, 1, hslice, hash2(hseed, 9.1), 0.5, fph);
        // global density below 0: free hits may become rests (the rhythm keeps its timing)
        const double restp = clampd(-g[G_GDENS] / 100, 0, 1) * 0.85;
        if (hit == 1 && hash2(hseed, 61.7) < restp) hslice = -1;

        // ---- free hits: the model keeps a record of them (Lock captures from it) ----
        if (hit == 1) {
            Report r; r.type = R_FREEHIT; r.f = f; r.t = hgrid; r.slice = hslice;
            r.hit.ph = (float)hgrid; r.hit.slice = (short)hslice;
            std::memcpy(r.hit.off, F.O, sizeof F.O);
            r.hit.rep = (float)hurep; r.hit.seed = (float)hseed; r.hit.wait = (float)F.lastlen;
            report(r);
        }
        // ---- primary hits plan their repeats ----
        const bool prim = hit == 1 || hit == 2;
        const int rcnt = (int)clampd(std::floor(hvRcount + 0.5), 1, 16);
        if (prim) {
            std::memcpy(F.OP, F.O, sizeof F.O);
            F.rn = 0; F.ri = 0;
            F.rslice = hslice; F.rseed = hseed;
            F.rstepv = (int)std::floor(hvRstep + 0.5);
            F.rfade = hvRfade; F.rtotal = rcnt;
        }
        const bool dorep = prim && g[G_REP] > 0.5 && hurep < hvRchance && hslice >= 0;
        double spc = hvRspace == 0 ? 0.03125 : (hvRspace == 1 ? 0.015625 : 0.0208333);
        if (dorep) {
            // Buzz off: a burst never gets faster than its spacing (Shape > 0 starts slower and speeds up TO it),
            // and never closer than 30 ms: it stays a rhythm, never a pitched tone
            const bool buzz = g[G_BUZZ] > 0.5;
            const double lift = buzz ? 0 : std::max(0.0, hvRshape);
            const double floorWn = buzz ? 0 : 0.030 * sr * wnps;
            auto gapAt = [&](int k) { return std::max(floorWn, spc * std::pow(2.0, lift - hvRshape * k / std::max(1, rcnt - 1))); };
            double t = pos;
            for (int k = 0; k < rcnt; k++) {
                const double gk = gapAt(k);
                t += gk;
                F.rpt[k] = t;
                F.rgap[k] = gapAt(std::min(k + 1, rcnt - 1));
                minRepGapMs = std::min(minRepGapMs, gk / std::max(1e-12, wnps) / sr * 1000);
            }
            F.rn = rcnt;
        }

        // ---- next wait (free clock) ----
        if (hit == 1) {
            const double dens = clampd(HV[DENS] / 50 - 1 + g[G_GDENS] / 100 * 3, -3, 3), cont = HV[CONT] / 100;
            int on[6], anyv = 0;
            for (int i = 0; i < 6; i++) { on[i] = HV[V1 + i] > 0.5; anyv += on[i]; }
            if (!anyv) on[4] = 1;
            double cand[18], wt[18], tot = 0;
            int nc = 0;
            for (int i = 0; i < 6; i++) {
                if (!on[i]) continue;
                const double dw = hvDerived ? std::max(0.02f, F.dw[i]) : 1.0, l0 = noteLen(i);
                cand[nc] = l0; wt[nc] = dw * waitWeight(l0, dens, cont, F.lastlen); tot += wt[nc++];
                if (hvTrip) { cand[nc] = l0 * 2 / 3; wt[nc] = dw * waitWeight(l0 * 2 / 3, dens, cont, F.lastlen); tot += wt[nc++]; }
                if (hvDot && i > 0) { cand[nc] = l0 * 1.5; wt[nc] = dw * waitWeight(l0 * 1.5, dens, cont, F.lastlen); tot += wt[nc++]; }
            }
            double x = F.rng.u() * tot, acc = 0, pick = 0.0625;
            for (int i = 0; i < nc; i++) { acc += wt[i]; if (acc >= x) { pick = cand[i]; break; } }
            F.lastlen = pick;
            F.nextgrid = (std::floor(hgrid / pick + 1e-6) + 1) * pick;
            if (F.nextgrid <= pos) F.nextgrid = (std::floor(pos / pick) + 1) * pick;
            const double ftraw = F.nextgrid + swingoff(F.nextgrid, swb);
            const double qt3 = qgh * 2 / 3;
            const double qs = std::floor(F.nextgrid / qgh + 0.5) * qgh, qt = std::floor(F.nextgrid / qt3 + 0.5) * qt3;
            const double l3 = std::log2(pick * 3);
            const bool qtri = qtr && std::fabs(l3 - std::floor(l3 + 0.5)) < 0.01;
            double qn = qtri ? qt : qs;
            const double qna = (std::floor(pos / qgh + 1e-6) + 1) * qgh, qnb = (std::floor(pos / qt3 + 1e-6) + 1) * qt3;
            qn = std::max(qn, qtri ? qnb : qna);   // never on or before this hit
            F.firetime = mixd(ftraw, qn + swingoff(qn, swb), qa);
        }

        if (hslice < 0 || !st) return;
        startVoice(f, F, hit, hk, hslice, hseed, dorep, spc, pfile, rq, qa,
                   hvStart, hvLen, hvRev, hvLoop, hvPenv, hvPdec, hvGlide, hvAtt, hvDec, hvGate, hvVol, hvPan, hvWidth,
                   hvCut, hvRes, hvFenv, hvFdec, hvTrack, hvGsize, hvGdens, hvScan, hvGjit, hvGspread, hvEngine, hvFtype);
    }

    void startVoice(int f, FilePlayer& F, int hit, int hk, int hslice, double hseed, bool dorep, double spc, double pfile, int rq,
                    double qa, double hvStart, double hvLen, double hvRev, double hvLoop, double hvPenv, double hvPdec,
                    double hvGlide, double hvAtt, double hvDec, double hvGate, double hvVol, double hvPan, double hvWidth,
                    double hvCut, double hvRes, double hvFenv, double hvFdec, double hvTrack, double hvGsize, double hvGdens,
                    double hvScan, double hvGjit, double hvGspread, int hvEngine, int hvFtype) {
        const SliceTable* st = F.st;
        const double sr = this->sr;
        const double bsr = std::max(1000.0, st->sr);
        const double bsrr = bsr / sr;
        const double hgain = hit == 3 ? clampd(1 + F.rfade * hk / F.rtotal, 0, 2) : 1;
        const double s0 = st->start[hslice], s1 = st->end[hslice];
        double slg = st->gain[hslice];
        if (!(slg > 0)) slg = 1;
        double ra0 = s0 + hvStart * (s1 - s0);
        // Start snaps to the nearest attack in the slice (the slice start counts as one): near-misses always, Quant pulls further
        double sab = s0, sad = std::fabs(s0 - ra0);
        for (int k = 0; k < NATK; k++) {
            const double a = st->atk[hslice][k];
            if (a > s0 && a < s1) { double d = std::fabs(a - ra0); if (d < sad) { sad = d; sab = a; } }
        }
        const double rsnap = std::max(qa * (s1 - s0), std::min(0.15 * (s1 - s0), 0.04 * bsr));
        if (sad <= rsnap) ra0 = sab;
        const double rb0 = std::min<double>(s1, ra0 + std::max(64.0, hvLen * (s1 - ra0)));
        const int ndr = hash2(hseed, 1.37) < hvRev ? -1 : 1;
        const double semis = g[G_GPITCH] + (g[G_PTCH] > 0.5 ? pfile + rq : 0);
        const double spd = hvEngine == 1 ? hvScan : std::pow(2.0, semis / 12);
        const double spdur = hvEngine == 1 ? 1 : spd;
        const double durs = (rb0 - ra0) / std::max(1e-4, spdur * bsrr);
        double ngl = clampd(hvGate * durs, 0.03 * sr, sr * 60);                 // at least 30 ms: never just a click
        double rgw = hit == 3 ? F.rgap[std::max(0, hk - 1)] : spc;
        if (hit == 3 || dorep) ngl = std::min(ngl, std::max(128.0, rgw / std::max(1e-9, wnps)));   // a burst stays clean
        if (hvLoop > 0) ngl = std::min(ngl, std::max(128.0, 1 / std::max(1e-9, wnps)));            // Loop: at most one bar
        double nat = std::max(0.003 * sr, hvAtt * sr / 1000);
        nat = mixd(nat, std::min(nat, 0.015 * sr), qa);                            // Quant: slow fade-ins shortened
        double ndc = std::max(0.004 * sr, hvDec * sr / 1000);
        if (nat + ndc > ngl) { double k2 = ngl / (nat + ndc); nat = std::max(0.002 * sr, nat * k2); ndc = std::max(0.003 * sr, ndc * k2); }
        const double th = (hvPan + 1) * M_PI * 0.25;
        double nla = 0, nlb = 0;
        // Buzz off: a loop is never shorter than 50 ms as heard (a stutter, never a tone); a part too short for that
        // plays once instead of looping
        const double minLoop = g[G_BUZZ] > 0.5 ? 0 : 0.05 * bsr * spdur;
        if (hvLoop > 0 && rb0 - ra0 >= minLoop) {
            const double ll = std::min(rb0 - ra0, std::max(std::max(256.0, hvLoop * (rb0 - ra0)), minLoop));
            minLoopMs = std::min(minLoopMs, ll / (bsr * spdur) * 1000);
            if (ndr > 0) { nla = ra0; nlb = std::min(rb0, ra0 + ll); }
            else { nlb = rb0; nla = std::max(ra0, rb0 - ll); }
        }
        // ---- voice allocation: a free voice, else the oldest fades out (when 5 or more sound) ----
        int nv = -1, oldest = -1, actives = 0;
        double oage = -1;
        for (int k = 0; k < NVOICE; k++) {
            Voice& v = F.v[k];
            if (v.act && !v.kill) { actives++; if (v.age > oage) { oage = v.age; oldest = k; } }
            else if (!v.act && nv < 0) nv = k;
        }
        if (actives >= 5 && oldest >= 0) { F.v[oldest].kill = true; F.v[oldest].ddir = -1; }
        if (nv < 0) {   // all six busy or fading: take the fading one that is quietest
            double qd = 2;
            for (int k = 0; k < NVOICE; k++) if (F.v[k].kill && F.v[k].duck < qd) { qd = F.v[k].duck; nv = k; }
            if (nv < 0) nv = oldest >= 0 ? oldest : 0;
        }
        Voice& v = F.v[nv];
        v = Voice();
        v.act = true;
        v.pos = ndr > 0 ? ra0 : rb0 - 1;
        v.a = ra0; v.b = rb0; v.dir = ndr; v.age = 0;
        v.gl = ngl; v.at = nat; v.dc = ndc;
        v.gain = dbtoa(hvVol) * hgain * mixd(1, slg, clampd(g[G_EVEN] / 100, 0, 1));
        v.pl = std::cos(th) * std::sqrt(2.0); v.pr = std::sin(th) * std::sqrt(2.0);
        v.wid = hvWidth;
        v.semi = semis; v.pe = hvPenv; v.pd = std::max(1.0, hvPdec * sr / 1000);
        v.gfrom = F.lastsemis; v.gt = hvGlide * sr / 1000;
        v.cut = hvCut; v.res = hvRes; v.fe = hvFenv; v.fd = std::max(1.0, hvFdec * sr / 1000); v.trk = hvTrack; v.ft = hvFtype;
        v.isg = hvEngine == 1;
        v.la = nla; v.lb = nlb;
        v.duck = 1; v.ddir = 0; v.kill = false;
        v.scan = hvScan; v.gsz = std::max(64.0, hvGsize * sr / 1000);
        v.gd = (int)clampd(std::floor(hvGdens + 0.5), 1, 4);
        v.gj = hvGjit; v.gsp = hvGspread; v.seed = hseed;
        for (int k = 0; k < 4; k++) { v.gph[k] = (double)k / v.gd; v.gal[k] = false; v.gln[k] = 1; }
        v.buzz = g[G_BUZZ] > 0.5;
        v.crc = 0;
        F.lastslice = hslice;
        F.lastsemis = semis;
        Report r; r.type = R_PLAYED; r.f = f; r.slice = hslice; r.t = P;
        report(r);
    }

    // ---- voices of one file, one sample ---------------------------------------------------------
    double lastPos[NF] = {};

    void renderFile(int f, FilePlayer& F, double& outL, double& outR) {
        const Source& S = src[f];
        const double sr = this->sr;
        F.mgain += ((F.mute ? 0.0 : 1.0) - F.mgain) * 0.002;
        if (!S.data || S.frames < 2) {   // the audio went away (reload): nothing to read
            for (int k = 0; k < NVOICE; k++) F.v[k].act = false;
            return;
        }
        const double bsrr = std::max(1000.0, S.sr) / sr;
        const long nfr = S.frames;
        const int nch = S.chans;
        const float* w = S.data;
        const double dk = 1 / (0.005 * sr);      // 5 ms fade when a voice is cut
        const double ef = 0.002 * sr;            // 2 ms declick at slice edges (output time)
        double L = 0, R = 0;
        for (int k = 0; k < NVOICE; k++) {
            Voice& v = F.v[k];
            if (!v.act) continue;
            v.age += 1;
            // fade when cut
            if (v.ddir < 0) {
                v.duck -= dk;
                if (v.duck <= 0) { v.act = false; continue; }
            }
            // envelope: attack, then a fade that ends at the gate
            // every fade is S-shaped (smoothstep): no corner in the level, so no click where a fade starts or ends
            double env = std::min(sstep(std::min(1.0, v.age / v.at)), sstep(clampd((v.gl - v.age) / v.dc, 0, 1)));
            if (v.age >= v.gl) { v.act = false; continue; }
            // control rate: pitch (envelope + glide) and filter coefficients
            if (v.crc-- <= 0) {
                v.crc = CR - 1;
                const double glk = v.gt > 1 ? std::exp(-v.age / std::max(1.0, v.gt)) : 0;
                v.sm = v.semi + v.pe * std::exp(-v.age / v.pd) + (v.gfrom - v.semi) * glk;
                v.ratio = std::pow(2.0, v.sm / 12);
                v.filt = v.ft > 0 || v.cut < 19000 || v.fe != 0 || v.trk != 0;
                if (v.filt) {
                    const double fc = clampd(v.cut * std::pow(2.0, v.fe * 4 * std::exp(-v.age / v.fd) + v.trk * v.sm / 12), 20, std::min(20000.0, sr * 0.45));
                    v.fg = std::tan(M_PI * fc / sr);
                    // resonance fades out toward the top of the range: no ringing up near Nyquist
                    v.fk = 2 - 1.96 * v.res * clampd((16000 - fc) / 6000, 0, 1);
                    v.fa1 = 1 / (1 + v.fg * (v.fg + v.fk));
                    v.fa2 = v.fg * v.fa1;
                    v.fa3 = v.fg * v.fa2;
                }
            }
            const double ratio = v.ratio;
            double xl, xr;
            double adv;
            if (!v.isg) {
                // tape: linear read, a 5 ms crossfade into the other end of a loop
                double tl, tr;
                readAt(w, nfr, nch, v.pos, tl, tr);
                const double lspan = v.lb - v.la;
                if (lspan > 0) {
                    const double lxf = clampd(0.005 * sr * ratio * bsrr, 32, std::max(32.0, lspan * 0.4));
                    const double xzf = v.dir > 0 ? (v.pos - (v.lb - lxf)) / lxf : ((v.la + lxf) - v.pos) / lxf;
                    const double xz = sstep(clampd(xzf, 0, 1));
                    if (xz > 0) {
                        double ul, ur;
                        readAt(w, nfr, nch, clampd(v.dir > 0 ? v.pos - lspan : v.pos + lspan, 0, nfr - 2), ul, ur);
                        tl += (ul - tl) * xz; tr += (ur - tr) * xz;
                    }
                }
                xl = tl; xr = tr;
                adv = ratio;
            } else {
                // grain: up to 4 heads, Hann windows, kept inside the slice
                const double gnorm = v.gd < 2 ? 1 : 2.0 / v.gd;
                double gsl = 0, gsr = 0;
                for (int h = 0; h < 4; h++) {
                    double gph = v.gph[h] + 1 / (v.gsz * v.gln[h]);
                    const bool gwrap = gph >= 1;
                    if (gwrap) gph -= 1;
                    const bool on = h < v.gd;
                    if ((gwrap || !v.gal[h]) && on) {
                        const double sd = v.seed + v.age * 0.0137 + h * 0.31;
                        const double gnrt = ratio * std::pow(2.0, (hash2(sd, 2.3) - 0.5) * 2 * v.gsp / 12);
                        const double gspan = v.gsz * gnrt * bsrr;
                        const double glo = v.dir > 0 ? v.a : v.a + gspan, ghi = v.dir > 0 ? v.b - 1 - gspan : v.b - 1;
                        const double gmid = (glo + ghi) * 0.5;
                        v.gst[h] = clampd(v.pos + (hash2(sd, 1.1) - 0.5) * 2 * v.gj * v.gsz, std::min(glo, gmid), std::max(ghi, gmid));
                        v.grt[h] = gnrt;
                        // Buzz off: every grain a little longer or shorter (±25 %), so grains never fall into an even
                        // rhythm that is heard as a pitch
                        v.gln[h] = v.buzz ? 1.0 : 0.75 + 0.5 * hash2(sd, 5.7);
                        v.gal[h] = true;
                    }
                    v.gph[h] = gph;
                    if (!on) continue;
                    const double rp = v.gst[h] + v.dir * gph * v.gsz * v.gln[h] * v.grt[h] * bsrr;
                    double gl0, gr0;
                    readAt(w, nfr, nch, rp, gl0, gr0);
                    const double gw = (0.5 - 0.5 * std::cos(2 * M_PI * gph)) * gnorm;
                    const double gedge = sstep(clampd(std::min(rp - v.a, v.b - 1 - rp) / 256, 0, 1));
                    gsl += gl0 * gw * gedge;
                    gsr += gr0 * gw * gedge;
                }
                xl = gsl; xr = gsr;
                adv = v.scan;
            }
            v.pos += adv * bsrr * v.dir;
            // region, loop wrap, edge declick
            const bool looping = v.lb > v.la;
            bool outr = false;
            if (looping) {
                const double span = v.lb - v.la;
                if (v.dir > 0 && v.pos >= v.lb) v.pos -= span;
                else if (v.dir < 0 && v.pos < v.la) v.pos += span;
            } else outr = v.pos >= v.b || v.pos < v.a;
            double edg = 1;
            if (!looping) {
                const double efv = std::max(16.0, ef * std::fabs(adv) * bsrr);
                edg = outr ? 0 : sstep(clampd(std::min(v.pos - v.a, v.b - v.pos) / efv, 0, 1));
            }
            // filter: stereo TPT state variable
            if (v.filt) {
                double v3 = xl - v.s2l, v1 = v.fa1 * v.s1l + v.fa2 * v3, v2 = v.s2l + v.fa2 * v.s1l + v.fa3 * v3;
                const double hp = xl - v.fk * v1 - v2;
                const double yl = v.ft == 0 ? v2 : (v.ft == 1 ? hp : v1);
                v.s1l = 2 * v1 - v.s1l; v.s2l = 2 * v2 - v.s2l;
                v3 = xr - v.s2r; v1 = v.fa1 * v.s1r + v.fa2 * v3; v2 = v.s2r + v.fa2 * v.s1r + v.fa3 * v3;
                const double hpr = xr - v.fk * v1 - v2;
                const double yr = v.ft == 0 ? v2 : (v.ft == 1 ? hpr : v1);
                v.s1r = 2 * v1 - v.s1r; v.s2r = 2 * v2 - v.s2r;
                xl = yl; xr = yr;
            }
            const double mid = (xl + xr) * 0.5, sid = (xl - xr) * 0.5 * v.wid;
            const double amp = env * edg * sstep(v.duck) * v.gain;
            L += (mid + sid) * amp * v.pl;
            R += (mid - sid) * amp * v.pr;
            if (outr) v.act = false;
        }
        outL += L * F.mgain;
        outR += R * F.mgain;
    }

    static inline double sstep(double t) { return t * t * (3 - 2 * t); }

    static inline void readAt(const float* w, long nfr, int nch, double p, double& l, double& r) {
        if (p < 0) p = 0;
        long i0 = (long)p;
        if (i0 > nfr - 2) i0 = nfr - 2;
        if (i0 < 0) i0 = 0;
        const double fr = clampd(p - i0, 0, 1);
        const float* a = w + i0 * nch;
        const float* b = a + nch;
        l = a[0] + (b[0] - a[0]) * fr;
        r = nch > 1 ? a[1] + (b[1] - a[1]) * fr : l;
    }

    // ---- output ----------------------------------------------------------------------------------
    void compress(double& l, double& r) {
        Dynamics& d = dyn;
        const double sr = this->sr;
        const int la = (int)std::floor(LOOKAHEAD_S * sr + 0.5);
        const double ac = 1 - std::exp(-1 / (0.003 * sr)), rc = 1 - std::exp(-1 / (0.12 * sr));
        d.amtS += (clampd(g[G_COMP] / 100, 0, 1) - d.amtS) * smooth20;
        const double amt = d.amtS, thr = -6 - 24 * amt, ratio = 1 + 5 * amt, sl = 1 - 1 / ratio, kw = 10;
        const double mk = std::max(0.0, -10 - thr) * sl * 0.8;
        const double pk = std::max(std::fabs(l), std::fabs(r));
        const double lvl = 20 * std::log10(std::max(pk, 1e-6));
        const double ov = lvl - thr;
        double tgt = ov > kw / 2 ? ov * sl : sl * (ov + kw / 2) * (ov + kw / 2) / (2 * kw);
        if (ov < -kw / 2) tgt = 0;
        d.grs += (tgt - d.grs) * (tgt > d.grs ? ac : rc);
        d.dlL[d.w] = (float)l; d.dlR[d.w] = (float)r;
        const int ri = (d.w - la + Dynamics::DL) % Dynamics::DL;
        d.w = (d.w + 1) % Dynamics::DL;
        const double gn = dbtoa(mk - d.grs);
        l = d.dlL[ri] * gn; r = d.dlR[ri] * gn;
    }

    // Limit 0..100: 0 = off; up to 10 = a safety catch at -0.3 dB (nothing pushed); 10 -> 100 = the mix pushed up to
    // +18 dB into the limiter, which lets go faster (80 -> 15 ms); 75 -> 100 = soft clipping blended in (grit).
    // The output never passes -0.3 dB. The signal is 2 ms late in every setting (no jump when it's switched).
    void limit(double& l, double& r) {
        Dynamics& d = dyn;
        const double sr = this->sr, v = g[G_LIMIT];
        const double ceil = dbtoa(-0.3), kn = ceil * 0.85, kw = ceil - kn;
        const double push = clampd((v - 10) / 90, 0, 1);
        d.drv += (dbtoa(18 * push) - d.drv) * smooth20;
        d.clip += (clampd((v - 75) / 25, 0, 1) - d.clip) * smooth20;
        d.mx += ((v > 0.5 ? 1.0 : 0.0) - d.mx) * (1 - std::exp(-1 / (0.01 * sr)));
        const int la = std::max(8, std::min(Dynamics::LL - 2, (int)std::floor(0.002 * sr + 0.5)));
        double xl = l * d.drv, xr = r * d.drv;
        if (d.clip > 1e-4) {   // soft clipping: rounds the peaks before the limiter catches them
            xl += (ceil * std::tanh(xl / ceil) - xl) * d.clip;
            xr += (ceil * std::tanh(xr / ceil) - xr) * d.clip;
        }
        const int N = Dynamics::LL;
        d.lL[d.lw] = (float)xl; d.lR[d.lw] = (float)xr;
        d.rawL[d.lw] = (float)l; d.rawR[d.lw] = (float)r;
        d.pk[d.lw] = (float)std::max(std::fabs(xl), std::fabs(xr));
        float m = 0;   // the loudest peak still ahead of the output (la samples)
        for (int k = 0, i = d.lw; k <= la; k++, i = i == 0 ? N - 1 : i - 1) m = std::max(m, d.pk[i]);
        const int ri = (d.lw - la + N) % N;
        d.lw = (d.lw + 1) % N;
        const double tg = m > ceil ? ceil / m : 1.0;
        const double ac = 1 - std::exp(-4.6 / la), rc = 1 - std::exp(-1 / ((0.08 - 0.065 * push) * sr));
        d.genv += (tg - d.genv) * (tg < d.genv ? ac : rc);
        double yl = d.lL[ri] * d.genv, yr = d.lR[ri] * d.genv;
        const double al = std::fabs(yl), ar = std::fabs(yr);
        if (al > kn) yl = (yl < 0 ? -1 : 1) * (kn + kw * std::tanh((al - kn) / kw));
        if (ar > kn) yr = (yr < 0 ? -1 : 1) * (kn + kw * std::tanh((ar - kn) / kw));
        d.limGr = d.mx * -20 * std::log10(std::max(1e-6, d.genv));
        l = d.rawL[ri] + (yl - d.rawL[ri]) * d.mx;
        r = d.rawR[ri] + (yr - d.rawR[ri]) * d.mx;
    }
};

}  // namespace wnd
