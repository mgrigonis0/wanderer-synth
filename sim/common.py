import json, re, sys
BASE='/tmp/claude-0/build/Wanderer_pre_opt/wanderer.voice.maxpat'
DST='/mnt/user-data/outputs/Wanderer/wanderer.voice.maxpat'
def load_code(path=BASE):
    d=json.load(open(path))
    gen=[b['box'] for b in d['patcher']['boxes'] if b['box'].get('text','').startswith('gen~')][0]
    cb=[b['box'] for b in gen['patcher']['boxes'] if b['box']['maxclass']=='codebox'][0]
    return d, gen, cb
class Code:
    def __init__(s, txt): s.t=txt
    def rep(s, old, new, n=1):
        c=s.t.count(old)
        if c!=n: raise SystemExit('anchor count %d != %d:\n%s'%(c,n,old[:200]))
        s.t=s.t.replace(old,new)
    def sub(s, pat, fn, n=None, flags=re.M):
        new, c = re.subn(pat, fn, s.t, flags=flags)
        if n is not None and c!=n: raise SystemExit('regex count %d != %d: %s'%(c,n,pat))
        s.t=new; return c
    def between(s, a, b):
        i=s.t.index(a); j=s.t.index(b, i); return i, j
    def wrap(s, start, end, cond, include_end=False):
        """wrap text from anchor start (inclusive) up to anchor end (exclusive) in if (cond) { }"""
        i=s.t.index(start); j=s.t.index(end, i)
        if include_end: j += len(end)
        block=s.t[i:j].rstrip('\n')
        ind='\n'.join(('\t'+l if l.strip() else l) for l in block.split('\n'))
        s.t=s.t[:i]+'if (%s) {\n%s\n}\n'%(cond, ind)+s.t[j:]
