// wanderer.wave.js — the selected file: name, waveform, slices; or (Mix) all 16 files as faders (jsui, Max 8 / ES5).
// Wave: click a slice: on / off. In Weighted order, drag up / down inside a slice: its weight.
// Mix: drag a fader: that file's Volume (double-click: 0 dB); M / S: its Mute / Solo; click a number: select it.
// in:  "wave <f> <state> <frames> <gen> <ns> <weighted> <name>", "wstarts ...", "wen ...", "ww ...",
//      "wpeaks <max min ...>", "hit <f> <slice>", "status <f> <text>",
//      "files <16 states>", "fmutes <16>", "fsolos <16>", "mixvol <16 dB>"
// out: "slicetoggle <i>", "sliceweight <i> <w>", "select <f>", "fvol <f> <dB>", "mmute <f> <0|1>", "msolo <f> <0|1>"

inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var FONT = "Ableton Sans Medium";
var BG = [0.11, 0.114, 0.125], WBG = [0.078, 0.082, 0.094];
var TEAL = [0.31, 0.765, 0.753], LIGHT = [0.5, 0.88, 0.867], AMBER = [0.949, 0.722, 0.294], VIOLET = [0.663, 0.545, 0.91];
var DIM = [0.66, 0.66, 0.68];
var HEAD = 14;
var BLUE = [0.416, 0.659, 0.941], BTN = [0.165, 0.169, 0.184], INK = [0.08, 0.08, 0.08], TRACKC = [0.055, 0.055, 0.063];
var STATES = ["empty", "", "file not found: click its slot to find it", "loading", "slicing"];

var file = 0, state = 0, frames = 0, ns = 0, weighted = 0, name = "", statusText = "";
var starts = [], en = [], wts = [], peaks = [];
var flash = -1, flashT = 0, hover = -1;
var drag = null;
// Mix
var view = 0;                       // 0 = Wave, 1 = Mix (this view only; not saved)
var fst = [], fmu = [], fso = [], vol = [], act = [];
for (var q = 0; q < 16; q++) { fst[q] = 0; fmu[q] = 0; fso[q] = 0; vol[q] = 0; act[q] = 0; }
var mdrag = null;
var fadeTask = new Task(fadeTick, this);
fadeTask.interval = 40;

function col(c, a) { mgraphics.set_source_rgba(c[0], c[1], c[2], a === undefined ? 1 : a); }
function text(s, x, y, size, c, a, align, w) {
    mgraphics.select_font_face(FONT);
    mgraphics.set_font_size(size);
    var m = mgraphics.text_measure(s);
    var tx = align === "r" ? x + w - m[0] : (align === "c" ? x + (w - m[0]) / 2 : x);
    col(c, a);
    mgraphics.move_to(tx, y);
    mgraphics.show_text(s);
}
function area() { var s = mgraphics.size; return { x: 0, y: HEAD + 2, w: s[0], h: s[1] - HEAD - 2 }; }
function sx(a, fr) { return a.x + fr / Math.max(1, frames) * a.w; }

// the Wave / Mix switch at the right of the header
function tabs() { var s = mgraphics.size, tw = 25; return { x: s[0] - 2 * tw - 2, y: 0, w: tw, h: 11 }; }
function drawTabs() {
    var t = tabs(), lab = ["Wave", "Mix"];
    for (var k = 0; k < 2; k++) {
        var x = t.x + k * (t.w + 2), on = view === k;
        col(on ? TEAL : BTN); mgraphics.rectangle_rounded(x, t.y, t.w, t.h, 2.5, 2.5); mgraphics.fill();
        if (!on) { col(TEAL, 0.7); mgraphics.set_line_width(0.8); mgraphics.rectangle_rounded(x + 0.4, t.y + 0.4, t.w - 0.8, t.h - 0.8, 2.5, 2.5); mgraphics.stroke(); }
        text(lab[k], x, t.y + 8.3, 7.5, on ? INK : TEAL, 1, "c", t.w);
    }
}
function dbText(v) { return (v > 0 ? "+" : "") + v.toFixed(1) + " dB"; }

function paint() {
    var s = mgraphics.size, a = area();
    col(BG); mgraphics.rectangle(0, 0, s[0], s[1]); mgraphics.fill();
    drawTabs();
    var t = tabs();
    if (view === 1) {
        text("MIX", 0, 10, 9.5, TEAL);
        text((file + 1) + "  " + (fst[file] ? name + "   " + dbText(vol[file]) : "empty slot"), 26, 10, 8, DIM);
        col(TEAL, 0.55); mgraphics.rectangle_rounded(0, HEAD - 3, s[0], 2, 1, 1); mgraphics.fill();
        paintMix(a);
        return;
    }
    // header: number + name, then what the slot is doing
    text((file + 1) + "  " + (name || "empty slot"), 0, 10, 9.5, TEAL);
    var info = state === 1 ? ns + " slices" + (statusText && statusText.indexOf("slices") < 0 ? "  ·  " + statusText : "") : (STATES[state] || statusText);
    if (state === 0) info = "drop a file on the strip at the left";
    text(info, 0, 10, 8, DIM, 1, "r", t.x - 6);
    col(TEAL, 0.55); mgraphics.rectangle_rounded(0, HEAD - 3, s[0], 2, 1, 1); mgraphics.fill();
    // waveform
    col(WBG); mgraphics.rectangle_rounded(a.x, a.y, a.w, a.h, 3, 3); mgraphics.fill();
    var mid = a.y + a.h / 2;
    col([0.17, 0.173, 0.19]); mgraphics.rectangle(a.x, mid, a.w, 0.5); mgraphics.fill();
    if (state !== 1 || peaks.length < 4) return;
    var np = peaks.length / 2, half = a.h / 2 - 3;
    mgraphics.move_to(a.x, mid - peaks[0] * half);
    for (var i = 1; i < np; i++) mgraphics.line_to(a.x + i / (np - 1) * a.w, mid - Math.max(peaks[i * 2], 0.004) * half);
    for (i = np - 1; i >= 0; i--) mgraphics.line_to(a.x + i / (np - 1) * a.w, mid - Math.min(peaks[i * 2 + 1], -0.004) * half);
    mgraphics.close_path();
    col(TEAL, 0.38); mgraphics.fill_preserve();
    col(LIGHT, 0.9); mgraphics.set_line_width(0.6); mgraphics.stroke();
    // slices: off = darkened, hovered / just played = lit, weights at the bottom in Weighted order
    for (i = 0; i < ns; i++) {
        var x0 = sx(a, starts[i]), x1 = i + 1 < ns ? sx(a, starts[i + 1]) : a.x + a.w;
        if (!en[i]) { col([0, 0, 0], 0.55); mgraphics.rectangle(x0, a.y, x1 - x0, a.h); mgraphics.fill(); }
        if (i === hover) { col(LIGHT, 0.1); mgraphics.rectangle(x0, a.y, x1 - x0, a.h); mgraphics.fill(); }
        if (i === flash && flashT > 0) { col(AMBER, 0.28 * flashT); mgraphics.rectangle(x0, a.y, x1 - x0, a.h); mgraphics.fill(); }
        if (i > 0) { col([1, 1, 1], 0.3); mgraphics.rectangle(x0, a.y, 0.6, a.h); mgraphics.fill(); }
        if (weighted) { var wh = Math.max(1.5, wts[i] * 22); col(VIOLET, 0.85); mgraphics.rectangle(x0 + 1.5, a.y + a.h - wh - 1.5, Math.max(1, x1 - x0 - 3), wh); mgraphics.fill(); }
    }
}

// ---------------------------------------------------------------------------------------------------- Mix
function mixGeom(a) {
    var gap = 2, sw = (a.w - 15 * gap) / 16;
    return { gap: gap, sw: sw, numY: a.y, numH: 10, fy: a.y + 13, fh: a.h - 13 - 27, mY: a.y + a.h - 25, sY: a.y + a.h - 12, bh: 11 };
}
function volN(v) { return (v + 36) / 42; }
function anySolo() { for (var i = 0; i < 16; i++) if (fso[i]) return true; return false; }
function audible(f) { return fst[f] === 1 && !fmu[f] && (!anySolo() || fso[f]); }

function paintMix(a) {
    var m = mixGeom(a);
    for (var f = 0; f < 16; f++) {
        var x = a.x + f * (m.sw + m.gap), loaded = fst[f] === 1, on = audible(f);
        // number
        col(loaded ? [0.122, 0.227, 0.227] : [0.133, 0.137, 0.149], loaded && !on ? 0.5 : 1);
        mgraphics.rectangle_rounded(x, m.numY, m.sw, m.numH, 2, 2); mgraphics.fill();
        if (f === file) { col(LIGHT); mgraphics.set_line_width(1.2); mgraphics.rectangle_rounded(x + 0.6, m.numY + 0.6, m.sw - 1.2, m.numH - 1.2, 2, 2); mgraphics.stroke(); }
        text("" + (f + 1), x, m.numY + 7.6, 7, loaded ? (on ? [0.85, 0.96, 0.96] : [0.43, 0.55, 0.54]) : [0.42, 0.42, 0.44], 1, "c", m.sw);
        // fader: the file's Volume; a faint line at 0 dB; the light line inside shows what it plays
        col(TRACKC); mgraphics.rectangle_rounded(x, m.fy, m.sw, m.fh, 2, 2); mgraphics.fill();
        col([1, 1, 1], 0.18); mgraphics.rectangle(x, m.fy + m.fh * (1 - volN(0)), m.sw, 0.6); mgraphics.fill();
        if (fst[f] !== 0) {
            var lv = m.fy + m.fh * (1 - volN(vol[f]));
            col(TEAL, on ? 0.7 : 0.28); mgraphics.rectangle_rounded(x + 1.5, lv, m.sw - 3, m.fy + m.fh - lv, 1.5, 1.5); mgraphics.fill();
            col(on ? LIGHT : DIM); mgraphics.rectangle(x + 1, lv - 0.8, m.sw - 2, 1.6); mgraphics.fill();
            if (on && act[f] > 0.02) {
                var mh = (m.fy + m.fh - lv) * act[f];
                col([0.92, 1, 1], 0.85); mgraphics.rectangle(x + m.sw / 2 - 0.5, m.fy + m.fh - mh, 1, mh); mgraphics.fill();
            }
        }
        // M and S
        var bs = [["M", m.mY, fmu[f], [0.85, 0.85, 0.85]], ["S", m.sY, fso[f], BLUE]];
        for (var k = 0; k < 2; k++) {
            var b = bs[k];
            col(b[2] ? b[3] : BTN); mgraphics.rectangle_rounded(x, b[1], m.sw, m.bh, 2, 2); mgraphics.fill();
            if (!b[2]) { col(b[3], loaded ? 0.55 : 0.2); mgraphics.set_line_width(0.7); mgraphics.rectangle_rounded(x + 0.35, b[1] + 0.35, m.sw - 0.7, m.bh - 0.7, 2, 2); mgraphics.stroke(); }
            text(b[0], x, b[1] + 8, 7, b[2] ? INK : b[3], b[2] ? 1 : (loaded ? 1 : 0.3), "c", m.sw);
        }
    }
}

function mixAt(x, y) {
    var a = area(), m = mixGeom(a);
    if (y < a.y || x < a.x) return null;
    var f = Math.floor((x - a.x) / (m.sw + m.gap));
    if (f < 0 || f > 15) return null;
    var part = y < m.numY + m.numH ? "num" : (y >= m.sY ? "s" : (y >= m.mY ? "m" : (y >= m.fy && y <= m.fy + m.fh ? "fader" : null)));
    return part ? { f: f, part: part, m: m } : null;
}
function faderTo(f, y, m) {
    var n = 1 - (y - m.fy) / m.fh;
    n = n < 0 ? 0 : (n > 1 ? 1 : n);
    var v = Math.round((n * 42 - 36) * 2) / 2;
    if (v !== vol[f]) { vol[f] = v; outlet(0, "fvol", f, v); mgraphics.redraw(); }
}

function sliceAt(x) {
    var a = area();
    if (state !== 1 || ns < 1) return -1;
    var fr = (x - a.x) / a.w * frames, k = 0;
    while (k + 1 < ns && starts[k + 1] <= fr) k++;
    return k;
}

function onclick(x, y) {
    var a = area(), t = tabs();
    if (y <= t.y + t.h + 1 && x >= t.x) { view = x < t.x + t.w + 1 ? 0 : 1; mdrag = null; drag = null; mgraphics.redraw(); return; }
    if (view === 1) {
        var h = mixAt(x, y);
        if (!h) return;
        if (h.part === "num") { outlet(0, "select", h.f); return; }
        if (fst[h.f] === 0) return;
        if (h.part === "m") { fmu[h.f] = fmu[h.f] ? 0 : 1; outlet(0, "mmute", h.f, fmu[h.f]); mgraphics.redraw(); return; }
        if (h.part === "s") { fso[h.f] = fso[h.f] ? 0 : 1; outlet(0, "msolo", h.f, fso[h.f]); mgraphics.redraw(); return; }
        mdrag = { f: h.f, m: h.m };
        if (h.f !== file) outlet(0, "select", h.f);
        faderTo(h.f, y, h.m);
        return;
    }
    if (y < a.y) return;
    var k = sliceAt(x);
    if (k < 0) return;
    drag = { k: k, y0: y, moved: false, w0: wts[k] || 0.5 };
}
function ondrag(x, y, but) {
    if (view === 1) {
        if (mdrag && but) faderTo(mdrag.f, y, mdrag.m);
        if (!but) mdrag = null;
        return;
    }
    if (!drag) return;
    if (but) {
        if (weighted && Math.abs(y - drag.y0) > 2) {
            drag.moved = true;
            var a = area(), w = 1 - (y - a.y) / a.h;
            w = w < 0 ? 0 : (w > 1 ? 1 : w);
            wts[drag.k] = w;
            outlet(0, "sliceweight", drag.k, w);
            mgraphics.redraw();
        }
        return;
    }
    if (!drag.moved) { en[drag.k] = en[drag.k] ? 0 : 1; outlet(0, "slicetoggle", drag.k); mgraphics.redraw(); }
    drag = null;
}
function ondblclick(x, y) {
    if (view !== 1) return;
    var h = mixAt(x, y);
    if (h && h.part === "fader" && fst[h.f] !== 0) { vol[h.f] = 0; outlet(0, "fvol", h.f, 0); mgraphics.redraw(); }
}
function onidle(x, y) { if (view === 1) return; var k = y > HEAD ? sliceAt(x) : -1; if (k !== hover) { hover = k; mgraphics.redraw(); } }
function onidleout() { if (hover !== -1) { hover = -1; mgraphics.redraw(); } }

function fadeTick() {
    var busy = false;
    flashT -= 0.2;
    if (flashT <= 0) flashT = 0; else busy = true;
    for (var i = 0; i < 16; i++) if (act[i] > 0) { act[i] = act[i] < 0.03 ? 0 : act[i] * 0.72; busy = true; }
    if (!busy) fadeTask.cancel();
    mgraphics.redraw();
}

// ---------------------------------------------------------------------------------------------------- messages
function wave(f, st, fr, gen, n, wtd) {
    var a = arrayfromargs(arguments);
    file = Math.round(f); state = Math.round(st); frames = fr; ns = Math.round(n); weighted = wtd ? 1 : 0;
    name = a.length > 6 ? a.slice(6).join(" ") : "";
    if (state !== 1) { starts = []; en = []; wts = []; peaks = []; }
    mgraphics.redraw();
}
function wstarts() { starts = arrayfromargs(arguments); mgraphics.redraw(); }
function wen() { en = arrayfromargs(arguments); mgraphics.redraw(); }
function ww() { wts = arrayfromargs(arguments); mgraphics.redraw(); }
function wpeaks() { peaks = arrayfromargs(arguments); mgraphics.redraw(); }
function hit(f, k) {
    f = Math.round(f);
    if (f >= 0 && f < 16) act[f] = 1;
    if (f === file) { flash = Math.round(k); flashT = 1; }
    if (!fadeTask.running) fadeTask.repeat();
}
function setArr(dst, a, isNum) { for (var i = 0; i < 16 && i < a.length; i++) dst[i] = isNum ? a[i] : (a[i] ? 1 : 0); if (view === 1) mgraphics.redraw(); }
function files() { var a = arrayfromargs(arguments); for (var i = 0; i < 16 && i < a.length; i++) fst[i] = Math.round(a[i]); if (view === 1) mgraphics.redraw(); }
function fmutes() { setArr(fmu, arrayfromargs(arguments), false); }
function fsolos() { setArr(fso, arrayfromargs(arguments), false); }
function mixvol() { setArr(vol, arrayfromargs(arguments), true); }
function status(f) { var a = arrayfromargs(arguments); if (Math.round(f) === file) { statusText = a.slice(1).join(" "); mgraphics.redraw(); } }
function anything() { }
function bang() { mgraphics.redraw(); }
