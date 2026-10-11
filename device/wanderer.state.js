// =====================================================================
//  WANDERER  ·  state brain
//  Owns every per-file setting, writes the parameter buffers for gen~,
//  runs slicing, memory slots, random buttons and saving.
//  All messages arrive through [r ---brain].
// =====================================================================

autowatch = 0;   // a recompile would wipe the state: re-add the device after editing
inlets = 1;
outlets = 5;
setinletassist(0, "messages from r ---brain and pattr");
setoutletassist(0, "to poly~");
setoutletassist(1, "to analysis router");
setoutletassist(2, "to conductor gen~");
setoutletassist(3, "to pattr (state)");
setoutletassist(4, "to opendialog");

// ---------- constants ---------------------------------------------------
var NF = 16;          // file slots
var STRIDE = 64;      // param buffer frames per file
var MAXS = 256;       // slices per file
var CTL = 32;         // control frames per file
var ROW = 43;         // lock memory values per row (42 = quantize grid of the hit)
var PAGEW = 290;      // panel page width (bpatcher offset step)
var SLIDES = [0, 0.25, 1, 2, 4, 8, 16];
var FLENS = [0.25, 0.5, 1, 2, 4, 8];

var P = [
	{"k":"dens","tab":"clock","type":"knob","def":50,"lo":0,"hi":100,"ex":1,"rnd":[0.15,0.85]},
	{"k":"cont","tab":"clock","type":"knob","def":0,"lo":-100,"hi":100,"ex":1,"rnd":[0.2,0.8]},
	{"k":"swing","tab":"clock","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.6]},
	{"k":"nudge","tab":"clock","type":"knob","def":0,"lo":-30,"hi":30,"ex":1,"rnd":[0.4,0.6]},
	{"k":"spread","tab":"slice","type":"knob","def":30,"lo":0,"hi":100,"ex":1,"rnd":[0,1]},
	{"k":"wstr","tab":"slice","type":"knob","def":100,"lo":0,"hi":100,"ex":1,"rnd":[0,1]},
	{"k":"jump","tab":"slice","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.15]},
	{"k":"start","tab":"play","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.3]},
	{"k":"length","tab":"play","type":"knob","def":100,"lo":1,"hi":100,"ex":1,"rnd":[0.4,1]},
	{"k":"rev","tab":"play","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.25]},
	{"k":"loop","tab":"play","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.25]},
	{"k":"pitch","tab":"pitch","type":"knob","def":0,"lo":-24,"hi":24,"ex":1,"rnd":[0.44,0.56]},
	{"k":"penv","tab":"pitch","type":"knob","def":0,"lo":-24,"hi":24,"ex":1,"rnd":[0.42,0.58]},
	{"k":"pdec","tab":"pitch","type":"knob","def":80,"lo":5,"hi":1000,"ex":3,"rnd":[0,1]},
	{"k":"glide","tab":"pitch","type":"knob","def":0,"lo":0,"hi":500,"ex":2,"rnd":[0,0.5]},
	{"k":"att","tab":"env","type":"knob","def":0,"lo":0,"hi":1000,"ex":3,"rnd":[0,0.4]},
	{"k":"dec","tab":"env","type":"knob","def":10,"lo":5,"hi":2000,"ex":3,"rnd":[0,0.6]},
	{"k":"gate","tab":"env","type":"knob","def":100,"lo":1,"hi":100,"ex":1,"rnd":[0.4,1]},
	{"k":"vol","tab":"env","type":"knob","def":0,"lo":-36,"hi":6,"ex":1},
	{"k":"pan","tab":"env","type":"knob","def":0,"lo":-100,"hi":100,"ex":1,"rnd":[0.25,0.75]},
	{"k":"width","tab":"env","type":"knob","def":100,"lo":0,"hi":200,"ex":1,"rnd":[0.25,0.75]},
	{"k":"cut","tab":"filter","type":"knob","def":20000,"lo":20,"hi":20000,"ex":3,"rnd":[0.35,1]},
	{"k":"res","tab":"filter","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.4]},
	{"k":"fenv","tab":"filter","type":"knob","def":0,"lo":-100,"hi":100,"ex":1,"rnd":[0.4,0.6]},
	{"k":"fdec","tab":"filter","type":"knob","def":150,"lo":5,"hi":2000,"ex":3,"rnd":[0,1]},
	{"k":"track","tab":"filter","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.3]},
	{"k":"rchance","tab":"repeat","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.5]},
	{"k":"rcount","tab":"repeat","type":"knob","def":3,"lo":1,"hi":16,"ex":1,"rnd":[0,0.27]},
	{"k":"rshape","tab":"repeat","type":"knob","def":0,"lo":-100,"hi":100,"ex":1,"rnd":[0,1]},
	{"k":"rvol","tab":"repeat","type":"knob","def":-40,"lo":-100,"hi":100,"ex":1,"rnd":[0,0.6]},
	{"k":"rstep","tab":"repeat","type":"knob","def":0,"lo":-7,"hi":7,"ex":1,"rnd":[0.3,0.7]},
	{"k":"rsame","tab":"repeat","type":"knob","def":100,"lo":0,"hi":100,"ex":1,"rnd":[0,1]},
	{"k":"rvar","tab":"repeat","type":"knob","def":0,"lo":0,"hi":100,"ex":1,"rnd":[0,0.6]},
	{"k":"gsize","tab":"grain","type":"knob","def":80,"lo":10,"hi":500,"ex":2,"rnd":[0.25,1]},
	{"k":"gdens","tab":"grain","type":"knob","def":2,"lo":1,"hi":4,"ex":1,"rnd":[0,1]},
	{"k":"scan","tab":"grain","type":"knob","def":100,"lo":0,"hi":200,"ex":1,"rnd":[0.25,0.75]},
	{"k":"gjit","tab":"grain","type":"knob","def":10,"lo":0,"hi":100,"ex":1,"rnd":[0,0.6]},
	{"k":"gspread","tab":"grain","type":"knob","def":0,"lo":0,"hi":12,"ex":1,"rnd":[0,0.15]},
	{"k":"v1","tab":"clock","type":"toggle","def":0,"odds":0.1},
	{"k":"v2","tab":"clock","type":"toggle","def":0,"odds":0.15},
	{"k":"v4","tab":"clock","type":"toggle","def":0,"odds":0.35},
	{"k":"v8","tab":"clock","type":"toggle","def":1,"odds":0.55},
	{"k":"v16","tab":"clock","type":"toggle","def":1,"odds":0.6},
	{"k":"v32","tab":"clock","type":"toggle","def":0,"odds":0.25},
	{"k":"trip","tab":"clock","type":"toggle","def":0,"odds":0.2},
	{"k":"dot","tab":"clock","type":"toggle","def":0,"odds":0.2},
	{"k":"derived","tab":"clock","type":"toggle","def":0,"odds":0.25},
	{"k":"smode","tab":"slice","type":"enum","def":0,"items":["Random","Walk","Skip","Weighted","Position"]},
	{"k":"choke","tab":"slice","type":"toggle","def":1,"odds":0.8},
	{"k":"engine","tab":"pitch","type":"enum","def":0,"items":["Tape","Grain"],"w":[0.75,0.25]},
	{"k":"ftype","tab":"filter","type":"enum","def":0,"items":["LP","HP","BP"],"w":[0.7,0.15,0.15]},
	{"k":"rspace","tab":"repeat","type":"enum","def":1,"items":["1/16","1/32","1/64","1/16T","1/32T"],"w":[0.4,0.35,0,0.125,0.125]},
	{"k":"wsrc","tab":"slice","type":"enum","def":0,"items":["Manual","Loud","Quiet","Long","Short","Bright","Dark"]},
	{"k":"method","tab":"detect","type":"enum","def":0,"items":["Hits","Soft","Pitch","Harmony","Timbre","Silence","Grid"]},
	{"k":"sens","tab":"detect","type":"knob","def":25,"lo":0,"hi":100,"ex":1},
	{"k":"minlen","tab":"detect","type":"knob","def":100,"lo":10,"hi":1000,"ex":2},
	{"k":"ftvar","tab":"filter","type":"knob0","def":0,"lo":0,"hi":100,"ex":1,"buf":60,"rnd":[0,0.5],"rodds":0.35},
	{"k":"chokep","tab":"slice","type":"knob0","def":100,"lo":0,"hi":100,"ex":1,"buf":61}
];
// each P[i].def is read as P[i].def below

var KEY = {};
for (var i = 0; i < P.length; i++) { KEY[P[i].k] = i; }
var NB = 52;          // params stored in the gen~ buffers
var NSLOT = NB + 1;   // params stored in memory slots (+ weight source)

// ---------- state -------------------------------------------------------
var rt = null;            // device prefix ("---a" resolved)
var ready = false;
var pendingRestore = null;
var files = [];
var sel = 0;
var curTab = 0;
var curTempo = 120;
var pat = this.patcher;
var glockOn = 0;
var slots = [null, null, null, null, null, null, null, null];
var curSlot = 0;
var slideIdx = 0;
var sliding = false;
var goCount = 0;
var resetCount = 0;
var saving = false;
var lastSaved = "";
var mSens = 0;        // master sensitivity offset, -50..50 (added to each file)
var mLen = 1;         // master min-length multiplier, 0.25..4
var chaosV = 50;      // Chaos, mirrored here for the slicing ranges

function chaos(v) { chaosV = clamp(v, 0, 100); }

// Sensitivity / Min Len actually used for a re-slice: the knob, or a draw within its range (scaled by Chaos)
function detectDraw(f, key) {
	var fl = files[f], p = KEY[key];
	var r = fl.r[p] * chaosV / 50, md = fl.m[p];
	if (!fl.dwk) { fl.dwk = {}; }
	if (md === 0 || r <= 0) { return fl.b[p]; }
	var off = Math.random() * 2 - 1;
	if (md === 2) { off = clamp((fl.dwk[key] || 0) + off * 0.35, -1, 1); fl.dwk[key] = off; }
	return clamp(fl.b[p] + off * r, 0, 1);
}
var savedOnce = false;   // after our own first save, any incoming state is an echo, not a set load      // last state written, to skip identical writes
var queue = [];
var busy = -1;
var relinkTarget = -1;
var bufA, bufB, bufST, bufCF, bufMEM;
var g = null;
var saveTask = new Task(saveState, this);
var detectTask = new Task(runDetect, this);
var detectPending = {};

// ---------- small helpers -----------------------------------------------
function clamp(x, lo, hi) { return x < lo ? lo : (x > hi ? hi : x); }
function round4(x) { return Math.round(x * 10000) / 10000; }
function norm(p, v) { var q = P[p]; return Math.pow(clamp((v - q.lo) / (q.hi - q.lo), 0, 1), 1 / q.ex); }
function denorm(p, n) { var q = P[p]; return q.lo + (q.hi - q.lo) * Math.pow(clamp(n, 0, 1), q.ex); }
function isKnob(p) { return P[p].type === "knob" || P[p].type === "knob0"; }
function audioName(f) { return rt + "w" + (f + 1); }

function newFile() {
	var f = { path: "", name: "", loaded: 0, missing: 0, loading: 0, sr: 44100, frames: 0,
		b: [], r: [], m: [], ns: 0, starts: [], ends: [], loud: [], zcr: [], en: [], wman: [],
		lock: 0, mute: 0, keep: null, wroll: false,
		retry: 0, retryBoost: 0, retryMethod: -1, retryBest: null };
	for (var p = 0; p < P.length; p++) {
		f.b[p] = isKnob(p) ? norm(p, P[p]["def"]) : P[p]["def"];
		f.r[p] = 0;
		f.m[p] = 0;
	}
	return f;
}

// ---------- startup -----------------------------------------------------
function root(r) {
	if (rt === String(r)) { return; }   // sent again by live.thisdevice: start up only once
	rt = String(r);
	bufA = new Buffer(rt + "pa");
	bufB = new Buffer(rt + "pb");
	bufST = new Buffer(rt + "st");
	bufCF = new Buffer(rt + "cf");
	bufMEM = new Buffer(rt + "mem");
	g = new Global("wanderer_" + rt);
	files = [];
	for (var f = 0; f < NF; f++) { files.push(newFile()); }
	g.files = files;
	g.sel = 0;
	tellUI("slots", "root", rt);
	tellUI("wave", "root", rt);
	var t = new Task(init, this);
	t.schedule(50);   // let buffers size themselves first
}

// scale tables for gen~: per scale 512 frames
//   [0..96]    note (-48..48)   -> degree (count of scale notes from 0, rounded down)
//   [100..500] degree (-200..200) -> note
var SCALES = [4095, 2741, 1453, 1709, 1451, 2773, 1717, 2477, 661, 1193, 129, 1];
function inScale(semi, m) { var pc = ((semi % 12) + 12) % 12; return (m >> pc) & 1; }
function writeScales() {
	var buf = new Buffer(rt + "sc");
	for (var s = 0; s < SCALES.length; s++) {
		var m = SCALES[s], base = s * 512;
		var notes = [];                       // scale notes ordered, degree 0 = semitone 0
		for (var semi = -600; semi <= 600; semi++) { if (inScale(semi, m)) { notes.push(semi); } }
		var zero = notes.indexOf(0);
		var deg = [];
		for (var n = -48; n <= 48; n++) {
			var d = 0;
			for (var k = 0; k < notes.length; k++) { if (notes[k] <= n) { d = k - zero; } }
			deg.push(d);
		}
		buf.poke(1, base, deg);
		var semis = [];
		for (var dg = -200; dg <= 200; dg++) { semis.push(notes[clamp(zero + dg, 0, notes.length - 1)]); }
		buf.poke(1, base + 100, semis);
	}
}

function init() {
	writeScales();
	// mute each slot on its own: after "mute 0 1" (all), poly~ will not unmute single instances
	for (var m = 1; m <= NF; m++) { outlet(0, "mute", m, 1); }
	for (var f = 0; f < NF; f++) {
		writeAll(f, 3);
		writeCtl(f);
	}
	ready = true;
	post("wanderer: ready (brain 2026-10-08f)\n");
	var pobj = pat.getnamed("panel");
	if (pobj) { pobj.message("offset", -curTab * PAGEW, 0); }
	if (pendingRestore) {
		var d = pendingRestore;
		pendingRestore = null;
		restore(d);
	}
	refreshAll();
}

// ---------- buffer writing ----------------------------------------------
// which: 1 = A, 2 = B, 3 = both
function writeParam(f, p, which) {
	if (!bufA) { return; }
	if (batch) { batch[f] = (batch[f] || 0) | which; return; }
	if (p >= NB && P[p].buf === undefined) { return; }
	var fr = f * STRIDE + (P[p].buf !== undefined ? P[p].buf : p);
	var file = files[f];
	if (which & 1) {
		bufA.poke(1, fr, file.b[p]);
		bufA.poke(2, fr, file.r[p]);
		bufA.poke(3, fr, file.m[p]);
	}
	if (which & 2) {
		bufB.poke(1, fr, file.b[p]);
		bufB.poke(2, fr, file.r[p]);
		bufB.poke(3, fr, file.m[p]);
	}
}

// one file's whole parameter block in a few buffer calls instead of ~200 single writes
function writeAll(f, which) {
	if (!bufA) { return; }
	if (batch) { batch[f] = (batch[f] || 0) | which; return; }
	var bufs = [];
	if (which & 1) { bufs.push(bufA); }
	if (which & 2) { bufs.push(bufB); }
	var file = files[f], base = f * STRIDE;
	for (var k = 0; k < bufs.length; k++) {
		var buf = bufs[k];
		var cb = buf.peek(1, base, STRIDE), cr = buf.peek(2, base, STRIDE), cm = buf.peek(3, base, STRIDE);
		for (var p = 0; p < P.length; p++) {
			if (p >= NB && P[p].buf === undefined) { continue; }
			var fr = P[p].buf !== undefined ? P[p].buf : p;
			cb[fr] = file.b[p];
			cr[fr] = file.r[p];
			cm[fr] = file.m[p];
		}
		buf.poke(1, base, cb);
		buf.poke(2, base, cr);
		buf.poke(3, base, cm);
	}
}

// batching: writes inside a batch are collected per file and flushed once at the end
var batch = null, batchDepth = 0;
function beginBatch() { if (batchDepth++ === 0) { batch = {}; } }
function endBatch() {
	if (--batchDepth > 0) { return; }
	var todo = batch;
	batch = null;
	for (var f in todo) { writeAll(+f, todo[f]); }
}

function writeCtl(f) {
	var fl = files[f];
	var c = f * CTL;
	bufCF.poke(1, c + 0, fl.lock);
	bufCF.poke(1, c + 1, fl.mute);
	bufCF.poke(1, c + 2, fl.loaded ? fl.ns : 0);
	writeTiming(f);
}

function writeTable(f) {
	var fl = files[f];
	var c = f * CTL;
	bufCF.poke(1, c + 2, 0);              // engine sees 0 slices while the table changes
	var w = weights(f);
	var base = f * MAXS;
	if (fl.ns > 0) {
		var c4 = [], c5 = [], c6 = [];
		for (var i = 0; i < fl.ns; i++) {
			c4.push(fl.en[i]);
			c5.push(fl.frames > 0 ? fl.starts[i] / fl.frames : 0);
			c6.push(evenGain(fl.loud[i]));
		}
		bufST.poke(1, base, fl.starts.slice(0, fl.ns));
		bufST.poke(2, base, fl.ends.slice(0, fl.ns));
		bufST.poke(3, base, w.slice(0, fl.ns));
		bufST.poke(4, base, c4);
		bufST.poke(5, base, c5);
		bufST.poke(6, base, c6);
		// attack points inside each slice (for Quant's Start snap); unused ones repeat the slice start
		for (var a = 0; a < ATK_N; a++) {
			var ca = [];
			for (var i2 = 0; i2 < fl.ns; i2++) {
				var lst = fl.inner && fl.inner[i2] ? fl.inner[i2] : [];
				ca.push(a < lst.length ? lst[a] : fl.starts[i2]);
			}
			bufST.poke(7 + a, base, ca);
		}
	}
	bufCF.poke(1, c + 2, fl.loaded ? fl.ns : 0);
}

function writeTiming(f) {
	var fl = files[f];
	var c = f * CTL;
	var wn = fl.frames > 0 ? (fl.frames / fl.sr) * curTempo / 240 : 1;
	var best = 1, bd = 99;
	for (var i = 0; i < FLENS.length; i++) {
		var d = Math.abs(Math.log(wn / FLENS[i]));
		if (d < bd) { bd = d; best = FLENS[i]; }
	}
	bufCF.poke(1, c + 3, best);
	// derived weights: how often each straight note value appears as a gap
	var counts = [0, 0, 0, 0, 0, 0];
	for (var s = 1; s < fl.ns; s++) {
		var gap = (fl.starts[s] - fl.starts[s - 1]) / fl.sr * curTempo / 240;
		if (gap > 0) {
			var k = Math.round(-Math.log(gap) / Math.LN2);
			counts[clamp(k, 0, 5)]++;
		}
	}
	var mx = Math.max.apply(null, counts);
	for (var j = 0; j < 6; j++) {
		bufCF.poke(1, c + 5 + j, mx > 0 ? 0.15 + 0.85 * counts[j] / mx : 1);
	}
}

// Even: gain that brings a slice's opening RMS to -20 dBFS, limited to -24..+18 dB
function evenGain(rms) {
	if (!(rms > 0)) { return 1; }
	return clamp(0.1 / rms, 0.063, 7.94);
}

// weight per slice for the chosen source, 0..1
function weights(f) {
	var fl = files[f];
	var src = fl.b[KEY.wsrc];
	var raw = [];
	for (var i = 0; i < fl.ns; i++) {
		var len = fl.ends[i] - fl.starts[i];
		switch (src) {
			case 1: raw.push(fl.loud[i]); break;
			case 2: raw.push(-fl.loud[i]); break;
			case 3: raw.push(len); break;
			case 4: raw.push(-len); break;
			case 5: raw.push(fl.zcr[i]); break;
			case 6: raw.push(-fl.zcr[i]); break;
			default: raw.push(fl.wman[i]);
		}
	}
	if (src === 0) { return raw; }
	var lo = Math.min.apply(null, raw), hi = Math.max.apply(null, raw);
	var out = [];
	for (var k = 0; k < raw.length; k++) {
		out.push(hi > lo ? 0.05 + 0.95 * (raw[k] - lo) / (hi - lo) : 1);
	}
	return out;
}

// ---------- panel messages ----------------------------------------------
function b(key, val) { setValue(key, "b", val); }
function r(key, val) { setValue(key, "r", val); }
function m(key, val) { setValue(key, "m", val); }
function v(key, val) { setValue(key, "b", val); }

function setValue(key, what, val) {
	var p = KEY[key];
	if (p === undefined || !ready) { return; }
	var fl = files[sel];
	if (what === "b") { fl.b[p] = isKnob(p) ? norm(p, val) : Math.round(val); }
	else if (what === "r") { fl.r[p] = clamp(val / 100, 0, 1); }
	else { fl.m[p] = Math.round(val); }
	writeParam(sel, p, 3);
	if (P[p].tab === "detect") { scheduleDetect(sel); }
	if (key === "wsrc" && fl.loaded) { writeTable(sel); }
	if (key === "wsrc" || key === "smode") { refreshWave(); }
	dirty();
}

function tab(i) {
	curTab = clamp(Math.round(i), 0, TABS.length - 1);
	if (!ready) { return; }
	var obj = pat.getnamed("panel");
	if (obj) { obj.message("offset", -i * PAGEW, 0); }
	refreshPanel();
}

// ---------- file slots ---------------------------------------------------
function select(n) {
	if (!ready) { return; }
	glide = null;
	sel = clamp(n - 1, 0, NF - 1);
	g.sel = sel;
	if (files[sel].missing) {
		relinkTarget = sel;
		outlet(4, "bang");
	}
	refreshAll();
}

function drop(path) {
	if (!ready) { post("wanderer: not ready yet, drop ignored\n"); return; }
	var f = -1;
	if (!files[sel].loaded && !files[sel].missing && !files[sel].loading) { f = sel; }
	else {
		for (var i = 0; i < NF; i++) {
			if (!files[i].loaded && !files[i].missing && !files[i].loading) { f = i; break; }
		}
		if (f < 0) { f = sel; }
	}
	files[f].en = [];
	files[f].wman = [];
	files[f].wroll = false;
	files[f].keep = null;
	loadFile(f, String(path));
	sel = f;
	g.sel = sel;
	refreshAll();
}

function relink(path) {
	if (!ready) { return; }
	if (relinkTarget < 0) { return; }
	var f = relinkTarget;
	relinkTarget = -1;
	loadFile(f, String(path));
	refreshAll();
}

function loadFile(f, path) {
	var fl = files[f];
	fl.path = path;
	fl.name = path.replace(/^.*[\/:]/, "");
	var fh = new File(path, "read");
	var ok = fh.isopen;
	fh.close();
	if (!ok) {
		post("wanderer: file not found: " + path + "\n");
		fl.missing = 1;
		fl.loaded = 0;
		fl.loading = 0;
		writeCtl(f);
		outlet(0, "mute", f + 1, 1);
		return;
	}
	fl.missing = 0;
	fl.loading = 1;
	fl.loaded = 0;
	fl.gen = (fl.gen || 0) + 1;     // analysis results for an older load are ignored
	fl.ns = 0;
	fl.starts = [];
	fl.ends = [];
	resetRetry(fl);
	dequeue(f);
	writeCtl(f);
	post("wanderer: loading " + fl.name + " into slot " + (f + 1) + "\n");
	outlet(0, "target", f + 1);
	outlet(0, "load", path);
	outlet(0, "target", 0);
	outlet(0, "mute", f + 1, 0);
	post("wanderer: slot " + (f + 1) + " unmuted\n");
}

function fclear(v) {
	if (v === 0) { return; }
	if (!ready) { return; }
	var fl = files[sel];
	fl.path = "";
	fl.name = "";
	fl.loaded = 0;
	fl.missing = 0;
	fl.loading = 0;
	fl.ns = 0;
	fl.frames = 0;
	fl.en = [];
	fl.wman = [];
	fl.starts = [];
	fl.ends = [];
	fl.keep = null;
	fl.lock = 0;
	fl.mute = 0;
	fl.wroll = false;
	fl.gen = (fl.gen || 0) + 1;
	resetRetry(fl);
	dequeue(sel);
	bufCF.poke(1, sel * CTL + 16, [0, 0, 0, 0]);   // no locked list left behind
	writeCtl(sel);
	refreshStrip();
	outlet(0, "target", sel + 1);
	outlet(0, "clear");
	outlet(0, "target", 0);
	outlet(0, "mute", sel + 1, 1);
	refreshAll();
	dirty();
}

// voice reports: sample rate, then loaded
function sr(n, val) {
	if (!ready) { return; }
	var f = n - 1;
	if (f < 0 || f >= NF) { return; }
	files[f].sr = val > 0 ? val : 44100;
}

function loaded(n) {
	if (!ready) { return; }
	var f = n - 1;
	if (f < 0 || f >= NF) { return; }
	var fl = files[f];
	var buf = new Buffer(audioName(f));
	fl.frames = buf.framecount();
	fl.loading = 0;
	fl.loaded = fl.frames > 0 ? 1 : 0;
	if (fl.loaded) { resetRetry(fl); enqueue(f); }
	writeCtl(f);
	refreshAll();
}

// ---------- slicing -------------------------------------------------------
// master detection: offsets every file's own setting, then re-slices all loaded files
var masterTask = new Task(masterReslice, this);
function msens(v) { if (v === mSens) { return; } mSens = clamp(v, -50, 50); masterSoon(); }
function mlen(v) { var k = Math.pow(4, clamp(v, -100, 100) / 100); if (k === mLen) { return; } mLen = k; masterSoon(); }
function masterSoon() { if (!ready) { return; } masterTask.cancel(); masterTask.schedule(500); }
function masterReslice() { for (var f = 0; f < NF; f++) { if (files[f].loaded) { detectPending[f] = 1; } } runDetect(); }

function scheduleDetect(f) {
	detectPending[f] = 1;
	detectTask.cancel();
	detectTask.schedule(400);
}

function runDetect() {
	for (var f in detectPending) {
		if (files[f].loaded) { files[f].keep = { en: files[f].en.slice(), w: files[f].wman.slice(), starts: files[f].starts.slice() }; resetRetry(files[f]); enqueue(+f); }
	}
	detectPending = {};
}

function dequeue(f) {
	var k = queue.indexOf(f);
	if (k >= 0) { queue.splice(k, 1); }
	delete detectPending[f];
}
// an analysis that never reports back must not block slicing for good
var busyGen = -1;
var busyTask = new Task(busyTimeout, this);
function busyTimeout() {
	if (busy < 0) { return; }
	post("wanderer: analysis of slot " + (busy + 1) + " did not finish, skipping it\n");
	busy = -1;
	runQueue();
}
function resetRetry(fl) { fl.retry = 0; fl.retryBoost = 0; fl.retryMethod = -1; fl.retryBest = null; }
function enqueue(f) {
	if (queue.indexOf(f) < 0) { queue.push(f); }
	runQueue();
}

function runQueue() {
	if (busy >= 0) { return; }
	while (queue.length && !files[queue[0]].loaded) { queue.shift(); }   // cleared or reloading meanwhile
	if (queue.length === 0) { return; }
	busy = queue.shift();
	var fl = files[busy];
	busyGen = fl.gen || 0;
	busyTask.cancel();
	busyTask.schedule(60000);
	var method = fl.retryMethod >= 0 ? fl.retryMethod : fl.b[KEY.method];
	fl.useMin = detectDraw(busy, "minlen");
	var sens = clamp(denorm(KEY.sens, detectDraw(busy, "sens")) + mSens + (fl.retryBoost || 0), 0, 100) / 100;   // file value (or range draw) + master
	var minms = denorm(KEY.minlen, fl.useMin) * mLen;                                       // file value (or range draw) x master
	var minsamps = Math.round(minms * fl.sr / 1000);
	var minhops = Math.max(1, Math.round(minsamps / 512));
	var src = audioName(busy);
	if (method === 6) {
		// Grid: equal divisions, no external analysis
		var n = Math.round(2 + sens * 62);
		var on = [];
		for (var i = 0; i < n; i++) { on.push(Math.floor(i * fl.frames / n)); }
		busyTask.cancel();
		finishSlicing(busy, on);
		busy = -1;
		runQueue();
		return;
	}
	if (method === 0) {
		outlet(1, "ampslice", "source", src);
		outlet(1, "ampslice", "onthreshold", 18 - sens * 15);
		outlet(1, "ampslice", "offthreshold", 9 - sens * 7.5);
		outlet(1, "ampslice", "minslicelength", minsamps);
		outlet(1, "ampslice", "bang");
	} else if (method === 1) {
		outlet(1, "onset", "source", src);
		outlet(1, "onset", "metric", 8);
		outlet(1, "onset", "threshold", 0.6 * Math.pow(1 - sens, 2) + 0.02);
		outlet(1, "onset", "minslicelength", minhops);
		outlet(1, "onset", "bang");
	} else if (method <= 4) {
		outlet(1, "novelty", "source", src);
		outlet(1, "novelty", "algorithm", method === 2 ? 3 : (method === 3 ? 2 : 1));
		outlet(1, "novelty", "kernelsize", 9);
		outlet(1, "novelty", "threshold", 0.8 * Math.pow(1 - sens, 2) + 0.02);
		outlet(1, "novelty", "minslicelength", minhops);
		outlet(1, "novelty", "bang");
	} else {
		outlet(1, "ampgate", "source", src);
		outlet(1, "ampgate", "onthreshold", -20 - sens * 35);
		outlet(1, "ampgate", "offthreshold", -26 - sens * 35);
		outlet(1, "ampgate", "minslicelength", minsamps);
		outlet(1, "ampgate", "bang");
	}
}

function fluiddone() {
	if (!ready) { return; }
	if (busy < 0) { return; }
	busyTask.cancel();
	if ((files[busy].gen || 0) !== busyGen || !files[busy].loaded) {   // the slot changed while it was analysed
		busy = -1;
		runQueue();
		return;
	}
	var ix = new Buffer(rt + "ix");
	var n = ix.framecount();
	var on = [];
	if (n > 0) {
		var data = ix.peek(1, 0, n);
		if (typeof data === "number") { data = [data]; }
		for (var i = 0; i < data.length; i++) { if (data[i] >= 0) { on.push(Math.floor(data[i])); } }
	}
	finishSlicing(busy, on);
	busy = -1;
	runQueue();
}

function finishSlicing(f, on) {
	var fl = files[f];
	if (!fl.loaded) { return; }   // cleared while it was being analysed
	var minsamps = denorm(KEY.minlen, fl.useMin !== undefined ? fl.useMin : fl.b[KEY.minlen]) * mLen * fl.sr / 1000;
	on.sort(function (a, b2) { return a - b2; });
	var starts = [0];
	for (var i = 0; i < on.length; i++) {
		var s = on[i];
		if (s > 0 && s < fl.frames - 64 && s - starts[starts.length - 1] >= minsamps) { starts.push(s); }
	}
	if (fl.b[KEY.method] !== 6) {   // Grid keeps its equal divisions
		starts = refineCuts(f, starts);
		starts = dropQuietCuts(f, starts);
	}
	if (starts.length > MAXS) { starts.length = MAXS; }
	if (retrySlicing(f, starts)) { return; }   // too few slices: another attempt is on its way
	if (fl.retryBest && fl.retryBest.length > starts.length) { starts = fl.retryBest; }
	fl.retry = 0;
	fl.retryBoost = 0;
	fl.retryMethod = -1;
	fl.retryBest = null;
	var ends = [];
	for (var j = 0; j < starts.length; j++) { ends.push(j + 1 < starts.length ? starts[j + 1] : fl.frames); }
	fl.starts = starts;
	fl.ends = ends;
	fl.ns = starts.length;
	fl.inner = innerAttacks(f);
	features(f);
	var keep = fl.keep;
	var same = keep && keep.en.length === fl.ns;
	if (same) { fl.en = keep.en.slice(); fl.wman = keep.w.slice(); }
	else if (keep && keep.starts && keep.starts.length) {
		// slice count changed: each new slice takes the on/off and weight of the old slice it starts in
		var oen = keep.en, ow = keep.w, os = keep.starts;
		fl.en = [];
		fl.wman = [];
		for (var k = 0; k < fl.ns; k++) {
			var o = 0;
			while (o + 1 < os.length && os[o + 1] <= fl.starts[k]) { o++; }
			fl.en.push(oen[o] === undefined ? 1 : oen[o]);
			fl.wman.push(ow[o] === undefined ? 0.5 : ow[o]);
		}
	} else if (fl.en.length !== fl.ns) {
		fl.en = [];
		fl.wman = [];
		for (var k2 = 0; k2 < fl.ns; k2++) { fl.en.push(1); fl.wman.push(0.5); }
	}
	if (fl.wroll && !same) { drawWeights(fl); }   // rolled weights: a fresh draw for the new slices, not a stretched copy
	fl.keep = null;
	post("wanderer: slot " + (f + 1) + " sliced into " + fl.ns + " slices\n");
	writeTable(f);
	writeTiming(f);
	refreshAll();
	dirty();
}

// fewer than 4 slices: try again with higher sensitivity (+25, +50), then with the other
// detection methods; the attempt with the most slices wins. Grid is never used as a fallback.
var RETRY_MIN = 4;
function retrySlicing(f, starts) {
	var fl = files[f];
	var base = fl.b[KEY.method];
	if (base === 6 || starts.length >= RETRY_MIN) { return false; }
	if (!fl.retryBest || starts.length > fl.retryBest.length) { fl.retryBest = starts.slice(); }
	var alts = [0, 1, 2].filter(function (m) { return m !== base; });
	var steps = [[25, -1], [50, -1], [50, alts[0]], [50, alts[1]]];
	var k = fl.retry || 0;
	if (k >= steps.length) { return false; }
	fl.retry = k + 1;
	fl.retryBoost = steps[k][0];
	fl.retryMethod = steps[k][1];
	post("wanderer: slot " + (f + 1) + " gave " + starts.length + " slice(s), retrying" +
		(steps[k][1] >= 0 ? " with another method" : " with sensitivity +" + steps[k][0]) + "\n");
	if (queue.indexOf(f) < 0) { queue.push(f); }   // runs right after this analysis finishes
	return true;
}

// ---------- attacks ---------------------------------------------------------
// One pass per load: peak level per 64-sample block (~1.5 ms). An attack is a block at least
// twice as loud (+6 dB) as the ~23 ms before it, louder than -30 dB below the file's peak,
// at least 60 ms after the previous attack. Its position is one block before the jump.
var ATK_B = 64;
var ATK_N = 8;   // attacks stored per slice
function fileAttacks(f) {
	var fl = files[f];
	if (fl.atk && fl.atkGen === fl.gen) { return fl.atk; }
	var buf = new Buffer(audioName(f));
	var nb = Math.floor((fl.frames || 0) / ATK_B);
	var stp = nb * ATK_B > 6000000 ? 4 : (nb * ATK_B > 3000000 ? 2 : 1);   // long files: every 2nd/4th sample is enough for a level
	var env = [], top = 0, CH = 65536;
	for (var p = 0; p < nb * ATK_B; p += CH) {
		var d = buf.peek(1, p, Math.min(CH, nb * ATK_B - p));
		if (typeof d === "number") { d = [d]; }
		for (var k = 0; k + ATK_B <= d.length; k += ATK_B) {
			var pk = 0;
			for (var j = k; j < k + ATK_B; j += stp) { var x = d[j] < 0 ? -d[j] : d[j]; if (x > pk) { pk = x; } }
			env.push(pk);
			if (pk > top) { top = pk; }
		}
	}
	var W = 16, sum = 0, last = -1e9;
	var gap = Math.max(1, Math.round(0.06 * (fl.sr || 44100) / ATK_B));
	var floor = top * 0.003, minLvl = top * 0.03;
	var atk = [];
	for (var i = 0; i < env.length; i++) {
		var before = i >= W ? sum / W : (i > 0 ? sum / i : 0);
		var e = env[i];
		if (i > 0 && e >= minLvl && e > 2 * (before + floor) && i - last >= gap) {
			atk.push({ p: (i - 1) * ATK_B, s: e / (before + floor) });
			last = i;
		}
		sum += e;
		if (i >= W) { sum -= env[i - W]; }
	}
	fl.atk = atk;
	fl.atkGen = fl.gen;
	return atk;
}

// move each cut to the nearest attack within 25 ms: the detectors work in frames and can land
// a little before or after the real start of a note
function refineCuts(f, starts) {
	var fl = files[f];
	var atk = fileAttacks(f);
	if (atk.length === 0 || starts.length < 2) { return starts; }
	var win = 0.025 * (fl.sr || 44100), out = [starts[0]], k = 0;
	var mingap = 0.01 * (fl.sr || 44100);
	for (var i = 1; i < starts.length; i++) {
		var s = starts[i];
		while (k < atk.length && atk[k].p < s - win) { k++; }
		var best = s, bd = win + 1;
		for (var j = k; j < atk.length && atk[j].p <= s + win; j++) {
			var dd = Math.abs(atk[j].p - s);
			if (dd < bd) { bd = dd; best = atk[j].p; }
		}
		if (best - out[out.length - 1] >= mingap && best < fl.frames - 64) { out.push(best); }
	}
	return out;
}

// per slice: up to ATK_N attacks inside it (the strongest ones, in time order), not counting its own start
function innerAttacks(f) {
	var fl = files[f];
	var atk = fileAttacks(f);
	var res = [], k = 0, edge = 0.02 * (fl.sr || 44100);
	for (var i = 0; i < fl.ns; i++) {
		var a = fl.starts[i], b = fl.ends[i];
		while (k < atk.length && atk[k].p <= a + edge) { k++; }
		var lst = [];
		for (var j = k; j < atk.length && atk[j].p < b - edge; j++) { lst.push(atk[j]); }
		lst.sort(function (x, y) { return y.s - x.s; });
		lst.length = Math.min(lst.length, ATK_N);
		lst.sort(function (x, y) { return x.p - y.p; });
		var ps = [];
		for (var q = 0; q < lst.length; q++) { ps.push(lst[q].p); }
		res.push(ps);
	}
	return res;
}

// remove cuts that land in near-silence: the detectors judge loudness relative to the
// recent past, so decaying tails and noise far below the hits can still trigger them
function dropQuietCuts(f, starts) {
	var buf = new Buffer(audioName(f));
	var WIN = 1024;
	var peaks = [], top = 0;
	for (var i = 0; i < starts.length; i++) {
		var d = buf.peek(1, starts[i], Math.max(1, Math.min(WIN, files[f].frames - starts[i])));
		if (typeof d === "number") { d = [d]; }
		var pk = 0;
		for (var k = 0; k < d.length; k++) { var a = Math.abs(d[k]); if (a > pk) { pk = a; } }
		peaks.push(pk);
		if (pk > top) { top = pk; }
	}
	var floor = top * 0.01;                     // -40 dB below the loudest cut
	var kept = [starts[0]];
	for (var j = 1; j < starts.length; j++) { if (peaks[j] >= floor) { kept.push(starts[j]); } }
	return kept;
}

// loudness (RMS) and zero-crossing rate per slice, sampled sparsely
function features(f) {
	var fl = files[f];
	var buf = new Buffer(audioName(f));
	fl.loud = [];
	fl.zcr = [];
	for (var i = 0; i < fl.ns; i++) {
		var a = fl.starts[i], len = fl.ends[i] - a;
		var n = Math.min(len, 4096);
		var sum = 0, zc = 0, prev = 0, cnt = 0;
		var chunk = buf.peek(1, a, n);
		if (typeof chunk === "number") { chunk = [chunk]; }
		for (var k = 0; k < chunk.length; k += 1) {
			var x = chunk[k];
			sum += x * x;
			if ((x >= 0) !== (prev >= 0)) { zc++; }
			prev = x;
			cnt++;
		}
		fl.loud.push(cnt ? Math.sqrt(sum / cnt) : 0);
		fl.zcr.push(cnt ? zc / cnt : 0);
	}
}

// ---------- waveform edits ------------------------------------------------
function slicetoggle(i) {
	if (!ready) { return; }
	var fl = files[sel];
	if (i < 0 || i >= fl.ns) { return; }
	fl.en[i] = fl.en[i] ? 0 : 1;
	bufST.poke(4, sel * MAXS + i, fl.en[i]);
	refreshWave();
	dirty();
}

function sliceweight(i, w) {
	if (!ready) { return; }
	var fl = files[sel];
	if (i < 0 || i >= fl.ns) { return; }
	fl.wman[i] = clamp(w, 0, 1);
	fl.wroll = false;   // hand-drawn now: keep it through re-slices
	if (fl.b[KEY.wsrc] === 0) { bufST.poke(3, sel * MAXS + i, fl.wman[i]); }
	refreshWave();
	dirty();
}

// ---------- file strip ----------------------------------------------------
// ---------- Lock capture (done here, not in gen~) ---------------------------
// The engine keeps a ring of the last 512 hits per file: row = [grid time, slice+1, 38 offsets, rep, seed].
// On Lock, pick the hits from the last Lock-length bars, order them by loop phase, write the
// locked list (row, phase) and flag it so the engine replays it instead of capturing its own.
function captureLock(f) {
	var c = f * CTL;
	var pos = bufCF.peek(1, c + 20, 1);
	var wc = bufCF.peek(1, c + 21, 1);
	var lk = bufCF.peek(1, c + 22, 1) || 4;
	var rows = bufMEM.peek(1, f * 1024 * ROW, 512 * ROW);
	if (typeof rows === "number") { rows = [rows]; }
	var t0 = Math.floor(pos / lk) * lk;
	var list = [];
	for (var n = Math.max(0, wc - 512); n < wc; n++) {
		var rw = n % 512, tg = rows[rw * ROW], rsl = rows[rw * ROW + 1];
		if (rsl > 0.5 && tg <= pos && tg > pos - lk) {
			list.push([tg >= t0 ? tg - t0 : tg - (t0 - lk), rw]);
		}
	}
	list.sort(function (a, b2) { return a[0] - b2[0]; });
	var flat = [];
	for (var i = 0; i < list.length; i++) { flat.push(list[i][1], list[i][0]); }
	if (flat.length) { bufMEM.poke(1, (f * 1024 + 512) * ROW, flat); }
	bufCF.poke(1, c + 16, list.length);
	bufCF.poke(1, c + 17, lk);
	bufCF.poke(1, c + 19, 1);              // tells the engine: use this loop, don't capture
	post("wanderer: slot " + (f + 1) + " locked " + list.length + " hits over " + lk + " bar(s)\n");
}

function flock(val) {
	if (!ready) { return; }
	if (val && files[sel].loaded && !files[sel].lock && !glockOn) { captureLock(sel); }
	files[sel].lock = val ? 1 : 0;
	writeCtl(sel);
	saveSoon(3000);   // after the loop has been captured
}

function fmute(val) {
	if (!ready) { return; }
	files[sel].mute = val ? 1 : 0;
	writeCtl(sel);
	dirty();
}

function frand(v) {
	if (v === 0) { return; }   // button release
	if (!ready) { return; }
	if (!files[sel].loaded) { return; }
	randomize(sel, null, depthOf("file"));
	refreshPanel();
	dirty();
}

function dice(tabname, v) {
	if (v === 0) { return; }
	if (!ready) { return; }
	randomize(sel, String(tabname), depthOf(String(tabname)));
	refreshPanel();
	dirty();
}

function grand(v) {
	if (v === 0) { return; }
	if (!ready) { return; }
	beginBatch();
	try { for (var f = 0; f < NF; f++) { if (files[f].loaded) { randomize(f, null, depthOf("all")); } } }
	finally { endBatch(); }
	refreshPanel();
	dirty();
}

function glock(val) {
	if (!ready) { glockOn = val ? 1 : 0; return; }
	if (val && !glockOn) {
		for (var f = 0; f < NF; f++) { if (files[f].loaded && !files[f].lock) { captureLock(f); } }
	}
	glockOn = val ? 1 : 0;
	saveSoon(3000);
}

// ---------- randomize -----------------------------------------------------
function pickWeighted(w) {
	var x = Math.random(), acc = 0;
	for (var i = 0; i < w.length; i++) { acc += w[i]; if (x < acc) { return i; } }
	return w.length - 1;
}

// random depth per scope (0..1): "all", "file" and each tab name
var rdepths = {};
function rdepth(scope, v) { rdepths[String(scope)] = clamp(v / 100, 0, 1); }
function depthOf(scope) { var d = rdepths[scope]; return d === undefined ? 1 : d; }

// amt: how far values move toward a new random value; modes, switches and menus change with this probability
function randomize(f, onlyTab, amt) {
	beginBatch();
	try { randomizeBody(f, onlyTab, amt); }
	finally { endBatch(); }
}
function randomizeBody(f, onlyTab, amt) {
	var fl = files[f];
	var anyNote = false;
	if (amt === undefined) { amt = 1; }
	if (amt <= 0) { return; }
	for (var p = 0; p < NB + 1; p++) {
		var q = P[p];
		if (onlyTab && q.tab !== onlyTab) { continue; }
		if (q.tab === "detect") { continue; }   // handled below
		if (q.type === "knob" && q.k === "vol") {
			// volume itself stays put; only its range (per-hit loudness variation) is rolled, capped at about +-12 dB
			var vr = Math.random() < 0.4 ? 0 : Math.random() * 0.3;
			fl.r[p] += (vr - fl.r[p]) * amt;
			if (Math.random() < amt) { fl.m[p] = fl.r[p] < 0.005 ? 0 : (Math.random() < 0.7 ? 1 : 2); }
			writeParam(f, p, 3);
			continue;
		}
		if (q.type === "knob") {
			if (!q.rnd) { continue; }
			var tb = q.rnd[0] + Math.random() * (q.rnd[1] - q.rnd[0]);
			var tr = Math.random() < 0.3 ? 0 : Math.random();             // 0..100% evenly; Chaos sets how much it does
			if (q.k === "loop") { tb = Math.random() < 0.8 ? 0 : 0.05 + Math.random() * 0.25; }
			if (q.k === "pitch") { tr = Math.random() < 0.3 ? 0 : Math.random() * 0.25; }   // capped: +-1 octave at Chaos 50
			if (q.k === "glide") {   // off in most rolls, short when on: swoops stay an occasional effect
				tb = Math.random() < 0.7 ? 0 : Math.random() * 0.35;
				tr = Math.random() < 0.5 ? 0 : Math.random() * 0.3;
			}
			fl.b[p] += (tb - fl.b[p]) * amt;
			fl.r[p] += (tr - fl.r[p]) * amt;
			if (Math.random() < amt) { fl.m[p] = fl.r[p] < 0.005 ? 0 : (Math.random() < 0.7 ? 1 : 2); }
		} else if (q.type === "toggle") {
			if (Math.random() < amt) { fl.b[p] = Math.random() < q.odds ? 1 : 0; }
		} else if (q.type === "enum") {
			if (Math.random() < amt) { fl.b[p] = q.w ? pickWeighted(q.w) : Math.floor(Math.random() * q.items.length); }
		}
		writeParam(f, p, 3);
	}
	// Start, Length and Gate: roll how much of the slice is heard overall (leaning toward most of it),
	// then share the cut between the three, so they are rarely all short at once
	var doPlay = !onlyTab || onlyTab === "play", doEnv = !onlyTab || onlyTab === "env";
	if (doPlay || doEnv) {
		var keepAll = 0.3 + 0.7 * (1 - Math.pow(Math.random(), 1.5));
		var wS = Math.pow(Math.random(), 3), wL = Math.pow(Math.random(), 3), wG = Math.pow(Math.random(), 3);
		var wSum = wS + wL + wG + 0.000001;
		var cS = Math.pow(keepAll, wS / wSum), cL = Math.pow(keepAll, wL / wSum), cG = Math.pow(keepAll, wG / wSum);
		var trio = [];
		if (doPlay) { trio.push([KEY.start, Math.min(0.5, 1 - cS)]); trio.push([KEY.length, (100 * cL - 1) / 99]); }
		if (doEnv) { trio.push([KEY.gate, (100 * cG - 1) / 99]); }
		for (var ti = 0; ti < trio.length; ti++) {
			var tp = trio[ti][0];
			var trr = Math.random() < 0.4 ? 0 : Math.random() * 0.5;   // per-hit range: smaller than other knobs
			fl.b[tp] += (clamp(trio[ti][1], 0, 1) - fl.b[tp]) * amt;
			fl.r[tp] += (trr - fl.r[tp]) * amt;
			if (Math.random() < amt) { fl.m[tp] = fl.r[tp] < 0.005 ? 0 : (Math.random() < 0.7 ? 1 : 2); }
			writeParam(f, tp, 3);
		}
	}
	if (!onlyTab || onlyTab === "detect") {
		// detection: method weighted toward the drum-friendly ones, moderate sensitivity and length
		var mth = KEY.method, sn = KEY.sens, ml = KEY.minlen;
		var before = fl.b[mth];
		if (Math.random() < amt) { fl.b[mth] = pickWeighted([0.35, 0.2, 0.1, 0.1, 0.1, 0.1, 0.05]); }
		// Sensitivity / Min Len knobs stay put; only their ranges and modes are rolled
		var ranged = false;
		var dk = [sn, ml];
		for (var di = 0; di < 2; di++) {
			var dp = dk[di];
			var dtr = Math.random() < 0.4 ? 0 : Math.random() * 0.5;
			fl.r[dp] += (dtr - fl.r[dp]) * amt;
			if (Math.random() < amt) { fl.m[dp] = fl.r[dp] < 0.005 ? 0 : (Math.random() < 0.7 ? 1 : 2); }
			if (fl.m[dp] > 0 && fl.r[dp] > 0.005) { ranged = true; }
		}
		if (fl.loaded && (fl.b[mth] !== before || ranged)) { scheduleDetect(f); }
	}
	if (!onlyTab || onlyTab === "slice") {
		var ch = KEY.chokep;
		var cht = Math.random() < 0.4 ? 1 : 0.25 + Math.random() * 0.75;   // often full, otherwise 25..100%
		fl.b[ch] += (cht - fl.b[ch]) * amt;
		writeParam(f, ch, 3);
	}
	if (!onlyTab || onlyTab === "filter") {
		var tv = KEY.ftvar;
		var tvt = 0.6 * Math.pow(Math.random(), 1.5);   // 0..60%, leaning low
		fl.b[tv] += (tvt - fl.b[tv]) * amt;
		writeParam(f, tv, 3);
		// keep the cutoff musical for the chosen type: LP stays bright, HP stays low, BP in the middle
		var ft = fl.b[KEY.ftype], c = KEY.cut;
		var lo = ft === 0 ? 0.55 : (ft === 1 ? 0.15 : 0.3);
		var hi = ft === 0 ? 1 : (ft === 1 ? 0.42 : 0.58);
		var target = lo + Math.random() * (hi - lo);
		var cur = clamp(fl.b[c], lo, hi);
		fl.b[c] = cur + (target - cur) * amt;
		fl.r[c] = Math.min(fl.r[c], 0.12);
		writeParam(f, c, 3);
	}
	if (!onlyTab || onlyTab === "clock") {
		for (var i = 0; i < 6; i++) { if (fl.b[KEY.v1 + i]) { anyNote = true; } }
		if (!anyNote) { fl.b[KEY.v16] = 1; writeParam(f, KEY.v16, 3); }
	}
	if ((!onlyTab || onlyTab === "slice") && fl.b[KEY.smode] === 3) { randomWeights(f); }
	if (fl.loaded) { writeTable(f); }
	if (f === sel) { refreshWave(); }
}

// Weighted mode rolled: draw new manual weights (some slices strong, many weak)
function randomWeights(f) {
	var fl = files[f];
	fl.b[KEY.wsrc] = 0;
	writeParam(f, KEY.wsrc, 3);
	fl.wroll = true;    // re-drawn after any re-slice (Random may also change the method)
	drawWeights(fl);
}
function drawWeights(fl) {
	fl.wman = [];
	for (var i = 0; i < fl.ns; i++) { fl.wman.push(0.05 + 0.95 * Math.pow(Math.random(), 1.6)); }
}

// Init: selected file back to default settings (slicing and Detect stay)
function finit(v) {
	if (v === 0 || !ready) { return; }
	var fl = files[sel];
	for (var p = 0; p < P.length; p++) {
		if (P[p].tab === "detect") { continue; }
		fl.b[p] = isKnob(p) ? norm(p, P[p]["def"]) : P[p]["def"];
		fl.r[p] = 0;
		fl.m[p] = 0;
	}
	writeAll(sel, 3);
	if (fl.loaded) { writeTable(sel); }
	refreshPanel();
	refreshWave();
	dirty();
}

// ---------- Clear All (two-step) ---------------------------------------------
// first press arms the button for 2 s ("Sure?"), a second press inside that time wipes everything
var clearArmed = false;
var clearLook = null;
var clearDisarm = new Task(clearDisarmNow, this);
var clearUITask = new Task(clearResetUI, this);
// global controls back to their defaults (the Out section stays as set: Even, Comp, Volume, Limit)
var CLEAR_UI = [["macro", 100], ["quant", 0], ["glen", 0], ["qhit", 2], ["qext", 1], ["chaos", 50], ["gdensity", 0], ["gpitch", 0], ["mutate", 0],
	["gscale", 0], ["gtrip", 1], ["gdot", 1], ["gptch", 1], ["grev", 1], ["glock", 0], ["locklen", 2],
	["slot", 0], ["slide", 0], ["msens", 0], ["mlen", 0], ["depth_file", 100], ["depth_all", 100],
	["tabs", 0]];
var PANEL_DEPTHS = ["clock", "slice", "play", "pitch", "env", "filter", "repeat", "grain", "detect"];

function clearall(v) {
	if (v === 0 || !ready) { return; }
	var obj = pat.getnamed("clearall");
	if (!clearArmed) {
		clearArmed = true;
		if (obj) {
			clearLook = { bg: obj.getattr("bgcolor"), tc: obj.getattr("textcolor") };
			obj.message("text", "Sure?");
			obj.message("bgcolor", 0.84, 0.27, 0.27, 1);
			obj.message("textcolor", 1, 1, 1, 1);
		}
		clearDisarm.schedule(2000);
		return;
	}
	clearDisarm.cancel();
	clearDisarmNow();
	wipeAll();
}

function clearDisarmNow() {
	clearArmed = false;
	var obj = pat.getnamed("clearall");
	if (!obj) { return; }
	obj.message("text", "Clear All");
	if (clearLook) {
		if (clearLook.bg) { obj.message("bgcolor", clearLook.bg); }
		if (clearLook.tc) { obj.message("textcolor", clearLook.tc); }
	}
}

function wipeAll() {
	post("wanderer: clear all\n");
	glide = null;
	glideTask.cancel();
	if (sliding) { commitSlide(); }
	queue = [];
	detectPending = {};
	busy = -1;
	busyTask.cancel();
	batch = null;
	batchDepth = 0;
	detectTask.cancel();
	masterTask.cancel();
	relinkTarget = -1;
	for (var f = 0; f < NF; f++) {
		files[f] = newFile();
		var c = f * CTL;
		bufCF.poke(1, c + 16, [0, 0, 0, 0]);   // locked list: count, length, -, restore flag
		writeAll(f, 3);
		writeCtl(f);
		outlet(0, "target", f + 1);
		outlet(0, "clear");
		outlet(0, "target", 0);
		outlet(0, "mute", f + 1, 1);
	}
	g.files = files;
	slots = [null, null, null, null, null, null, null, null];
	curSlot = 0;
	slideIdx = 0;
	rdepths = {};
	mSens = 0;
	mLen = 1;
	sel = 0;
	g.sel = 0;
	refreshAll();
	clearUITask.schedule(10);   // outside this call: the controls answer back through ---brain
}

function clearResetUI() {
	for (var i = 0; i < CLEAR_UI.length; i++) {
		var o = pat.getnamed(CLEAR_UI[i][0]);
		if (o) { o.message("float", CLEAR_UI[i][1]); }
	}
	var pobj = pat.getnamed("panel");
	var pp = pobj ? pobj.subpatcher() : null;
	if (pp) {
		for (var k = 0; k < PANEL_DEPTHS.length; k++) {
			var d = pp.getnamed("depth_" + PANEL_DEPTHS[k]);
			if (d) { d.message("float", 100); }
		}
	}
	refreshAll();
	saveSoon(500);
}

// ---------- memory slots and slide ------------------------------------------
function snapshot() {
	var s = [];
	for (var f = 0; f < NF; f++) {
		var fl = files[f];
		s.push({ b: fl.b.slice(), r: fl.r.slice(), m: fl.m.slice() });
	}
	return s;
}

function store(v) {
	if (v === 0) { return; }
	if (!ready) { return; }
	slots[curSlot] = snapshot();
	dirty();
}

function slide(i) { slideIdx = clamp(Math.round(i), 0, SLIDES.length - 1); }

function slot(i) {
	curSlot = clamp(Math.round(i), 0, 7);
	if (!ready) { return; }   // value restored by Live at load: remember it, recall nothing
	var s = slots[curSlot];
	if (!s || !ready) { return; }
	if (sliding) { commitSlide(); }
	var dur = SLIDES[slideIdx];
	var fromB = files[sel].b.slice(), fromR = files[sel].r.slice();
	for (var f = 0; f < NF; f++) {
		var fl = files[f];
		var srcOld = fl.b[KEY.wsrc];
		for (var p = 0; p < P.length; p++) {
			if (P[p].tab === "detect" || s[f].b[p] === undefined) { continue; }
			fl.b[p] = s[f].b[p];
			fl.r[p] = s[f].r[p];
			fl.m[p] = s[f].m[p];
		}
		writeAll(f, dur > 0 ? 2 : 3);
		if (fl.loaded && fl.b[KEY.wsrc] !== srcOld) { writeTable(f); }
	}
	if (dur > 0) {
		sliding = true;
		outlet(2, "sldur", dur);
		outlet(2, "slgo", ++goCount);
		startPanelGlide(fromB, fromR, dur);
	}
	refreshPanel();
	if (dur > 0) { glideStep(); }
	refreshWave();
	dirty();
}

// the panel's knobs move along with a slide (the sound glides in the engine itself)
var glide = null;
var glideTask = new Task(glideStep, this);
glideTask.interval = 40;
function startPanelGlide(fromB, fromR, dur) {
	glideTask.cancel();
	glide = { fromB: fromB, fromR: fromR, t0: new Date().getTime(), ms: dur * 4 * 60000 / curTempo, f: sel };
	glideTask.repeat();
}
function glideStep() {
	if (!glide) { glideTask.cancel(); return; }
	var k = clamp((new Date().getTime() - glide.t0) / glide.ms, 0, 1);
	var obj = pat.getnamed("panel");
	var pp = obj ? obj.subpatcher() : null;
	if (pp && glide.f === sel) {
		var fl = files[sel];
		var page = TABS[curTab];
		for (var p = 0; p < NB; p++) {
			if (P[p].type !== "knob" || P[p].tab !== page) { continue; }
			var b = glide.fromB[p] + (fl.b[p] - glide.fromB[p]) * k;
			var r = glide.fromR[p] + (fl.r[p] - glide.fromR[p]) * k;
			setUI(pp, P[p].k + "_b", denorm(p, b));
			setUI(pp, P[p].k + "_r", r * 100);
		}
	}
	if (k >= 1) { glide = null; glideTask.cancel(); }
}

function slidedone() { if (sliding) { commitSlide(); } }

function commitSlide() {
	for (var f = 0; f < NF; f++) { writeAll(f, 1); }
	outlet(2, "slreset", ++resetCount);
	sliding = false;
}

function tempo(t) {
	curTempo = t > 0 ? t : 120;
	if (!ready) { return; }
	for (var f = 0; f < NF; f++) { if (files[f].loaded) { writeTiming(f); } }
}

// ---------- saving -----------------------------------------------------------
function dirty() { saveSoon(2000); }   // one write per burst of edits: keeps Live's undo history small
function saveSoon(ms) { saveTask.cancel(); saveTask.schedule(ms); }

function saveState() {
	if (!ready) { return; }
	// v3: no arrays directly inside arrays and no nulls (Max dictionaries cannot hold them)
	var st = { v: 3, sel: sel, msens: mSens, mlen: mLen, slots: [], files: [] };
	for (var s = 0; s < 8; s++) { st.slots.push(slots[s] ? { f: packSlot(slots[s]) } : { e: 1 }); }
	for (var f = 0; f < NF; f++) {
		var fl = files[f];
		var o = { path: fl.path, b: fl.b.map(round4), r: fl.r.map(round4), m: fl.m.slice(),
			en: fl.en.slice(), w: fl.wman.map(round4), lock: fl.lock, mute: fl.mute };
		var c = f * CTL;
		if (fl.lock || glockOn) {
			var cnt = bufCF.peek(1, c + 16, 1);
			var len = bufCF.peek(1, c + 17, 1);
			if (cnt > 0) {
				// locked list = (row, phase) pairs pointing into the hit rows
				var ent = bufMEM.peek(1, (f * 1024 + 512) * ROW, cnt * 2);
				if (typeof ent === "number") { ent = [ent]; }
				var ph = [], rows = [];
				for (var e = 0; e < cnt; e++) {
					ph.push(round4(ent[e * 2 + 1]));
					var rw = bufMEM.peek(1, (f * 1024 + ent[e * 2]) * ROW, ROW);
					rows = rows.concat(rw.map(round4));
				}
				o.loop = { cnt: cnt, len: len, ph: ph, rows: rows };
			}
		}
		st.files.push(o);
	}
	var json = JSON.stringify(st);
	if (json === lastSaved) { return; }   // nothing changed: no new undo step
	lastSaved = json;
	var d = new Dict(rt + "state");
	d.parse(json);
	saving = true;
	savedOnce = true;
	outlet(3, "dictionary", rt + "state");
	saving = false;
}

function packSlot(s) {
	var out = [];
	for (var f = 0; f < s.length; f++) {
		out.push({ b: s[f].b.map(round4), r: s[f].r.map(round4), m: s[f].m.slice() });
	}
	return out;
}

// Max dictionaries store a one-element array as a single value: turn it back into an array
function isArr(x) { return Object.prototype.toString.call(x) === "[object Array]"; }
function toArr(x) {
	if (x === undefined || x === null) { return []; }
	return isArr(x) ? x : [x];
}

function dictionary(name) {
	if (saving || savedOnce) { return; }
	if (!ready) { pendingRestore = String(name); return; }
	restore(String(name));
}

function restore(name) {
	post("wanderer: restoring saved state\n");
	var d = new Dict(name);
	var st;
	try { lastSaved = d.stringify(); st = JSON.parse(lastSaved); } catch (e) { post("wanderer: could not read saved state\n"); return; }
	if (!st || !st.files) { return; }
	slots = [];
	var sl0 = toArr(st.slots);
	for (var s = 0; s < 8; s++) {
		var e0 = sl0[s];
		var arr = null;
		if (isArr(e0)) { arr = e0; }                       // v2 format
		else if (e0 && e0.f !== undefined) { arr = toArr(e0.f); }   // v3 format
		if (arr && arr.length) {
			for (var k = 0; k < arr.length; k++) { arr[k] = { b: toArr(arr[k].b), r: toArr(arr[k].r), m: toArr(arr[k].m) }; }
			slots.push(arr);
		} else { slots.push(null); }
	}
	for (var f = 0; f < NF && f < st.files.length; f++) {
		var o = st.files[f];
		var fl = files[f];
		var ob = toArr(o.b), orr = toArr(o.r), om = toArr(o.m);
		for (var p = 0; p < P.length; p++) {
			if (ob[p] !== undefined) { fl.b[p] = ob[p]; }
			if (orr[p] !== undefined) { fl.r[p] = orr[p]; }
			if (om[p] !== undefined) { fl.m[p] = om[p]; }
		}
		fl.lock = o.lock || 0;
		fl.mute = o.mute || 0;
		writeAll(f, 3);
		writeCtl(f);
		var lph = o.loop ? toArr(o.loop.ph) : [], lrows = o.loop ? toArr(o.loop.rows) : [];
		if (st.v >= 2 && o.loop && o.loop.cnt > 0 && lph.length >= o.loop.cnt && lrows.length >= o.loop.cnt * ROW) {
			for (var e = 0; e < o.loop.cnt; e++) {
				bufMEM.poke(1, (f * 1024 + e) * ROW, lrows.slice(e * ROW, (e + 1) * ROW));
				bufMEM.poke(1, (f * 1024 + 512) * ROW + e * 2, [e, lph[e]]);
			}
			bufCF.poke(1, f * CTL + 16, o.loop.cnt);
			bufCF.poke(1, f * CTL + 17, o.loop.len);
			bufCF.poke(1, f * CTL + 19, 1);
		}
		if (o.path) {
			fl.keep = { en: toArr(o.en), w: toArr(o.w) };
			loadFile(f, o.path);
		}
	}
	if (st.msens !== undefined) { mSens = st.msens; mLen = st.mlen || 1; }
	sel = clamp(st.sel || 0, 0, NF - 1);
	g.sel = sel;
	refreshAll();
}

// ---------- UI refresh --------------------------------------------------------
function tellUI(name, msg, arg) {
	var obj = pat.getnamed(name);
	if (!obj) { return; }
	if (arg === undefined) { obj.message(msg); } else { obj.message(msg, arg); }
}

function refreshAll() {
	refreshSlots();
	refreshWave();
	refreshPanel();
	refreshStrip();
}

function refreshSlots() {
	if (!g) { return; }
	var states = [];
	for (var f = 0; f < NF; f++) {
		var fl = files[f];
		states.push(fl.missing ? 2 : (fl.loading ? 3 : (fl.loaded ? 1 : 0)));
	}
	g.states = states;
	g.sel = sel;
	tellUI("slots", "bang");
}

function refreshWave() {
	if (!g) { return; }
	var fl = files[sel];
	g.wave = { buf: audioName(sel), ver: fl.gen || 0, frames: fl.frames, loaded: fl.loaded, missing: fl.missing,
		name: fl.name, ns: fl.ns, starts: fl.starts, ends: fl.ends, en: fl.en, w: fl.wman,
		manual: fl.b[KEY.wsrc] === 0 && fl.b[KEY.smode] === 3 };
	tellUI("wave", "bang");
}

function refreshStrip() {
	setUI(pat, "flock", files[sel].lock);
	setUI(pat, "fmute", files[sel].mute);
}

// only the page on screen is updated; switching tabs refreshes the new page
var TABS = ["clock", "slice", "play", "pitch", "env", "filter", "repeat", "grain", "detect"];
function refreshPanel() {
	var obj = pat.getnamed("panel");
	if (!obj) { return; }
	var pp = obj.subpatcher();
	if (!pp) { return; }
	var fl = files[sel];
	var page = TABS[curTab];
	for (var p = 0; p < P.length; p++) {
		var q = P[p];
		if (q.tab !== page) { continue; }
		if (q.type === "knob" || q.type === "knob0") {
			setUI(pp, q.k + "_b", denorm(p, fl.b[p]));
			if (q.type === "knob") {
				setUI(pp, q.k + "_r", fl.r[p] * 100);
				setUI(pp, q.k + "_m", fl.m[p]);
			}
		} else {
			setUI(pp, q.k + "_v", fl.b[p]);
		}
	}
}

function setUI(patcher, name, val) {
	var o = patcher.getnamed(name);
	if (o) { o.message("set", val); }
}

// pattr sends a bare 0 when nothing has been saved yet: nothing to restore
function msg_int(v) { }
function msg_float(v) { }

function anything() {
	post("wanderer: unknown message " + messagename + "\n");
}
