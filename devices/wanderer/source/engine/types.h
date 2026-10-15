// Wanderer engine: data shared between the model (main thread) and the player (audio thread).
#pragma once
#include <atomic>
#include <mutex>
#include <vector>

#include "params.h"

namespace wnd {

// One file's slicing, as the player needs it. Built by the model, handed over by pointer, never changed after.
struct SliceTable {
    int ns = 0;
    long frames = 0;
    double sr = 44100;
    float start[MAXS] = {}, end[MAXS] = {};
    float pos[MAXS] = {};        // start / frames (Position order)
    float gain[MAXS] = {};       // Even: gain that brings the slice's opening to a common loudness
    float atk[MAXS][NATK] = {};  // attack points inside the slice (unused ones = the slice start)
    unsigned char en[MAXS] = {}; // slice on/off
    float w[MAXS] = {};          // weight 0..1 (Weighted order)
};

// A file's parameters: stored values (knobs normalised 0..1, toggles 0/1, enums as index), per-hit range and mode.
struct ParamSet {
    float b[NP];
    float r[NK];
    unsigned char m[NK];   // 0 fixed, 1 random per hit, 2 walk
    void reset() {
        for (int p = 0; p < NP; p++) b[p] = (float)defaultStored(p);
        for (int p = 0; p < NK; p++) { r[p] = 0; m[p] = 0; }
    }
};

// One hit of a locked loop (also the record of a played free hit).
struct Hit {
    float ph = 0;          // phase in the loop, whole notes (or the song position, in the record of played hits)
    short slice = -1;      // -1 = a rest
    float off[NK] = {};    // per-hit offsets -1..1 the hit was drawn with
    float rep = 1;         // repeat draw 0..1 (a burst happens when rep < Chance)
    float seed = 0;        // seed for the hit's hashed choices (reverse, filter type...)
    float wait = 0.0625f;  // the wait that led to this hit (triplet waits snap to triplet lines)
};

struct Pattern {
    double len = 4;        // loop length, whole notes
    int cnt = 0;
    Hit hits[PAT_MAX];
};

// ---- main -> audio commands --------------------------------------------------------------------
enum CmdType {
    C_PARAMS,      // f, ptr ParamSet*, i: 1 = A, 2 = B, 3 = both
    C_PARAM,       // f, i = param, a = b, b = r, c = m (both sets)
    C_SLICES,      // f, ptr SliceTable* (nullptr = none)
    C_TIMING,      // f, a = file length (bars), v[6] derived weights
    C_PATTERN,     // f, ptr Pattern*, i: 0 = now (enter at the current position), 1 = at the next pass,
                   //   2 = now, keeping the place (Mutate: the same hits, re-drawn)
    C_LOCK,        // f, i
    C_MUTE,        // f, i
    C_NUDGE,       // f: Random pressed -> next free hit on the next 1/16 line
    C_SILENCE,     // f: fade out the file's voices (before a load or clear)
    C_GLOBAL,      // i = global id, a = value
    C_SLIDE,       // a = duration (whole notes; 0 = instant)
    C_SLICEON,     // f, i = slice, a = on   (cheap edits without a new table)
    C_SLICEW,      // f, i = slice, a = weight
};

enum Global {
    G_CHAOS, G_GDENS, G_GPITCH, G_GSCALE, G_MACRO, G_TRIP, G_DOT, G_PTCH, G_REV, G_QUANT, G_QHIT, G_GLEN,
    G_EVEN, G_COMP, G_STEREO, G_VOLUME, G_LIMIT, G_PLAYING, G_TEMPO, G_LOCKLEN, G_BUZZ, G_REP, NGLOBAL
};

struct Cmd {
    int type = 0, f = 0, i = 0;
    float a = 0, b = 0, c = 0;
    float v[6] = {};
    void* ptr = nullptr;
};

// ---- audio -> main reports ------------------------------------------------------------------------
enum RepType { R_FREEHIT, R_PLAYED, R_PASS, R_START, R_GARBAGE_SLICES, R_GARBAGE_PATTERN, R_GARBAGE_PARAMS };
struct Report {
    int type = 0, f = 0;
    double t = 0;          // song position (whole notes)
    int slice = -1;
    Hit hit;               // R_FREEHIT: what was played (hit.ph = song position)
    void* ptr = nullptr;   // garbage to free on the main thread
};

// Single-producer single-consumer ring. Producers that may run on two threads take `pushLock`.
template <typename T, int N>
struct Ring {
    T buf[N];
    std::atomic<int> head{0}, tail{0};
    std::mutex pushLock;
    bool push(const T& x) {
        int h = head.load(std::memory_order_relaxed), n = (h + 1) % N;
        if (n == tail.load(std::memory_order_acquire)) return false;
        buf[h] = x;
        head.store(n, std::memory_order_release);
        return true;
    }
    bool pushLocked(const T& x) { std::lock_guard<std::mutex> g(pushLock); return push(x); }
    bool pop(T& x) {
        int t = tail.load(std::memory_order_relaxed);
        if (t == head.load(std::memory_order_acquire)) return false;
        x = buf[t];
        tail.store((t + 1) % N, std::memory_order_release);
        return true;
    }
};

// ---- slice choice (the model's Mutate and patterns; the player has the same in Player::choose) -----
inline int wrapIdx(int x, int n) { return ((x % n) + n) % n; }
inline int chooseSlice(const SliceTable* st, int mode, double spread, double wstr, int prev, double u1, double u2, double ph) {
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
        target = wrapIdx(prev + sp, ns);
    } else {
        int pt = post;
        if (u2 < spread) pt = post + (int)std::floor((u1 * 2 - 1) * 2.5 + 0.5);
        target = wrapIdx(pt, ns);
    }
    for (int d = 0; d < ns; d++) {
        int ia = wrapIdx(target + d, ns), ib = wrapIdx(target - d, ns);
        if (st->en[ia]) return ia;
        if (st->en[ib]) return ib;
    }
    return -1;
}

// What the player reads from a file's audio this block (filled by the host before process()).
struct Source {
    const float* data = nullptr;   // interleaved
    long frames = 0;
    int chans = 0;
    double sr = 44100;
};

}  // namespace wnd
