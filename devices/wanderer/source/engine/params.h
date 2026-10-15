// Wanderer engine: parameter tables shared by the player (audio thread) and the model (main thread).
#pragma once
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstring>

namespace wnd {

constexpr int NF = 16;          // file slots
constexpr int MAXS = 256;       // slices per file
constexpr int NATK = 8;         // attack points stored per slice (Quant's Start snap)
constexpr int NVOICE = 6;       // playback voices per file
constexpr int PAT_MAX = 256;    // hits per locked pattern
constexpr int NSLOT = 8;        // memory slots
constexpr double LOOKAHEAD_S = 0.005;   // output compressor lookahead; the clock runs this much early

enum Kind { KNOB, KNOB0, TOGGLE, ENUM };

// Per-file parameters. The first NK are knobs with a per-hit range ("varying"); their offsets are stored per hit.
enum P {
    DENS, CONT, SWING, SPREAD, WSTR, START, LENGTH, REV, LOOP, PITCH, PENV, PDEC, GLIDE,
    ATT, DEC, GATE, VOL, PAN, WIDTH, CUT, RES, FENV, FDEC, TRACK,
    RCHANCE, RCOUNT, RSHAPE, RFADE, RSTEP, GSIZE, GDENS, SCAN, GJIT, GSPREAD,
    NK,                         // ---- end of varying knobs
    FTVAR = NK, SENS, MINLEN,   // knobs without a range
    V1, V2, V4, V8, V16, V32, TRIP, DOT, DERIVED,
    SMODE, ENGINE, FTYPE, RSPACE, METHOD,
    NP
};

struct ParamDef {
    const char* key;
    const char* tab;
    Kind kind;
    double lo, hi, ex, def;     // knobs: range and curve; toggles/enums: def = default index
    double rlo, rhi;            // Random: base drawn in this normalised range (rlo < 0: Random leaves it alone)
    double odds;                // toggles: chance of "on" when rolled
    int nitems;                 // enums
    double w[4];                // enums: Random weights (all 0 = uniform)
    // Macro: clean value (normalised), kind (0 none, 1 full, 2 capped at 125 %, 3 no overshoot past 100 %),
    // and whether the base value is blended (1) or only the range (0)
    double mclean; int mkind; int mbase;
    bool steady;                // one value per file, never a per-hit range (Swing)
};

// clang-format off
inline const ParamDef PDEF[NP] = {
    {"dens",   "clock",  KNOB, 0, 100, 1, 50,      0.15, 0.85, 0, 0, {0}, 0.5, 0, 1, false},
    {"cont",   "clock",  KNOB, -100, 100, 1, 0,    0.2, 0.8, 0, 0, {0}, 0.5, 0, 1, false},
    {"swing",  "clock",  KNOB, 0, 100, 1, 0,       0, 0.6, 0, 0, {0}, 0.0, 0, 1, true},
    {"spread", "slice",  KNOB, 0, 100, 1, 30,      0, 1, 0, 0, {0}, 0.3, 0, 1, false},
    {"wstr",   "slice",  KNOB, 0, 100, 1, 100,     0, 1, 0, 0, {0}, 1.0, 0, 1, false},
    {"start",  "play",   KNOB, 0, 100, 1, 0,       0, 0.3, 0, 0, {0}, 0.0, 3, 1, false},
    {"length", "play",   KNOB, 1, 100, 1, 100,     0.4, 1, 0, 0, {0}, 1.0, 3, 1, false},
    {"rev",    "play",   KNOB, 0, 100, 1, 0,       0, 0.25, 0, 0, {0}, 0.0, 1, 1, false},
    {"loop",   "play",   KNOB, 0, 100, 1, 0,       0, 0.25, 0, 0, {0}, 0.0, 1, 1, false},
    {"pitch",  "pitch",  KNOB, -24, 24, 1, 0,      0.44, 0.56, 0, 0, {0}, 0.5, 2, 0, false},
    {"penv",   "pitch",  KNOB, -24, 24, 1, 0,      0.42, 0.58, 0, 0, {0}, 0.5, 2, 1, false},
    {"pdec",   "pitch",  KNOB, 5, 1000, 3, 80,     0, 1, 0, 0, {0}, 0.422422, 1, 1, false},
    {"glide",  "pitch",  KNOB, 0, 500, 2, 0,       0, 0.5, 0, 0, {0}, 0.0, 1, 1, false},
    {"att",    "env",    KNOB, 0, 1000, 3, 0,      0, 0.4, 0, 0, {0}, 0.0, 1, 1, false},
    {"dec",    "env",    KNOB, 5, 2000, 3, 10,     0, 0.6, 0, 0, {0}, 0.135834, 1, 1, false},
    {"gate",   "env",    KNOB, 1, 100, 1, 100,     0.4, 1, 0, 0, {0}, 1.0, 3, 1, false},
    {"vol",    "env",    KNOB, -36, 6, 1, 0,       -1, -1, 0, 0, {0}, 0.857143, 0, 1, false},
    {"pan",    "env",    KNOB, -100, 100, 1, 0,    0.25, 0.75, 0, 0, {0}, 0.5, 1, 1, false},
    {"width",  "env",    KNOB, 0, 200, 1, 100,     0.25, 0.75, 0, 0, {0}, 0.5, 1, 1, false},
    {"cut",    "filter", KNOB, 20, 20000, 3, 20000, 0.35, 1, 0, 0, {0}, 1.0, 1, 0, false},
    {"res",    "filter", KNOB, 0, 100, 1, 0,       0, 0.4, 0, 0, {0}, 0.0, 2, 1, false},
    {"fenv",   "filter", KNOB, -100, 100, 1, 0,    0.4, 0.6, 0, 0, {0}, 0.5, 1, 1, false},
    {"fdec",   "filter", KNOB, 5, 2000, 3, 150,    0, 1, 0, 0, {0}, 0.417326, 1, 1, false},
    {"track",  "filter", KNOB, 0, 100, 1, 0,       0, 0.3, 0, 0, {0}, 0.0, 1, 1, false},
    {"rchance","repeat", KNOB, 0, 100, 1, 0,       0, 0.5, 0, 0, {0}, 0.0, 2, 1, false},
    {"rcount", "repeat", KNOB, 1, 16, 1, 3,        0, 0.27, 0, 0, {0}, 0.133333, 2, 1, false},
    {"rshape", "repeat", KNOB, -100, 100, 1, 0,    0, 1, 0, 0, {0}, 0.5, 1, 1, false},
    {"rfade",  "repeat", KNOB, -100, 100, 1, -40,  0, 0.6, 0, 0, {0}, 0.3, 1, 1, false},
    {"rstep",  "repeat", KNOB, -7, 7, 1, 0,        0.3, 0.7, 0, 0, {0}, 0.5, 1, 1, false},
    {"gsize",  "grain",  KNOB, 10, 500, 2, 80,     0.25, 1, 0, 0, {0}, 0.377964, 1, 1, false},
    {"gdens",  "grain",  KNOB, 1, 4, 1, 2,         0, 1, 0, 0, {0}, 0.333333, 1, 1, false},
    {"scan",   "grain",  KNOB, 0, 200, 1, 100,     0.25, 0.75, 0, 0, {0}, 0.5, 1, 1, false},
    {"gjit",   "grain",  KNOB, 0, 100, 1, 10,      0, 0.6, 0, 0, {0}, 0.1, 1, 1, false},
    {"gspread","grain",  KNOB, 0, 12, 1, 0,        0, 0.15, 0, 0, {0}, 0.0, 2, 1, false},
    {"ftvar",  "filter", KNOB0, 0, 100, 1, 0,      -1, -1, 0, 0, {0}, 0, 0, 0, false},
    {"sens",   "detect", KNOB0, 0, 100, 1, 25,     -1, -1, 0, 0, {0}, 0, 0, 0, false},
    {"minlen", "detect", KNOB0, 10, 1000, 2, 100,  -1, -1, 0, 0, {0}, 0, 0, 0, false},
    {"v1",     "clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.05, 0, {0}, 0, 0, 0, false},
    {"v2",     "clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.08, 0, {0}, 0, 0, 0, false},
    {"v4",     "clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.35, 0, {0}, 0, 0, 0, false},
    {"v8",     "clock",  TOGGLE, 0, 1, 1, 1,       0, 0, 0.55, 0, {0}, 0, 0, 0, false},
    {"v16",    "clock",  TOGGLE, 0, 1, 1, 1,       0, 0, 0.6, 0, {0}, 0, 0, 0, false},
    {"v32",    "clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.25, 0, {0}, 0, 0, 0, false},
    {"trip",   "clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.2, 0, {0}, 0, 0, 0, false},
    {"dot",    "clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.2, 0, {0}, 0, 0, 0, false},
    {"derived","clock",  TOGGLE, 0, 1, 1, 0,       0, 0, 0.25, 0, {0}, 0, 0, 0, false},
    {"smode",  "slice",  ENUM, 0, 3, 1, 0,         0, 0, 0, 4, {0}, 0, 0, 0, false},
    {"engine", "pitch",  ENUM, 0, 1, 1, 0,         0, 0, 0, 2, {0.75, 0.25}, 0, 0, 0, false},
    {"ftype",  "filter", ENUM, 0, 2, 1, 0,         0, 0, 0, 3, {0.7, 0.15, 0.15}, 0, 0, 0, false},
    {"rspace", "repeat", ENUM, 0, 2, 1, 0,         0, 0, 0, 3, {0.55, 0.2, 0.25}, 0, 0, 0, false},
    {"method", "detect", ENUM, 0, 1, 1, 0,         -1, -1, 0, 2, {0}, 0, 0, 0, false},
};
// clang-format on

inline bool isKnob(int p) { return PDEF[p].kind == KNOB || PDEF[p].kind == KNOB0; }
inline double clampd(double x, double lo, double hi) { return x < lo ? lo : (x > hi ? hi : x); }
inline float clampf(float x, float lo, float hi) { return x < lo ? lo : (x > hi ? hi : x); }
inline double normOf(int p, double v) {
    const ParamDef& q = PDEF[p];
    return std::pow(clampd((v - q.lo) / (q.hi - q.lo), 0, 1), 1.0 / q.ex);
}
inline double denormOf(int p, double n) {
    const ParamDef& q = PDEF[p];
    return q.lo + (q.hi - q.lo) * std::pow(clampd(n, 0, 1), q.ex);
}
inline double defaultStored(int p) { return isKnob(p) ? normOf(p, PDEF[p].def) : PDEF[p].def; }
inline int paramIndex(const char* key) {
    for (int p = 0; p < NP; p++)
        if (!std::strcmp(PDEF[p].key, key)) return p;
    return -1;
}

// ---- tabs (the per-file page) --------------------------------------------------------------------
constexpr int NTAB = 9;
inline const char* TABS[NTAB] = {"clock", "slice", "play", "pitch", "env", "filter", "repeat", "grain", "detect"};
inline int tabIndex(const char* t) {
    for (int i = 0; i < NTAB; i++)
        if (!std::strcmp(TABS[i], t)) return i;
    return -1;
}

// ---- scales ----------------------------------------------------------------------------------------
constexpr int NSCALE = 12;
inline const int SCALE_MASK[NSCALE] = {4095, 2741, 1453, 1709, 1451, 2773, 1717, 2477, 661, 1193, 129, 1};
inline bool inScale(int semi, int mask) { int pc = ((semi % 12) + 12) % 12; return (mask >> pc) & 1; }

// nearest semitone to x in the scale
inline int quantToScale(double x, int mask) {
    int n = (int)std::floor(x + 0.5), best = n;
    double bd = 999;
    for (int k = 0; k < 13; k++) {
        int c = n + k - 6;
        if (!inScale(c, mask)) continue;
        double d = std::fabs(c - x);
        if (d < bd) { bd = d; best = c; }
    }
    return best;
}
// degree of a scale note (count of scale notes from 0; notes below 0 count down)
// (the degree of the nearest scale note at or below `note`)
inline int degreeOf(int note, int mask) {
    int g = note;
    while (!inScale(g, mask)) g--;
    int d = 0;
    if (g > 0) { for (int s = 1; s <= g; s++) if (inScale(s, mask)) d++; }
    else if (g < 0) { for (int s = g; s < 0; s++) if (inScale(s, mask)) d--; }
    return d;
}
inline int noteOfDegree(int deg, int mask) {
    int s = 0, d = 0;
    if (deg > 0) { while (d < deg) { s++; if (inScale(s, mask)) d++; } }
    else if (deg < 0) { while (d > deg) { s--; if (inScale(s, mask)) d--; } }
    return s;
}

// ---- small helpers -----------------------------------------------------------------------------
inline double hash2(double a, double b) {
    double x = std::sin(a * 12.9898 + b * 78.233) * 43758.5453;
    return x - std::floor(x);
}
inline double mixd(double a, double b, double t) { return a + (b - a) * t; }
inline double dbtoa(double db) { return std::pow(10.0, db / 20.0); }

struct Rng {
    uint64_t s = 0x9E3779B97F4A7C15ull;
    explicit Rng(uint64_t seed = 1) { reseed(seed); }
    void reseed(uint64_t seed) { s = seed * 0x9E3779B97F4A7C15ull + 0xD1B54A32D192ED03ull; if (!s) s = 1; next(); }
    uint64_t next() { s ^= s << 13; s ^= s >> 7; s ^= s << 17; return s; }
    double u() { return (next() >> 11) * (1.0 / 9007199254740992.0); }   // [0,1)
};

// note values 1, 1/2 ... 1/32 (whole notes)
inline double noteLen(int i) { return std::pow(0.5, i); }

// weight of one note value for the next wait (free clock): density favours short/long, contour favours similar
inline double waitWeight(double nlen, double dens, double cont, double last) {
    double sh = (std::log2(1.0 / nlen) - 2.5) / 2.5;
    double sim = std::exp(-std::fabs(std::log2(nlen / last)));
    return std::exp(3 * dens * sh) * std::exp(3 * cont * (sim - 0.5));
}

}  // namespace wnd
