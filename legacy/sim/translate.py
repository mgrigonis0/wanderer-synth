import json,re,sys
SRC=sys.argv[1] if len(sys.argv)>1 else '/mnt/user-data/outputs/Wanderer/wanderer.voice.maxpat'
OUT=sys.argv[2] if len(sys.argv)>2 else 'voice_sim.js'
p=json.load(open(SRC))
gen=[b['box'] for b in p['patcher']['boxes'] if b['box'].get('text','').startswith('gen~')][0]
code=[b['box']['code'] for b in gen['patcher']['boxes'] if b['box']['maxclass']=='codebox'][0]
lines=code.split('\n'); out=[]; funcs=[]; i=0
while i<len(lines):
    L=lines[i]
    m=re.match(r'^Param (\w+)\(([^)]*)\);',L)
    if m: out.append('var %s = %s;'%m.groups()); i+=1; continue
    m=re.match(r'^Buffer (\w+)\(',L)
    if m: out.append('var %s = BUF("%s");'%(m.group(1),m.group(1))); i+=1; continue
    m=re.match(r'^Data (\w+)\((\d+), (\d+)\);',L)
    if m: out.append('var %s = DATA(%s,%s);'%m.groups()); i+=1; continue
    if L.startswith('History '):
        for nm,val in re.findall(r'History (\w+)\(([^)]*)\);',L): out.append('var %s = %s;'%(nm,val))
        i+=1; continue
    m=re.match(r'^(\w+)\(([^)]*)\) \{$',L)
    if m and m.group(1) not in('if','for','while'):
        body=[]; i+=1; d=1
        while d>0:
            l=lines[i]; d+=l.count('{')-l.count('}'); body.append(l); i+=1
        txt='\n'.join(body); args=[a.strip() for a in m.group(2).split(',') if a.strip()]
        names=set(re.findall(r'(?<![\w.])([a-zA-Z_]\w*)\s*(?:=(?!=)|\+=|-=)',txt))-set(args)
        funcs.append('function %s(%s){\n%s\n%s'%(m.group(1),m.group(2),('var '+','.join(sorted(names))+';') if names else '',txt)); continue
    out.append(L); i+=1
idx=next(k for k,l in enumerate(out) if 'locals, declared once' in l)
body='\n'.join(out[idx:]); outs=sorted(set(re.findall(r'\b(out\d)\b',body)))
open(OUT,'w').write('\n'.join(out[:idx])+'\n'+'\n'.join(funcs)+'\nfunction tick(in1,in2,in3){\nvar '+','.join(outs)+';\n'+body+'\nreturn ['+','.join(outs)+'];\n}\nmodule.exports={tick,get:n=>eval(n),set:(n,v)=>eval(n+"=v")};\n')
