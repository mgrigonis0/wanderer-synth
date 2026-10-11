const H=require('./harness.js'); const c=H.ctx, V=H.V;
const QH=+(process.env.QH||2), QE=+(process.env.QE||1), TR=+(process.env.TR||0), SEEDS=+(process.env.N||6), LOCK=+(process.env.LOCK||0);
let s=+(process.env.SEED||12345); Math.random=()=>{ s=(s*16807)%2147483647; return (s-1)/2147483646; };
const G=[0.25,0.125,0.0625,0.03125][QH], E=[0.0625,0.03125,0.015625][QE];
const wn=0.5/H.sr, ms=t=>t*2000; // 120 bpm: 1 whole note = 2 s
const hist={}; const add=(k)=>hist[k]=(hist[k]||0)+1; let rev=0,n=0,startIn=0,atk=[];
for(let seed=0;seed<SEEDS;seed++){
  c.grand(1); H.run();
  V.set('gquant',100); V.set('gqhit',QH); V.set('gqext',QE); V.set('gtrip',TR);
  let pos=0;
  for(let i=0;i<H.sr*8;i++){
    if(LOCK&&i==H.sr*4){ V.set('glock',1); }
    V.tick(pos,0,1);
    if(L.startv){ const t=pos, isRep=L.hit==3, g=isRep?E:G;
      const k=Math.round(t/g), d=ms(t-k*g); const odd16=Math.abs(k*g*16-Math.round(k*g*16))<1e-6 && Math.round(k*g*16)%2==1;
      let cat=Math.abs(d)<0.05?'on line':(odd16&&d>0?'swung odd 16th':'OFF');
      if(cat==='OFF'&&TR){const g3=g*2/3,k3=Math.round(t/g3); if(Math.abs(ms(t-k3*g3))<0.05) cat='triplet line';}
      add((isRep?'extra ':'main ')+cat+(cat==='OFF'?' '+d.toFixed(1)+'ms':'')); 
      if(!isRep){n++; if(L.ndr<0)rev++; if(L.hvStart>0.02)startIn++; atk.push(L.nat/H.sr*1000);}
    }
    pos+=wn;
  }
}
atk.sort((a,b)=>a-b);
console.log(`Hits 1/${1/G} Extra 1/${1/E} Trip ${TR} Lock ${LOCK}`, JSON.stringify(hist));
console.log(`main hits ${n}: reversed ${rev}, start inside slice ${startIn}, attack median ${atk[atk.length>>1].toFixed(1)}ms p90 ${atk[Math.floor(atk.length*0.9)].toFixed(1)}ms`);
