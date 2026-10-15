// Wanderer engine: the model. Main thread only (the host serialises every call with one lock).
// Owns every file's settings, slicing, locked loops, memory slots, Random and saving; drives the player
// through commands and learns what it played from its reports.
#pragma once
#include <array>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <deque>
#include <functional>
#include <map>
#include <memory>
#include <string>
#include <vector>

#include "analysis.h"
#include "player.h"

namespace wnd {

// ---- what the model asks of its host (the Max object, or a test) ---------------------------------
struct Out {
    std::string sel;
    std::vector<double> nums;
    std::string str;
};

struct SliceJob {
    int method = 0;
    double sens = 0.25;         // 0..1
    double minSamps = 4410;
    bool fixed = false;         // use `starts` as they are (a reload with saved slicing); only measure the slices
    std::vector<long> starts;
};

struct SliceResult {
    long frames = 0;
    double sr = 44100;
    std::vector<long> starts;
    std::vector<float> gain;
    std::vector<std::array<float, NATK>> atk;
    std::vector<float> peaks;   // waveform overview: NPEAK columns of (max, min)
};

constexpr int NPEAK = 400;

struct Host {
    virtual ~Host() {}
    virtual void ui(const Out& o) = 0;
    virtual void loadBuffer(int f, const std::string& path) = 0;   // then model.bufferLoaded()
    virtual void clearBuffer(int f) = 0;
    virtual void analyze(int f, int gen, const SliceJob& job) = 0;  // then model.analysisDone()
    virtual void askRelink(int f) = 0;
    virtual void saveState() = 0;                                   // the host calls model.writeState() and stores it
    virtual bool fileExists(const std::string& path) = 0;
    virtual void log(const std::string&) {}
};

// Flat saved state: numbers and text by key.
struct StateDoc {
    std::map<std::string, std::vector<double>> num;
    std::map<std::string, std::string> str;
    const std::vector<double>* get(const std::string& k) const { auto i = num.find(k); return i == num.end() ? nullptr : &i->second; }
    double get1(const std::string& k, double def) const { auto v = get(k); return v && !v->empty() ? (*v)[0] : def; }
};

// The slicing pass with its retry ladder: under 4 slices, try again with more sensitivity, then the other method.
inline SliceResult runSliceJob(Analysis& an, const SliceJob& job) {
    SliceResult res;
    res.frames = (long)an.mono.size();
    res.sr = an.sr;
    an.findAttacks();
    if (job.fixed) res.starts = job.starts;
    else {
        res.starts = an.slice(job.method, job.sens, job.minSamps);
        const double steps[3][2] = {{0.25, -1}, {0.5, -1}, {0.5, (double)(1 - job.method)}};
        for (int k = 0; k < 3 && res.starts.size() < 4; k++) {
            int m = steps[k][1] < 0 ? job.method : (int)steps[k][1];
            std::vector<long> s2 = an.slice(m, std::min(1.0, job.sens + steps[k][0]), job.minSamps);
            if (s2.size() > res.starts.size()) res.starts = s2;
        }
    }
    if (res.starts.empty()) res.starts.push_back(0);
    // the overview the waveform view draws
    res.peaks.assign(NPEAK * 2, 0.f);
    const long nfr = res.frames;
    for (int c = 0; c < NPEAK && nfr > 0; c++) {
        const long a = nfr * c / NPEAK, b = std::max(a + 1, nfr * (c + 1) / NPEAK);
        float mx = -1, mn = 1;
        for (long i = a; i < b && i < nfr; i++) { const float v = an.mono[(size_t)i]; mx = std::max(mx, v); mn = std::min(mn, v); }
        res.peaks[(size_t)c * 2] = mx; res.peaks[(size_t)c * 2 + 1] = mn;
    }
    const size_t ns = res.starts.size();
    for (size_t i = 0; i < ns; i++) {
        const long a = res.starts[i], b = i + 1 < ns ? res.starts[i + 1] : res.frames;
        const double rms = an.openingRms(a, b);
        res.gain.push_back(rms > 0 ? (float)clampd(0.1 / rms, 0.063, 7.94) : 1.0f);   // Even: -20 dBFS, -24..+18 dB
        std::array<float, NATK> at{};
        an.innerAttacks(a, b, at.data());
        res.atk.push_back(at);
    }
    return res;
}

enum FileState { F_EMPTY, F_READY, F_MISSING, F_LOADING, F_ANALYZING };

struct FileModel {
    std::string path, name;
    int state = F_EMPTY;
    int gen = 0;
    long frames = 0;
    double sr = 44100;
    ParamSet ps;
    SliceTable tab;                     // the model's copy (the player gets its own)
    std::vector<long> savedStarts;      // slicing restored from a set (used if the file still has the same length)
    std::vector<unsigned char> keepEn;  // on/off and weights carried across a re-slice
    std::vector<float> keepW;
    std::vector<long> keepStarts;
    bool wroll = false;                 // weights were rolled by Random (re-drawn after a re-slice)
    bool lock = false, mute = false;
    Pattern pat;
    std::deque<Hit> played;             // the last 512 free hits (ph = song position)
    std::vector<float> peaks;           // waveform overview
    double resliceAt = -1;              // debounce (ms)
};

struct Slot {
    bool used = false;
    ParamSet ps[NF];
    int lk[NF];
    bool hasPat[NF];
    std::vector<Pattern> pats;          // NF entries
    Slot() : pats(NF) { for (int f = 0; f < NF; f++) { lk[f] = -1; hasPat[f] = false; } }
};

class Model {
public:
    Player* pl;
    Host* host;
    FileModel files[NF];
    std::unique_ptr<Slot> slots[NSLOT];
    int sel = 0, curTab = 0, curSlot = 0, slideIdx = 0;
    double gv[NGLOBAL] = {};
    double mutate = 0, msens = 0, mlen = 1;
    int gMethod = 0, gLock = 0, lockBars = 2;
    double depth[2 + NTAB];             // Random depth: all, file, then one per tab
    bool restored = false;              // nothing is saved before the set's own state had its chance to load
    double nowMs = 0;
    double saveAt = -1, clearArmUntil = -1;
    Rng rng;

    Model(Player* p, Host* h) : pl(p), host(h) {
        for (int f = 0; f < NF; f++) files[f].ps.reset();
        for (int k = 0; k < 2 + NTAB; k++) depth[k] = 1;
        for (int i = 0; i < NGLOBAL; i++) gv[i] = p->g[i];
        rng.reseed((uint64_t)std::chrono::steady_clock::now().time_since_epoch().count() ^ (uint64_t)(uintptr_t)this);
    }

    // ================================================================ messages from the UI / patch
    struct Atom { bool num = true; double d = 0; std::string s; };

    void message(const std::string& m, const std::vector<Atom>& a) {
        // a button's "bang" (or any word) counts as the default: "grand bang" = "grand 1"
        auto n = [&](size_t i, double def = 0) {
            if (i >= a.size()) return def;
            if (a[i].num) return a[i].d;
            char* end = nullptr;
            const double v = std::strtod(a[i].s.c_str(), &end);
            return end && end != a[i].s.c_str() && *end == 0 ? v : def;
        };
        auto s = [&](size_t i) { return i < a.size() ? (a[i].num ? std::to_string(a[i].d) : a[i].s) : std::string(); };
        // ---- the file page ----
        if (m == "set") { setValue(sel, (int)n(0), s(1), n(2)); return; }   // set <param> b|r|m <value>
        if (m == "tab") { curTab = (int)clampd(n(0), 0, NTAB - 1); sendPage(); return; }
        if (m == "rndtab") { if (n(0, 1) != 0) diceTab(curTab); return; }
        if (m == "tabdepth") { depth[2 + curTab] = clampd(n(0) / 100, 0, 1); dirty(); return; }
        if (m == "select") { select((int)n(0)); return; }
        if (m == "frand") { if (n(0, 1) != 0) randomFile(); return; }
        if (m == "finit") { if (n(0, 1) != 0) initFile(sel); return; }
        if (m == "fclear") { if (n(0, 1) != 0) clearFile(sel); return; }
        if (m == "flock") { lockFile(sel, n(0) != 0); sendFiles(); dirty(3000); return; }
        if (m == "fmute") { files[sel].mute = n(0) != 0; cmd(C_MUTE, sel, files[sel].mute); sendFiles(); dirty(); return; }
        if (m == "slicetoggle") { sliceToggle((int)n(0)); return; }
        if (m == "sliceweight") { sliceWeight((int)n(0), n(1)); return; }
        if (m == "drop") { drop(s(0)); return; }
        if (m == "relinkpath") { relink(s(0)); return; }
        // ---- memory ----
        if (m == "store") { if (n(0, 1) != 0) store(); return; }
        if (m == "slot") { recall((int)n(0)); return; }
        if (m == "clearslot") { if (n(0, 1) != 0) clearSlot(); return; }
        if (m == "slide") { slideIdx = (int)clampd(n(0), 0, 6); dirty(); return; }
        // ---- whole device ----
        if (m == "grand") { if (n(0, 1) != 0) randomAll(); return; }
        if (m == "rdall") { depth[0] = clampd(n(0) / 100, 0, 1); dirty(); return; }
        if (m == "clearall") { if (n(0, 1) != 0) clearAllPress(); return; }
        if (m == "mutate") { mutate = clampd(n(0), 0, 100); return; }
        if (m == "locklen") { lockBars = n(0) < 0.5 ? 1 : (n(0) < 1.5 ? 2 : (n(0) < 2.5 ? 4 : 8)); global(G_LOCKLEN, n(0)); return; }
        if (m == "glock") { globalLock(n(0) != 0); return; }
        if (m == "gmethod") { globalMethod(n(0) != 0 ? 1 : 0); return; }
        if (m == "msens") { msens = clampd(n(0), -50, 50); masterReslice(); return; }
        if (m == "mlen") { mlen = std::pow(4.0, clampd(n(0), -100, 100) / 100); masterReslice(); return; }
        if (m == "tempo") { setTempo(n(0)); return; }
        static const std::pair<const char*, int> GL[] = {
            {"chaos", G_CHAOS}, {"gdensity", G_GDENS}, {"gpitch", G_GPITCH}, {"gscale", G_GSCALE}, {"macro", G_MACRO},
            {"gtrip", G_TRIP}, {"gdot", G_DOT}, {"gptch", G_PTCH}, {"grev", G_REV}, {"quant", G_QUANT}, {"qhit", G_QHIT},
            {"glen", G_GLEN}, {"even", G_EVEN}, {"comp", G_COMP}, {"stereo", G_STEREO}, {"volume", G_VOLUME},
            {"limit", G_LIMIT}, {"playing", G_PLAYING}, {"gbuzz", G_BUZZ}};
        for (auto& gl : GL) if (m == gl.first) { global(gl.second, n(0)); return; }
    }

    // called by the host about every 15 ms: reports from the player, debounced work, saving
    void tick(double ms) {
        nowMs = ms;
        drainReports();
        for (int f = 0; f < NF; f++)
            if (files[f].resliceAt >= 0 && ms >= files[f].resliceAt) { files[f].resliceAt = -1; reslice(f); }
        if (clearArmUntil >= 0 && ms >= clearArmUntil) { clearArmUntil = -1; ui("cleararm", {0}); }
        if (saveAt >= 0 && ms >= saveAt && restored) { saveAt = -1; host->saveState(); }
    }

    // ================================================================ host callbacks
    void bufferLoaded(int f, bool ok, long frames, double sr) {
        FileModel& F = files[f];
        if (F.state != F_LOADING) return;
        if (!ok || frames < 64) {
            host->log("could not read: " + F.path);
            F.state = F_MISSING;
            status(f, "file not found");
            sendFiles();
            return;
        }
        F.frames = frames;
        F.sr = sr > 0 ? sr : 44100;
        SliceJob job = jobFor(f);
        if (!F.savedStarts.empty()) {   // a set reload: the same slicing as when it was saved
            bool okStarts = F.savedStarts.back() < frames;
            if (okStarts) { job.fixed = true; job.starts = F.savedStarts; }
            F.savedStarts.clear();
        }
        F.state = F_ANALYZING;
        status(f, "slicing");
        sendFiles();
        host->analyze(f, F.gen, job);
    }

    void analysisDone(int f, int gen, const SliceResult& r) {
        FileModel& F = files[f];
        if (gen != F.gen || (F.state != F_ANALYZING && F.state != F_READY)) return;   // the slot changed meanwhile
        const int ns = std::min((int)r.starts.size(), MAXS);
        SliceTable& t = F.tab;
        t = SliceTable();
        t.ns = ns; t.frames = r.frames; t.sr = r.sr;
        for (int i = 0; i < ns; i++) {
            t.start[i] = (float)r.starts[(size_t)i];
            t.end[i] = (float)(i + 1 < ns ? r.starts[(size_t)i + 1] : r.frames);
            t.pos[i] = r.frames > 0 ? (float)((double)r.starts[(size_t)i] / r.frames) : 0;
            t.gain[i] = r.gain[(size_t)i];
            for (int k = 0; k < NATK; k++) t.atk[i][k] = r.atk[(size_t)i][(size_t)k];
        }
        // on/off and weights: kept when the slice count is the same; otherwise each new slice takes the values
        // of the old slice it starts in
        if (!F.keepEn.empty()) {
            if ((int)F.keepEn.size() == ns) {
                for (int i = 0; i < ns; i++) { t.en[i] = F.keepEn[(size_t)i]; t.w[i] = F.keepW[(size_t)i]; }
            } else if (!F.keepStarts.empty()) {
                for (int i = 0; i < ns; i++) {
                    size_t o = 0;
                    while (o + 1 < F.keepStarts.size() && F.keepStarts[o + 1] <= (long)t.start[i]) o++;
                    t.en[i] = o < F.keepEn.size() ? F.keepEn[o] : 1;
                    t.w[i] = o < F.keepW.size() ? F.keepW[o] : 0.5f;
                }
                if (F.wroll) drawWeights(f);
            } else { for (int i = 0; i < ns; i++) { t.en[i] = 1; t.w[i] = 0.5f; } }
        } else { for (int i = 0; i < ns; i++) { t.en[i] = 1; t.w[i] = 0.5f; } }
        F.keepEn.clear(); F.keepW.clear(); F.keepStarts.clear();
        F.peaks = r.peaks;
        F.state = F_READY;
        sendTable(f);
        sendTiming(f);
        status(f, std::to_string(ns) + " slices");
        sendFiles();
        if (f == sel) sendWave();
        dirty();
    }

    void relinkAnswer(int f, const std::string& path) { if (!path.empty()) loadFile(f, path); }

    // ================================================================ state
    void writeState(StateDoc& d) const {
        d.num.clear(); d.str.clear();
        d.num["v"] = {6};
        d.num["misc"] = {(double)sel, (double)curTab, (double)curSlot, (double)slideIdx, msens, mlen, (double)gMethod,
                         (double)gLock, (double)lockBars};
        d.num["depth"] = std::vector<double>(depth, depth + 2 + NTAB);
        for (int f = 0; f < NF; f++) {
            const FileModel& F = files[f];
            const std::string k = "f" + std::to_string(f) + ".";
            putParams(d, k, F.ps);
            if (!F.path.empty()) d.str[k + "path"] = F.path;
            d.num[k + "flags"] = {(double)F.lock, (double)F.mute, (double)F.wroll};
            if (F.state == F_READY) {
                std::vector<double> st, en, w;
                for (int i = 0; i < F.tab.ns; i++) { st.push_back(F.tab.start[i]); en.push_back(F.tab.en[i]); w.push_back(F.tab.w[i]); }
                d.num[k + "starts"] = st; d.num[k + "en"] = en; d.num[k + "w"] = w;
                d.num[k + "frames"] = {(double)F.tab.frames};
            } else if (!F.savedStarts.empty()) {
                d.num[k + "starts"] = std::vector<double>(F.savedStarts.begin(), F.savedStarts.end());
                d.num[k + "en"] = std::vector<double>(F.keepEn.begin(), F.keepEn.end());
                d.num[k + "w"] = std::vector<double>(F.keepW.begin(), F.keepW.end());
            }
            if (F.lock && F.pat.cnt > 0) putPattern(d, k + "pat", F.pat);
        }
        for (int s = 0; s < NSLOT; s++) {
            if (!slots[s] || !slots[s]->used) continue;
            const Slot& S = *slots[s];
            const std::string k = "s" + std::to_string(s) + ".";
            d.num[k + "used"] = {1};
            std::vector<double> lk;
            for (int f = 0; f < NF; f++) {
                putParams(d, k + "f" + std::to_string(f) + ".", S.ps[f]);
                lk.push_back(S.lk[f]);
                if (S.hasPat[f]) putPattern(d, k + "f" + std::to_string(f) + ".pat", S.pats[(size_t)f]);
            }
            d.num[k + "lk"] = lk;
        }
    }

    void readState(const StateDoc& d) {
        restored = true;
        if (d.get1("v", 0) < 6) { sendAll(); return; }
        if (auto m = d.get("misc")) {
            const std::vector<double>& v = *m;
            if (v.size() >= 9) {
                sel = (int)clampd(v[0], 0, NF - 1); curTab = (int)clampd(v[1], 0, NTAB - 1); curSlot = (int)clampd(v[2], 0, NSLOT - 1);
                slideIdx = (int)clampd(v[3], 0, 6); msens = v[4]; mlen = v[5] > 0 ? v[5] : 1;
                gMethod = v[6] != 0; gLock = v[7] != 0; lockBars = (int)v[8];
            }
        }
        if (auto dp = d.get("depth")) for (size_t k = 0; k < dp->size() && k < (size_t)(2 + NTAB); k++) depth[k] = clampd((*dp)[k], 0, 1);
        for (int f = 0; f < NF; f++) {
            FileModel& F = files[f];
            const std::string k = "f" + std::to_string(f) + ".";
            getParams(d, k, F.ps);
            sendParams(f, 3);
            if (auto fl = d.get(k + "flags")) { F.lock = fl->size() > 0 && (*fl)[0] != 0; F.mute = fl->size() > 1 && (*fl)[1] != 0; F.wroll = fl->size() > 2 && (*fl)[2] != 0; }
            cmd(C_MUTE, f, F.mute);
            F.savedStarts.clear(); F.keepEn.clear(); F.keepW.clear(); F.keepStarts.clear();
            if (auto st = d.get(k + "starts")) {
                for (double x : *st) F.savedStarts.push_back((long)x);
                if (auto en = d.get(k + "en")) for (double x : *en) F.keepEn.push_back(x != 0);
                if (auto w = d.get(k + "w")) for (double x : *w) F.keepW.push_back((float)x);
                if (F.keepEn.size() != F.savedStarts.size()) F.keepEn.assign(F.savedStarts.size(), 1);
                if (F.keepW.size() != F.savedStarts.size()) F.keepW.assign(F.savedStarts.size(), 0.5f);
                F.keepStarts = F.savedStarts;
            }
            F.pat = Pattern();
            if (F.lock && getPattern(d, k + "pat", F.pat)) { sendPattern(f, 0); cmd(C_LOCK, f, 1); }
            else { F.lock = false; cmd(C_LOCK, f, 0); }
            auto p = d.str.find(k + "path");
            if (p != d.str.end() && !p->second.empty()) loadFile(f, p->second, true);
        }
        for (int s = 0; s < NSLOT; s++) {
            const std::string k = "s" + std::to_string(s) + ".";
            if (d.get1(k + "used", 0) == 0) { slots[s].reset(); continue; }
            slots[s].reset(new Slot());
            Slot& S = *slots[s];
            S.used = true;
            const std::vector<double>* lk = d.get(k + "lk");
            for (int f = 0; f < NF; f++) {
                getParams(d, k + "f" + std::to_string(f) + ".", S.ps[f]);
                S.lk[f] = lk && (size_t)f < lk->size() ? (int)(*lk)[(size_t)f] : -1;
                S.hasPat[f] = getPattern(d, k + "f" + std::to_string(f) + ".pat", S.pats[(size_t)f]);
            }
        }
        sendAll();
    }

    // nothing came from the set (a new device): saving may start
    void noState() { restored = true; sendAll(); }

    // ================================================================ files
    void select(int n) {
        sel = (int)clampd(n, 0, NF - 1);
        if (files[sel].state == F_MISSING) host->askRelink(sel);
        sendFiles(); sendWave(); sendPage();
    }

    void drop(const std::string& path) {
        if (path.empty() || path == "none" || path == "bang") return;   // not a file (a stray bang, an empty strip)
        int f = -1;
        if (files[sel].state == F_EMPTY) f = sel;
        else for (int i = 0; i < NF; i++) if (files[i].state == F_EMPTY) { f = i; break; }
        if (f < 0) f = sel;
        FileModel& F = files[f];
        F.keepEn.clear(); F.keepW.clear(); F.keepStarts.clear(); F.savedStarts.clear(); F.wroll = false;
        loadFile(f, path);
        sel = f;
        select(sel);
    }

    void relink(const std::string& path) { if (files[sel].state == F_MISSING) loadFile(sel, path, true); }

    void loadFile(int f, const std::string& path, bool keepSlicing = false) {
        FileModel& F = files[f];
        F.path = path;
        size_t k = path.find_last_of("/:\\");
        F.name = k == std::string::npos ? path : path.substr(k + 1);
        F.gen++;
        if (!keepSlicing) { F.savedStarts.clear(); }
        cmd(C_SILENCE, f, 0);
        if (!host->fileExists(path)) {
            host->log("file not found: " + path);
            F.state = F_MISSING;
            cmd(C_SLICES, f, 0, nullptr);
            status(f, "file not found");
            sendFiles();
            if (f == sel) sendWave();
            dirty();
            return;
        }
        F.state = F_LOADING;
        status(f, "loading");
        sendFiles();
        if (f == sel) sendWave();
        host->loadBuffer(f, path);
        dirty();
    }

    void clearFile(int f) {
        FileModel& F = files[f];
        F.gen++;
        cmd(C_SILENCE, f, 0);
        cmd(C_LOCK, f, 0);
        cmd(C_SLICES, f, 0, nullptr);
        cmd(C_PATTERN, f, 0, nullptr);
        cmd(C_MUTE, f, 0);
        F.path.clear(); F.name.clear(); F.state = F_EMPTY; F.frames = 0;
        F.tab = SliceTable(); F.lock = false; F.mute = false; F.pat = Pattern(); F.played.clear();
        F.keepEn.clear(); F.keepW.clear(); F.keepStarts.clear(); F.savedStarts.clear(); F.wroll = false; F.resliceAt = -1;
        host->clearBuffer(f);
        sendFiles();
        if (f == sel) { sendWave(); sendPage(); }
        dirty();
    }

    void initFile(int f) {
        FileModel& F = files[f];
        for (int p = 0; p < NP; p++) {
            if (!std::strcmp(PDEF[p].tab, "detect")) continue;
            F.ps.b[p] = (float)defaultStored(p);
            if (p < NK) { F.ps.r[p] = 0; F.ps.m[p] = 0; }
        }
        sendParams(f, 3);
        if (f == sel) sendPage();
        dirty();
    }

    // ================================================================ parameters
    // set <param> b|r|m <value>: b in display units (knobs) or index, r in 0..100, m 0/1/2
    void setValue(int f, int p, const std::string& what, double val) {
        if (p < 0 || p >= NP) return;
        FileModel& F = files[f];
        const ParamDef& q = PDEF[p];
        if (what == "b") F.ps.b[p] = (float)(isKnob(p) ? normOf(p, val) : clampd(std::floor(val + 0.5), q.lo, q.hi));
        else if (p < NK && !q.steady && what == "r") F.ps.r[p] = (float)clampd(val / 100, 0, 1);
        else if (p < NK && !q.steady && what == "m") F.ps.m[p] = (unsigned char)clampd(std::floor(val + 0.5), 0, 2);
        else return;
        sendParam(f, p);
        if (!std::strcmp(q.tab, "detect")) scheduleReslice(f, 400);
        if (p == SMODE && f == sel) sendWave();
        if (f == sel) sendPageValue(p);
        dirty();
    }

    void global(int i, double v) {
        gv[i] = v;
        cmd(C_GLOBAL, 0, i, nullptr, (float)v);
        if (i == G_TEMPO) {}
    }

    void setTempo(double bpm) {
        if (!(bpm > 0)) return;
        bool changed = std::fabs(bpm - gv[G_TEMPO]) > 0.01;
        global(G_TEMPO, bpm);
        if (changed) for (int f = 0; f < NF; f++) if (files[f].state == F_READY) sendTiming(f);
    }

    // ================================================================ slicing
    SliceJob jobFor(int f) const {
        const FileModel& F = files[f];
        SliceJob j;
        j.method = (int)F.ps.b[METHOD];
        j.sens = clampd(denormOf(SENS, F.ps.b[SENS]) + msens, 0, 100) / 100;
        j.minSamps = denormOf(MINLEN, F.ps.b[MINLEN]) * mlen * F.sr / 1000;
        return j;
    }

    void scheduleReslice(int f, double ms) { if (files[f].state == F_READY || files[f].state == F_ANALYZING) files[f].resliceAt = nowMs + ms; }

    void reslice(int f) {
        FileModel& F = files[f];
        if (F.state != F_READY && F.state != F_ANALYZING) return;
        if (F.state == F_READY) {
            F.keepEn.assign(F.tab.en, F.tab.en + F.tab.ns);
            F.keepW.assign(F.tab.w, F.tab.w + F.tab.ns);
            F.keepStarts.clear();
            for (int i = 0; i < F.tab.ns; i++) F.keepStarts.push_back((long)F.tab.start[i]);
        }
        F.gen++;
        F.state = F_ANALYZING;
        status(f, "slicing");
        sendFiles();
        host->analyze(f, F.gen, jobFor(f));
    }

    void masterReslice() { for (int f = 0; f < NF; f++) scheduleReslice(f, 500); dirty(); }

    void globalMethod(int v) {
        if (v == gMethod) return;   // Live restoring the switch at load never overrides files set on their own
        gMethod = v;
        for (int f = 0; f < NF; f++) { files[f].ps.b[METHOD] = (float)v; sendParam(f, METHOD); scheduleReslice(f, 50); }
        sendPage();
        dirty();
    }

    void sliceToggle(int i) {
        FileModel& F = files[sel];
        if (F.state != F_READY || i < 0 || i >= F.tab.ns) return;
        F.tab.en[i] = !F.tab.en[i];
        Cmd c; c.type = C_SLICEON; c.f = sel; c.i = i; c.a = F.tab.en[i]; push(c);
        sendWave();
        dirty();
    }

    void sliceWeight(int i, double w) {
        FileModel& F = files[sel];
        if (F.state != F_READY || i < 0 || i >= F.tab.ns) return;
        F.tab.w[i] = (float)clampd(w, 0, 1);
        F.wroll = false;   // drawn by hand now: kept through re-slices
        Cmd c; c.type = C_SLICEW; c.f = sel; c.i = i; c.a = F.tab.w[i]; push(c);
        sendWave();
        dirty();
    }

    void drawWeights(int f) {
        SliceTable& t = files[f].tab;
        for (int i = 0; i < t.ns; i++) t.w[i] = (float)(0.05 + 0.95 * std::pow(rng.u(), 1.6));
    }

    // ================================================================ Free / Lock and loops
    void lockFile(int f, bool on) {
        FileModel& F = files[f];
        if (on && F.state == F_READY && !F.lock) {
            F.pat = capture(f);
            sendPattern(f, 0);
            F.lock = true;
            cmd(C_LOCK, f, 1);
        } else if (!on && F.lock) {
            F.lock = false;
            cmd(C_LOCK, f, 0);
        }
    }

    void globalLock(bool on) {
        int v = on ? 1 : 0;
        if (v == gLock) return;   // Live restoring the switch at load never changes files switched on their own
        gLock = v;
        for (int f = 0; f < NF; f++) if (files[f].state == F_READY) lockFile(f, on);
        sendFiles();
        dirty(3000);
    }

    // Free -> Lock: the hits of the last Lock-length bars, as they were played. Read from the newest back,
    // stopping where time jumped backwards (a Live loop jumping back), so an earlier pass is never mixed in.
    Pattern capture(int f) {
        FileModel& F = files[f];
        const double lk = lockBars;
        const double pos = pl->posNow.load() - 1e-6;
        const double t0 = std::floor(pos / lk) * lk;
        std::vector<std::pair<double, const Hit*>> list;
        double newer = 1e300;
        for (auto it = F.played.rbegin(); it != F.played.rend(); ++it) {
            const double tg = it->ph;
            if (tg > newer + 1e-6 || tg <= pos - lk) break;
            newer = tg;
            if (it->slice >= 0 && tg <= pos) list.push_back({tg >= t0 ? tg - t0 : tg - (t0 - lk), &*it});
        }
        if (list.empty()) return generatePattern(f);
        std::stable_sort(list.begin(), list.end(), [](const std::pair<double, const Hit*>& a, const std::pair<double, const Hit*>& b) { return a.first < b.first; });
        Pattern p;
        p.len = lk;
        for (auto& e : list) {
            if (p.cnt >= PAT_MAX) break;
            p.hits[p.cnt] = *e.second;
            p.hits[p.cnt].ph = (float)e.first;
            p.cnt++;
        }
        return p;
    }

    double knobNow(const ParamSet& ps, int p, double off) const {
        return denormOf(p, clampd(ps.b[p] + off * ps.r[p] * gv[G_CHAOS] / 50, 0, 1));
    }

    // a fresh loop of the Lock length, drawn the way the free clock would play this file's settings
    Pattern generatePattern(int f) {
        FileModel& F = files[f];
        const ParamSet& ps = F.ps;
        Pattern pat;
        pat.len = lockBars;
        const double flen = std::max(0.25, fileBars(f));
        double wk[NK] = {}, last = 0.0625, t = 0;
        int prev = -1;
        const double restp = clampd(-gv[G_GDENS] / 100, 0, 1) * 0.85;
        int on[6], anyOn = 0;
        for (int i = 0; i < 6; i++) { on[i] = ps.b[V1 + i] > 0.5; anyOn += on[i]; }
        if (!anyOn) on[4] = 1;
        const bool trip = gv[G_TRIP] > 0.5 && ps.b[TRIP] > 0.5, dot = gv[G_DOT] > 0.5 && ps.b[DOT] > 0.5, derived = ps.b[DERIVED] > 0.5;
        float dw[6];
        derivedWeights(f, dw);
        int guard = 0;
        while (t < pat.len - 1e-9 && pat.cnt < PAT_MAX && guard++ < 4096) {
            Hit h;
            for (int p = 0; p < NK; p++) {
                const int md = ps.m[p];
                const double u = rng.u() * 2 - 1;
                double o = 0;
                if (md == 2) { o = clampd(wk[p] + u * 0.35, -1, 1); wk[p] = o; }
                else if (md == 1) o = u;
                h.off[p] = (float)o;
            }
            h.rep = (float)rng.u();
            h.seed = (float)(std::floor(rng.u() * 100000) / 100);
            h.wait = (float)last;
            const double ph = (t - std::floor(t / flen) * flen) / flen;
            const int s = chooseSlice(&F.tab, (int)ps.b[SMODE], knobNow(ps, SPREAD, h.off[SPREAD]) / 100,
                                      knobNow(ps, WSTR, h.off[WSTR]) / 100, prev, rng.u(), rng.u(), ph);
            if (s >= 0 && !(rng.u() < restp)) {
                h.ph = (float)t; h.slice = (short)s;
                pat.hits[pat.cnt++] = h;
                prev = s;
            }
            const double dens = clampd(knobNow(ps, DENS, h.off[DENS]) / 50 - 1 + gv[G_GDENS] / 100 * 3, -3, 3);
            const double cont = knobNow(ps, CONT, h.off[CONT]) / 100;
            double cand[18], wt[18], tot = 0;
            int nc = 0;
            for (int i = 0; i < 6; i++) {
                if (!on[i]) continue;
                const double d = derived ? std::max(0.02f, dw[i]) : 1.0, l0 = noteLen(i);
                cand[nc] = l0; wt[nc] = d * waitWeight(l0, dens, cont, last); tot += wt[nc++];
                if (trip) { cand[nc] = l0 * 2 / 3; wt[nc] = d * waitWeight(l0 * 2 / 3, dens, cont, last); tot += wt[nc++]; }
                if (dot && i > 0) { cand[nc] = l0 * 1.5; wt[nc] = d * waitWeight(l0 * 1.5, dens, cont, last); tot += wt[nc++]; }
            }
            double x = rng.u() * tot, acc = 0, pick = 0.0625;
            for (int i = 0; i < nc; i++) { acc += wt[i]; if (acc >= x) { pick = cand[i]; break; } }
            last = pick;
            t = (std::floor(t / pick + 1e-6) + 1) * pick;
        }
        return pat;
    }

    // Mutate: after each pass, some hits of a locked loop are re-drawn (offsets, slice, repeat, seed)
    void mutatePass(int f) {
        FileModel& F = files[f];
        if (!F.lock || mutate <= 0 || F.pat.cnt == 0 || F.state != F_READY) return;
        const ParamSet& ps = F.ps;
        const double flen = std::max(0.25, fileBars(f));
        bool any = false;
        for (int i = 0; i < F.pat.cnt; i++) {
            if (!(rng.u() < mutate / 100)) continue;
            Hit& h = F.pat.hits[i];
            for (int p = 0; p < NK; p++) h.off[p] = ps.m[p] > 0 ? (float)(rng.u() * 2 - 1) : 0.f;
            const double ph = (h.ph - std::floor(h.ph / flen) * flen) / flen;
            const int s = chooseSlice(&F.tab, (int)ps.b[SMODE], knobNow(ps, SPREAD, h.off[SPREAD]) / 100,
                                      knobNow(ps, WSTR, h.off[WSTR]) / 100, h.slice, rng.u(), rng.u(), ph);
            if (s >= 0) h.slice = (short)s;
            h.rep = (float)rng.u();
            h.seed = (float)(std::floor(rng.u() * 100000) / 100);
            any = true;
        }
        if (any) { sendPattern(f, 2); if (saveAt < 0) dirty(30000); }   // Mutate saves now and then, not every pass
    }

    // ================================================================ Random
    double depthOf(int scope) const { return depth[scope]; }

    void randomFile() {
        FileModel& F = files[sel];
        if (F.state != F_READY) return;
        randomize(sel, -1, depth[1]);
        freshPattern(sel);
        cmd(C_NUDGE, sel, 0);
        sendPage();
        dirty();
    }

    void diceTab(int t) {
        if (t < 0 || t >= NTAB || !std::strcmp(TABS[t], "detect")) return;   // Random never changes the slicing
        randomize(sel, t, depth[2 + t]);
        sendPage();
        dirty();
    }

    void randomAll() {
        for (int f = 0; f < NF; f++) {
            if (files[f].state != F_READY) continue;
            randomize(f, -1, depth[0]);
            freshPattern(f);
            cmd(C_NUDGE, f, 0);
        }
        sendPage();
        dirty();
    }

    void freshPattern(int f) {
        if (!files[f].lock || files[f].state != F_READY) return;
        files[f].pat = generatePattern(f);
        sendPattern(f, 0);
    }

    // amt: how far values move toward a new random value; switches and menus change with this probability
    void randomize(int f, int onlyTab, double amt) {
        if (amt <= 0) return;
        FileModel& F = files[f];
        ParamSet& ps = F.ps;
        auto inTab = [&](int p) { return onlyTab < 0 || !std::strcmp(PDEF[p].tab, TABS[onlyTab]); };
        auto tabIs = [&](const char* t) { return onlyTab < 0 || !std::strcmp(TABS[onlyTab], t); };
        auto rollMode = [&](int p) { if (rng.u() < amt) ps.m[p] = ps.r[p] < 0.005 ? 0 : (rng.u() < 0.7 ? 1 : 2); };
        for (int p = 0; p < NP; p++) {
            const ParamDef& q = PDEF[p];
            if (!inTab(p) || !std::strcmp(q.tab, "detect") || p == FTVAR) continue;
            if (p == VOL) {   // the volume itself stays; only its per-hit range is rolled (about +-12 dB at most)
                const double vr = rng.u() < 0.4 ? 0 : rng.u() * 0.3;
                ps.r[p] += (float)((vr - ps.r[p]) * amt);
                rollMode(p);
                continue;
            }
            if (q.kind == KNOB) {
                if (q.rlo < 0) continue;
                double tb = q.rlo + rng.u() * (q.rhi - q.rlo);
                double tr = rng.u() < 0.3 ? 0 : rng.u();
                if (p == LOOP) {   // Loop is on in about 1 roll of 5; when it's off, no hit may loop (its range is 0 too)
                    const bool on = rng.u() < 0.2;
                    tb = on ? 0.05 + rng.u() * 0.25 : 0;
                    tr = on && rng.u() < 0.5 ? rng.u() * 0.3 : 0;
                }
                if (p == PITCH) tr = rng.u() < 0.3 ? 0 : rng.u() * 0.25;
                if (p == GLIDE) { tb = rng.u() < 0.7 ? 0 : rng.u() * 0.35; tr = rng.u() < 0.5 ? 0 : rng.u() * 0.3; }
                ps.b[p] += (float)((tb - ps.b[p]) * amt);
                ps.r[p] += (float)((tr - ps.r[p]) * amt);
                rollMode(p);
                if (q.steady) { ps.r[p] = 0; ps.m[p] = 0; }
            } else if (q.kind == TOGGLE) {
                if (rng.u() < amt) ps.b[p] = rng.u() < q.odds ? 1.f : 0.f;
            } else if (q.kind == ENUM) {
                if (rng.u() < amt) {
                    double sw = 0;
                    for (int i = 0; i < q.nitems; i++) sw += q.w[i];
                    if (sw <= 0) ps.b[p] = (float)std::floor(rng.u() * q.nitems);
                    else {
                        double x = rng.u() * sw, acc = 0;
                        int pick = q.nitems - 1;
                        for (int i = 0; i < q.nitems; i++) { acc += q.w[i]; if (x < acc) { pick = i; break; } }
                        ps.b[p] = (float)pick;
                    }
                }
            }
        }
        // Start, Length and Gate share one "how much of the slice is heard" (leaning toward most of it),
        // so they are rarely all short at once
        const bool doPlay = tabIs("play"), doEnv = tabIs("env");
        if (doPlay || doEnv) {
            const double keepAll = 0.3 + 0.7 * (1 - std::pow(rng.u(), 1.5));
            const double wS = std::pow(rng.u(), 3), wL = std::pow(rng.u(), 3), wG = std::pow(rng.u(), 3), wSum = wS + wL + wG + 1e-6;
            const double cS = std::pow(keepAll, wS / wSum), cL = std::pow(keepAll, wL / wSum), cG = std::pow(keepAll, wG / wSum);
            std::vector<std::pair<int, double>> trio;
            if (doPlay) { trio.push_back({START, std::min(0.5, 1 - cS)}); trio.push_back({LENGTH, (100 * cL - 1) / 99}); }
            if (doEnv) trio.push_back({GATE, (100 * cG - 1) / 99});
            for (auto& t : trio) {
                const double trr = rng.u() < 0.4 ? 0 : rng.u() * 0.5;
                ps.b[t.first] += (float)((clampd(t.second, 0, 1) - ps.b[t.first]) * amt);
                ps.r[t.first] += (float)((trr - ps.r[t.first]) * amt);
                rollMode(t.first);
            }
        }
        if (tabIs("filter")) {
            const double tvt = 0.6 * std::pow(rng.u(), 1.5);   // Type var 0..60 %, leaning low
            ps.b[FTVAR] += (float)((tvt - ps.b[FTVAR]) * amt);
            // keep the cutoff musical for the type: LP stays bright, HP low, BP in the middle
            const int ft = (int)ps.b[FTYPE];
            const double lo = ft == 0 ? 0.55 : (ft == 1 ? 0.15 : 0.3), hi = ft == 0 ? 1 : (ft == 1 ? 0.42 : 0.58);
            const double target = lo + rng.u() * (hi - lo), cur = clampd(ps.b[CUT], lo, hi);
            ps.b[CUT] = (float)(cur + (target - cur) * amt);
            ps.r[CUT] = std::min(ps.r[CUT], 0.12f);
        }
        if (tabIs("clock") && !(ps.b[V8] > 0.5 || ps.b[V16] > 0.5)) ps.b[rng.u() < 0.5 ? V8 : V16] = 1;   // never only long waits
        bool newWeights = false;
        if (tabIs("slice") && (int)ps.b[SMODE] == 2 && F.state == F_READY) { drawWeights(f); F.wroll = true; newWeights = true; }
        sendParams(f, 3);
        if (newWeights) { sendTable(f); if (f == sel) sendWave(); }
    }

    // ================================================================ memory slots and Slide
    void store() {
        if (!slots[curSlot]) slots[curSlot].reset(new Slot());
        Slot& S = *slots[curSlot];
        S.used = true;
        for (int f = 0; f < NF; f++) {
            S.ps[f] = files[f].ps;
            S.lk[f] = files[f].lock ? 1 : 0;
            S.hasPat[f] = files[f].lock && files[f].pat.cnt > 0;
            if (S.hasPat[f]) S.pats[(size_t)f] = files[f].pat;   // exactly what plays, Mutate included
        }
        sendSlots();
        dirty();
    }

    static constexpr double SLIDES[7] = {0, 0.25, 1, 2, 4, 8, 16};

    void recall(int i) {
        curSlot = (int)clampd(i, 0, NSLOT - 1);
        sendSlots();
        if (!slots[curSlot] || !slots[curSlot]->used) { dirty(); return; }
        Slot& S = *slots[curSlot];
        const double dur = SLIDES[slideIdx];
        for (int f = 0; f < NF; f++) {
            FileModel& F = files[f];
            for (int p = 0; p < NP; p++) {
                if (!std::strcmp(PDEF[p].tab, "detect")) continue;
                F.ps.b[p] = S.ps[f].b[p];
                if (p < NK) { F.ps.r[p] = S.ps[f].r[p]; F.ps.m[p] = S.ps[f].m[p]; }
            }
            sendParams(f, dur > 0 ? 2 : 3);
            // Free/Lock and the loop change with the settings, so what plays is exactly what was stored
            if (S.lk[f] >= 0 && F.state == F_READY) {
                if (S.lk[f] && S.hasPat[f]) { F.pat = S.pats[(size_t)f]; sendPattern(f, 0); F.lock = true; cmd(C_LOCK, f, 1); }
                else if (S.lk[f]) { lockFile(f, true); }
                else if (F.lock) { F.lock = false; cmd(C_LOCK, f, 0); }
            }
        }
        Cmd c; c.type = C_SLIDE; c.a = (float)dur; push(c);
        sendFiles();
        sendPage();
        dirty();
    }

    void clearSlot() {
        slots[curSlot].reset();
        sendSlots();
        dirty();
    }

    // ================================================================ Clear All (two presses within 2 s)
    void clearAllPress() {
        if (clearArmUntil < 0) { clearArmUntil = nowMs + 2000; ui("cleararm", {1}); return; }
        clearArmUntil = -1;
        ui("cleararm", {0});
        for (int f = 0; f < NF; f++) { clearFile(f); files[f].ps.reset(); sendParams(f, 3); }
        for (int s = 0; s < NSLOT; s++) slots[s].reset();
        curSlot = 0; slideIdx = 0; msens = 0; mlen = 1; gMethod = 0; gLock = 0; lockBars = 2; sel = 0; curTab = 0;
        for (int k = 0; k < 2 + NTAB; k++) depth[k] = 1;
        // the global controls back to their defaults (Out stays as set: Even, Comp, Stereo, Volume, Limit)
        static const std::pair<const char*, double> D[] = {
            {"macro", 100}, {"quant", 0}, {"glen", 0}, {"qhit", 2}, {"gmethod", 0}, {"chaos", 50}, {"gdensity", 0},
            {"gpitch", 0}, {"mutate", 0}, {"gscale", 0}, {"gtrip", 1}, {"gdot", 1}, {"gptch", 1}, {"grev", 1}, {"gbuzz", 0},
            {"glock", 0}, {"locklen", 1}, {"slide", 0}, {"msens", 0}, {"mlen", 0}, {"rdall", 100}};
        for (auto& d : D) { Out o; o.sel = "gset"; o.str = d.first; o.nums = {d.second}; host->ui(o); }
        sendAll();
        dirty(500);
    }

    // ================================================================ reports from the player
    void drainReports() {
        Report r;
        while (pl->reps.pop(r)) {
            switch (r.type) {
                case R_FREEHIT: {
                    FileModel& F = files[r.f];
                    F.played.push_back(r.hit);
                    if (F.played.size() > 512) F.played.pop_front();
                    break;
                }
                case R_PLAYED: { Out o; o.sel = "hit"; o.nums = {(double)r.f, (double)r.slice}; host->ui(o); break; }
                case R_PASS: mutatePass(r.f); break;
                case R_START: for (int f = 0; f < NF; f++) if (!files[f].lock) files[f].played.clear(); break;
                case R_GARBAGE_SLICES: delete (SliceTable*)r.ptr; break;
                case R_GARBAGE_PATTERN: delete (Pattern*)r.ptr; break;
                case R_GARBAGE_PARAMS: delete (ParamSet*)r.ptr; break;
            }
        }
    }

    // ================================================================ to the player
    void push(const Cmd& c) {
        for (int tries = 0; tries < 1000 && !pl->cmds.pushLocked(c); tries++) {}
    }
    void cmd(int type, int f, int i, void* ptr = nullptr, float a = 0) { Cmd c; c.type = type; c.f = f; c.i = i; c.ptr = ptr; c.a = a; push(c); }
    void sendParam(int f, int p) {
        Cmd c; c.type = C_PARAM; c.f = f; c.i = p; c.a = files[f].ps.b[p];
        if (p < NK) { c.b = files[f].ps.r[p]; c.c = files[f].ps.m[p]; }
        push(c);
    }
    void sendParams(int f, int which) { cmd(C_PARAMS, f, which, new ParamSet(files[f].ps)); }
    void sendTable(int f) {
        if (files[f].state != F_READY) return;
        cmd(C_SLICES, f, 0, new SliceTable(files[f].tab));
    }
    void sendPattern(int f, int when) { cmd(C_PATTERN, f, when, new Pattern(files[f].pat)); }

    // file length in bars at the current tempo, snapped to 1/4 .. 8 bars (Position order)
    double fileBars(int f) const {
        const FileModel& F = files[f];
        if (F.tab.frames <= 0) return 1;
        const double wn = (F.tab.frames / F.tab.sr) * std::max(20.0, gv[G_TEMPO]) / 240;
        static const double FL[6] = {0.25, 0.5, 1, 2, 4, 8};
        double best = 1, bd = 99;
        for (double l : FL) { double d = std::fabs(std::log(wn / l)); if (d < bd) { bd = d; best = l; } }
        return best;
    }
    // Derived: how often each straight note value appears as a gap between the file's own slices
    void derivedWeights(int f, float* dw) const {
        const FileModel& F = files[f];
        int counts[6] = {0, 0, 0, 0, 0, 0};
        const double tempo = std::max(20.0, gv[G_TEMPO]);
        for (int s = 1; s < F.tab.ns; s++) {
            const double gap = (F.tab.start[s] - F.tab.start[s - 1]) / F.tab.sr * tempo / 240;
            if (gap > 0) counts[(int)clampd(std::lround(-std::log(gap) / std::log(2.0)), 0, 5)]++;
        }
        int mx = 0;
        for (int c : counts) mx = std::max(mx, c);
        for (int j = 0; j < 6; j++) dw[j] = mx > 0 ? (float)(0.15 + 0.85 * counts[j] / mx) : 1.f;
    }
    void sendTiming(int f) {
        Cmd c; c.type = C_TIMING; c.f = f; c.a = (float)fileBars(f);
        derivedWeights(f, c.v);
        push(c);
    }

    // ================================================================ to the UI
    void ui(const std::string& s, std::vector<double> n, const std::string& str = "") { Out o; o.sel = s; o.nums = std::move(n); o.str = str; host->ui(o); }
    void status(int f, const std::string& t) { if (f == sel) ui("status", {(double)f}, t); }

    void sendFiles() {
        std::vector<double> st, lk, mu;
        for (int f = 0; f < NF; f++) { st.push_back(files[f].state); lk.push_back(files[f].lock); mu.push_back(files[f].mute); }
        ui("files", st);
        ui("flocks", lk);
        ui("fmutes", mu);
        ui("sel", {(double)sel});
        ui("fstate", {(double)files[sel].lock, (double)files[sel].mute});
    }

    void sendWave() {
        const FileModel& F = files[sel];
        const bool ready = F.state == F_READY;
        ui("wave", {(double)sel, (double)F.state, ready ? (double)F.tab.frames : 0, (double)F.gen,
                    ready ? (double)F.tab.ns : 0, (double)((int)F.ps.b[SMODE] == 2)}, F.name);
        if (!ready) return;
        std::vector<double> st, en, w;
        for (int i = 0; i < F.tab.ns; i++) { st.push_back(F.tab.start[i]); en.push_back(F.tab.en[i]); w.push_back(F.tab.w[i]); }
        ui("wstarts", st); ui("wen", en); ui("ww", w);
        ui("wpeaks", std::vector<double>(F.peaks.begin(), F.peaks.end()));
        status(sel, std::to_string(F.tab.ns) + " slices");
    }

    // the selected file's page: every stored value, range and mode
    void sendPage() {
        const ParamSet& ps = files[sel].ps;
        std::vector<double> b, r, m;
        for (int p = 0; p < NP; p++) b.push_back(isKnob(p) ? denormOf(p, ps.b[p]) : ps.b[p]);
        for (int p = 0; p < NK; p++) { r.push_back(ps.r[p] * 100); m.push_back(ps.m[p]); }
        ui("tab", {(double)curTab, depth[2 + curTab] * 100});
        ui("pb", b); ui("pr", r); ui("pm", m);
    }
    void sendPageValue(int p) {
        const ParamSet& ps = files[sel].ps;
        ui("pv", {(double)p, isKnob(p) ? denormOf(p, ps.b[p]) : ps.b[p], p < NK ? ps.r[p] * 100 : 0, p < NK ? (double)ps.m[p] : 0});
    }
    void sendSlots() {
        std::vector<double> v;
        for (int s = 0; s < NSLOT; s++) v.push_back(slots[s] && slots[s]->used ? 1 : 0);
        v.push_back(curSlot);
        ui("slots", v);
    }
    void sendAll() {
        sendFiles(); sendWave(); sendPage(); sendSlots();
        ui("misc", {(double)slideIdx, depth[0] * 100});
    }

    void dirty(double ms = 2000) { saveAt = nowMs + ms; }   // one save per burst of edits: keeps Live's undo history small

private:
    static void putParams(StateDoc& d, const std::string& k, const ParamSet& ps) {
        d.num[k + "b"] = std::vector<double>(ps.b, ps.b + NP);
        d.num[k + "r"] = std::vector<double>(ps.r, ps.r + NK);
        d.num[k + "m"] = std::vector<double>(ps.m, ps.m + NK);
    }
    static void getParams(const StateDoc& d, const std::string& k, ParamSet& ps) {
        ps.reset();
        if (auto b = d.get(k + "b")) for (size_t p = 0; p < b->size() && p < (size_t)NP; p++) ps.b[p] = (float)(*b)[p];
        if (auto r = d.get(k + "r")) for (size_t p = 0; p < r->size() && p < (size_t)NK; p++) ps.r[p] = (float)(*r)[p];
        if (auto m = d.get(k + "m")) for (size_t p = 0; p < m->size() && p < (size_t)NK; p++) ps.m[p] = (unsigned char)(*m)[p];
        for (int p = 0; p < NK; p++) if (PDEF[p].steady) { ps.r[p] = 0; ps.m[p] = 0; }
    }
    // a loop as numbers: len, cnt, then per hit: ph, slice, rep, seed, wait, NK offsets
    static void putPattern(StateDoc& d, const std::string& k, const Pattern& p) {
        std::vector<double> v{p.len, (double)p.cnt};
        for (int i = 0; i < p.cnt; i++) {
            const Hit& h = p.hits[i];
            v.push_back(h.ph); v.push_back(h.slice); v.push_back(h.rep); v.push_back(h.seed); v.push_back(h.wait);
            for (int q = 0; q < NK; q++) v.push_back(h.off[q]);
        }
        d.num[k] = v;
    }
    static bool getPattern(const StateDoc& d, const std::string& k, Pattern& p) {
        auto v = d.get(k);
        if (!v || v->size() < 2) return false;
        const std::vector<double>& a = *v;
        p.len = a[0] > 0 ? a[0] : 4;
        const int cnt = std::min((int)a[1], PAT_MAX);
        const size_t per = 5 + NK;
        if (a.size() < 2 + per * (size_t)cnt) return false;
        p.cnt = cnt;
        for (int i = 0; i < cnt; i++) {
            const double* x = &a[2 + per * (size_t)i];
            Hit& h = p.hits[i];
            h.ph = (float)x[0]; h.slice = (short)x[1]; h.rep = (float)x[2]; h.seed = (float)x[3]; h.wait = (float)x[4];
            for (int q = 0; q < NK; q++) h.off[q] = (float)x[5 + q];
        }
        return cnt > 0;
    }
};

}  // namespace wnd
