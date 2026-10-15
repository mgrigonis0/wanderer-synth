// wanderer.gr.js — the compressor's gain reduction as a small bar growing from the right (jsui, Max 8 / ES5).
// in: "meter <gr dB> <level L> <level R> <tempo>"

inlets = 1;
outlets = 0;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var gr = 0, shown = -1;

function paint() {
    var s = mgraphics.size, w = s[0], h = s[1];
    mgraphics.set_source_rgba(0.055, 0.055, 0.063, 1);
    mgraphics.rectangle_rounded(0, 0, w, h, 2, 2); mgraphics.fill();
    var f = Math.min(1, gr / 12);
    if (f > 0.005) {
        mgraphics.set_source_rgba(0.937, 0.541, 0.47, 1);
        mgraphics.rectangle_rounded(w - w * f, 0, w * f, h, 2, 2); mgraphics.fill();
    }
}

function meter(g) {
    gr = g > 0 ? g : 0;
    var q = Math.round(gr * 4);
    if (q !== shown) { shown = q; mgraphics.redraw(); }
}
function anything() { }
