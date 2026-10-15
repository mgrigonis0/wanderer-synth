// wanderer.drop.js — turns what the Drop strip hands over into a full path (js, Max 8 / ES5).
// Live sometimes gives only a file name (e.g. "TEMP-655_..._Loop.aif") that Max's File object can find from the
// device's own context; the engine needs the full path. in: "drop <name or path>"  out: "drop <full path>"
// The console line tells where the file lives (and so whether it survives reopening the set).

inlets = 1;
outlets = 1;

function drop() {
    var a = arrayfromargs(arguments);
    var name = a.join(" ");
    if (!name || name === "none" || name === "bang") return;
    var f = new File(name, "read");
    if (f.isopen) {
        // a file Max finds only by name (Live's TEMP-… copies) has no folder: buffer~ finds it by name the same way
        var full = f.foldername ? f.foldername + "/" + f.filename : f.filename;
        f.close();
        post("wanderer: dropped " + full + (f.foldername ? "" : "  (found by name only)") + "\n");
        outlet(0, "drop", full);
    } else {
        f.close();
        post("wanderer: can't open the dropped file: " + name + "\n");
        outlet(0, "drop", name);   // the engine tries once more and reports
    }
}

function anything() { }
