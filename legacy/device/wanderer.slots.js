// =====================================================================
//  WANDERER  ·  file slots (jsui)
//  4 x 4 grid. Click to select. Empty, loaded, missing (red), loading.
// =====================================================================

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;
inlets = 1;
outlets = 1;
setoutletassist(0, "select n");

var g = null;
var COLS = 4;
var C_BG = [0.11, 0.11, 0.11, 1];
var C_EMPTY = [0.19, 0.19, 0.19, 1];
var C_LOADED = [0.93, 0.62, 0.24, 1];
var C_MISSING = [0.84, 0.27, 0.27, 1];
var C_LOADING = [0.45, 0.45, 0.45, 1];
var C_TEXT = [0.09, 0.09, 0.09, 1];
var C_TEXT_DIM = [0.55, 0.55, 0.55, 1];
var C_SEL = [0.43, 0.78, 0.84, 1];   // selection colour, shared with the waveform and the panel frame

function root(r) {
	g = new Global("wanderer_" + r);
	mgraphics.redraw();
}

function bang() { mgraphics.redraw(); }

function cell() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	return { w: w / COLS, h: h / COLS };
}

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var c = cell();
	with (mgraphics) {
		set_source_rgba(C_BG);
		rectangle(0, 0, w, h);
		fill();
		select_font_face("Arial Bold");
		set_font_size(9);
		for (var i = 0; i < 16; i++) {
			var x = (i % COLS) * c.w;
			var y = Math.floor(i / COLS) * c.h;
			var st = (g && g.states) ? g.states[i] : 0;
			var col = st === 1 ? C_LOADED : (st === 2 ? C_MISSING : (st === 3 ? C_LOADING : C_EMPTY));
			set_source_rgba(col);
			rectangle_rounded(x + 1.5, y + 1.5, c.w - 3, c.h - 3, 3, 3);
			fill();
			if (g && g.sel === i) {
				set_source_rgba(C_SEL);
				set_line_width(1.5);
				rectangle_rounded(x + 1.5, y + 1.5, c.w - 3, c.h - 3, 3, 3);
				stroke();
			}
			var label = String(i + 1);
			var tm = text_measure(label);
			set_source_rgba(st === 0 ? C_TEXT_DIM : C_TEXT);
			move_to(x + (c.w - tm[0]) / 2, y + (c.h + tm[1]) / 2 - 2);
			show_text(label);
		}
	}
}

function onclick(x, y) {
	var c = cell();
	var col = Math.floor(x / c.w);
	var row = Math.floor(y / c.h);
	if (col < 0 || col >= COLS || row < 0 || row >= COLS) { return; }
	outlet(0, "select", row * COLS + col + 1);
}
onclick.local = 1;

function onresize() { mgraphics.redraw(); }
onresize.local = 1;
