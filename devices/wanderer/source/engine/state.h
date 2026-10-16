// Saved state as a plain list of numbers, the form a hidden Live parameter ([pattr], blob) keeps in the set.
// CONVENTIONS "Saving in the Live set": no dict names, no new symbols per save; text goes in as byte values.
//
// One list per store: [MAGIC, CODEC, store, hash hi, hash lo, payload...]
//   payload = count of number entries, then per entry: key (text), length, values;
//             count of text entries, then per entry: key (text), value (text);    text = length, bytes 0..255 (UTF-8)
// Every value is rounded to 32-bit float before it is written, and the hash is taken over those rounded values,
// so a list comes back identical (and is recognised as our own) whether Live keeps 32- or 64-bit numbers.
// Whole numbers above 2^24 can't survive 32-bit floats: callers split them (putBig / getBig).
// Anything incomplete, garbled or from another device type is refused as a whole.
#pragma once
#include <cmath>
#include <cstdint>
#include <cstring>
#include <map>
#include <string>
#include <vector>

namespace wnd {

// Flat saved state: numbers and text by key.
struct StateDoc {
    std::map<std::string, std::vector<double>> num;
    std::map<std::string, std::string> str;
    const std::vector<double>* get(const std::string& k) const { auto i = num.find(k); return i == num.end() ? nullptr : &i->second; }
    double get1(const std::string& k, double def) const { auto v = get(k); return v && !v->empty() ? (*v)[0] : def; }
    std::string gets(const std::string& k) const { auto i = str.find(k); return i == str.end() ? std::string() : i->second; }
};

constexpr double STATE_MAGIC = 7311;          // "this list is Wanderer state"
constexpr double STATE_CODEC = 1;
constexpr size_t STATE_HEAD = 5;
constexpr size_t STATE_MAX_NUMBERS = 30000;   // one Max message holds at most 32767 items

inline double f32(double v) { return std::isfinite(v) ? (double)(float)v : 0.0; }

inline uint32_t stateHash(const std::vector<double>& v, size_t from) {
    uint32_t h = 2166136261u;
    for (size_t i = from; i < v.size(); i++) {
        const float f = (float)v[i];
        uint32_t b;
        std::memcpy(&b, &f, 4);
        for (int k = 0; k < 4; k++) { h ^= (b >> (8 * k)) & 0xffu; h *= 16777619u; }
    }
    return h;
}

inline void encodeText(const std::string& s, std::vector<double>& o) {
    o.push_back((double)s.size());
    for (unsigned char c : s) o.push_back((double)c);
}

inline std::vector<double> encodeState(const StateDoc& d, int store) {
    std::vector<double> o{STATE_MAGIC, STATE_CODEC, (double)store, 0, 0};
    o.push_back((double)d.num.size());
    for (auto& kv : d.num) {
        encodeText(kv.first, o);
        o.push_back((double)kv.second.size());
        for (double v : kv.second) o.push_back(f32(v));
    }
    o.push_back((double)d.str.size());
    for (auto& kv : d.str) { encodeText(kv.first, o); encodeText(kv.second, o); }
    const uint32_t h = stateHash(o, STATE_HEAD);
    o[3] = (double)(h >> 16);
    o[4] = (double)(h & 0xffffu);
    return o;
}

// false (and `d` left empty) for anything that is not a complete, well-formed Wanderer state for `store`
inline bool decodeState(const std::vector<double>& in, int store, StateDoc& d) {
    d = StateDoc();
    if (in.size() < STATE_HEAD + 2 || in.size() > STATE_MAX_NUMBERS || in[0] != STATE_MAGIC || in[1] != STATE_CODEC ||
        in[2] != (double)store)
        return false;
    const uint32_t h = stateHash(in, STATE_HEAD);
    if (in[3] != (double)(h >> 16) || in[4] != (double)(h & 0xffffu)) return false;
    size_t p = STATE_HEAD;
    auto count = [&](double maxv, long& out) {
        if (p >= in.size()) return false;
        const double v = in[p++];
        if (!(v >= 0 && v <= maxv) || v != std::floor(v)) return false;
        out = (long)v;
        return true;
    };
    auto text = [&](std::string& s) {
        long n;
        if (!count(100000, n) || p + (size_t)n > in.size()) return false;
        s.clear();
        for (long i = 0; i < n; i++) {
            const double c = in[p++];
            if (!(c >= 0 && c < 256) || c != std::floor(c)) return false;
            s.push_back((char)(unsigned char)c);
        }
        return true;
    };
    StateDoc t;
    long nn, ns;
    if (!count(100000, nn)) return false;
    for (long e = 0; e < nn; e++) {
        std::string k;
        long nv;
        if (!text(k) || !count(100000, nv) || p + (size_t)nv > in.size()) return false;
        t.num[k] = std::vector<double>(in.begin() + (long)p, in.begin() + (long)(p + (size_t)nv));
        p += (size_t)nv;
    }
    if (!count(100000, ns)) return false;
    for (long e = 0; e < ns; e++) {
        std::string k, v;
        if (!text(k) || !text(v)) return false;
        t.str[k] = v;
    }
    if (p != in.size()) return false;
    d = t;
    return true;
}

// whole numbers that may pass 2^24 (sample positions in long files): two exact parts
inline void putBig(std::vector<double>& o, long v) { if (v < 0) v = 0; o.push_back((double)(v / 65536)); o.push_back((double)(v % 65536)); }
inline long getBig(const std::vector<double>& v, size_t i) { return (long)v[i] * 65536 + (long)v[i + 1]; }

}  // namespace wnd
