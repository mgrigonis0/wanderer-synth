# Wanderer — install and first test

For Live 11 with Max 8 on a Mac (Intel or Apple Silicon).

## 1. Download

On the repository's Releases page, open **"Wanderer — latest build"** and download **wanderer-mac.zip**. Unzip it.
You get a folder `Wanderer` with:

- `wanderer~.mxo`: the engine
- `Wanderer.amxd`: the Live device
- `wanderer.page.js`, `wanderer.wave.js`, `wanderer.files.js`, `wanderer.memory.js`, `wanderer.gr.js`: the views

If you're updating, **quit Live completely first** (Live keeps a loaded engine in memory), replace the whole old
`Wanderer` folder, and load a fresh `Wanderer.amxd` from it.

## 2. Put the folder where Max can find it

1. In Finder press **Cmd+Shift+G** and go to `~/Documents/Max 8/Library` (create `Library` if it isn't there).
2. Copy the whole `Wanderer` folder into it.

## 3. Let macOS open the engine (once per download)

Open **Terminal**, paste this and press Enter (nothing is printed when it works):

```
xattr -dr com.apple.quarantine ~/Documents/Max\ 8/Library/Wanderer
```

## 4. Load it in Live

1. Drag `Wanderer.amxd` from that folder onto a MIDI track.
2. Drop an audio file on the **Drop** strip at the left, press Play in Live.

The Max window (open the device editor, then Cmd+M) shows `wanderer~ 2026-10-16b (engine) ready` and `wanderer: patch 2026-10-16b` when
the engine and the device loaded.
A red `wanderer~` box or no sound: copy the red lines from the Max window and send them.

## Saving

Everything (files, slicing, settings, locked loops, memory slots) is saved inside the Live set. If a file has moved,
its slot turns red: click it and show where the file is now. Files Live only hands over by name (dragged from the
browser) are copied once to `~/Music/Wanderer Samples`, so they are still there next time.

When a set opens, the Max window says `state: restored (saved by …), n files` (or `state: nothing saved in the set
(a new device)` for a new one). If a set comes back empty, see "Checking a set file" below.

## Checking a set file

A `.als` is gzip'd XML. In Terminal: `gunzip -c "My Set.als" | grep -A2 BlobSlot | head -40`. Wanderer's stores are
the hidden parameters `State` and `Mem 1`…`Mem 8`; an empty `<Blob />` means Live stored nothing there.
