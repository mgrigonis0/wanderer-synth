# Wanderer

A Max for Live instrument (Max 8.6.4, Ableton Live). Drop in up to 16 audio files. Each file is sliced with FluCoMa, and its slices play from a stochastic clock of its own, with Lock/Mutate, memory slots with Slide, global Quant, and output compression and limiting.

## Contents

- `device/`: the device files, which must all sit in the same folder or in Max's search path.
  - `wanderer.maxpat`: the main device.
  - `wanderer.voice.maxpat`: the poly~ voice, containing the gen~ engine.
  - `wanderer.conductor.maxpat`, `wanderer.comp.maxpat`, `wanderer.limiter.maxpat`, `wanderer.panel.maxpat`: the abstractions.
  - `wanderer.state.js`: the brain. `wanderer.wave.js` and `wanderer.slots.js` are the jsui displays.
- `docs/HANDOFF.md`: the full development state, the design decisions, the gen~ rules and the open proposal.
- `sim/`: Node simulation tools. `translate.py` converts the gen~ code to JS, and `harness.js` loads the brain in a mocked Max.

## Requirements

- Max 8.6.4 / Live with Max for Live.
- The FluCoMa package (`fluid.bufampslice~`, `fluid.bufonsetslice~`, `fluid.bufnoveltyslice~`, `fluid.bufampgate~`).

Current versions: voice engine 2026-10-08f, brain 2026-10-08f.
