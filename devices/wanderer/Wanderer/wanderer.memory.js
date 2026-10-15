// wanderer.memory.js — the 8 memory slots (jsui, Max 8 / ES5). Click: recall that slot (and make it the one
// Store and Clear act on). Filled = stored, dashed = empty, outlined = selected.
// in: "slots <8 used flags> <current>"     out: "slot <i>"

inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var FONT = "Ableton Sans Medium";
var BG = [0.11, 0.114, 0.125];
var VIOLET = [0.663, 0.545, 0.91], PALE = [0.79, 0.71, 1.0];
var HEAD = 14;
var used = [0, 0, 0, 0, 0, 0, 0, 0], cur = 0;

function col(c, a) { mgraphics.set_source_rgba(c[0], c[1], c[2], a === undefined ? 1 : a); }
function cell(i) {
    var s = mgraphics.size, g = 3, cw = (s[0] - g) / 2, ch = (s[1] - HEAD - 2 - 3 * g) / 4;
    return { x: (i % 2) * (cw + g), y: HEAD + 2 + Math.floor(i / 2) * (ch + g), w: cw, h: ch };
}

function paint() {
    var s = mgraphics.size;
    col(BG); mgraphics.rectangle(0, 0, s[0], s[1]); mgraphics.fill();
    mgraphics.select_font_face(FONT);
    mgraphics.set_font_size(9.5);
    col(VIOLET); mgraphics.move_to(0, 10); mgraphics.show_text("MEMORY");
    col(VIOLET, 0.55); mgraphics.rectangle_rounded(0, HEAD - 3, s[0], 2, 1, 1); mgraphics.fill();
    for (var i = 0; i < 8; i++) {
        var c = cell(i);
        mgraphics.set_line_width(1);
        if (used[i]) {
            col([0.176, 0.157, 0.251]); mgraphics.rectangle_rounded(c.x, c.y, c.w, c.h, 3, 3); mgraphics.fill();
            col([0.365, 0.31, 0.549]); mgraphics.rectangle_rounded(c.x + 0.5, c.y + 0.5, c.w - 1, c.h - 1, 3, 3); mgraphics.stroke();
        } else {
            col([0.133, 0.137, 0.149]); mgraphics.rectangle_rounded(c.x, c.y, c.w, c.h, 3, 3); mgraphics.fill();
            col([0.24, 0.243, 0.263]); mgraphics.rectangle_rounded(c.x + 0.5, c.y + 0.5, c.w - 1, c.h - 1, 3, 3); mgraphics.stroke();
        }
        if (i === cur) { col(PALE); mgraphics.set_line_width(1.5); mgraphics.rectangle_rounded(c.x + 0.75, c.y + 0.75, c.w - 1.5, c.h - 1.5, 3, 3); mgraphics.stroke(); }
        mgraphics.set_font_size(9);
        var t = "" + (i + 1), m = mgraphics.text_measure(t);
        col(used[i] ? [0.89, 0.85, 1] : [0.42, 0.42, 0.44]);
        mgraphics.move_to(c.x + (c.w - m[0]) / 2, c.y + c.h / 2 + 3.2); mgraphics.show_text(t);
    }
}

function onclick(x, y) {
    for (var i = 0; i < 8; i++) {
        var c = cell(i);
        if (x >= c.x && x < c.x + c.w && y >= c.y && y < c.y + c.h) { cur = i; outlet(0, "slot", i); mgraphics.redraw(); return; }
    }
}

function slots() {
    var a = arrayfromargs(arguments);
    for (var i = 0; i < 8 && i < a.length; i++) used[i] = a[i] ? 1 : 0;
    if (a.length > 8) cur = Math.round(a[8]);
    mgraphics.redraw();
}
function anything() { }
function bang() { mgraphics.redraw(); }
