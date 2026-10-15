// wanderer~ — Max wrapper around the Wanderer engine (one object per device: all 16 files live inside it).
//
// Argument: the device prefix (the patch writes "wanderer~ ---", Live turns --- into a per-device number).
//   Every name the object uses starts with it, so two Wanderers never share anything.
// Inlet: signal = bar phase (phasor~ 1n @lock 1); messages = every control (see Model::message), plus
//   init                     the device finished loading (live.thisdevice): pull the saved state
//   loaded <slot 0..15>      a buffer~ finished reading
//   dictionary <name>        the saved state, from the pattr
// Outlets: 0 left audio, 1 right audio, 2 info for the patch and the views:
//   files/flocks/fmutes/sel/fstate, wave/wstarts/wen/ww, tab/pb/pr/pm/pv, slots, misc, status, hit, meter,
//   cleararm, gset <name> <value>, getstate, relink, dictionary <name> (to the pattr)
#include "ext.h"
#include "ext_obex.h"
#include "ext_buffer.h"
#include "ext_dictobj.h"
#include "ext_path.h"
#include "z_dsp.h"

#include "../../engine/model.h"

#include <condition_variable>
#include <cstdio>
#include <deque>
#include <fstream>
#include <mutex>
#include <string>
#include <thread>
#include <vector>

using namespace wnd;

struct t_wanderer;

struct Job { int f; int gen; SliceJob job; std::vector<float> mono; double sr; };
struct Done { int f; int gen; SliceResult res; };

struct Worker {
    std::thread th;
    std::mutex m;
    std::condition_variable cv;
    std::deque<Job> jobs;
    std::deque<Done> done;
    bool quit = false;
};

class Glue : public Host {
public:
    t_wanderer* x;
    explicit Glue(t_wanderer* o) : x(o) {}
    void ui(const Out& o) override;
    void loadBuffer(int f, const std::string& path) override;
    void clearBuffer(int f) override;
    void analyze(int f, int gen, const SliceJob& job) override;
    void askRelink(int f) override;
    void saveState() override;
    bool fileExists(const std::string& path) override;
};

struct t_wanderer {
    t_pxobject ob;
    Player* pl;
    Model* model;
    Glue* glue;
    std::recursive_mutex* mx;
    Worker* wk;
    void* infoOut;
    void* tickClock;
    t_symbol* prefix;
    t_symbol* bufName[NF];
    t_symbol* loadName[NF];
    t_buffer_ref* bref[NF];
    t_buffer_obj* locked[NF];
    std::string* pendingPath;      // NF entries: a load waiting for the voices to fade
    double* pendingAt;
    double* loadDeadline;
    t_dictionary* stateDict;
    t_symbol* stateName;
    bool initDone, gotState, saving;
    double initAt;
    double meterAt;
};

static t_class* s_class = nullptr;

static double now_ms() { return systimer_gettime(); }

// ---------------------------------------------------------------------------------------------------
static void worker_run(t_wanderer* x) {
    Worker* w = x->wk;
    for (;;) {
        Job j;
        {
            std::unique_lock<std::mutex> lk(w->m);
            w->cv.wait(lk, [w] { return w->quit || !w->jobs.empty(); });
            if (w->quit) return;
            j = std::move(w->jobs.front());
            w->jobs.pop_front();
        }
        Analysis an;
        an.mono.swap(j.mono);
        an.sr = j.sr;
        Done d;
        d.f = j.f; d.gen = j.gen;
        d.res = runSliceJob(an, j.job);
        std::lock_guard<std::mutex> lk(w->m);
        // a newer job for the same slot makes this result stale; the model checks the generation too
        w->done.push_back(std::move(d));
    }
}

// ---------------------------------------------------------------------------------------------------
void Glue::ui(const Out& o) {
    std::vector<t_atom> a;
    a.reserve(o.nums.size() + 1);
    t_atom t;
    if (o.sel == "gset") { atom_setsym(&t, gensym(o.str.c_str())); a.push_back(t); }
    for (double v : o.nums) { atom_setfloat(&t, v); a.push_back(t); }
    if (o.sel != "gset" && !o.str.empty()) { atom_setsym(&t, gensym(o.str.c_str())); a.push_back(t); }
    outlet_anything(x->infoOut, gensym(o.sel.c_str()), (short)a.size(), a.data());
}

void Glue::loadBuffer(int f, const std::string& path) {
    // the player fades the slot's voices first (C_SILENCE); the buffer is replaced 30 ms later
    x->pendingPath[f] = path;
    x->pendingAt[f] = now_ms() + 30;
}

void Glue::clearBuffer(int f) {
    x->pendingPath[f].clear();
    x->pendingAt[f] = -1;
    x->loadDeadline[f] = -1;
    t_object* r = (t_object*)x->loadName[f]->s_thing;
    if (r) { t_atom a; atom_setlong(&a, 1); typedmess(r, gensym("sizeinsamps"), 1, &a); }
}

void Glue::analyze(int f, int gen, const SliceJob& job) {
    Job j;
    j.f = f; j.gen = gen; j.job = job;
    t_buffer_obj* b = buffer_ref_getobject(x->bref[f]);
    if (!b) return;
    const long frames = (long)buffer_getframecount(b);
    const long ch = (long)buffer_getchannelcount(b);
    j.sr = buffer_getsamplerate(b);
    if (!(j.sr > 0)) j.sr = 44100;
    float* s = buffer_locksamples(b);
    if (!s || frames <= 0 || ch <= 0) { if (s) buffer_unlocksamples(b); return; }
    j.mono.resize((size_t)frames);
    for (long i = 0; i < frames; i++) {
        double m = 0;
        for (long c = 0; c < ch; c++) m += s[i * ch + c];
        j.mono[(size_t)i] = (float)(m / ch);
    }
    buffer_unlocksamples(b);
    {
        std::lock_guard<std::mutex> lk(x->wk->m);
        for (auto it = x->wk->jobs.begin(); it != x->wk->jobs.end();)   // an older job for this slot is obsolete
            it = it->f == f ? x->wk->jobs.erase(it) : it + 1;
        x->wk->jobs.push_back(std::move(j));
    }
    x->wk->cv.notify_one();
}

void Glue::askRelink(int f) {
    t_atom a; atom_setlong(&a, f);
    outlet_anything(x->infoOut, gensym("relink"), 1, &a);
}

void Glue::saveState() {
    if (!x->stateDict) return;
    StateDoc d;
    x->model->writeState(d);
    dictionary_clear(x->stateDict);
    std::vector<t_atom> at;
    for (auto& kv : d.num) {
        at.resize(kv.second.size());
        for (size_t i = 0; i < kv.second.size(); i++) atom_setfloat(&at[i], kv.second[i]);
        if (at.empty()) { t_atom z; atom_setfloat(&z, 0); dictionary_appendatoms(x->stateDict, gensym(kv.first.c_str()), 0, &z); }
        else dictionary_appendatoms(x->stateDict, gensym(kv.first.c_str()), (long)at.size(), at.data());
    }
    for (auto& kv : d.str) dictionary_appendsym(x->stateDict, gensym(kv.first.c_str()), gensym(kv.second.c_str()));
    x->saving = true;
    t_atom a; atom_setsym(&a, x->stateName);
    outlet_anything(x->infoOut, gensym("dictionary"), 1, &a);
    x->saving = false;
}

bool Glue::fileExists(const std::string& path) {
    char native[MAX_PATH_CHARS];
    if (path_nameconform(path.c_str(), native, PATH_STYLE_NATIVE, PATH_TYPE_BOOT) != 0)
        std::snprintf(native, sizeof native, "%s", path.c_str());
    std::ifstream f(native, std::ios::binary);
    if (f.good()) return true;
    std::ifstream g(path.c_str(), std::ios::binary);
    return g.good();
}

// ---------------------------------------------------------------------------------------------------
static void wnd_tick(t_wanderer* x) {
    const double ms = now_ms();
    {
        std::lock_guard<std::recursive_mutex> g(*x->mx);
        // buffer loads waiting for the voices to fade
        for (int f = 0; f < NF; f++) {
            if (x->pendingAt[f] >= 0 && ms >= x->pendingAt[f]) {
                x->pendingAt[f] = -1;
                t_object* r = (t_object*)x->loadName[f]->s_thing;
                if (r) {
                    t_atom a; atom_setsym(&a, gensym(x->pendingPath[f].c_str()));
                    typedmess(r, gensym("replace"), 1, &a);
                    x->loadDeadline[f] = ms + 30000;
                } else x->model->bufferLoaded(f, false, 0, 0);
            }
            if (x->loadDeadline[f] >= 0 && ms >= x->loadDeadline[f]) {   // the buffer never answered
                x->loadDeadline[f] = -1;
                x->model->bufferLoaded(f, false, 0, 0);
            }
        }
        // slicing results
        std::deque<Done> done;
        {
            std::lock_guard<std::mutex> lk(x->wk->m);
            done.swap(x->wk->done);
        }
        for (Done& d : done) x->model->analysisDone(d.f, d.gen, d.res);
        // nothing came from the set within 1.5 s of loading: a new device
        if (x->initDone && !x->gotState && ms >= x->initAt + 1500) { x->gotState = true; x->model->noState(); }
        x->model->tick(ms);
    }
    if (ms >= x->meterAt) {
        x->meterAt = ms + 40;
        t_atom a[4];
        atom_setfloat(a, x->pl->grNow.load());
        atom_setfloat(a + 1, x->pl->lvlL.load());
        atom_setfloat(a + 2, x->pl->lvlR.load());
        atom_setfloat(a + 3, x->pl->tempoNow.load());
        outlet_anything(x->infoOut, gensym("meter"), 4, a);
    }
    clock_fdelay(x->tickClock, 15.);
}

// ---------------------------------------------------------------------------------------------------
static void wnd_anything(t_wanderer* x, t_symbol* s, long argc, t_atom* argv) {
    std::vector<Model::Atom> a;
    for (long i = 0; i < argc; i++) {
        Model::Atom m;
        if (atom_gettype(argv + i) == A_SYM) { m.num = false; m.s = atom_getsym(argv + i)->s_name; }
        else m.d = atom_getfloat(argv + i);
        a.push_back(m);
    }
    std::lock_guard<std::recursive_mutex> g(*x->mx);
    x->model->message(s->s_name, a);
}

static void wnd_init(t_wanderer* x) {
    if (x->initDone) return;
    x->initDone = true;
    x->initAt = now_ms();
    outlet_anything(x->infoOut, gensym("getstate"), 0, nullptr);   // the pattr answers with "dictionary <name>"
}

static void wnd_loaded(t_wanderer* x, long f) {
    if (f < 0 || f >= NF) return;
    x->loadDeadline[f] = -1;
    t_buffer_obj* b = buffer_ref_getobject(x->bref[f]);
    long frames = b ? (long)buffer_getframecount(b) : 0;
    double sr = b ? buffer_getsamplerate(b) : 0;
    std::lock_guard<std::recursive_mutex> g(*x->mx);
    x->model->bufferLoaded((int)f, frames > 0, frames, sr);
}

static void wnd_dictionary(t_wanderer* x, t_symbol* name) {
    if (x->saving || name == x->stateName) { if (!x->gotState && name == x->stateName) {} return; }
    t_dictionary* d = dictobj_findregistered_retain(name);
    if (!d) return;
    StateDoc doc;
    long n = 0;
    t_symbol** keys = nullptr;
    dictionary_getkeys(d, &n, &keys);
    for (long i = 0; i < n; i++) {
        t_symbol* k = keys[i];
        if (dictionary_entryisstring(d, k)) {
            t_symbol* v = nullptr;
            dictionary_getsym(d, k, &v);
            if (v) doc.str[k->s_name] = v->s_name;
            continue;
        }
        long ac = 0;
        t_atom* av = nullptr;
        if (dictionary_getatoms(d, k, &ac, &av) == MAX_ERR_NONE) {
            std::vector<double> v;
            if (ac == 1 && atom_gettype(av) == A_SYM) { doc.str[k->s_name] = atom_getsym(av)->s_name; continue; }
            for (long j = 0; j < ac; j++) v.push_back(atom_getfloat(av + j));
            doc.num[k->s_name] = v;
        }
    }
    if (keys) dictionary_freekeys(d, n, keys);
    dictobj_release(d);
    std::lock_guard<std::recursive_mutex> g(*x->mx);
    x->gotState = true;
    x->model->readState(doc);
}

static void wnd_int(t_wanderer* x, long v) { (void)x; (void)v; }      // pattr sends a bare 0 when nothing was saved
static void wnd_float(t_wanderer* x, double v) { (void)x; (void)v; }

// ---------------------------------------------------------------------------------------------------
static void wnd_perform64(t_wanderer* x, t_object*, double** ins, long numins, double** outs, long numouts, long n, long, void*) {
    if (numouts < 2) return;
    static thread_local std::vector<float> ph, L, R;
    if ((long)ph.size() < n) { ph.resize((size_t)n); L.resize((size_t)n); R.resize((size_t)n); }
    for (long i = 0; i < n; i++) ph[(size_t)i] = numins > 0 ? (float)ins[0][i] : 0.f;
    for (int f = 0; f < NF; f++) {
        x->locked[f] = nullptr;
        x->pl->src[f] = Source();
        t_buffer_obj* b = buffer_ref_getobject(x->bref[f]);
        if (!b) continue;
        float* s = buffer_locksamples(b);
        if (!s) continue;
        x->locked[f] = b;
        x->pl->src[f].data = s;
        x->pl->src[f].frames = (long)buffer_getframecount(b);
        x->pl->src[f].chans = (int)buffer_getchannelcount(b);
        x->pl->src[f].sr = buffer_getsamplerate(b);
        if (x->pl->src[f].chans < 1 || x->pl->src[f].frames < 2) x->pl->src[f].data = nullptr;
    }
    x->pl->process(ph.data(), L.data(), R.data(), (int)n, sys_getsr());
    for (int f = 0; f < NF; f++) if (x->locked[f]) buffer_unlocksamples(x->locked[f]);
    for (long i = 0; i < n; i++) { outs[0][i] = L[(size_t)i]; outs[1][i] = R[(size_t)i]; }
}

static void wnd_dsp64(t_wanderer* x, t_object* dsp64, short*, double, long, long) {
    object_method(dsp64, gensym("dsp_add64"), x, wnd_perform64, 0, NULL);
}

static t_max_err wnd_notify(t_wanderer* x, t_symbol* s, t_symbol* msg, void* sender, void* data) {
    for (int f = 0; f < NF; f++) buffer_ref_notify(x->bref[f], s, msg, sender, data);
    return MAX_ERR_NONE;
}

static void wnd_assist(t_wanderer*, void*, long m, long a, char* s) {
    if (m == ASSIST_INLET) std::snprintf(s, 256, "(signal) bar phase, control messages");
    else {
        const char* t[3] = {"(signal) Left", "(signal) Right", "Info for the views and the patch"};
        std::snprintf(s, 256, "%s", t[a < 0 ? 0 : (a > 2 ? 2 : a)]);
    }
}

static void* wnd_new(t_symbol*, long argc, t_atom* argv) {
    t_wanderer* x = (t_wanderer*)object_alloc(s_class);
    if (!x) return nullptr;
    dsp_setup((t_pxobject*)x, 1);
    x->infoOut = outlet_new((t_object*)x, NULL);
    outlet_new((t_object*)x, "signal");
    outlet_new((t_object*)x, "signal");
    x->ob.z_misc |= Z_NO_INPLACE;

    x->prefix = argc > 0 && atom_gettype(argv) == A_SYM ? atom_getsym(argv) : gensym("wnd");
    if (argc > 0 && atom_gettype(argv) != A_SYM) {   // Live turned "---" into a number
        char b[64]; std::snprintf(b, sizeof b, "%ld", (long)atom_getlong(argv)); x->prefix = gensym(b);
    }
    for (int f = 0; f < NF; f++) {
        char b[256];
        std::snprintf(b, sizeof b, "%sw%d", x->prefix->s_name, f + 1);
        x->bufName[f] = gensym(b);
        std::snprintf(b, sizeof b, "%sld%d", x->prefix->s_name, f + 1);
        x->loadName[f] = gensym(b);
        x->bref[f] = buffer_ref_new((t_object*)x, x->bufName[f]);
        x->locked[f] = nullptr;
    }
    x->pendingPath = new std::string[NF];
    x->pendingAt = new double[NF];
    x->loadDeadline = new double[NF];
    for (int f = 0; f < NF; f++) { x->pendingAt[f] = -1; x->loadDeadline[f] = -1; }
    x->mx = new std::recursive_mutex();
    x->pl = new Player();
    x->glue = new Glue(x);
    x->model = new Model(x->pl, x->glue);
    x->wk = new Worker();
    x->wk->th = std::thread(worker_run, x);
    x->initDone = false; x->gotState = false; x->saving = false;
    x->initAt = 0; x->meterAt = 0;
    char dn[256];
    std::snprintf(dn, sizeof dn, "%sstate", x->prefix->s_name);
    x->stateName = gensym(dn);
    x->stateDict = dictionary_new();
    x->stateDict = dictobj_register(x->stateDict, &x->stateName);
    x->tickClock = clock_new(x, (method)wnd_tick);
    clock_fdelay(x->tickClock, 50.);
    post("wanderer~ 2026-10-15a (engine) ready, device %s", x->prefix->s_name);
    return x;
}

static void wnd_free(t_wanderer* x) {
    dsp_free((t_pxobject*)x);
    clock_unset(x->tickClock);
    object_free(x->tickClock);
    {
        std::lock_guard<std::mutex> lk(x->wk->m);
        x->wk->quit = true;
    }
    x->wk->cv.notify_one();
    if (x->wk->th.joinable()) x->wk->th.join();
    delete x->wk;
    for (int f = 0; f < NF; f++) object_free(x->bref[f]);
    if (x->stateDict) dictobj_unregister(x->stateDict);
    {
        // anything still queued between the threads
        Report r;
        while (x->pl->reps.pop(r)) {
            if (r.type == R_GARBAGE_SLICES) delete (SliceTable*)r.ptr;
            else if (r.type == R_GARBAGE_PATTERN) delete (Pattern*)r.ptr;
            else if (r.type == R_GARBAGE_PARAMS) delete (ParamSet*)r.ptr;
        }
        Cmd c;
        while (x->pl->cmds.pop(c)) {
            if (c.type == C_SLICES) delete (SliceTable*)c.ptr;
            else if (c.type == C_PATTERN) delete (Pattern*)c.ptr;
            else if (c.type == C_PARAMS) delete (ParamSet*)c.ptr;
        }
        for (int f = 0; f < NF; f++) {
            delete x->pl->fp[f].st;
            delete x->pl->fp[f].pat;
            delete x->pl->fp[f].pending;
        }
    }
    delete x->model;
    delete x->glue;
    delete x->pl;
    delete x->mx;
    delete[] x->pendingPath;
    delete[] x->pendingAt;
    delete[] x->loadDeadline;
}

void ext_main(void*) {
    t_class* c = class_new("wanderer~", (method)wnd_new, (method)wnd_free, (long)sizeof(t_wanderer), 0L, A_GIMME, 0);
    class_addmethod(c, (method)wnd_dsp64, "dsp64", A_CANT, 0);
    class_addmethod(c, (method)wnd_assist, "assist", A_CANT, 0);
    class_addmethod(c, (method)wnd_notify, "notify", A_CANT, 0);
    class_addmethod(c, (method)wnd_init, "init", 0);
    class_addmethod(c, (method)wnd_loaded, "loaded", A_LONG, 0);
    class_addmethod(c, (method)wnd_dictionary, "dictionary", A_SYM, 0);
    class_addmethod(c, (method)wnd_int, "int", A_LONG, 0);
    class_addmethod(c, (method)wnd_float, "float", A_FLOAT, 0);
    class_addmethod(c, (method)wnd_anything, "anything", A_GIMME, 0);
    class_dspinit(c);
    class_register(CLASS_BOX, c);
    s_class = c;
}
