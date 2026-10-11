require('./rt.js');
const fs=require('fs'), vm=require('vm');
const sr=44100;
alloc('pa',1024,3); alloc('pb',1024,3); alloc('st',4096,14); alloc('cf',512,1); alloc('mem',16*1024*43,1); alloc('sc',12*512,1); alloc('ix',16,1);
const W=alloc('w', sr*6, 2);
for(let i=0;i<sr*6;i++){ const t=(i%(sr/8))/sr; const v=0.8*Math.exp(-t*25)*Math.sin(2*Math.PI*(80+ (Math.floor(i/(sr/8))%7)*60)*t); W.d[i*2]=v; W.d[i*2+1]=v; }
// brain in a mocked Max
class JBuf{ constructor(n){ this.b=BUF(n.replace(/^x/,'').replace(/^w1$/,'w')); }
  framecount(){return this.b.frames;}
  peek(c,f,n){ n=n||1; const o=[]; for(let i=0;i<n;i++) o.push(peek(this.b,f+i,c-1)); return n==1?o[0]:o; }
  poke(c,f,v){ if(Array.isArray(v)) v.forEach((x,i)=>poke(this.b,x,f+i,c-1)); else poke(this.b,v,f,c-1); } }
const tasks=[]; function Task(fn){this.fn=fn;this.p=false;tasks.push(this);} Task.prototype.schedule=function(ms){this.p=!(ms>10000)}; Task.prototype.cancel=function(){this.p=false}; Task.prototype.repeat=function(){this.p=true};
const g={}; const mk=()=>({message(){},getattr:()=>[0.2,0.2,0.2,1],subpatcher:()=>({getnamed:()=>mk()})});
const ctx={Buffer:JBuf,Global:function(){return g;},Task,Dict:function(){this.parse=()=>{};this.stringify=()=>'{}';},File:function(){this.isopen=true;this.close=()=>{}},
  post:()=>{}, outlet(){}, setinletassist(){}, setoutletassist(){}, Math,JSON,String,isNaN, this_patcher:{getnamed:()=>mk()}};
let src=fs.readFileSync(process.env.BRAIN||'/mnt/user-data/outputs/Wanderer/wanderer.state.js','utf8').replace('var pat = this.patcher;','var pat = this_patcher;');
vm.createContext(ctx); vm.runInContext(src,ctx);
const run=()=>tasks.forEach(t=>{ if(t.p){t.p=false;t.fn();} });
ctx.root('x'); run();
ctx.drop('/a.wav'); ctx.sr(1,sr); ctx.loaded(1);
const on=[]; for(let k=0;k<40;k++) on.push(Math.floor(k*sr*6/40));
BUF('ix').frames=on.length; BUF('ix').d=Float64Array.from(on); BUF('ix').ch=1;
ctx.fluiddone();
const V=require(process.env.VOICE||'./voice_sim.js'); V.set('bsr',sr); V.set('inst',0);
module.exports={ctx,V,run,sr};
