# Wanderer: handoff (state as of 2026-10-11)

Read this first in a new chat. **GitHub:** https://github.com/mgrigonis0/wanderer-synth (`device/`, `docs/`, `sim/`): commit each build there too. The latest source of every device file is in this project under `wanderer/src/`. The simulation tools are under `wanderer/sim/`. These copies are what the user is running in Live now: voice engine **2026-10-08f** and brain **2026-10-08f**.

---

## 1. How to work with this user (important)

- **Don't build until a decision is made.** The user said: "you keep building after each addition or comment I make, please don't build until we've decided to build". Discuss and propose concisely, then wait for an explicit go ("go", "yeah okay, so the plan is…").
- **Keep test requests to the user minimal.** Simulate yourself (see §7). Only ask for a Live test when nothing else can tell, for example when gen~ compiles silently to zero.
- **Explain simply when asked.** Use plain words and small examples (the user said "I didnt understand" once). Keep opinions concise.
- **Bump both version strings on every build.**
  - Voice: the message box in `wanderer.voice.maxpat` that prints `wanderer: voice engine <date><letter> - <summary>`. No commas, because a comma splits the message.
  - Brain: `post("wanderer: ready (brain <date><letter>)")` in `wanderer.state.js`.
  - Tell the user to **delete and re-add the device** after replacing files. Live caches abstractions, and that caused a false "not working" report once.
- **Deliver:** send the changed files, then update the copies in this project (`wanderer/src/…`) and this handoff.

---

## 2. What the device is

**Wanderer** (formerly "Splinter") is a Max for Live **Instrument** for Max 8.6.4 in Live.
- You drop up to **16 audio files**. Each file is sliced with FluCoMa, and slices are played by a **stochastic clock per file**.
- Per-file parameter tabs: clock, slice, play, pitch, env, filter, repeat, grain, detect.
- Lock/Mutate, memory slots with Slide, global controls, and an output chain.
- Style rules:
  - Logic lives in gen~; js/jsui are used where sensible.
  - UI → `prepend <name>` → `s ---all` / `s ---brain`.
  - Short Live info-panel annotations, clean patches, compact presentation. Device width is 1118.

### Files (`wanderer/src/`)

| File | Role |
|---|---|
| `wanderer.maxpat` | Main device: UI, buffers, FluCoMa slicers, poly~, output chain |
| `wanderer.voice.maxpat` | poly~ voice (16 instances, one per file). gen~ engine of about 3900 lines |
| `wanderer.conductor.maxpat` | gen~ song position (whole notes, 5 ms lookahead), slide ramp |
| `wanderer.comp.maxpat` | Lookahead compressor (5 ms delay always), one Amount dial, GR out |
| `wanderer.limiter.maxpat` | Stereo limiter with soft knee, Limit switch crossfade |
| `wanderer.panel.maxpat` | Per-file parameter panel (tabs, big dials, F/R/W range tabs, Rnd) |
| `wanderer.state.js` | **The brain**: file and slice state, params, Random, Lock capture, saving (dict v3), slicing queue |
| `wanderer.wave.js` | jsui waveform (cyan frame, peaks cache keyed by `ver`) |
| `wanderer.slots.js` | jsui memory slots |

### Output chain (main patch)

1. conductor → poly~ → `wanderer.comp`. Amount comes via `prepend amount`; GR goes through `snapshot~ 40` to the multislider `obj-gr`.
2. Volume: `if $f1 <= -69.9 then -999. else $f1` → dbtoa → pack → line~ → *~.
3. `wanderer.limiter` → plugout~ and meters.

### Buffers

| Buffer | Size | Contents |
|---|---|---|
| `---apa` / `---apb` | 64 frames × 3 ch per file | Param sets A/B |
| `---ast` | 256 frames per file × **14 ch** | See below |
| `---acf` | 32 per file | Control frames (CTL = 32) |
| `---amem` | 16 × 1024 × 43 | Lock ring of 512 hits per file + locked list; ROW = 43; col 42 = the hit's wait length |
| `---asc` | — | Scratch |
| `---aix` | — | FluCoMa indices |
| `w1..w16` | — | Audio |

`---ast` channels (0-based):
- 0 start
- 1 end
- 2 weight
- 3 enabled
- 4 start fraction
- 5 Even gain
- 6..13 up to 8 attack positions inside the slice. Unused ones repeat the slice start.

Brain constants: NF 16, MAXS 256, CTL 32, ROW 43, NB 52.

### Per-file params (`P` table in brain)

- **clock:** dens, cont, swing, nudge, v1/v2/v4/v8/v16/v32, trip, dot, derived
- **slice:** spread, wstr, jump, smode (Random/Walk/Skip/Weighted/Position), choke (toggle, def 1), chokep (knob0, 0..100), wsrc
- **play:** start, length, rev, loop
- **pitch:** pitch, penv, pdec, glide, engine
- **env:** att, dec, gate, vol, pan, width
- **filter:** cut, res, fenv, fdec, track, ftype, ftvar
- **repeat:** rchance, rcount, rshape, rvol, rstep, rsame, rvar, rspace (1/16, 1/32, 1/64, 1/16T, 1/32T)
- **grain:** gsize, gdens, scan, gjit, gspread
- **detect:** method (Hits, Soft, Pitch, Harmony, Timbre, Silence, Grid), sens, minlen

Each knob has a base value, a range (`r`) and a range mode (`m`). Chaos scales the per-hit variation.

### Global controls (main patch, presentation)

- **Allow row:**
  - Trip [764,64,24], Dot [790,64,24]
  - **Pitch** (`obj-gpenv`, varname `gptch`, `prepend gptch`) [816,64,30]
  - Rev [848,64,24], Lock [880], Bars [916]
- **Quant** dial (`obj-quant`) at [924,84], violet.
  - **Hits** menu (1/4, 1/8, 1/16, 1/32) at [826,145].
  - **Extra** menu (1/16, 1/32, 1/64) at [874,145].
- **Length** dial (`obj-glen`, `prepend glen`) at [924,2].
- **Out zone (red):** Even, Comp, Out, Limit.
- **Also:** global Pitch, Scale, Density, Chaos, Macro, Mutate, Random All with a depth dial, Clear All, master Sensitivity and Min Len.
- **Global Lock:** `prepend glock` fans out directly to `s ---all` and `s ---brain`. Don't use `[t a a]`: in this Max it sent the symbol "a".

---

## 3. Feature history (all built and confirmed unless noted)

- **Quant:** strength dial, Hits/Extra menus, and Allow Trip adds triplet lines.
  - Hits use type-matched grid lines: triplet waits go to triplet lines, everything else to straight lines.
  - Two hits never share a line.
  - Locked hits use the stored wait (mem col 42).
- **Allow switches:** Allow Rev. The Pitch switch replaced P.Env.
- **Even and Comp:**
  - **Even** levels each slice to about −20 dBFS (gain limited to −24..+18 dB).
  - **Comp** is one dial with 5 ms lookahead and a GR bar. The conductor runs 5 ms ahead to compensate.
- **Weights fix:** weights are drawn after the slice mode is chosen.
- **CPU optimisation:** kept at "Test B" level (details in §6).
- **Click fixes:**
  - Grain start is fitted inside the slice; grain edge fade is 256 samples.
  - Tape loop crossfade.
  - Edge fades in output time.
  - Minimum attack and release are 3 ms.
- **Length:** global dial scaling Start, Length, Gate and Decay.
- **Random rebalance:** Start, Length and Gate share one "how much is heard" amount (`keepAll`), so they're rarely all short at once. Glide is off in 70% of rolls.
- **Slicing retry ladder:** below 4 slices, retry at +25 and +50 sensitivity, then other methods. Never falls back to Grid.
- **Panel alignment:** range dials and F/R/W tabs centred under the big dials; depth dial above Rnd.
- **Full bug review fixes:**
  - Reverse start position.
  - `lastlq` reset.
  - Repeat seed.
  - Lock swing and nudge blended A/B.
  - Softer voice reuse.
  - Jump only when the voice is older than 0.5.
  - Grain respawn on jump.
  - Dict save v3 (no nulls, no nested arrays; the save function is named `saveState`).
  - Slicing generation checks.
  - Busy watchdog.
  - and more.
- **Pitch drift bug fixed:** a repeat loop overwrote the scale note `rq`; it's renamed `rqg`.
- **2026-10-08f (last build, confirmed loading):**
  - **Global Pitch decoupled from the Pitch switch.** In the voice: `semis = gpitch + (gptch > 0.5 ? pfile + rq : 0)`. Switch off disables file pitch, scale notes, Glide, pitch envelope, repeat steps and grain spread. The global Pitch dial still transposes.
  - **Quant = tightness.** At 0% nothing changes.
    - Swing is scaled by (1 − Quant): `hvSwing *= (1-qa)` and `swb *= (1-qa)`. 100% = straight.
    - Start snaps to the nearest attack in the slice when the distance ≤ Quant × slice length, so 100% always snaps. Uses st ch 6..13; the slice start counts as an attack.
    - Attack is capped: `nat = mix(nat, min(nat, 15 ms), qa)`.
  - **Brain attack analysis** (`fileAttacks`, cached per load by `fl.gen`):
    - Peak per 64-sample block. An attack is a block more than 2× the previous ~23 ms average, above −30 dB of the file peak, and at least 60 ms after the previous attack.
    - Position is one block before the jump.
    - `refineCuts` moves each cut to the nearest attack within 25 ms (not for Grid).
    - `innerAttacks` stores the 8 strongest attacks per slice.
    - Long files subsample (step 2 above 3M samples, step 4 above 6M).
  - **Sim results:** Quant 100 gave 0 main hits off the straight grid, 36 of 36 hits starting on an attack, and a longest attack of 15 ms. Not yet confirmed by ear. Watch whether melodic files snap enough; the 6 dB attack threshold may need loosening.
  - Info texts for Pitch and Quant updated.

### Earlier quant investigation result

The quantiser was correct. "Offbeat" with melodic material came from:
- swing (randomised per file and per hit)
- Start inside long multi-note slices
- slow attacks
- reverse
- slightly early FFT-based cuts

The 2026-10-08f build addresses all of these.

---

## 4. OPEN PROPOSAL: agreed in direction, awaiting the user's "go"

The user's last request (2026-10-11): "I think I need choke removed fully, it gets too choppy… I'm looking for groove, not chop. The ratchets don't really sound like ratchets, I was imagining bursts of the same sound… don't need all the different slicing algorithms, a couple is enough, and they should not be randomised with the Random button. One should be hits, the other, what do you think? This needs a bit of simplification."

The proposal below was sent. **The user hasn't said go yet.** Confirm, then build.

### 1. Remove Choke completely

- Remove the per-file `choke` toggle (param index 48, def 1, odds 0.8) and `chokep` (knob0, buf 61).
- Remove Random's chokep roll (in `randomizeBody`, under "slice") and Macro's fade toward always-choke. In the voice: `chp = clamp(1 + (mix(chA, chB, sl) - 1) * mkfull, 0, 1)` and the choke/duck kill logic.
- Remove both from the panel UI and CLEAR_UI and from save/restore. Old sets must still load: ignore the old keys.
- Keep voice stealing: when all 6 voices are busy, the oldest fades out over 3 ms.
- Sounds then overlap naturally; Gate and Length control duration.

### 2. Ratchets as real bursts

Why they don't sound like ratchets now:
- `rsame` is randomised, so repeats often pick a different slice.
- `rvar` varies params per repeat.
- `rspace` often lands on 1/16.
- Choke cuts each repeat.
- Quant's Extra grid and the never-share-a-line rule spread fast repeats apart.

Proposed changes:
- Repeats always replay the same slice with the same settings. Remove `rsame` and `rvar`.
- `rspace` options become 1/32, 1/64, 1/32T.
- Each repeat's gate fits its spacing, so the burst stays clean.
- Keep Chance, Count, Shape (accelerate/decelerate), volume fade (rvol/rfade) and pitch step (rstep).
- **Remove the Extra menu** (`gqext`). The burst's first hit is on the main grid; repeats follow their spacing exactly. At Quant 100%, the burst is straight even with Shape.
- Repeat code in the voice is around `dorep`/`spc`/`RP`/`rqg`, about line 1300. Repeats fire as `hit = 3`.

### 3. Slicing: two methods, not randomised

- **Hits:** `fluid.bufampslice~`, loudness jumps, for drums and percussive material.
- **Notes:** `fluid.bufonsetslice~` with a spectral metric (currently metric 8), for melodic material. It catches note changes without a loudness jump.
- Remove Soft, Pitch, Harmony, Timbre (the novelty variants), Silence (ampgate) and Grid, plus the unused FluCoMa objects in the main patch.
- Random no longer touches the method or the sens/minlen ranges. Remove the "detect" branch in `randomizeBody`.
- Retry ladder: raise sensitivity, then try the other method.
- Saved-set migration: Hits, Silence, Grid → Hits; Soft, Pitch, Harmony, Timbre → Notes.

**After the user says go:**
- Build all three.
- Run the scanner and sim checks (§7).
- Bump versions (next: `2026-10-11a`).
- Send files and update `wanderer/src/` plus this handoff.

---

## 5. Known leftovers (only if the user asks)

- The first downbeat after Play is 5 ms late; this comes from the lookahead.
- The old spec doc (Claude Docs artifact https://claude.ai/code/artifact/2c626796-d0e8-4e6b-8bd1-73ca55954a9c) is outdated: it still says "Splinter" and lacks newer features. Offered a rewrite; not requested.
- The `choke` dead param goes away with the open proposal.

---

## 6. gen~ rules learned the hard way (CRITICAL)

- **gen~ can silently compile the whole engine to zero output.** No console error and no sound.
  - Seen with: lazy RNG, trigger wraps, lock/mutate gating, voice DSP restructuring, inlined helper functions.
  - **Rule:** only use code patterns already present in the playing engine.
  - Keep new code as top-level straight-line statements: `peek`, ternaries, `mix`, `min`, `max`, `abs`, `clamp`.
  - Compare the construct placements against the base: user-function calls, peek/poke, History writes, builtins.
  - If sound disappears, bisect against the last playing version.
- **Also:**
  - Functions come first.
  - Loops only at top level; a loop that shouldn't run gets length 0.
  - Inside loops, peeks come first.
  - No nested ternaries.
  - A variable used outside an if must first be assigned at top level. All locals are declared once in the "locals, declared once" block.
  - History is assigned at most 2 if-levels deep.
  - Don't call user functions with side effects (`rnd`) inside if blocks.
- **CPU level kept ("Test B"):**
  - Debug outlets removed.
  - PT/CL tables filled once.
  - Data VS holds voice state; only active voices read and write it.
  - poly~ `parallel` is off in Live.
- **Max JS:**
  - Dicts turn 1-element arrays into scalars; no nested arrays; no null.
  - Use `isArr`, not `instanceof`.
  - `save` is a reserved function name.
- **Max patching:** a comma in a message box splits the message; `[t a a]` sent the symbol "a".
- **FluCoMa:** `@blocking 0`; done → `deferlow` → `t fluiddone`.

---

## 7. Simulation tools (`wanderer/sim/`)

Restore them into a working folder, for example `/tmp/claude-0/sim/`, with the device in `/mnt/user-data/outputs/Wanderer/`. Fix the paths in `harness.js` and `common.py` if they differ.

- **`translate.py [voice.maxpat] [out.js]`:** translates the gen~ codebox into `voice_sim.js`, a JS module with `tick(in1,in2,in3)`, `get(name)`, `set(name,v)`. Only top-level Params and History are reachable.
  - To read locals, insert `globalThis.L={...}` before the final `return [out` in the generated file.
- **`rt.js`:** runtime: BUF/DATA/peek/poke/alloc.
- **`harness.js`:** loads the real `wanderer.state.js` brain in a mocked Max (Buffer, Task, Dict, Global), creates a 6 s test file, slices it, and exports `{ctx, V, run, sr}`.
  - `ctx.<fn>` calls brain functions, such as `ctx.grand(1)` for Random All or `ctx.v(key,val)`.
  - The st buffer is allocated with 14 channels.
  - The Task mock ignores delays over 10 s.
- **`qaudit2.js`:** classifies hit offsets against the grid. Env vars: QH, QE, TR, LOCK, N, SEED, VOICE.
- **`tight.js`:** Quant 0/50/100 check: swing, Start snap, attack cap, global Pitch with the switch off.
- **`common.py`:** `load_code(path)` and the `Code` class (`rep` with an anchor-count check) used to patch the gen~ code in place. `DST` is the device voice file.
- **Speed:** about 2 minutes for 5 random states × 8 s. Run audits in the background or in parallel.
- **Limit:** the sim can't detect the gen~ compiler zero-output problem. Only Live can.

---

## 8. Workspace paths used in the previous chat (may not exist in a new session)

- Device: `/mnt/user-data/outputs/Wanderer/`
- Backups:
  - `/tmp/claude-0/bak_q/` holds the pre-08f files.
  - `/tmp/claude-0/build/opt/BASE_PLAYS.maxpat` was the "safe1" engine.
- In a new session, restore from `wanderer/src/` in this project.
