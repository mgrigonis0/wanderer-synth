// wanderer.page.js — the selected file's settings (jsui, Max 8 / ES5).
// Left: the nine tabs. Right: the tab's controls on one grid (two rows of cells), and Random + Depth for the tab.
// Each dial: drag = value; drag its outer ring = the per-hit range (scaled by Chaos); click the text under it =
// fixed / rnd / walk; double-click = default. Shift = fine.
// in:  "tab <i> <depth%>", "pb <NP values>", "pr <NK ranges%>", "pm <NK modes>", "pv <p> <b> <r> <m>", "files/sel ..."
// out: "tab <i>", "set <p> b|r|m <value>", "rndtab 1", "tabdepth <v>"

inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var FONT = "Ableton Sans Medium";
var BG = [0.11, 0.114, 0.125];
var TRACK = [0.055, 0.055, 0.063];
var TEXT = [0.925, 0.925, 0.925];
var DIM = [0.66, 0.66, 0.68];
var BTN = [0.165, 0.169, 0.184];
var BTNLINE = [0.29, 0.294, 0.314];

var TABS = [
    ["clock", "Clock", [0.941, 0.376, 0.416]], ["slice", "Slice", [0.663, 0.545, 0.91]], ["play", "Play", [0.612, 0.8, 0.353]],
    ["pitch", "Pitch", [0.941, 0.627, 0.314]], ["env", "Env", [0.937, 0.541, 0.47]], ["filter", "Filter", [0.91, 0.8, 0.369]],
    ["repeat", "Repeat", [0.898, 0.478, 0.659]], ["grain", "Grain", [0.498, 0.82, 0.682]], ["detect", "Detect", [0.77, 0.77, 0.78]]
];

// parameter indices (must match the engine's enum P)
var P = { dens: 0, cont: 1, swing: 2, spread: 3, wstr: 4, start: 5, length: 6, rev: 7, loop: 8, pitch: 9, penv: 10, pdec: 11,
    glide: 12, att: 13, dec: 14, gate: 15, vol: 16, pan: 17, width: 18, cut: 19, res: 20, fenv: 21, fdec: 22, track: 23,
    rchance: 24, rcount: 25, rshape: 26, rfade: 27, rstep: 28, gsize: 29, gdens: 30, scan: 31, gjit: 32, gspread: 33,
    ftvar: 34, sens: 35, minlen: 36, v1: 37, v2: 38, v4: 39, v8: 40, v16: 41, v32: 42, trip: 43, dot: 44, derived: 45,
    smode: 46, engine: 47, ftype: 48, rspace: 49, method: 50 };
var NK = 34, NP = 51;
// knob ranges: [lo, hi, exponent, default, label, unit]
var K = {};
K[P.dens] = [0, 100, 1, 50, "Density", "%"];      K[P.cont] = [-100, 100, 1, 0, "Contour", "+"];
K[P.swing] = [0, 100, 1, 0, "Swing", "%"];        K[P.spread] = [0, 100, 1, 30, "Spread", "%"];
K[P.wstr] = [0, 100, 1, 100, "Weight", "%"];      K[P.start] = [0, 100, 1, 0, "Start", "%"];
K[P.length] = [1, 100, 1, 100, "Length", "%"];    K[P.rev] = [0, 100, 1, 0, "Reverse", "%"];
K[P.loop] = [0, 100, 1, 0, "Loop", "%"];          K[P.pitch] = [-24, 24, 1, 0, "Pitch", "st"];
K[P.penv] = [-24, 24, 1, 0, "P.Env", "st"];       K[P.pdec] = [5, 1000, 3, 80, "P.Decay", "ms"];
K[P.glide] = [0, 500, 2, 0, "Glide", "ms"];       K[P.att] = [0, 1000, 3, 0, "Attack", "ms"];
K[P.dec] = [5, 2000, 3, 10, "Decay", "ms"];       K[P.gate] = [1, 100, 1, 100, "Gate", "%"];
K[P.vol] = [-36, 6, 1, 0, "Volume", "dB"];        K[P.pan] = [-100, 100, 1, 0, "Pan", "pan"];
K[P.width] = [0, 200, 1, 100, "Width", "%"];      K[P.cut] = [20, 20000, 3, 20000, "Cutoff", "Hz"];
K[P.res] = [0, 100, 1, 0, "Reso", "%"];           K[P.fenv] = [-100, 100, 1, 0, "F.Env", "+%"];
K[P.fdec] = [5, 2000, 3, 150, "F.Decay", "ms"];   K[P.track] = [0, 100, 1, 0, "Track", "%"];
K[P.rchance] = [0, 100, 1, 0, "Chance", "%"];     K[P.rcount] = [1, 16, 1, 3, "Count", "int"];
K[P.rshape] = [-100, 100, 1, 0, "Shape", "+"];    K[P.rfade] = [-100, 100, 1, -40, "Fade", "+"];
K[P.rstep] = [-7, 7, 1, 0, "Step", "int+"];       K[P.gsize] = [10, 500, 2, 80, "Size", "ms"];
K[P.gdens] = [1, 4, 1, 2, "Density", "int"];      K[P.scan] = [0, 200, 1, 100, "Scan", "%"];
K[P.gjit] = [0, 100, 1, 10, "Jitter", "%"];       K[P.gspread] = [0, 12, 1, 0, "Spread", "st"];
K[P.ftvar] = [0, 100, 1, 0, "Type var", "%"];     K[P.sens] = [0, 100, 1, 25, "Sens", "%"];
K[P.minlen] = [10, 1000, 2, 100, "Min len", "ms"];
var BIP = {}; BIP[P.cont] = 1; BIP[P.pitch] = 1; BIP[P.penv] = 1; BIP[P.pan] = 1; BIP[P.fenv] = 1; BIP[P.rshape] = 1; BIP[P.rfade] = 1; BIP[P.rstep] = 1;
var STEADY = {}; STEADY[P.swing] = 1;

// page layouts: rows of cells. {d: param} a dial; {t: [params], n: [names], cols, span, label, multi} switches
var PAGES = {
    clock: [[{ d: P.dens }, { d: P.cont }, { d: P.swing }, { t: [P.derived], n: ["On"], cols: 1, span: 1, label: "Derived", multi: 1 }],
            [{ t: [P.v1, P.v2, P.v4, P.v8, P.v16, P.v32, P.trip, P.dot], n: ["1", "1/2", "1/4", "1/8", "1/16", "1/32", "Trip", "Dot"], cols: 4, span: 4, label: "Note values", multi: 1 }]],
    slice: [[{ d: P.spread }, { d: P.wstr }],
            [{ e: P.smode, n: ["Random", "Walk", "Weighted", "Position"], cols: 4, span: 4, label: "Order" }]],
    play: [[{ d: P.start }, { d: P.length }, { d: P.rev }, { d: P.loop }], []],
    pitch: [[{ d: P.pitch }, { d: P.penv }, { d: P.pdec }, { d: P.glide }],
            [{ e: P.engine, n: ["Tape", "Grain"], cols: 1, span: 1, label: "Engine" }]],
    env: [[{ d: P.att }, { d: P.dec }, { d: P.gate }], [{ d: P.vol }, { d: P.pan }, { d: P.width }]],
    filter: [[{ d: P.cut }, { d: P.res }, { d: P.fenv }, { d: P.fdec }],
             [{ d: P.track }, { d: P.ftvar }, { e: P.ftype, n: ["LP", "HP", "BP"], cols: 1, span: 1, label: "Type" }]],
    repeat: [[{ d: P.rchance }, { d: P.rcount }, { d: P.rshape }, { d: P.rfade }],
             [{ d: P.rstep }, { e: P.rspace, n: ["1/32", "1/64", "1/32T"], cols: 1, span: 1, label: "Spacing" }]],
    grain: [[{ d: P.gsize }, { d: P.gdens }, { d: P.scan }, { d: P.gjit }], [{ d: P.gspread }]],
    detect: [[{ d: P.sens }, { d: P.minlen }, { e: P.method, n: ["Hits", "Notes"], cols: 1, span: 1, label: "Method" }],
             [{ note: "Changes re-slice this file. Random never changes slicing.", span: 4 }]]
};

// geometry (1x): tabs column, then 4 cells
var TABW = 36, GAP = 4, CELL = 36, CGAP = 3, HEAD = 14, ROWH = 56, STRIP = 15;
var cur = 0, depth = 100;
var B = [], R = [], M = [];
for (var i = 0; i < NP; i++) { B[i] = 0; }
for (i = 0; i < NK; i++) { R[i] = 0; M[i] = 0; }
var hot = [];          // clickable regions, rebuilt on every paint
var drag = null;

function clamp(x, lo, hi) { return x < lo ? lo : (x > hi ? hi : x); }
function norm(p, v) { var k = K[p]; return Math.pow(clamp((v - k[0]) / (k[1] - k[0]), 0, 1), 1 / k[2]); }
function denorm(p, n) { var k = K[p]; return k[0] + (k[1] - k[0]) * Math.pow(clamp(n, 0, 1), k[2]); }
function col(c, a) { mgraphics.set_source_rgba(c[0], c[1], c[2], a === undefined ? 1 : a); }
function fmt(p, v) {
    var u = K[p][5];
    if (u === "%") return Math.round(v) + " %";
    if (u === "+") return (v > 0 ? "+" : "") + Math.round(v);
    if (u === "+%") return (v > 0 ? "+" : "") + Math.round(v) + " %";
    if (u === "st") return (v > 0 && BIP[p] ? "+" : "") + (Math.abs(v) < 10 ? v.toFixed(1) : Math.round(v)) + " st";
    if (u === "ms") return v < 10 ? v.toFixed(1) + " ms" : Math.round(v) + " ms";
    if (u === "dB") return v.toFixed(1) + " dB";
    if (u === "Hz") return v >= 1000 ? (v / 1000).toFixed(v >= 10000 ? 1 : 2) + " kHz" : Math.round(v) + " Hz";
    if (u === "pan") return Math.abs(v) < 0.5 ? "C" : Math.round(Math.abs(v)) + (v < 0 ? " L" : " R");
    if (u === "int") return "" + Math.round(v);
    if (u === "int+") return (v > 0.5 ? "+" : "") + Math.round(v);
    return "" + v;
}
function text(s, x, y, size, c, a, align, w) {
    mgraphics.select_font_face(FONT);
    mgraphics.set_font_size(size);
    var m = mgraphics.text_measure(s);
    var tx = align === "c" ? x + (w - m[0]) / 2 : (align === "r" ? x + w - m[0] : x);
    col(c, a);
    mgraphics.move_to(tx, y);
    mgraphics.show_text(s);
}
function rrect(x, y, w, h, r) {
    mgraphics.rectangle_rounded(x, y, w, h, r, r);
}
function arc(cx, cy, r, a0, a1) {   // angles in degrees, 0 = up, clockwise
    var t0 = (a0 - 90) * Math.PI / 180, t1 = (a1 - 90) * Math.PI / 180;
    if (t1 < t0) { var t = t0; t0 = t1; t1 = t; }
    mgraphics.arc(cx, cy, r, t0, Math.max(t1, t0 + 0.01));
}

// ---------------------------------------------------------------------------------------------------- painting
function paint() {
    var sz = mgraphics.size, w = sz[0], h = sz[1];
    hot = [];
    col(BG); mgraphics.rectangle(0, 0, w, h); mgraphics.fill();
    var tc = TABS[cur][2];
    // tabs
    var th = (h - 8 * 3) / 9;
    for (var i = 0; i < 9; i++) {
        var y = i * (th + 3), on = i === cur, c = TABS[i][2];
        col(on ? c : BTN); rrect(0, y, TABW, th, 3); mgraphics.fill();
        text(TABS[i][1], 5, y + th / 2 + 3.5, 9, on ? [0.08, 0.08, 0.08] : c);
        hot.push({ x: 0, y: y, w: TABW, h: th, kind: "tab", i: i });
    }
    var x0 = TABW + GAP;
    // colour line beside the page, header
    col(tc, 0.7); rrect(x0, 0, 2, h, 1); mgraphics.fill();
    var px = x0 + 6, pw = w - px;
    text(TABS[cur][1].toUpperCase(), px, 10, 9.5, tc);
    col(tc, 0.55); rrect(px, HEAD - 3, pw, 2, 1); mgraphics.fill();
    // the two rows
    var rows = PAGES[TABS[cur][0]];
    for (var r = 0; r < 2; r++) {
        var row = rows[r], cx = px, cy = HEAD + 2 + r * (ROWH + 2);
        for (var k = 0; k < row.length; k++) {
            var it = row[k], span = it.span || 1, cw = span * CELL + (span - 1) * CGAP;
            if (it.d !== undefined) drawDial(it.d, cx, cy, tc);
            else if (it.t || it.e !== undefined) drawSwitches(it, cx, cy, cw, tc);
            else if (it.note) drawNote(it.note, cx, cy, cw);
            cx += cw + CGAP;
        }
    }
    // action strip: Random <tab> + Depth
    var sy = h - STRIP;
    if (TABS[cur][0] !== "detect") {
        var bw = 2 * CELL + CGAP;
        col(BTN); rrect(px, sy, bw, STRIP, STRIP / 2); mgraphics.fill();
        col(tc); mgraphics.set_line_width(1); rrect(px + 0.5, sy + 0.5, bw - 1, STRIP - 1, STRIP / 2); mgraphics.stroke();
        text("Random " + TABS[cur][1].toLowerCase(), px, sy + 10.5, 8.5, tc, 1, "c", bw);
        hot.push({ x: px, y: sy, w: bw, h: STRIP, kind: "rnd" });
        var dx = px + bw + CGAP, dw = 2 * CELL + CGAP;
        // depth: a small bar you drag sideways
        text("Depth", dx, sy + 10.5, 8, DIM);
        var bx = dx + 26, bw2 = dw - 26;
        col(TRACK); rrect(bx, sy + 4, bw2, 7, 3); mgraphics.fill();
        col(tc); rrect(bx, sy + 4, Math.max(3, bw2 * depth / 100), 7, 3); mgraphics.fill();
        text(Math.round(depth) + "%", bx, sy + 10, 7, [0.08, 0.08, 0.08], depth > 30 ? 1 : 0, "c", bw2);
        hot.push({ x: bx, y: sy, w: bw2, h: STRIP, kind: "depth" });
    }
}

function drawDial(p, x, y, c) {
    var hasRange = p < NK && !STEADY[p];
    var cx = x + CELL / 2, cy = y + 24, r = 10.5;
    text(K[p][4], x - 4, y + 8, 8.5, TEXT, 1, "c", CELL + 8);
    var n = norm(p, B[p]), a = -135 + 270 * n, a0 = BIP[p] ? 0 : -135;
    mgraphics.set_line_cap("round");
    mgraphics.set_line_width(3);
    col(TRACK); arc(cx, cy, r, -135, 135); mgraphics.stroke();
    if (hasRange && R[p] > 0.004) {        // the per-hit range: a thin outer arc around the value
        var rr = R[p] / 100 * 270;
        col(c, 0.5); mgraphics.set_line_width(1.6);
        arc(cx, cy, r + 3.2, Math.max(-135, a - rr), Math.min(135, a + rr)); mgraphics.stroke();
    } else if (hasRange) {                 // a faint guide: where the range ring lives
        col(c, 0.12); mgraphics.set_line_width(1);
        arc(cx, cy, r + 3.2, -135, 135); mgraphics.stroke();
    }
    mgraphics.set_line_width(3);
    col(c); arc(cx, cy, r, a0, a); mgraphics.stroke();
    var t = (a - 90) * Math.PI / 180;
    mgraphics.set_line_width(2);
    mgraphics.move_to(cx, cy); mgraphics.line_to(cx + Math.cos(t) * (r - 2.5), cy + Math.sin(t) * (r - 2.5)); mgraphics.stroke();
    text(fmt(p, B[p]), x - 4, y + 45, 8, TEXT, 0.85, "c", CELL + 8);
    hot.push({ x: x, y: y + 10, w: CELL, h: 30, kind: "dial", p: p, cx: cx, cy: cy, r: r });
    if (hasRange) {
        var mtxt = R[p] > 0.004 ? "±" + Math.round(R[p]) + (M[p] === 2 ? " walk" : (M[p] === 1 ? " rnd" : " fixed")) : (M[p] === 2 ? "walk" : (M[p] === 1 ? "rnd" : "fixed"));
        text(mtxt, x - 4, y + 54, 7, c, R[p] > 0.004 ? 1 : 0.45, "c", CELL + 8);
        hot.push({ x: x, y: y + 47, w: CELL, h: 9, kind: "mode", p: p });
    }
}

function drawSwitches(it, x, y, w, c) {
    text(it.label, x, y + 8, 8.5, TEXT, 1, "c", w);
    var n = it.n.length, cols = it.cols, rowsN = Math.ceil(n / cols);
    var bw = (w - (cols - 1) * CGAP) / cols, bh = 12, by0 = y + 13;
    for (var i = 0; i < n; i++) {
        var bx = x + (i % cols) * (bw + CGAP), by = by0 + Math.floor(i / cols) * (bh + 3);
        var on = it.t ? B[it.t[i]] > 0.5 : Math.round(B[it.e]) === i;
        col(on ? c : BTN); rrect(bx, by, bw, bh, 2.5); mgraphics.fill();
        if (!on) { col(BTNLINE); mgraphics.set_line_width(1); rrect(bx + 0.5, by + 0.5, bw - 1, bh - 1, 2.5); mgraphics.stroke(); }
        text(it.n[i], bx, by + 8.8, 7.5, on ? [0.08, 0.08, 0.08] : [0.85, 0.85, 0.85], 1, "c", bw);
        hot.push({ x: bx, y: by, w: bw, h: bh, kind: it.t ? "tog" : "enum", p: it.t ? it.t[i] : it.e, i: i });
    }
}

function drawNote(s, x, y, w) {
    text(s.split(". ")[0] + ".", x, y + 14, 7.5, DIM);
    if (s.indexOf(". ") > 0) text(s.split(". ")[1], x, y + 25, 7.5, DIM);
}

// ---------------------------------------------------------------------------------------------------- input
function hit(x, y) {
    for (var i = hot.length - 1; i >= 0; i--) {
        var h = hot[i];
        if (x >= h.x && x < h.x + h.w && y >= h.y && y < h.y + h.h) return h;
    }
    return null;
}

function onclick(x, y, but, cmd, shift) {
    var h = hit(x, y);
    drag = null;
    if (!h) return;
    if (h.kind === "tab") { cur = h.i; outlet(0, "tab", cur); mgraphics.redraw(); return; }
    if (h.kind === "rnd") { outlet(0, "rndtab", 1); return; }
    if (h.kind === "depth") { drag = { kind: "depth", x0: x, v0: depth, bx: h.x, bw: h.w }; setDepthAt(x, h); return; }
    if (h.kind === "tog") { var nv = B[h.p] > 0.5 ? 0 : 1; B[h.p] = nv; outlet(0, "set", h.p, "b", nv); mgraphics.redraw(); return; }
    if (h.kind === "enum") { B[h.p] = h.i; outlet(0, "set", h.p, "b", h.i); mgraphics.redraw(); return; }
    if (h.kind === "mode") { var m = (M[h.p] + 1) % 3; M[h.p] = m; outlet(0, "set", h.p, "m", m); mgraphics.redraw(); return; }
    if (h.kind === "dial") {
        var dx = x - h.cx, dy = y - h.cy, dist = Math.sqrt(dx * dx + dy * dy);
        var ring = h.p < NK && !STEADY[h.p] && dist > h.r + 0.5;
        drag = { kind: ring ? "range" : "value", p: h.p, y0: y, n0: norm(h.p, B[h.p]), r0: R[h.p] };
    }
}

function setDepthAt(x, h) {
    depth = clamp((x - h.x) / h.w * 100, 0, 100);
    outlet(0, "tabdepth", Math.round(depth));
    mgraphics.redraw();
}

function ondrag(x, y, but, cmd, shift) {
    if (!drag) return;
    if (!but) { drag = null; return; }
    if (drag.kind === "depth") { setDepthAt(x, { x: drag.bx, w: drag.bw }); return; }
    var k = shift ? 0.0015 : 0.008, d = (drag.y0 - y) * k;
    if (drag.kind === "value") {
        var v = denorm(drag.p, clamp(drag.n0 + d, 0, 1));
        if (K[drag.p][5] === "int" || K[drag.p][5] === "int+") v = Math.round(v);
        B[drag.p] = v;
        outlet(0, "set", drag.p, "b", v);
    } else {
        var r = clamp(drag.r0 + d * 100, 0, 100);
        R[drag.p] = r;
        if (r > 0.4 && M[drag.p] === 0) { M[drag.p] = 1; outlet(0, "set", drag.p, "m", 1); }
        outlet(0, "set", drag.p, "r", r);
    }
    mgraphics.redraw();
}

function ondblclick(x, y) {
    var h = hit(x, y);
    if (h && h.kind === "dial") { B[h.p] = K[h.p][3]; outlet(0, "set", h.p, "b", B[h.p]); mgraphics.redraw(); }
}

// ---------------------------------------------------------------------------------------------------- messages
function tab(i, d) { cur = clamp(Math.round(i), 0, 8); if (d !== undefined) depth = d; mgraphics.redraw(); }
function pb() { var a = arrayfromargs(arguments); for (var i = 0; i < a.length && i < NP; i++) B[i] = a[i]; mgraphics.redraw(); }
function pr() { var a = arrayfromargs(arguments); for (var i = 0; i < a.length && i < NK; i++) R[i] = a[i]; mgraphics.redraw(); }
function pm() { var a = arrayfromargs(arguments); for (var i = 0; i < a.length && i < NK; i++) M[i] = a[i]; mgraphics.redraw(); }
function pv(p, b, r, m) { p = Math.round(p); if (p < 0 || p >= NP) return; B[p] = b; if (p < NK) { R[p] = r; M[p] = m; } mgraphics.redraw(); }
function anything() { }
function bang() { mgraphics.redraw(); }
