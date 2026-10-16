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
    Rig b(false);
    b.disk = a.disk;
    b.openSet(a.host);
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
    Rig c(false);
    c.openSet(a.host);
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

// Files dropped as Live's TEMP-… names: the device keeps its own copies, the state points at them, and after
// reopening the set (the TEMP names gone) every slot comes back with its slicing. The Drop strip repeating its
// last file while the set loads is not a new drop.
static void testKeptCopies() {
    std::printf("kept copies\n");
    Rig a;
    a.tempo(120);
    const char* names[3] = {"TEMP-1_3870941970_kick.aif", "TEMP-2_3870941970_loop.aif", "TEMP-3_3870941970_hats.aif"};
    for (int i = 0; i < 3; i++) {
        a.disk[names[i]] = drumLoop(110 + 10 * i, 2, nullptr, 3 + i);
        std::vector<Model::Atom> d(1);
        d[0].num = false; d[0].s = names[i];
        a.m->message("drop", d);
        a.run(0.3);
    }
    a.run(3);
    bool kept = true;
    for (int i = 0; i < 3; i++) kept = kept && a.m->files[i].path.find("/Wanderer Samples/") != std::string::npos;
    fails += expect(kept, "a name-only drop is kept as the device's own copy");
    fails += expect(a.m->files[1].name == "loop.aif", "Live's TEMP-… prefix is not shown");
    Rig b(false);
    for (auto& kv : a.disk) if (kv.first.compare(0, 5, "TEMP-") != 0) b.disk[kv.first] = kv.second;   // TEMP copies gone
    std::vector<Model::Atom> late(1);
    late[0].num = false; late[0].s = names[2];
    b.m->message("drop", late);                 // the Drop strip repeating its last file while the set loads
    b.openSet(a.host);
    b.m->message("drop", late);                 // ... or just after
    b.run(0.5);
    bool ok = true;
    for (int i = 0; i < 3; i++) {
        const FileModel& x = a.m->files[i];
        const FileModel& y = b.m->files[i];
        ok = ok && y.state == F_READY && y.tab.ns == x.tab.ns;
        for (int k = 0; ok && k < x.tab.ns; k++) ok = x.tab.start[k] == y.tab.start[k];
    }
    fails += expect(ok, "reopened: all three files back with their slicing");
    fails += expect(b.m->files[3].state == F_EMPTY, "the Drop strip's repeat at load is not loaded as a new file");
}

// Saving in the Live set: number lists in NSTORE hidden stores (CONVENTIONS "Saving in the Live set")
static void testStores() {
    std::printf("stores\n");
    // a heavy session: 16 files, all locked with varying knobs, all 8 memory slots stored
    Rig a;
    a.tempo(120);
    for (int f = 0; f < NF; f++) {
        const std::string p = f == 5 ? "/Users/m/Garsai/ąžuolas būgnai.wav" : "/Users/m/Samples/A long folder name/file " + std::to_string(f) + ".wav";
        a.load(f, p, f % 2 ? drumLoop(120, 8, nullptr, f + 1) : legato(0.25, 48, nullptr));
    }
    for (int f = 0; f < NF; f++) for (int q = 0; q < NK; q += 3) if (!PDEF[q].steady) { a.m->files[f].ps.m[q] = 1; a.m->files[f].ps.r[q] = 0.5f; }
    for (int f = 0; f < NF; f++) a.m->sendParams(f, 3);
    a.play(true);
    a.run(9);
    a.msg("glock", {1});
    a.run(1);
    for (int s = 0; s < NSLOT; s++) { a.msg("slot", {(double)s}); a.msg("store"); a.run(0.1); }
    a.run(3);
    size_t biggest = 0, total = 0;
    bool all = true;
    for (int k = 0; k < NSTORE; k++) { biggest = std::max(biggest, a.host.set[k].size()); total += a.host.set[k].size(); all = all && !a.host.set[k].empty(); }
    std::printf("    heavy session: %zu numbers in all, biggest store %zu\n", total, biggest);
    fails += expect(all && biggest <= STATE_MAX_NUMBERS, "every store is written and fits one Max message");
    // reopen, with Live keeping 32-bit numbers
    Rig b(false);
    b.disk = a.disk;
    b.host.float32 = true;
    b.openSet(a.host);
    b.run(0.5);
    bool files = true, loops = true, mem = true;
    for (int f = 0; f < NF; f++) {
        const FileModel& x = a.m->files[f];
        const FileModel& y = b.m->files[f];
        files = files && y.state == F_READY && y.path == x.path && y.tab.ns == x.tab.ns;
        for (int p = 0; files && p < NP; p++) files = x.ps.b[p] == y.ps.b[p];
        loops = loops && y.lock && x.pat.cnt == y.pat.cnt && x.pat.cnt > 0;
        for (int i = 0; loops && i < x.pat.cnt; i++) {
            loops = x.pat.hits[i].ph == y.pat.hits[i].ph && x.pat.hits[i].slice == y.pat.hits[i].slice;
            for (int q = 0; loops && q < NK; q++) loops = std::fabs(x.pat.hits[i].off[q] - y.pat.hits[i].off[q]) <= 0.5 / 2047 + 1e-6;
        }
    }
    for (int s = 0; s < NSLOT; s++) {
        mem = mem && b.m->slots[s] && b.m->slots[s]->used;
        for (int f = 0; mem && f < NF; f++) mem = b.m->slots[s]->hasPat[f] == a.m->slots[s]->hasPat[f] &&
                                                   b.m->slots[s]->pats[(size_t)f].cnt == a.m->slots[s]->pats[(size_t)f].cnt;
    }
    fails += expect(files, "16 files, their slicing and settings come back (32-bit numbers in the set)");
    fails += expect(b.m->files[5].path == "/Users/m/Garsai/ąžuolas būgnai.wav", "a path with Lithuanian letters comes back exactly");
    fails += expect(loops, "every locked loop comes back (offsets within 1/4000)");
    fails += expect(mem, "all 8 memory slots come back with their loops");
    b.run(3);
    fails += expect(b.host.saves == 0, "reopening saves nothing (no undo step in Live)");

    // after an edit only the device store is written; Store writes only its slot's store
    b.msg("slot", {3});   // recall slot 3 (the edit below goes into it with Store)
    b.run(3);
    int before[NSTORE];
    for (int k = 0; k < NSTORE; k++) before[k] = b.host.storeWrites[k];
    b.msg("select", {2});
    std::vector<Model::Atom> args(3);
    args[0].d = CUT; args[1].num = false; args[1].s = "r"; args[2].d = 37;
    b.m->message("set", args);
    b.run(3);
    bool only0 = b.host.storeWrites[0] == before[0] + 1;
    for (int k = 1; k < NSTORE; k++) only0 = only0 && b.host.storeWrites[k] == before[k];
    fails += expect(only0, "a knob edit rewrites only the device store");
    b.msg("store"); b.run(3);
    fails += expect(b.host.storeWrites[4] == before[4] + 1 && b.host.storeWrites[5] == before[5], "Store rewrites only that slot's store");

    // a garbled or foreign list is refused whole
    std::vector<double> bad = a.host.set[0];
    bad[bad.size() / 2] += 1;
    StateDoc d;
    fails += expect(!decodeState(bad, 0, d) && !decodeState(a.host.set[0], 1, d) && decodeState(a.host.set[0], 0, d),
                    "a changed number or another store's list is refused");
    std::vector<double> big;
    putBig(big, 31000000);   // a slice 11 minutes into a file
    StateDoc bd; bd.num["x"] = big;
    StateDoc back;
    std::vector<double> enc = encodeState(bd, 0);
    for (double& x : enc) x = (double)(float)x;
    fails += expect(decodeState(enc, 0, back) && getBig(*back.get("x"), 0) == 31000000, "sample positions past 2^24 survive 32-bit numbers");

    // nothing in the set: a new device after 1.5 s; a valid state arriving later (within 10 s) still wins
    Rig c(false);
    c.disk = a.disk;
    c.host.answers = false;
    c.openSet(a.host);
    c.run(1.7);
    fails += expect(c.m->restored && c.m->files[0].state == F_EMPTY && c.host.logged("a new device"), "no answer: a new device after 1.5 s");
    c.run(1);
    c.host.answers = true;
    c.host.requestState();
    c.run(0.5);
    fails += expect(c.m->files[0].state == F_READY && c.m->slots[7] && c.m->slots[7]->used, "the set's state arriving late still wins");

    // an empty set (pattr's bare 0) is a new device, quietly
    Rig e(false);
    e.openSet(TestHost());
    e.run(2);
    fails += expect(e.m->restored && !e.host.logged("unreadable"), "empty stores: a new device, no complaint");
    e.load(0, "/x.wav", drumLoop(120, 1, nullptr));
    fails += expect(e.m->files[0].state == F_READY, "a drop after loading is taken");
    e.run(3);
    fails += expect(!e.host.set[0].empty(), "a new device saves once something changed");

    // the set's store changes behind our back (Live's undo of one of our saves): the device saves what plays again
    const int w0 = b.host.storeWrites[0];
    b.host.set[0] = a.host.set[0];
    b.host.answer(0);
    b.run(3);
    fails += expect(b.host.storeWrites[0] == w0 + 1 && std::fabs(b.m->files[2].ps.r[CUT] - 0.37f) < 1e-6,
                    "a different list after loading is not taken; the device's own state is saved again");

    // too big for a store (every knob varying, 256-hit loops everywhere): saved without the loops, and said so
    Rig h;
    h.load(0, "/d.wav", drumLoop(120, 2, nullptr));
    for (int f = 0; f < NF; f++) {
        Pattern& P = h.m->files[f].pat;
        P = Pattern(); P.len = 8; P.cnt = PAT_MAX;
        for (int i = 0; i < PAT_MAX; i++) { P.hits[i].ph = i / 32.0f; P.hits[i].slice = (short)(i % 4); for (int q = 0; q < NK; q++) P.hits[i].off[q] = 0.3f; }
        h.m->files[f].lock = true;
    }
    h.m->dirty(10);
    h.run(0.5);
    fails += expect(h.host.set[0].size() <= STATE_MAX_NUMBERS && !h.host.set[0].empty() && h.host.logged("too big"),
                    "a device too big for one store is saved without its loops (and the Max window says so)");
}

// Solo, Undo and the mixer messages
static void testSoloUndo() {
    std::printf("solo, undo, mixer\n");
    Rig a;
    a.tempo(120);
    a.load(0, "/d.wav", drumLoop(120, 2, nullptr));
    a.load(1, "/n.wav", legato(0.4, 12, nullptr));
    a.load(2, "/h.wav", drumLoop(120, 2, nullptr, 9));
    a.play(true);
    a.run(1);
    a.msg("msolo", {1, 1});
    a.run(0.2);
    fails += expect(a.pl->fp[0].mute && !a.pl->fp[1].mute && a.pl->fp[2].mute, "Solo: only the soloed file plays");
    a.msg("select", {2}); a.msg("fsolo", {1});
    a.run(0.2);
    fails += expect(a.pl->fp[0].mute && !a.pl->fp[1].mute && !a.pl->fp[2].mute, "two soloed files both play");
    a.msg("msolo", {1, 0}); a.msg("fsolo", {0}); a.msg("mmute", {0, 1});
    a.run(0.2);
    fails += expect(a.pl->fp[0].mute && !a.pl->fp[1].mute && !a.pl->fp[2].mute, "no solo: Mute works as before");
    a.msg("mmute", {0, 0});
    a.msg("fvol", {1, -9});
    fails += expect(std::fabs(denormOf(VOL, a.m->files[1].ps.b[VOL]) + 9) < 0.01, "a mixer fader sets that file's Volume");

    // Undo
    a.msg("select", {0}); a.msg("flock", {1});
    a.run(2.5);
    const ParamSet p0 = a.m->files[0].ps;
    const Pattern pat0 = a.m->files[0].pat;
    a.msg("grand"); a.msg("grand");
    a.run(0.2);
    bool changed = false;
    for (int p = 0; p < NP; p++) changed = changed || a.m->files[0].ps.b[p] != p0.b[p];
    fails += expect(changed && a.m->undos.size() == 2, "Random all is undoable (two steps kept)");
    a.msg("undo"); a.msg("undo");
    a.run(0.2);
    bool same = a.m->files[0].pat.cnt == pat0.cnt && a.m->files[0].lock;
    for (int p = 0; same && p < NP; p++) same = a.m->files[0].ps.b[p] == p0.b[p] && (p >= NK || (a.m->files[0].ps.r[p] == p0.r[p] && a.m->files[0].ps.m[p] == p0.m[p]));
    for (int i = 0; same && i < pat0.cnt; i++) same = a.m->files[0].pat.hits[i].ph == pat0.hits[i].ph && a.m->files[0].pat.hits[i].slice == pat0.hits[i].slice;
    fails += expect(same && a.m->undos.empty(), "two Undos bring back the settings and the locked loop exactly");
    for (int k = 0; k < 12; k++) a.msg("frand");
    fails += expect(a.m->undos.size() == (size_t)NUNDO, "at most 8 steps are kept");
    a.m->undos.clear();
    a.msg("slot", {2}); a.msg("store"); a.msg("grand"); a.msg("store");   // slot 2 holds the second roll
    const ParamSet before = a.m->files[1].ps;
    a.msg("grand");
    const ParamSet rolled = a.m->files[1].ps;
    a.msg("slot", {2});
    a.msg("undo");
    bool back = true;
    for (int p = 0; p < NP; p++) back = back && a.m->files[1].ps.b[p] == rolled.b[p];
    (void)before;
    fails += expect(back, "Undo steps back over a memory recall");
    a.msg("undo");
    bool back2 = true;
    for (int p = 0; p < NP; p++) back2 = back2 && a.m->files[1].ps.b[p] == before.b[p];
    fails += expect(back2, "... and then over the Random before it");

    // Solo is saved with the set
    a.msg("msolo", {2, 1});
    a.run(3);
    Rig b(false);
    b.disk = a.disk;
    b.openSet(a.host);
    b.run(0.3);
    fails += expect(b.m->files[2].solo && b.pl->fp[0].mute && !b.pl->fp[2].mute, "Solo comes back with the set");
}

// The Limit slider: 0 = off, 10 = a safety catch, higher = louder and denser; never over -0.3 dB
static void testLimit() {
    std::printf("limit\n");
    long clicks10 = 0, clicks60 = 0;
    auto measure = [&clicks10, &clicks60](double lim, double& peak, double& rms) {
        Rig r;
        r.tempo(120);
        r.load(0, "/d.wav", drumLoop(120, 2, nullptr));
        r.load(1, "/n.wav", legato(0.4, 12, nullptr));
        r.msg("volume", {-12});   // peaks well under the ceiling: Limit 10 has nothing to do
        r.msg("limit", {lim});
        r.play(true);
        r.run(1);
        r.L.clear(); r.R.clear();
        r.run(6);
        peak = 0; rms = 0;
        for (size_t i = 0; i < r.L.size(); i++) { peak = std::max(peak, (double)std::max(std::fabs(r.L[i]), std::fabs(r.R[i]))); rms += r.L[i] * r.L[i]; }
        rms = std::sqrt(rms / std::max<size_t>(1, r.L.size()));
        // the detector's count on this noisy material, compared with Limit 10 (which leaves it alone)
        if (lim == 10) clicks10 = findClicks(r.L).count;
        if (lim == 60) clicks60 = findClicks(r.L).count;
    };
    double p0, r0, p10, r10, p60, r60, p100, r100;
    measure(0, p0, r0); measure(10, p10, r10); measure(60, p60, r60); measure(100, p100, r100);
    std::printf("    peak / rms dB: off %.1f / %.1f, 10 %.1f / %.1f, 60 %.1f / %.1f, 100 %.1f / %.1f\n",
                20 * std::log10(p0), 20 * std::log10(r0), 20 * std::log10(p10), 20 * std::log10(r10),
                20 * std::log10(p60), 20 * std::log10(r60), 20 * std::log10(p100), 20 * std::log10(r100));
    const double ceil = std::pow(10, -0.3 / 20) + 1e-4;
    fails += expect(p10 <= ceil && p60 <= ceil && p100 <= ceil, "with Limit on, the output never passes -0.3 dB");
    fails += expect(r60 > r10 * 1.6 && r100 > r60, "pushing Limit makes it louder and denser");
    fails += expect(std::fabs(20 * std::log10(r10 / r0)) < 1.5, "10 is a safety catch: about the same loudness as off");
    fails += expect(clicks60 <= clicks10 * 1.02 + 5, "pushing the limiter (60) adds no clicks of its own");
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
    if (only.empty() || only == "kept") testKeptCopies();
    if (only.empty() || only == "stores") testStores();
    if (only.empty() || only == "solo") testSoloUndo();
    if (only.empty() || only == "limit") testLimit();
    if (only.empty() || only == "cpu") testCpu();
    std::printf(fails ? "\n%d FAILED\n" : "\nall passed\n", fails);
    return fails ? 1 : 0;
}
