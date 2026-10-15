// Offline checks of the Wanderer engine. Build: g++ -std=c++17 -O2 -o engine_test engine_test.cpp -lpthread
#include <chrono>
#include <cstring>

#include "harness.h"

using namespace test;
using namespace wnd;

static int fails = 0;

static std::vector<std::pair<int, int>> hits(TestHost& h, int f = -1) {
    std::vector<std::pair<int, int>> v;
    for (auto& o : h.outs) if (o.sel == "hit" && (f < 0 || (int)o.nums[0] == f)) v.push_back({(int)o.nums[0], (int)o.nums[1]});
    return v;
}

// detected cuts vs truth: share of true hits with a cut within `tol` samples, and cuts with no true hit nearby
static void matchCuts(const std::vector<long>& cuts, const std::vector<long>& truth, long tol, double& recall, int& extra) {
    int found = 0;
    for (long t : truth) { for (long c : cuts) if (std::labs(c - t) <= tol) { found++; break; } }
    extra = 0;
    for (long c : cuts) { bool near = false; for (long t : truth) if (std::labs(c - t) <= tol) near = true; if (!near) extra++; }
    recall = truth.empty() ? 1 : (double)found / truth.size();
}

static void testDetection() {
    std::printf("detection\n");
    {
        std::vector<long> truth;
        Audio a = drumLoop(170, 2, &truth);
        Analysis an; an.sr = a.sr;
        for (long i = 0; i < a.frames(); i++) an.mono.push_back(0.5f * (a.data[(size_t)i * 2] + a.data[(size_t)i * 2 + 1]));
        an.findAttacks();
        SliceJob j; j.method = 0; j.sens = 0.25; j.minSamps = 0.03 * a.sr;
        SliceResult r = runSliceJob(an, j);
        double rec; int extra;
        matchCuts(r.starts, truth, (long)(0.01 * a.sr), rec, extra);
        std::printf("    drums, Hits: %zu cuts for %zu hits, recall %.0f%%, %d extra\n", r.starts.size(), truth.size(), rec * 100, extra);
        fails += expect(rec >= 0.9 && extra <= 2, "Hits finds the drum hits within 10 ms");
    }
    {
        std::vector<long> truth;
        Audio a = legato(0.4, 12, &truth);
        Analysis an; an.sr = a.sr; an.mono = a.data;
        SliceJob j; j.method = 1; j.sens = 0.25; j.minSamps = 0.1 * a.sr;
        SliceResult r = runSliceJob(an, j);
        double rec; int extra;
        matchCuts(r.starts, truth, (long)(0.03 * a.sr), rec, extra);
        std::printf("    legato notes, Notes: %zu cuts for %zu notes, recall %.0f%%, %d extra\n", r.starts.size(), truth.size(), rec * 100, extra);
        fails += expect(rec >= 0.8 && extra <= 2, "Notes finds note changes without a loudness jump (within 30 ms)");
        SliceJob h = j; h.method = 0;
        Analysis an2; an2.sr = a.sr; an2.mono = a.data;
        SliceResult r2 = runSliceJob(an2, h);
        std::printf("    legato notes, Hits (with the retry ladder): %zu cuts\n", r2.starts.size());
    }
}

static void testPlayStart() {
    std::printf("play start\n");
    for (int lock = 0; lock < 2; lock++) {
        Rig rig;
        rig.tempo(170);
        std::vector<long> truth;
        rig.load(0, "/drums.wav", drumLoop(170, 2, &truth));
        rig.play(true);
        rig.run(6);
        if (lock) { rig.msg("flock", {1}); rig.run(0.5); }
        rig.play(false);
        rig.run(0.5);
        rig.phase = 0.003;   // Live reports Play a few ms after the bar started
        rig.L.clear();
        rig.play(true);
        rig.run(1.5);
        long first = -1;
        for (size_t i = 0; i < rig.L.size(); i++) if (std::fabs(rig.L[i]) > 1e-4) { first = (long)i; break; }
        const double sec = first < 0 ? 99 : first / rig.sr;
        std::printf("    %s: first sound after %.3f s\n", lock ? "Lock" : "Free", sec);
        fails += expect(sec < 0.02 || (lock && sec < 0.4), lock ? "Lock starts right away (or on its first hit)" : "Free starts within 20 ms");
    }
}

static void testLockRepeats() {
    std::printf("lock\n");
    Rig rig;
    rig.tempo(120);
    rig.load(0, "/drums.wav", drumLoop(120, 2, nullptr));
    rig.msg("locklen", {1});   // 2 bars
    rig.play(true);
    rig.run(8);
    rig.msg("flock", {1});
    rig.run(0.1);
    const Pattern captured = rig.m->files[0].pat;
    std::printf("    captured %d hits over %.0f bars\n", captured.cnt, captured.len);
    fails += expect(captured.cnt > 4, "Lock captures what was just played");
    // two passes of 2 bars at 120 bpm = 4 s each: the same slices in the same order
    const double pass = 2 * 4 * 60.0 / 120;
    // align to a pass start
    double posNow = rig.pl->posNow.load();
    double toNext = (std::ceil(posNow / 2) * 2 - posNow) * 60.0 / 120 * 4;
    rig.run(toNext + 0.05);
    rig.host.outs.clear();
    rig.run(pass);
    auto a = hits(rig.host, 0);
    rig.host.outs.clear();
    rig.run(pass);
    auto b = hits(rig.host, 0);
    std::printf("    pass 1: %zu hits, pass 2: %zu hits\n", a.size(), b.size());
    fails += expect(!a.empty() && a == b, "a locked loop repeats exactly");
    // Mutate changes some hits from pass to pass
    rig.msg("mutate", {60});
    rig.run(pass);
    rig.host.outs.clear();
    rig.run(pass);
    auto c = hits(rig.host, 0);
    fails += expect(c != b, "Mutate changes the loop");
    // Store, Random, recall: the stored loop comes back exactly
    rig.msg("mutate", {0});
    rig.run(pass);
    Pattern before = rig.m->files[0].pat;
    rig.msg("slot", {2});
    rig.msg("store");
    rig.msg("frand");
    rig.run(0.5);
    bool changed = rig.m->files[0].pat.cnt != before.cnt || std::memcmp(&rig.m->files[0].pat.hits[0], &before.hits[0], sizeof(Hit)) != 0;
    rig.msg("slot", {2});
    rig.run(0.1);
    const Pattern& back = rig.m->files[0].pat;
    bool same = back.cnt == before.cnt;
    for (int i = 0; same && i < back.cnt; i++) same = back.hits[i].ph == before.hits[i].ph && back.hits[i].slice == before.hits[i].slice;
    fails += expect(changed && same, "Store / Random / recall brings the exact loop back");
}

static void testSaveRestore() {
    std::printf("save and restore\n");
    Rig a;
    a.tempo(120);
    a.load(0, "/drums.wav", drumLoop(120, 2, nullptr));
    a.load(3, "/notes.wav", legato(0.4, 12, nullptr));
    a.msg("select", {0});
    a.msg("set", {(double)PITCH}, "");   // ignored (no b/r/m)
    std::vector<Model::Atom> args(3);
    args[0].d = CUT; args[1].num = false; args[1].s = "b"; args[2].d = 1200;
    a.m->message("set", args);
    a.msg("slicetoggle", {2});
    a.play(true);
    a.run(6);
    a.msg("flock", {1});
    a.msg("slot", {5});
    a.msg("store");
    a.run(3);   // the save is debounced
    fails += expect(a.host.saves > 0, "the state is saved after edits");
    StateDoc doc = a.host.saved;
    Rig b;
    b.disk = a.disk;
    b.m->readState(doc);
    b.run(0.3);
    bool ok = true;
    for (int f : {0, 3}) {
        const FileModel& x = a.m->files[f];
        const FileModel& y = b.m->files[f];
        ok = ok && y.state == F_READY && y.path == x.path && y.tab.ns == x.tab.ns;
        for (int i = 0; ok && i < x.tab.ns; i++) ok = x.tab.start[i] == y.tab.start[i] && x.tab.en[i] == y.tab.en[i];
        for (int p = 0; ok && p < NP; p++) ok = x.ps.b[p] == y.ps.b[p];
    }
    fails += expect(ok, "files, slicing, on/off and settings come back after reopening the set");
    const Pattern& pa = a.m->files[0].pat;
    const Pattern& pb = b.m->files[0].pat;
    bool pok = b.m->files[0].lock && pa.cnt == pb.cnt;
    for (int i = 0; pok && i < pa.cnt; i++) pok = pa.hits[i].ph == pb.hits[i].ph && pa.hits[i].slice == pb.hits[i].slice;
    fails += expect(pok, "the locked loop comes back");
    fails += expect(b.m->slots[5] && b.m->slots[5]->used, "memory slots come back");
    // a moved file: reported missing, nothing crashes
    Rig c;
    c.m->readState(doc);
    c.run(0.2);
    fails += expect(c.m->files[0].state == F_MISSING, "a file that moved is shown as missing (click to relink)");
}

static void testClicks() {
    std::printf("clicks\n");
    // a pure low tone: any click stands out as a jump in the second difference
    long total = 0;
    double worst = 0;
    for (int run = 0; run < 12; run++) {
        Rig rig;
        rig.tempo(100 + run * 10);
        rig.keep = true;
        rig.load(0, "/sine.wav", sine(80, 4, 0.5));
        rig.load(1, "/sine2.wav", sine(110, 3, 0.4));
        rig.msg("gptch", {0});           // no pitch change: the tone stays low, so the test is strict
        rig.msg("grepeat", {1}); rig.msg("grev", {1}); rig.msg("gtrip", {1}); rig.msg("gdot", {1});
        rig.msg("rdall", {100});
        rig.m->rng.reseed(1000 + run);
        rig.msg("grand");
        for (int f = 0; f < 2; f++) {   // dense, overlapping, bursts
            rig.m->files[f].ps.b[DENS] = 0.8f;
            rig.m->files[f].ps.b[RCHANCE] = 0.5f;
            // a resonant filter ringing at a few kHz is the sound, not a click: keep it out of this test
            rig.m->files[f].ps.b[RES] = std::min(rig.m->files[f].ps.b[RES], 0.4f);
            rig.m->files[f].ps.r[RES] = 0;
            rig.m->sendParams(f, 3);
        }
        rig.play(true);
        rig.run(6);
        if (run % 3 == 1) { rig.msg("glock", {1}); rig.run(4); rig.msg("mutate", {50}); rig.run(4); }
        if (run % 3 == 2) { rig.msg("slot", {1}); rig.msg("store"); rig.msg("grand"); rig.run(2); rig.msg("slide", {3}); rig.msg("slot", {1}); rig.run(5); }
        rig.play(false);
        rig.run(0.3);
        ClickStats cs = findClicks(rig.L);
        total += cs.count;
        worst = std::max(worst, cs.worst);
        if (cs.count) std::printf("    run %d: %ld clicks, worst %.1fx at %.3f s\n", run, cs.count, cs.worst, cs.worstAt / rig.sr);
    }
    std::printf("    %ld clicks in 12 runs\n", total);
    fails += expect(total == 0, "no clicks: starts, ends, cuts, loops, bursts, reverse, grain, stop");
}

static void testButtons() {
    std::printf("buttons\n");
    Rig rig;
    rig.load(0, "/d.wav", drumLoop(120, 2, nullptr));
    const float before = rig.m->files[0].ps.b[DENS];
    std::vector<Model::Atom> a(1);
    a[0].num = false; a[0].s = "bang";
    rig.m->message("grand", a);            // what a Live button sends through [prepend grand]
    fails += expect(rig.m->files[0].ps.b[DENS] != before, "Random all works from a button (bang)");
    rig.m->message("store", a);
    fails += expect(rig.m->slots[0] && rig.m->slots[0]->used, "Store works from a button (bang)");
    // Live hands over a bare name (TEMP-… copy): the engine passes it to the buffer as it is
    rig.disk["TEMP-655_loop.aif"] = drumLoop(120, 2, nullptr);
    rig.m->select(5);
    std::vector<Model::Atom> d(1);
    d[0].num = false; d[0].s = "TEMP-655_loop.aif";
    rig.m->message("drop", d);
    rig.run(0.3);
    fails += expect(rig.m->files[5].state == F_READY && rig.m->files[5].tab.ns > 4, "a dropped bare file name loads and slices");
}

// Buzz off: nothing repeats faster than ~30 ms (repeats) or loops shorter than 50 ms; Buzz on: it may
static void testBuzz() {
    std::printf("buzz\n");
    double gap[2], loop[2];
    for (int buzz = 0; buzz < 2; buzz++) {
        Rig rig;
        rig.keep = false;
        rig.tempo(174);
        rig.load(0, "/d.wav", drumLoop(174, 2, nullptr));
        rig.msg("gbuzz", {(double)buzz});
        rig.msg("grepeat", {1});
        rig.play(true);
        for (int k = 0; k < 120; k++) {
            rig.m->rng.reseed(500 + k);
            rig.m->randomize(0, -1, 1.0);
            ParamSet& ps = rig.m->files[0].ps;
            ps.b[RCHANCE] = 0.9f; ps.b[RCOUNT] = 1.f; ps.b[RSHAPE] = 1.f; ps.b[RSPACE] = 1;   // fastest bursts
            ps.b[LOOP] = 0.05f; ps.r[LOOP] = 0;                                                 // tiny loops
            rig.m->sendParams(0, 3);
            rig.run(0.6);
        }
        gap[buzz] = rig.pl->minRepGapMs; loop[buzz] = rig.pl->minLoopMs;
        std::printf("    Buzz %s: shortest repeat gap %.1f ms, shortest loop %.1f ms\n", buzz ? "on " : "off", gap[buzz], loop[buzz]);
    }
    fails += expect(gap[0] >= 29.9 && loop[0] >= 49.9, "Buzz off: repeats >= 30 ms apart, loops >= 50 ms");
    fails += expect(gap[1] < 25 && loop[1] < 25, "Buzz on: fast repeats and tiny loops are still possible");
}

// Random: Loop is a sometimes-thing. Off in most rolls, and then no hit loops through its range either
static void testLoopShare() {
    std::printf("random loop\n");
    Rig rig;
    rig.load(0, "/d.wav", drumLoop(125, 2, nullptr));
    Rng r(9);
    long hits = 0, looped = 0, rolls = 0, rollsLoop = 0;
    for (int k = 0; k < 3000; k++) {
        rig.m->rng.reseed(7000 + k);
        rig.m->randomize(0, -1, 1.0);
        const ParamSet& p = rig.m->files[0].ps;
        bool any = false;
        for (int h = 0; h < 50; h++) {
            const double o = p.m[LOOP] > 0 ? r.u() * 2 - 1 : 0;
            const double v = denormOf(LOOP, clampd(p.b[LOOP] + o * p.r[LOOP], 0, 1));
            hits++;
            if (v > 0.5) { looped++; any = true; }
        }
        rolls++; rollsLoop += any;
    }
    std::printf("    rolls with any looping hit %.0f%%, hits that loop %.0f%%\n", 100.0 * rollsLoop / rolls, 100.0 * looped / hits);
    fails += expect(rollsLoop < rolls * 0.25 && looped < hits * 0.2, "Random: Loop in about 1 roll of 5, never on hits of the others");
}

// Allow Rep off: no bursts, no loops (the settings stay)
static void testRepOff() {
    std::printf("allow rep\n");
    Rig rig;
    rig.keep = false;
    rig.load(0, "/d.wav", drumLoop(125, 2, nullptr));
    ParamSet& ps = rig.m->files[0].ps;
    ps.b[RCHANCE] = 1.f; ps.b[LOOP] = 0.3f;
    rig.m->sendParams(0, 3);
    rig.play(true);
    rig.run(6);
    fails += expect(rig.pl->minRepGapMs > 1e8 && rig.pl->minLoopMs > 1e8, "Rep off (the default): no bursts, no loops");
    rig.msg("grepeat", {1});
    rig.run(6);
    fails += expect(rig.pl->minRepGapMs < 1e8 && rig.pl->minLoopMs < 1e8, "Rep on: bursts and loops play");
    fails += expect(ps.b[RCHANCE] == 1.f && ps.b[LOOP] == 0.3f, "switching Rep never changes the settings");
}

static void testCpu() {
    std::printf("cpu\n");
    Rig rig;
    rig.keep = false;
    rig.tempo(140);
    Audio d = drumLoop(140, 2, nullptr);
    for (int f = 0; f < NF; f++) rig.load(f, "/d" + std::to_string(f) + ".wav", d);
    for (int f = 0; f < NF; f++) { rig.m->files[f].ps.b[DENS] = 0.9f; rig.m->files[f].ps.b[V32] = 1; rig.m->files[f].ps.b[ENGINE] = f % 2; rig.m->files[f].ps.b[CUT] = 0.5f; rig.m->sendParams(f, 3); }
    rig.play(true);
    auto t0 = std::chrono::steady_clock::now();
    rig.run(10);
    double s = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
    std::printf("    16 busy files: %.1f%% of one core\n", s / 10 * 100);
    fails += expect(s / 10 < 0.35, "16 busy files stay well under a core");
}

int main(int argc, char** argv) {
    std::string only = argc > 1 ? argv[1] : "";
    if (only.empty() || only == "detect") testDetection();
    if (only.empty() || only == "start") testPlayStart();
    if (only.empty() || only == "lock") testLockRepeats();
    if (only.empty() || only == "save") testSaveRestore();
    if (only.empty() || only == "clicks") testClicks();
    if (only.empty() || only == "buttons") testButtons();
    if (only.empty() || only == "buzz") testBuzz();
    if (only.empty() || only == "loopshare") testLoopShare();
    if (only.empty() || only == "rep") testRepOff();
    if (only.empty() || only == "cpu") testCpu();
    std::printf(fails ? "\n%d FAILED\n" : "\nall passed\n", fails);
    return fails ? 1 : 0;
}
