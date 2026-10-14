// =====================================================================
//  WANDERER  ·  waveform (jsui)
//  Shows the selected file and its slices.
//  Click a slice: enable / disable it.
//  Weighted + Manual: drag in the lower strip to set slice weights.
// =====================================================================

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;
inlets = 1;
outlets = 1;
setoutletassist(0, "slicetoggle i / sliceweight i w");

var g = null;
var STRIP = 18;
var peaks = null;
var peaksKey = "";
var dragSlice = -1;

var C_BG = [0.11, 0.11, 0.11, 1];
var C_WAVE = [0.93, 0.62, 0.24, 0.9];
var C_ALT = [1, 1, 1, 0.035];
var C_OFF = [0, 0, 0, 0.6];
var C_MARK = [1, 1, 1, 0.35];
var C_TEXT = [0.75, 0.75, 0.75, 1];
var C_DIM = [0.45, 0.45, 0.45, 1];
var C_WEIGHT = [0.55, 0.78, 0.95, 0.85];
var C_RED = [0.84, 0.27, 0.27, 1];
var C_SEL = [0.43, 0.78, 0.84, 1];   // selection colour, shared with the slots and the panel frame

function root(r) {
	g = new Global("wanderer_" + r);
	mgraphics.redraw();
}

function bang() { mgraphics.redraw(); }

function size() {
	return [box.rect[2] - box.rect[0], box.rect[3] - box.rect[1]];
}

// min / max per pixel column, sampled sparsely so long files stay fast
function buildPeaks(wv, w) {
	var key = wv.buf + ":" + (wv.ver || 0) + ":" + wv.frames + ":" + w;   // ver changes with every load into the slot
	if (key === peaksKey && peaks) { return; }
	peaks = [];
	var buf = new Buffer(wv.buf);
	var fpc = wv.frames / w;
	var n = Math.max(1, Math.min(Math.floor(fpc), 256));
	for (var x = 0; x < w; x++) {
		var a = Math.floor(x * fpc);
		var d = buf.peek(1, a, n);
		if (typeof d === "number") { d = [d]; }
		var lo = 0, hi = 0;
		for (var i = 0; i < d.length; i++) {
			if (d[i] < lo) { lo = d[i]; }
			if (d[i] > hi) { hi = d[i]; }
		}
		peaks.push([lo, hi]);
	}
	peaksKey = key;
}

function paint() {
	paintBody();
	var sz = size();
	with (mgraphics) {
		set_source_rgba(C_SEL);
		set_line_width(1);
		rectangle(0.5, 0.5, sz[0] - 1, sz[1] - 1);
		stroke();
	}
}

function paintBody() {
	var sz = size(), w = sz[0], h = sz[1];
	var wv = g ? g.wave : null;
	with (mgraphics) {
		set_source_rgba(C_BG);
		rectangle(0, 0, w, h);
		fill();
		select_font_face("Arial Bold");
		set_font_size(9);

		if (!wv || (!wv.loaded && !wv.missing)) {
			set_source_rgba(C_DIM);
			move_to(8, h / 2 + 3);
			show_text("Drop audio files on the drop zone");
			return;
		}
		if (wv.missing) {
			set_source_rgba(C_RED);
			move_to(8, h / 2 + 3);
			show_text("Missing: " + wv.name + "  (click the slot to relink)");
			return;
		}

		var wh = wv.manual ? h - STRIP : h;
		var mid = wh / 2;
		var x2f = wv.frames / w;

		// slice shading and disabled slices
		for (var s = 0; s < wv.ns; s++) {
			var xa = wv.starts[s] / x2f, xb = wv.ends[s] / x2f;
			if (s % 2 === 1) { set_source_rgba(C_ALT); rectangle(xa, 0, xb - xa, wh); fill(); }
		}

		// waveform
		buildPeaks(wv, Math.max(1, Math.floor(w)));
		set_source_rgba(C_WAVE);
		for (var x = 0; x < peaks.length; x++) {
			var lo = peaks[x][0], hi = peaks[x][1];
			rectangle(x, mid - hi * mid * 0.92, 1, Math.max(1, (hi - lo) * mid * 0.92));
		}
		fill();

		for (var s2 = 0; s2 < wv.ns; s2++) {
			var a2 = wv.starts[s2] / x2f, b2 = wv.ends[s2] / x2f;
			if (!wv.en[s2]) { set_source_rgba(C_OFF); rectangle(a2, 0, b2 - a2, wh); fill(); }
			set_source_rgba(C_MARK);
			move_to(a2 + 0.5, 0);
			line_to(a2 + 0.5, wh);
			set_line_width(1);
			stroke();
		}

		// manual weight strip
		if (wv.manual) {
			set_source_rgba([0.16, 0.16, 0.16, 1]);
			rectangle(0, h - STRIP, w, STRIP);
			fill();
			set_source_rgba(C_WEIGHT);
			for (var s3 = 0; s3 < wv.ns; s3++) {
				var a3 = wv.starts[s3] / x2f, b3 = wv.ends[s3] / x2f;
				var bh = (wv.w[s3] || 0) * (STRIP - 3);
				rectangle(a3 + 1, h - 1 - bh, Math.max(1, b3 - a3 - 2), bh);
			}
			fill();
		}

		// labels
		set_source_rgba(C_TEXT);
		move_to(5, 11);
		show_text(wv.name);
		var info = wv.ns + " slices";
		var tm = text_measure(info);
		move_to(w - tm[0] - 5, 11);
		show_text(info);
	}
}

function sliceAt(x) {
	var wv = g ? g.wave : null;
	if (!wv || !wv.loaded) { return -1; }
	var f = x / size()[0] * wv.frames;
	for (var s = wv.ns - 1; s >= 0; s--) { if (f >= wv.starts[s]) { return s; } }
	return -1;
}

function weightAt(y) {
	var h = size()[1];
	return Math.max(0, Math.min(1, (h - 1 - y) / (STRIP - 3)));
}

paintBody.local = 1;

function onclick(x, y) {
	var wv = g ? g.wave : null;
	var s = sliceAt(x);
	if (s < 0) { return; }
	if (wv.manual && y > size()[1] - STRIP) {
		dragSlice = s;
		outlet(0, "sliceweight", s, weightAt(y));
	} else {
		dragSlice = -1;
		outlet(0, "slicetoggle", s);
	}
}
onclick.local = 1;

function ondrag(x, y, but) {
	if (!but) { dragSlice = -1; return; }
	if (dragSlice < 0) { return; }
	var s = sliceAt(x);
	if (s >= 0) { dragSlice = s; outlet(0, "sliceweight", s, weightAt(y)); }
}
ondrag.local = 1;

function onresize() { peaksKey = ""; mgraphics.redraw(); }
onresize.local = 1;
