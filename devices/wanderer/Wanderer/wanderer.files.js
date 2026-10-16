// wanderer.files.js — the 16 file slots (jsui, Max 8 / ES5). Click: select (a missing file asks where it went).
// Teal = loaded, dashed = empty, red = missing, dim = loading / slicing. Bar: blue = soloed, amber = locked,
// grey = muted. Silent files (muted, or not soloed while another is) are dimmed. A slot glows briefly when it plays.
// in:  "files <16 states>", "flocks <16>", "fmutes <16>", "fsolos <16>", "sel <f>", "hit <f> <slice>"
// out: "select <f>"

inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var FONT = "Ableton Sans Medium";
var BG = [0.11, 0.114, 0.125];
var TEAL = [0.31, 0.765, 0.753], LIGHT = [0.5, 0.88, 0.867], AMBER = [0.949, 0.722, 0.294], RED = [0.937, 0.47, 0.42];
var HEAD = 14;
var BLUE = [0.416, 0.659, 0.941];
var st = [], lk = [], mu = [], so = [], glow = [], sel = 0;
for (var i = 0; i < 16; i++) { st[i] = 0; lk[i] = 0; mu[i] = 0; so[i] = 0; glow[i] = 0; }
function anySolo() { for (var i = 0; i < 16; i++) if (so[i]) return true; return false; }
var glowTask = new Task(glowTick, this);
glowTask.interval = 50;

function col(c, a) { mgraphics.set_source_rgba(c[0], c[1], c[2], a === undefined ? 1 : a); }
function text(s, x, y, size, c, a, w) {
    mgraphics.select_font_face(FONT);
    mgraphics.set_font_size(size);
    var m = mgraphics.text_measure(s);
    col(c, a);
    mgraphics.move_to(w ? x + (w - m[0]) / 2 : x, y);
    mgraphics.show_text(s);
}
function cell(i) {
    var s = mgraphics.size, gx = 3, gy = 3, cw = (s[0] - gx) / 2, ch = (s[1] - HEAD - 2 - 7 * gy) / 8;
    return { x: (i % 2) * (cw + gx), y: HEAD + 2 + Math.floor(i / 2) * (ch + gy), w: cw, h: ch };
}

function paint() {
    var s = mgraphics.size;
    col(BG); mgraphics.rectangle(0, 0, s[0], s[1]); mgraphics.fill();
    text("FILES", 0, 10, 9.5, TEAL);
    col(TEAL, 0.55); mgraphics.rectangle_rounded(0, HEAD - 3, s[0], 2, 1, 1); mgraphics.fill();
    var solo = anySolo();
    for (var i = 0; i < 16; i++) {
        var c = cell(i), state = st[i], fg, silent = mu[i] || (solo && !so[i]);
        mgraphics.set_line_width(1);
        if (state === 2) { col([0.165, 0.114, 0.118]); mgraphics.rectangle_rounded(c.x, c.y, c.w, c.h, 2.5, 2.5); mgraphics.fill(); col(RED, 0.8); mgraphics.rectangle_rounded(c.x + 0.5, c.y + 0.5, c.w - 1, c.h - 1, 2.5, 2.5); mgraphics.stroke(); fg = RED; }
        else if (state === 1 || state >= 3) {
            col([0.122, 0.227, 0.227], state === 1 && !silent ? 1 : 0.55); mgraphics.rectangle_rounded(c.x, c.y, c.w, c.h, 2.5, 2.5); mgraphics.fill();
            if (glow[i] > 0) { col(LIGHT, 0.35 * glow[i]); mgraphics.rectangle_rounded(c.x, c.y, c.w, c.h, 2.5, 2.5); mgraphics.fill(); }
            fg = silent ? [0.43, 0.55, 0.54] : [0.85, 0.96, 0.96];
        } else {
            col([0.133, 0.137, 0.149]); mgraphics.rectangle_rounded(c.x, c.y, c.w, c.h, 2.5, 2.5); mgraphics.fill();
            col([0.24, 0.243, 0.263]); mgraphics.rectangle_rounded(c.x + 0.5, c.y + 0.5, c.w - 1, c.h - 1, 2.5, 2.5); mgraphics.stroke();
            fg = [0.42, 0.42, 0.44];
        }
        if (i === sel) { col(LIGHT); mgraphics.set_line_width(1.5); mgraphics.rectangle_rounded(c.x + 0.75, c.y + 0.75, c.w - 1.5, c.h - 1.5, 2.5, 2.5); mgraphics.stroke(); }
        text("" + (i + 1), c.x, c.y + c.h / 2 + 3, 8, fg, state >= 3 ? 0.6 : 1, c.w);
        if (so[i] || lk[i] || mu[i]) { col(so[i] ? BLUE : (lk[i] ? AMBER : [0.33, 0.34, 0.36])); mgraphics.rectangle_rounded(c.x + 3, c.y + c.h - 2.5, c.w - 6, 1.5, 1, 1); mgraphics.fill(); }
    }
}

function onclick(x, y) {
    for (var i = 0; i < 16; i++) {
        var c = cell(i);
        if (x >= c.x && x < c.x + c.w && y >= c.y && y < c.y + c.h) { sel = i; outlet(0, "select", i); mgraphics.redraw(); return; }
    }
}

function glowTick() {
    var any = false;
    for (var i = 0; i < 16; i++) if (glow[i] > 0) { glow[i] = Math.max(0, glow[i] - 0.25); any = true; }
    if (!any) glowTask.cancel();
    mgraphics.redraw();
}

function files() { var a = arrayfromargs(arguments); for (var i = 0; i < 16 && i < a.length; i++) st[i] = Math.round(a[i]); mgraphics.redraw(); }
function flocks() { var a = arrayfromargs(arguments); for (var i = 0; i < 16 && i < a.length; i++) lk[i] = a[i] ? 1 : 0; mgraphics.redraw(); }
function fsolos() { var a = arrayfromargs(arguments); for (var i = 0; i < 16 && i < a.length; i++) so[i] = a[i] ? 1 : 0; mgraphics.redraw(); }
function fmutes() { var a = arrayfromargs(arguments); for (var i = 0; i < 16 && i < a.length; i++) mu[i] = a[i] ? 1 : 0; mgraphics.redraw(); }
function hit(f) { f = Math.round(f); if (f >= 0 && f < 16) { glow[f] = 1; if (!glowTask.running) glowTask.repeat(); } }
function anything() { if (messagename === "sel") { sel = Math.round(arguments[0]); mgraphics.redraw(); } }
function bang() { mgraphics.redraw(); }
