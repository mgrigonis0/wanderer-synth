#!/usr/bin/env python3
"""Generate the Wanderer Max for Live device (never hand-edit the outputs).

Writes devices/wanderer/Wanderer/Wanderer.maxpat (plain patcher) and Wanderer.amxd (the same, as a Live instrument).

Signal:   [phasor~ 1n @lock 1] (bar phase) -> wanderer~ -> plugout~
Controls: every Live control -> [prepend <name>] -> wanderer~ ; the views (jsui) -> wanderer~
Info:     wanderer~ outlet 2 -> every view (each picks its own messages), and [route ...] for the patch:
          fstate (per-file buttons), cleararm, gset (Clear All resets), relink, meter
Files:    wanderer~ sends "replace <path>" to [r ---ld<n>] -> [buffer~ ---w<n>]; its "done" bang -> "loaded <n-1>"
Saving:   9 hidden Live parameters (blob, Stored Only): [pattr st0] "State" (the device) and [pattr st1..8] "Mem 1..8"
          (one memory slot each), each holding a number list. wanderer~ outlet 3: "getstate" bangs them all, "st<k>
          <numbers>" sets one; each answers through [prepend statelist <k>]. CONVENTIONS "Saving in the Live set".
"""
import json
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VERSION = re.search(r'WANDERER_VERSION "([^"]+)"', (ROOT / "source/engine/version.h").read_text()).group(1)
NSTORE = 9                    # = 1 + NSLOT (model.h)
OUT = ROOT / "Wanderer"
NF = 16

boxes, lines = [], []
_n = [0]


def box(maxclass, rect, text=None, ins=1, outs=1, outtypes=None, pres=None, **extra):
    _n[0] += 1
    bid = f"obj-{_n[0]}"
    b = {"id": bid, "maxclass": maxclass, "numinlets": ins, "numoutlets": outs, "patching_rect": [float(v) for v in rect]}
    if outs:
        b["outlettype"] = outtypes if outtypes is not None else [""] * outs
    if text is not None:
        b["text"] = text
    if pres is not None:
        b["presentation"] = 1
        b["presentation_rect"] = [float(v) for v in pres]
    b.update(extra)
    boxes.append({"box": b})
    return bid


def obj(text, rect, ins=1, outs=1, outtypes=None, **extra):
    return box("newobj", rect, text=text, ins=ins, outs=outs, outtypes=outtypes, **extra)


def msg(text, rect):
    return box("message", rect, text=text, ins=2, outs=1)


def wire(src, so, dst, di):
    lines.append({"patchline": {"source": [src, so], "destination": [dst, di]}})


def valueof(longname, short, ptype, lo, hi, init, unitstyle=1, exponent=1.0, units=None, enum=None, invisible=0,
            initial_enable=1):
    """initial_enable=0: no initial value at all (the stores: the proven combination, Lifegiver 15e)."""
    v = {"parameter_longname": longname, "parameter_shortname": short, "parameter_type": ptype,
         "parameter_mmin": lo, "parameter_mmax": hi,
         "parameter_initial_enable": 1 if initial_enable else 0, "parameter_unitstyle": unitstyle}
    if initial_enable:
        v["parameter_initial"] = [init]
    if exponent != 1.0:
        v["parameter_exponent"] = exponent
    if units:
        v["parameter_units"] = units
    if enum:
        v["parameter_enum"] = enum
    if invisible:
        v["parameter_invisible"] = invisible
    return {"valueof": v}


def rgba(c, a=1.0):
    return [c[0], c[1], c[2], a]


# --------------------------------------------------------------------------------------------- colours
C = {
    "teal": (0.31, 0.765, 0.753), "groove": (0.416, 0.659, 0.941), "shape": (0.941, 0.627, 0.314),
    "memory": (0.663, 0.545, 0.91), "detect": (0.77, 0.77, 0.78), "out": (0.937, 0.541, 0.47),
    "amber": (0.949, 0.722, 0.294), "green": (0.612, 0.8, 0.353),
}
DEV_BG = (0.239, 0.243, 0.255)
PANEL = (0.11, 0.114, 0.125)
BTN = (0.165, 0.169, 0.184)
INK = (0.08, 0.08, 0.08)
TXT = (0.925, 0.925, 0.925)

# --------------------------------------------------------------------------------------------- Info View
INFO = {
    "files": "The 16 file slots. Click one to show and edit it. Teal = loaded, red = not found (click to find it), amber bar = locked, grey bar = muted.",
    "drop": "Drop audio files here. A file goes into the selected slot if it is empty, otherwise into the next empty one.",
    "wave": "The selected file and its slices. Click a slice: switch it off or on. In Weighted order, drag up or down in a slice to set how often it plays.",
    "page": "The selected file's settings. Left: the tabs. Drag a dial: its value. Drag its thin outer ring: how much it varies on every hit (scaled by Chaos). Click the text under a dial: fixed, rnd (a new value each hit) or walk (drifts from hit to hit). Double-click: default. Shift: fine.",
    "flock": "Free: this file keeps inventing new hits. Lock: it repeats the last bars it played as a loop (Bars sets the length).",
    "fmute": "Silences this file (it keeps its place in time).",
    "finit": "This file's settings back to their defaults (its slicing stays).",
    "fclear": "Empties this slot.",
    "frand": "New random settings for this file (Depth: Random All's). If it is locked, it also gets a fresh loop.",
    "quant": "How tightly hits are pulled onto the grid set by Quant to. 0 = loose (swing and feel as set), 100 = on the grid, straight.",
    "gdensity": "More or fewer hits for every file. Below 0 some hits become rests, so the rhythm keeps its shape.",
    "glen": "Every sound fuller (+) or shorter (-): Start, Length, Gate and release together.",
    "qhit": "The grid Quant pulls hits onto. Triplet waits use triplet lines when Trip is allowed.",
    "glock": "Free / Lock for every file at once (each file can still be switched on its own).",
    "locklen": "How many bars Lock keeps as a loop.",
    "macro": "All files at once: 0 = clean (every knob toward neutral), 100 = as set, up to 175 = exaggerated.",
    "chaos": "How much the per-hit ranges vary every hit. 50 = as drawn, 0 = no variation, 100 = double.",
    "mutate": "Locked loops slowly change: after each pass, this share of hits gets a new slice and new values.",
    "gpitch": "Transposes every file.",
    "gscale": "Per-hit pitch changes and repeat steps snap to this scale.",
    "gtrip": "Allow triplet waits (and triplet repeat spacing).",
    "gdot": "Allow dotted waits.",
    "gptch": "Allow pitch changes: file pitch, per-hit pitch, pitch envelope, glide, repeat steps. The global Pitch dial still transposes.",
    "grev": "Allow reverse playback.",
    "grepeat": "Allow repeating: the bursts (Repeat tab) and Loop (Play tab). Off = every hit plays once; the settings are kept.",
    "gbuzz": "Allow buzz: repeats faster than 30 ms, loops shorter than 50 ms and evenly spaced grains, which turn into a pitched tone. Off = they stay rhythmic.",
    "grand": "New random settings for every file (and fresh loops for locked files). Depth: how far they move.",
    "rdall": "How far Random All moves the settings: 100 % = a completely new roll, lower = a nudge.",
    "clearall": "Empties every slot and memory and resets the device. Press twice within 2 seconds.",
    "memory": "Memory slots: click to recall (settings, Free/Lock and the loops, exactly as stored). Store saves into the selected slot, Clear empties it.",
    "slide": "Recall glides from the old settings to the new over this time.",
    "store": "Saves everything into the selected memory slot.",
    "clearslot": "Empties the selected memory slot.",
    "msens": "Detection sensitivity for every file, added to each file's own. Higher = more slices.",
    "mlen": "Shortest slice for every file, as a multiple of each file's own.",
    "gmethod": "Slicing for every file: Hits (loudness jumps: drums) or Notes (changes in sound: melodic material).",
    "even": "Evens out loudness between slices: 100 % = every slice starts at the same level.",
    "comp": "Glues the output: more = lower threshold, higher ratio, matching make-up. The bar shows the gain reduction.",
    "stereo": "Stereo width of the whole output: 0 = mono, 100 % = as is, 200 % = extra wide.",
    "volume": "Output level.",
    "limit": "A soft limiter at the end: the output never goes over -0.3 dB.",
}


def info(name, title):
    t = INFO.get(name)
    return {"annotation": t, "annotation_name": title} if t else {}


# --------------------------------------------------------------------------------------------- core
eng = obj("wanderer~ ---wnd", (40, 300, 140, 22), ins=1, outs=4, outtypes=["signal", "signal", "", ""])
phas = obj("phasor~ 1n @lock 1", (40, 260, 120, 22), ins=2, outs=1, outtypes=["signal"])
plug = obj("plugout~", (40, 350, 60, 22), ins=2, outs=0)
wire(phas, 0, eng, 0); wire(eng, 0, plug, 0); wire(eng, 1, plug, 1)

thisdev = obj("live.thisdevice", (40, 20, 90, 22), ins=1, outs=3, outtypes=["bang", "int", "int"])
tinit = obj("t b b b", (40, 50, 60, 22), ins=1, outs=3, outtypes=["bang", "bang", "bang"])
wire(thisdev, 0, tinit, 0)
initmsg = msg("init", (40, 80, 40, 22))
wire(tinit, 0, initmsg, 0); wire(initmsg, 0, eng, 0)
# transport and tempo from Live
pathmsg = msg("path live_set", (140, 80, 90, 22))
lpath = obj("live.path", (140, 110, 70, 22), ins=1, outs=3)
wire(tinit, 1, pathmsg, 0); wire(pathmsg, 0, lpath, 0)
for k, (prop, name) in enumerate((("is_playing", "playing"), ("tempo", "tempo"))):
    pm = msg(f"property {prop}", (250 + 140 * k, 80, 110, 22))
    ob = obj("live.observer", (250 + 140 * k, 140, 90, 22), ins=2, outs=2)
    pre = obj(f"prepend {name}", (250 + 140 * k, 170, 100, 22))
    wire(tinit, 1, pm, 0); wire(pm, 0, ob, 0); wire(lpath, 0, ob, 1); wire(ob, 0, pre, 0); wire(pre, 0, eng, 0)

# the 16 audio buffers: loaded by wanderer~ through [r ---ld<n>]
for i in range(1, NF + 1):
    x, y = 40 + (i - 1) % 8 * 120, 1100 + (i - 1) // 8 * 110
    rr = obj(f"r ---ld{i}", (x, y, 70, 22), ins=0, outs=1)
    bf = obj(f"buffer~ ---w{i}", (x, y + 28, 90, 22), ins=1, outs=2, outtypes=["float", "bang"])
    lm = msg(f"loaded {i - 1}", (x, y + 56, 60, 22))
    wire(rr, 0, bf, 0); wire(bf, 1, lm, 0); wire(lm, 0, eng, 0)

# saving in the Live set (CONVENTIONS "Saving in the Live set", proven in Lifegiver 15e): hidden blob parameters
# holding number lists. Parameter mode of a plain object (pattr) is an OBJECT attribute: it goes in
# saved_object_attributes, as Max writes it. A box-level parameter_enable alone is ignored on a pattr, and Live then
# saves an empty blob (Wanderer 15k/15l, Lifegiver 15a-15d). No initial value (Initial Enable 0), Stored Only.
sroute = obj("route getstate " + " ".join(f"st{k}" for k in range(NSTORE)), (600, 360, 420, 22), ins=2, outs=NSTORE + 2)
wire(eng, 3, sroute, 0)
tget = obj("t b", (600, 390, 30, 22), ins=1, outs=1, outtypes=["bang"])
wire(sroute, 0, tget, 0)
for k in range(NSTORE):
    name = "State" if k == 0 else f"Mem {k}"
    x = 600 + k * 100
    pattr = obj(f"pattr st{k}", (x, 420, 60, 22), ins=1, outs=3, parameter_enable=1, varname=f"st{k}",
                saved_object_attributes={"parameter_enable": 1, "parameter_mappable": 0},
                saved_attribute_attributes=valueof(name, name, 3, 0, 1, 0, invisible=1, initial_enable=0))
    pre = obj(f"prepend statelist {k}", (x, 450, 95, 22))
    wire(tget, 0, pattr, 0); wire(sroute, k + 1, pattr, 0)
    wire(pattr, 0, pre, 0); wire(pre, 0, eng, 0)

# engine -> patch
route = obj("route fstate cleararm gset relink", (200, 400, 220, 22), ins=2, outs=5)
wire(eng, 2, route, 0)
odlg = obj("opendialog sound", (440, 430, 100, 22), ins=1, outs=2)
prl = obj("prepend relinkpath", (440, 460, 110, 22))
trl = obj("t b", (440, 405, 30, 22), outtypes=["bang"])   # "relink <slot>": opendialog only takes a bang
wire(route, 3, trl, 0); wire(trl, 0, odlg, 0); wire(odlg, 0, prl, 0); wire(prl, 0, eng, 0)

# the patch's build in the Max window, next to the engine's
vmsg = msg(f"patch {VERSION}", (140, 20, 120, 22))
vprint = obj("print wanderer", (140, 50, 80, 22), ins=1, outs=0)
wire(thisdev, 0, vmsg, 0); wire(vmsg, 0, vprint, 0)

# --------------------------------------------------------------------------------------------- layout (1x)
DEV_H = 169
PY, PH = 4, 161               # panels
Y0 = PY + 4                   # inner top
CELL, CG = 44, 3              # global sections: wide enough for Live's labels (1/16, Notes, Pitch)
FC = CELL                     # files column: the same cell width as everywhere else
DROPH = 30                    # the Drop strip: tall enough for Live's legend + the file name
WAVE_W, PAGE_W = 250, 215     # the two jsui views (page: tabs 36 + 4 + 6 + 4 cells of 40 + gaps)
WC = (WAVE_W - 6 * 3) / 7     # the strip under the waveform: 7 cells
ROWA, ROWB, STRIP_Y = Y0 + 16, Y0 + 74, Y0 + 138
SH = 15                       # strip height
IP = 6                        # panel inner padding
PANEL_W = {"files": 2 * IP + FC, "wave": 2 * IP + WAVE_W, "page": 2 * IP + PAGE_W, "master": 2 * IP + 3 * CELL + 2 * CG + 3 + 1 + 3 + 3 * CELL + 2 * CG,
           "memory": 2 * IP + 2 * CELL + CG, "detect": 2 * IP + CELL, "out": 2 * IP + 2 * CELL + CG}
ORDER = ["files", "wave", "page", "master", "memory", "detect", "out"]
PX = {}
x = 6
for k in ORDER:
    PX[k] = x
    x += PANEL_W[k] + 5
DEVICE_W = x - 5 + 6

# the dark section panels: in the background layer (behind every control) and first in the file, as the old
# device had its zones (that showed in Live). No full-size panel: Live's own device colour is the body, and a
# full-size panel covered everything in 15b/15c.
for k in ORDER:
    box("panel", (970, 20, 40, 30), ins=1, outs=0, pres=(PX[k], PY, PANEL_W[k], PH), bgcolor=rgba(PANEL), border=0,
        rounded=6, background=1, ignoreclick=1, mode=0)


def cellx(panel, i, offset=0):
    return PX[panel] + IP + offset + i * (CELL + CG)


def header(panel, title, color, offset=0, width=None):
    w = width if width is not None else PANEL_W[panel] - 2 * IP
    box("live.comment", (1000, 40 + len(boxes), 80, 18), text=title, ins=1, outs=0,
        pres=(PX[panel] + IP + offset - 3, Y0 - 3, w + 6, 14), textcolor=rgba(color), fontname="Ableton Sans Bold",
        fontsize=9.5, fontface=1)
    box("panel", (1100, 40 + len(boxes), 80, 2), ins=1, outs=0, pres=(PX[panel] + IP + offset, Y0 + 11, w, 2),
        bgcolor=rgba(color, 0.55), border=0, rounded=1, ignoreclick=1)


def label(text, x, y, w, color=TXT, size=8.5):
    box("live.comment", (1200, 40 + len(boxes), 60, 18), text=text, ins=1, outs=0, pres=(x - 2, y - 2, w + 4, 13),
        textcolor=rgba(color), fontsize=size, textjustification=1)


ctl = {}           # name -> object id
bang_at_init = []  # dials, tabs, menus, numboxes: re-output at load


def to_engine(name, src, x, y):
    pre = obj(f"prepend {name}", (x, y, 100, 22))
    wire(src, 0, pre, 0)
    wire(pre, 0, eng, 0)


def dial(name, longn, short, lo, hi, init, ustyle, color, pres, expo=1.0, units=None, at=(0, 0)):
    d = box("live.dial", (700 + at[0], 600 + at[1], 44, 48), ins=1, outs=2, outtypes=["", "float"], pres=pres,
            varname=longn, parameter_enable=1, **info(name, longn), fontsize=8.5,
            activedialcolor=rgba(color), activeneedlecolor=rgba(color), dialcolor=rgba((0.055, 0.055, 0.063)),
            textcolor=rgba(TXT), showname=1, shownumber=1,
            saved_attribute_attributes=valueof(longn, short, 0, lo, hi, init, ustyle, expo, units))
    ctl[name] = d
    bang_at_init.append(d)
    to_engine(name, d, 700 + at[0], 655 + at[1])
    return d


def tab(name, longn, short, items, init, color, pres, lines_, param=True, at=(0, 0)):
    extra = {"parameter_enable": 1, "saved_attribute_attributes": valueof(longn, short, 2, 0, len(items) - 1, init, 9, enum=items)} \
        if param else {"parameter_enable": 0}
    t = box("live.tab", (1300 + at[0], 600 + at[1], 60, 30), ins=1, outs=3, outtypes=["", "", "float"], pres=pres,
            num_lines_patching=lines_, num_lines_presentation=lines_, varname=longn, **info(name, longn),
            activebgoncolor=rgba(color), activetextoncolor=rgba(INK), bgcolor=rgba(BTN), bgoncolor=rgba(color),
            textcolor=rgba((0.85, 0.85, 0.85)), fontsize=7.5, rounded=3, spacing_x=2, spacing_y=2, **extra)
    ctl[name] = t
    if param:
        bang_at_init.append(t)
    to_engine(name, t, 1300 + at[0], 640 + at[1])
    return t


def button(name, text_, pres, color, toggle=False, param=True, init=0, longn=None, at=(0, 0), filled=False):
    longn = longn or text_
    extra = {"parameter_enable": 1, "saved_attribute_attributes": valueof(longn, longn, 2, 0, 1, init, 9, enum=["off", "on"])} \
        if param else {"parameter_enable": 0}
    b = box("live.text", (1500 + at[0], 600 + at[1], 60, 17), ins=1, outs=2, outtypes=["", ""], pres=pres,
            text=text_, texton=text_, mode=1 if toggle else 0, varname=longn, **info(name, longn), fontsize=8.5,
            activebgoncolor=rgba(color), activetextoncolor=rgba(INK), bgcolor=rgba(BTN), bgoncolor=rgba(color),
            activebgcolor=rgba(color, 0.25) if not filled else rgba(color, 0.35), textcolor=rgba(color if not toggle else (0.85, 0.85, 0.85)),
            bordercolor=rgba(color, 0.9), rounded=3, **extra)
    ctl[name] = b
    to_engine(name, b, 1500 + at[0], 630 + at[1])
    return b


# ---- files ----
fx = PX["files"] + IP
FILES_H = STRIP_Y + SH - DROPH - 4 - Y0
files = box("jsui", (40, 500, 44, 120), ins=1, outs=1, pres=(fx, Y0, FC, FILES_H), filename="wanderer.files.js",
            parameter_enable=0, border=0, **info("files", "Files"))
# live.drop only takes drops as a parameter (type "file"); invisible = never stored, never re-sent at load
drop = box("live.drop", (40, 650, 44, 30), ins=1, outs=2, pres=(fx, STRIP_Y + SH - DROPH, FC, DROPH), legend="Drop", varname="drop",
           parameter_enable=1, saved_attribute_attributes={"valueof": {"parameter_invisible": 2, "parameter_longname": "Drop",
                                                                      "parameter_shortname": "Drop", "parameter_type": 4}}, **info("drop", "Drop"), fontsize=8.0, textcolor=rgba(C["teal"]), bordercolor=rgba(C["teal"], 0.8))
# the name Live hands over -> a full path (Max's File object finds Live's copies), then the engine
pdrop = obj("prepend drop", (40, 690, 80, 22))
jdrop = obj("js wanderer.drop.js", (40, 720, 120, 22))
wire(drop, 0, pdrop, 0); wire(pdrop, 0, jdrop, 0); wire(jdrop, 0, eng, 0)

# ---- waveform + per-file buttons ----
wx = PX["wave"] + IP
wave = box("jsui", (100, 500, WAVE_W, 134), ins=1, outs=1, pres=(wx, Y0, WAVE_W, 134), filename="wanderer.wave.js",
           parameter_enable=0, border=0, **info("wave", "Waveform"))
# Free / Lock of the selected file: two buttons that show the file's state ("fstate" from the engine sets them)
ffree = box("live.text", (1500, 560, 60, 17), ins=1, outs=2, outtypes=["", ""], pres=((wx + 0 * (WC + 3)), STRIP_Y, WC, SH),
            text="Free", texton="Free", mode=1, parameter_enable=0, **info("flock", "Free / Lock"), fontsize=8.5,
            activebgoncolor=rgba(C["teal"]), activetextoncolor=rgba(INK), bgcolor=rgba(BTN), bgoncolor=rgba(C["teal"]),
            textcolor=rgba((0.85, 0.85, 0.85)), rounded=3)
flockb = box("live.text", (1570, 560, 60, 17), ins=1, outs=2, outtypes=["", ""], pres=((wx + 1 * (WC + 3)), STRIP_Y, WC, SH),
             text="Lock", texton="Lock", mode=1, parameter_enable=0, **info("flock", "Free / Lock"), fontsize=8.5,
             activebgoncolor=rgba(C["amber"]), activetextoncolor=rgba(INK), bgcolor=rgba(BTN), bgoncolor=rgba(C["amber"]),
             textcolor=rgba((0.85, 0.85, 0.85)), rounded=3)
mfree = msg("flock 0", (1500, 590, 50, 22)); mlock = msg("flock 1", (1570, 590, 50, 22))
tfree = obj("t b", (1500, 575, 24, 22), outtypes=["bang"]); tlock = obj("t b", (1570, 575, 24, 22), outtypes=["bang"])
wire(ffree, 0, tfree, 0); wire(tfree, 0, mfree, 0); wire(mfree, 0, eng, 0)
wire(flockb, 0, tlock, 0); wire(tlock, 0, mlock, 0); wire(mlock, 0, eng, 0)
button("fmute", "Mute", ((wx + 2 * (WC + 3)), STRIP_Y, WC, SH), (0.85, 0.85, 0.85), toggle=True, param=False, at=(0, 40))
button("finit", "Init", ((wx + 3 * (WC + 3)), STRIP_Y, WC, SH), (0.85, 0.85, 0.85), param=False, at=(80, 40))
button("fclear", "Clear", ((wx + 4 * (WC + 3)), STRIP_Y, WC, SH), (0.85, 0.85, 0.85), param=False, at=(160, 40))
button("frand", "Random file", ((wx + 5 * (WC + 3)), STRIP_Y, 2 * WC + 3, SH), C["teal"], param=False, at=(240, 40))

# ---- the per-file page ----
pgx = PX["page"] + IP
page = box("jsui", (400, 500, PAGE_W, 153), ins=1, outs=1, pres=(pgx, Y0, PAGE_W, PH - 8), filename="wanderer.page.js",
           parameter_enable=0, border=0, **info("page", "File settings"))

# ---- groove + shape ----
G0 = 0
S0 = 3 * CELL + 2 * CG + 3 + 1 + 3
header("master", "GROOVE", C["groove"], G0, 3 * CELL + 2 * CG)
header("master", "SHAPE", C["shape"], S0, 3 * CELL + 2 * CG)
box("panel", (1100, 900, 2, 40), ins=1, outs=0, pres=(PX["master"] + IP + 3 * CELL + 2 * CG + 3, ROWA, 1, 2 * 56 + 2),
    bgcolor=rgba((0.18, 0.184, 0.204)), border=0, rounded=0, ignoreclick=1)
DH = 50
dial("quant", "Quant", "Quant", 0, 100, 0, 5, C["groove"], (cellx("master", 0, G0), ROWA, CELL, DH), at=(0, 0))
dial("gdensity", "Density", "Density", -100, 100, 0, 0, C["groove"], (cellx("master", 1, G0), ROWA, CELL, DH), at=(60, 0))
dial("glen", "Length", "Length", -100, 100, 0, 0, C["groove"], (cellx("master", 2, G0), ROWA, CELL, DH), at=(120, 0))
for i, (t, n) in enumerate((("Quant to", "qhit"), ("Mode", "glock"), ("Bars", "locklen"))):
    label(t, cellx("master", i, G0), ROWB, CELL)
tab("qhit", "Quant To", "Quant to", ["1/4", "1/8", "1/16", "1/32"], 2, C["groove"], (cellx("master", 0, G0), ROWB + 13, CELL, 27), 2, at=(0, 0))
tab("glock", "Lock Mode", "Mode", ["Free", "Lock"], 0, C["amber"], (cellx("master", 1, G0), ROWB + 13, CELL, 27), 2, at=(80, 0))
tab("locklen", "Lock Bars", "Bars", ["1", "2", "4", "8"], 1, C["amber"], (cellx("master", 2, G0), ROWB + 13, CELL, 27), 2, at=(160, 0))
dial("macro", "Macro", "Macro", 0, 175, 100, 5, C["shape"], (cellx("master", 0, S0), ROWA, CELL, DH), at=(180, 0))
dial("chaos", "Chaos", "Chaos", 0, 100, 50, 5, C["shape"], (cellx("master", 1, S0), ROWA, CELL, DH), at=(240, 0))
dial("mutate", "Mutate", "Mutate", 0, 100, 0, 5, C["shape"], (cellx("master", 2, S0), ROWA, CELL, DH), at=(300, 0))
dial("gpitch", "Pitch", "Pitch", -24, 24, 0, 7, C["shape"], (cellx("master", 0, S0), ROWB, CELL, DH), at=(360, 0))
label("Scale", cellx("master", 1, S0), ROWB, CELL)
scale = box("live.menu", (1400, 900, 80, 15), ins=1, outs=3, outtypes=["", "", "float"],
            pres=(cellx("master", 1, S0), ROWB + 13, CELL, 14), varname="Scale", parameter_enable=1, **info("gscale", "Scale"),
            fontsize=8.0, bgcolor=rgba(BTN), textcolor=rgba(TXT), arrowcolor=rgba(C["shape"]),
            saved_attribute_attributes=valueof("Scale", "Scale", 2, 0, 11, 0, 9, enum=[
                "Chrom", "Major", "Minor", "Dorian", "Phryg", "Lydian", "Mixo", "HarMin",
                "MajPen", "MinPen", "Fifths", "Octave"]))
ctl["gscale"] = scale
bang_at_init.append(scale)
to_engine("gscale", scale, 1400, 930)
label("Allow", cellx("master", 2, S0), ROWB, CELL)
aw = (CELL - CG) / 2
for i, (n, t) in enumerate((("gtrip", "Trip"), ("gdot", "Dot"), ("gptch", "Pitch"), ("grev", "Rev"), ("gbuzz", "Buzz"), ("grepeat", "Rep"))):
    # a 2 x 3 block: Trip Dot / Pitch Rev / Buzz Rep; every switch starts off
    button(n, t, (cellx("master", 2, S0) + (i % 2) * (aw + CG), ROWB + 13 + (i // 2) * 15, aw, 12), C["shape"], toggle=True,
           init=0, longn="Allow " + t, at=(i * 70, 200))
for n in ("gtrip", "gdot", "gptch", "grev", "gbuzz", "grepeat"):
    for b in boxes:
        if b["box"]["id"] == ctl[n]:
            b["box"]["fontsize"] = 7.0
# strip: Random all + depth, Clear all
button("grand", "Random all", (cellx("master", 0, G0), STRIP_Y, 2 * CELL + CG, SH), C["groove"], at=(0, 300), filled=True)
rd = box("live.numbox", (1700, 600, 44, 15), ins=1, outs=2, outtypes=["", "float"],
         pres=(cellx("master", 2, G0), STRIP_Y, CELL, SH), varname="Random Depth", parameter_enable=1,
         **info("rdall", "Random Depth"), fontsize=8.0, activeslidercolor=rgba(C["groove"]), textcolor=rgba(TXT),
         bordercolor=rgba(BTN), appearance=1,
         saved_attribute_attributes=valueof("Random Depth", "Depth", 0, 0, 100, 100, 5))
ctl["rdall"] = rd
bang_at_init.append(rd)
to_engine("rdall", rd, 1700, 630)
clearall = button("clearall", "Clear all", (cellx("master", 2, S0), STRIP_Y, CELL, SH), (0.75, 0.75, 0.77), at=(80, 300))

# ---- memory ----
mx = PX["memory"] + IP
mem = box("jsui", (700, 500, 75, 112), ins=1, outs=1, pres=(mx, Y0, 2 * CELL + CG, 112), filename="wanderer.memory.js",
          parameter_enable=0, border=0, **info("memory", "Memory"))
label("Slide", mx, Y0 + 119, CELL)
slide = box("live.menu", (1400, 1000, 80, 15), ins=1, outs=3, outtypes=["", "", "float"],
            pres=(mx + CELL + CG, Y0 + 118, CELL, 14), varname="Slide", parameter_enable=1, **info("slide", "Slide"),
            fontsize=8.0, bgcolor=rgba(BTN), textcolor=rgba(TXT), arrowcolor=rgba(C["memory"]),
            saved_attribute_attributes=valueof("Slide", "Slide", 2, 0, 6, 0, 9,
                                               enum=["Off", "1/4", "1 bar", "2 bar", "4 bar", "8 bar", "16 bar"]))
ctl["slide"] = slide
bang_at_init.append(slide)
to_engine("slide", slide, 1400, 1030)
button("store", "Store", (mx, STRIP_Y, CELL, SH), C["memory"], at=(160, 300))
button("clearslot", "Clear", (mx + CELL + CG, STRIP_Y, CELL, SH), (0.85, 0.85, 0.85), longn="Clear Slot", at=(240, 300))

# ---- detect (all files) ----
header("detect", "DETECT", C["detect"])
dial("msens", "Detect Sens", "Sens", -50, 50, 0, 0, C["detect"], (cellx("detect", 0), ROWA, CELL, DH), at=(420, 0))
dial("mlen", "Detect Min Len", "Min len", -100, 100, 0, 0, C["detect"], (cellx("detect", 0), ROWB, CELL, DH), at=(480, 0))
tab("gmethod", "Detect Method", "Method", ["Hits", "Notes"], 0, C["detect"], (cellx("detect", 0), STRIP_Y, CELL, SH), 1, at=(240, 0))
for b in boxes:
    if b["box"]["id"] == ctl["gmethod"]:
        b["box"]["fontsize"] = 7.0

# ---- out ----
header("out", "OUT", C["out"])
dial("even", "Even", "Even", 0, 100, 0, 5, C["out"], (cellx("out", 0), ROWA, CELL, DH), at=(540, 0))
dial("comp", "Comp", "Comp", 0, 100, 0, 5, C["out"], (cellx("out", 1), ROWA, CELL, DH), at=(600, 0))
# the gain-reduction bar sits in the gap between Comp's value and the Volume label below
gr = box("jsui", (900, 500, 30, 5), ins=1, outs=0, pres=(cellx("out", 1) + 6, ROWA + DH - 3, CELL - 12, 3),
         filename="wanderer.gr.js", parameter_enable=0, border=0)
dial("stereo", "Stereo", "Stereo", 0, 200, 100, 5, C["out"], (cellx("out", 0), ROWB, CELL, DH), at=(660, 0))
dial("volume", "Volume", "Volume", -70, 6, 0, 4, C["out"], (cellx("out", 1), ROWB, CELL, DH), at=(720, 0))
button("limit", "Limit", (cellx("out", 0), STRIP_Y, CELL, SH), C["out"], toggle=True, init=1, at=(320, 300))
for k in range(2):
    mt = box("live.meter~", (1000 + 40 * k, 360, 30, 6), ins=1, outs=1, outtypes=["list"],
             pres=(cellx("out", 1), STRIP_Y + 2 + k * 7, CELL, 5), orientation=1, parameter_enable=0,
             coldcolor=rgba(C["green"]), warmcolor=rgba(C["amber"]), hotcolor=rgba(C["out"]), offcolor=rgba((0.055, 0.055, 0.063)))
    wire(eng, k, mt, 0)

# ---- wiring of the views ----
for v in (files, wave, page, mem, gr):
    wire(eng, 2, v, 0)
for v in (files, wave, page, mem):
    wire(v, 0, eng, 0)
for d in bang_at_init:
    wire(tinit, 2, d, 0)

# per-file buttons follow the selected file: "fstate <lock> <mute>"
unp = obj("unpack 0 0", (200, 440, 60, 22), ins=1, outs=2)
s1 = obj("prepend set", (200, 470, 80, 22)); s2 = obj("prepend set", (290, 470, 80, 22))
inv = obj("expr 1 - $i1", (110, 470, 70, 22)); s0 = obj("prepend set", (110, 500, 80, 22))
wire(route, 0, unp, 0); wire(unp, 0, s1, 0); wire(unp, 1, s2, 0); wire(unp, 0, inv, 0); wire(inv, 0, s0, 0)
wire(s1, 0, flockb, 0); wire(s0, 0, ffree, 0); wire(s2, 0, ctl["fmute"], 0)
# Clear All asks to be pressed again
sel = obj("sel 1 0", (300, 440, 60, 22), ins=3, outs=3, outtypes=["bang", "bang", ""])
m1 = msg("text Sure?", (300, 500, 70, 22)); m0 = msg("text Clear all", (380, 500, 80, 22))
wire(route, 1, sel, 0); wire(sel, 0, m1, 0); wire(sel, 1, m0, 0); wire(m1, 0, clearall, 0); wire(m0, 0, clearall, 0)
# Clear All resets the global controls
GSET = ["macro", "quant", "glen", "qhit", "gmethod", "chaos", "gdensity", "gpitch", "mutate", "gscale", "gtrip", "gdot",
        "gptch", "grev", "gbuzz", "grepeat", "glock", "locklen", "slide", "msens", "mlen", "rdall"]
rg = obj("route " + " ".join(GSET), (200, 540, 500, 22), ins=2, outs=len(GSET) + 1)
wire(route, 2, rg, 0)
for k, n in enumerate(GSET):
    wire(rg, k, ctl[n], 0)

patcher = {
    "patcher": {
        "fileversion": 1,
        "appversion": {"major": 8, "minor": 6, "revision": 4, "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [60.0, 60.0, 1800.0, 1300.0],
        "openrect": [0.0, 0.0, float(DEVICE_W), float(DEV_H)],
        "bglocked": 0, "openinpresentation": 1,
        "default_fontsize": 10.0, "default_fontface": 0, "default_fontname": "Arial Bold",
        "gridonopen": 1, "gridsize": [8.0, 8.0], "gridsnaponopen": 1, "objectsnaponopen": 1,
        "statusbarvisible": 2, "toolbarvisible": 1, "boxanimatetime": 200, "enablehscroll": 1,
        "enablevscroll": 1, "devicewidth": float(DEVICE_W), "description": "Wanderer",
        "digest": "", "tags": "", "style": "", "subpatcher_template": "",
        "boxes": boxes, "lines": lines,
        "dependency_cache": [
            {"name": n, "bootpath": ".", "patcherrelativepath": ".", "type": "TEXT", "implicit": 1}
            for n in ("wanderer.page.js", "wanderer.wave.js", "wanderer.files.js", "wanderer.memory.js", "wanderer.gr.js", "wanderer.drop.js")
        ] + [{"name": "wanderer~.mxo", "type": "iLaX"}],
        "latency": 0, "is_mpe": 0, "minimum_live_version": "", "minimum_max_version": "",
        "platform_compatibility": 0,
        "project": {
            "version": 1, "creationdate": 3590052493, "modificationdate": 3590052493,
            "viewrect": [0.0, 0.0, 300.0, 500.0], "autoorganize": 1, "hideprojectwindow": 1,
            "showdependencies": 1, "autolocalize": 0, "contents": {"patchers": {}},
            "layout": {}, "searchpath": {}, "detailsvisible": 0,
            "amxdtype": 1768515945, "readonly": 0, "devpathtype": 0, "devpath": ".",
            "sortmode": 0, "viewmode": 0, "includepackages": 0,
        },
        "autosave": 0,
    }
}


def amxd(patch_json: bytes, devtype: bytes = b"iiii") -> bytes:
    """Unfrozen device container: ampf(type) + meta + ptch(JSON, NUL-terminated), little-endian lengths."""
    body = patch_json + b"\x00"
    return (b"ampf" + struct.pack("<I", 4) + devtype +
            b"meta" + struct.pack("<I", 4) + struct.pack("<I", 0) +
            b"ptch" + struct.pack("<I", len(body)) + body)


def main():
    OUT.mkdir(exist_ok=True)
    # background panels first in the list (drawn first = behind)
    boxes.sort(key=lambda b: 0 if b["box"].get("background") == 1 else 1)
    text = json.dumps(patcher, indent="\t").encode("utf-8")
    (OUT / "Wanderer.maxpat").write_bytes(text)
    (OUT / "Wanderer.amxd").write_bytes(amxd(text))
    ids = {b["box"]["id"] for b in boxes}
    for l in lines:
        s, d = l["patchline"]["source"], l["patchline"]["destination"]
        assert s[0] in ids and d[0] in ids, l
    # every connection must use an existing outlet / inlet
    byid = {b["box"]["id"]: b["box"] for b in boxes}
    for l in lines:
        s, d = l["patchline"]["source"], l["patchline"]["destination"]
        assert s[1] < byid[s[0]]["numoutlets"], (byid[s[0]].get("text"), s)
        assert d[1] < byid[d[0]]["numinlets"], (byid[d[0]].get("text"), d)
    # presentation inside the device
    for b in boxes:
        r = b["box"].get("presentation_rect")
        if r:
            assert r[0] >= 0 and r[1] >= 0 and r[0] + r[2] <= DEVICE_W + 0.01 and r[1] + r[3] <= DEV_H + 0.01, (b["box"].get("text"), r)
    nparams = sum(1 for b in boxes if b["box"].get("parameter_enable") == 1)
    print(f"{len(boxes)} boxes, {len(lines)} connections, {nparams} Live parameters, device {DEVICE_W}x{DEV_H}")


if __name__ == "__main__":
    main()
