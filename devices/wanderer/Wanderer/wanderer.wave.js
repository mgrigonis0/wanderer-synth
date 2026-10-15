// wanderer.wave.js — the selected file: name, waveform, slices (jsui, Max 8 / ES5).
// Click a slice: on / off. In Weighted order, drag up / down inside a slice: its weight.
// in:  "wave <f> <state> <frames> <gen> <ns> <weighted> <name>", "wstarts ...", "wen ...", "ww ...",
//      "wpeaks <max min ...>", "hit <f> <slice>", "status <f> <text>", "sel <f>"
// out: "slicetoggle <i>", "sliceweight <i> <w>"

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
var STATES = ["empty", "", "file not found: click its slot to find it", "loading", "slicing"];

var file = 0, state = 0, frames = 0, ns = 0, weighted = 0, name = "", statusText = "";
var starts = [], en = [], wts = [], peaks = [];
var flash = -1, flashT = 0, hover = -1;
var drag = null;
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

function paint() {
    var s = mgraphics.size, a = area();
    col(BG); mgraphics.rectangle(0, 0, s[0], s[1]); mgraphics.fill();
    // header: number + name, then what the slot is doing
    text((file + 1) + "  " + (name || "empty slot"), 0, 10, 9.5, TEAL);
    var info = state === 1 ? ns + " slices" + (statusText && statusText.indexOf("slices") < 0 ? "  ·  " + statusText : "") : (STATES[state] || statusText);
    if (state === 0) info = "drop a file on the strip at the left";
    text(info, 0, 10, 8, DIM, 1, "r", s[0]);
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

function sliceAt(x) {
    var a = area();
    if (state !== 1 || ns < 1) return -1;
    var fr = (x - a.x) / a.w * frames, k = 0;
    while (k + 1 < ns && starts[k + 1] <= fr) k++;
    return k;
}

function onclick(x, y) {
    var a = area();
    if (y < a.y) return;
    var k = sliceAt(x);
    if (k < 0) return;
    drag = { k: k, y0: y, moved: false, w0: wts[k] || 0.5 };
}
function ondrag(x, y, but) {
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
function onidle(x, y) { var k = y > HEAD ? sliceAt(x) : -1; if (k !== hover) { hover = k; mgraphics.redraw(); } }
function onidleout() { if (hover !== -1) { hover = -1; mgraphics.redraw(); } }

function fadeTick() {
    flashT -= 0.2;
    if (flashT <= 0) { flashT = 0; fadeTask.cancel(); }
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
    if (Math.round(f) !== file) return;
    flash = Math.round(k); flashT = 1;
    fadeTask.cancel(); fadeTask.repeat();
}
function status(f) { var a = arrayfromargs(arguments); if (Math.round(f) === file) { statusText = a.slice(1).join(" "); mgraphics.redraw(); } }
function anything() { }
function bang() { mgraphics.redraw(); }
