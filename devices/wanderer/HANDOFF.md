# Wanderer — Handoff

_Last updated: 2026-10-14_

## What it does
A Max for Live instrument. The user drops up to 16 audio files; each is sliced into hits, and a stochastic clock per file plays its slices in time with Live (Free), or repeats a captured or generated loop (Lock). Per-file parameters each have a base value, a per-hit range and a mode; Random, Chaos, Macro, Mutate, memory slots with Slide, global Quant and an output chain (Even, Comp, Volume, Limit) shape the whole.

## Current state
- Working (legacy build, brain + voice 2026-10-12e): Free/Lock per file and global, Store/recall with locked patterns, instant start on Play, bursts, Quant, Random.
- Not started: **the rebuild from scratch**, agreed 2026-10-14 (see Next step). Nothing new is written yet.
- The legacy main patch and panel in the repo are 2026-10-08f (the 10-11/10-12 versions were never pushed and are lost); they don't match the 10-12e brain and voice.

## Structure (legacy, reference only)
- `legacy/device/wanderer.state.js`: brain. Files, slicing, `P` param table (the parameter spec), Random, patterns, memory slots, saving (dict v5 via pattr).
- `legacy/device/wanderer.voice.maxpat`: poly~ voice ×16 with the gen~ engine (clock, Lock playback, repeats, 6 voices × tape/grain, SVF filter).
- `legacy/device/wanderer.maxpat`, `wanderer.panel.maxpat`, `.conductor`, `.comp`, `.limiter`, `wanderer.wave.js`, `wanderer.slots.js`: main patch, UI and output chain (10-08f).
- `legacy/sim/`: Node sim: `translate.py` turns the gen~ codebox into JS; `harness.js` runs the brain in a mocked Max.
- Flow: conductor gen~ (song position in whole notes) → poly~ voices read param buffers written by the brain → comp → volume → limiter → out.

## Parameters
Per file (tabs): clock (density, contour, swing, note values 1..1/32, trip, dot, derived), slice (mode Random/Walk/Weighted/Position, spread, weight strength), play (start, length, rev, loop), pitch (pitch, p.env, p.decay, glide, engine Tape/Grain), env (att, dec, gate, vol, pan, width), filter (cut, res, f.env, f.decay, track, type LP/HP/BP, type var), repeat (chance, count, shape, fade, step, spacing 1/32·1/64·1/32T), grain (size, density, scan, jitter, spread), detect (Hits/Notes, sensitivity, min length). Full ranges: `P` in the legacy brain.
Global: Macro, Chaos, Density, Pitch, Scale, Mutate, Quant + Hits grid, Length, Allow Trip/Dot/Pitch/Rev, Free/Lock + Lock bars (1/2/4/8), Random All + depth, Clear All, master Sensitivity/Min Len, 8 memory slots + Slide, Even, Comp, Volume, Limit. **New: master Stereo width.**

## Decisions (and why)
- Rebuild from scratch, keeping the 10-12e behaviour as the spec: the user likes what it does; the internals and UI grew irregular.
- No FluCoMa (agreed 2026-10-14): own Hits (loudness jumps) and Notes (spectral flux) detection in chunked JS; no install, and the stuck analysis queue goes away.
- No C++ externals: gen~ is already native; unsigned Mac externals need Xcode builds plus `xattr`/signing on every machine.
- Delivered in stages, each tested in Live: 1 engine + brain with a plain UI, 2 the new UI.
- Lock patterns: brain writes the idle bank and counts a request up; engine swaps once per new number (gen~ in Live drops writes inside `if`).
- On Play, a position within 1/32 past a bar line counts as the line; a hit exactly on the current position plays (instant start).
- Removed for good: Choke, Nudge, Jump, repeat Same/Vary, automatic weight sources, slicing methods other than Hits/Notes, Quant Extra menu. Random never changes slicing.

## Rejected approaches
- Engine clearing requests via conditional writes: dropped by gen~ in Live, Lock went silent.
- FluCoMa novelty/ampgate/grid methods: too many, and randomising them made results unpredictable.

## Known issues (legacy; the rebuild must fix)
- Files are not restored after reopening the Live set; they must be dragged in again.
- After a long session, slicing stopped working, then worked, then ignored setting changes (analysis queue/busy state).
- Clicking between slices on the waveform is not smooth.
- Duplicate devices must not crosstalk: not yet audited (names use `---`, but jsui/Global/pattr paths are unchecked).
- Mutate may not change slices in Live (conditional write in the engine).
- UI outdated after many additions and removals.

## Next step
Optional before stage 1: the user may attach 2–3 real files (one drum loop, one or two melodic) to tune Notes. Then stage 1: new `devices/wanderer/Wanderer/` folder with engine, brain, saving, detection, no-crosstalk naming and a plain UI; sim-check, push, user tests in Live. Stage 2: new UI design (mockup first).
