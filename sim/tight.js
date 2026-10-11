const H=require('./harness.js'); const c=H.ctx, V=H.V;
// brain side: cuts and attacks
const st=BUF('st'); const fl=[]; for(let i=0;i<40;i++){ const row=[]; for(let ch=0;ch<14;ch++) row.push(peek(st,i,ch)); fl.push(row); }
const ns=peek(BUF('cf'),2,0);
console.log('slices',ns,'starts',fl.slice(0,8).map(r=>r[0]).join(' '));
console.log('true note starts every 5512.5; slice 1 attacks:',fl[1].slice(6).join(' '),' slice 1 =',fl[1][0],'..',fl[1][1]);
let s=4242; Math.random=()=>{ s=(s*16807)%2147483647; return (s-1)/2147483646; };
const wn=0.5/H.sr;
for(const Q of [0,50,100]){
  c.grand(1); H.run(); V.set('gquant',Q); V.set('gqhit',2); V.set('gqext',1); V.set('gtrip',0); V.set('gptch',0); V.set('gpitch',7);
  let dbg=0, pos=0, n=0, swung=0, snapped=0, onAtk=0, atkMax=0, semisBad=0, startIn=0;
  for(let i=0;i<H.sr*6;i++){ V.tick(pos,0,1);
    if(L.startv && pos>0.25){ n++;
      if(L.hit!=3){ const k=Math.round(pos/0.0625); if(Math.abs(pos-k*0.0625)>wn*2) swung++; }
      if(L.semis!==7) semisBad++;
      atkMax=Math.max(atkMax,L.nat/H.sr*1000);
      const cands=[0,6,7,8,9,10,11,12,13].map(ch=>peek(st,L.hslice,ch)); if(cands.some(x=>Math.abs(x-L.ra0)<1)) onAtk++;
      if(L.hvStart>0.02) startIn++; if(Q==100&&!cands.some(x=>Math.abs(x-L.ra0)<1)&&dbg++<4) console.log('miss',L.ra0,L.s0,L.s1,L.sab,L.sad,cands.join(' '));
    }
    pos+=wn; }
  console.log(`Quant ${Q}: hits ${n}, main hits off the straight grid ${swung}, start inside slice ${startIn}, starts on an attack ${onAtk}, longest attack ${atkMax.toFixed(1)} ms, semis != global 7 with Pitch off: ${semisBad}`);
}
