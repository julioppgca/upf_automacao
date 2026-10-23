import os,sys,re,pathlib,csv
ROOT=pathlib.Path(__file__).resolve().parent
local=ROOT.parents[1]/'work'/'libs'
if local.exists(): sys.path.insert(0,str(local))
os.environ.setdefault('MPLCONFIGDIR',str(ROOT.parents[1]/'work'/'mpl'))
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
plt.rcParams.update({'font.size':10,'axes.spines.top':False,'axes.spines.right':False,'figure.dpi':160})
IMG=ROOT/'images'; IMG.mkdir(exist_ok=True)
BLUE='#1f5c99'; ORANGE='#cf6a18'; GREEN='#26805c'
def save(name):
    plt.tight_layout(); plt.savefig(IMG/name,dpi=190,bbox_inches='tight'); plt.close()
def axeslabels(axs):
    for ax in np.ravel(axs): ax.grid(alpha=.22)
    np.ravel(axs)[-1].set_xlabel('Tempo (s)')
def trajectory(ts=1.,ki=0.,kd=0.,tf=.5,end=80.,wind=False,aw=False):
    # y[k] sampled first; I[k] incorporates e[k] for interval ending at k.
    tt=np.arange(0,end+ts*.1,ts); y=20.; integ=0.; deriv=0.; yp=20.; rows=[]; ap=np.exp(-ts/10)
    for k,t in enumerate(tt):
        sp=80. if wind and t<40 else 40.; e=sp-y; p=2*e
        if k:
            deriv=tf/(tf+ts)*deriv-kd/(tf+ts)*(y-yp)
            ic=integ+ki*ts*e; vc=p+ic+deriv
            if not aw or not ((vc>100 and e>0) or (vc<0 and e<0)): integ=ic
        v=p+integ+deriv; u=float(np.clip(v,0,100)); rows.append([t,sp,y,e,p,integ,deriv,v,u]); yp=y
        y=20+ap*(y-20)+.5*(1-ap)*u
    return np.array(rows)
# P continuous analytical and sampled.
t=np.linspace(0,60,1201); yc=30-10*np.exp(-t/5); ec=40-yc
rp=trajectory(); pi=trajectory(ki=.2); pid=trajectory(ki=.2,kd=2.)
fig,axs=plt.subplots(3,1,figsize=(8.1,6.4),sharex=True)
axs[0].plot(t,yc,color=BLUE,label='PV contínua'); axs[0].axhline(40,color='black',ls='--',label='SP = 40 °C'); axs[0].plot(rp[::5,0],rp[::5,2],'o',ms=3,label='P discreto, Ts = 1 s'); axs[0].set_ylabel('Temperatura (°C)'); axs[0].legend(fontsize=8)
axs[1].plot(t,ec,color=ORANGE); axs[1].axhline(10,color='gray',ls=':'); axs[1].set_ylabel('Erro (°C)')
axs[2].plot(t,2*ec,color=BLUE); axs[2].step(rp[:,0],rp[:,8],where='post',alpha=.65,label='Saída discreta'); axs[2].set_ylabel('Potência (%)'); axs[2].legend(fontsize=8); axs[2].set_xlim(0,60)
axeslabels(axs); save('p-resposta.png')
fig,ax=plt.subplots(figsize=(8,3.4))
for kp in [.5,2,10]:
    final=(20+20*kp)/(1+.5*kp); yy=final+(20-final)*np.exp(-(1+.5*kp)*t/10)
    ax.plot(t,yy,label=f'Kp = {kp:g}; final = {final:.2f} °C')
ax.axhline(40,color='black',ls='--',label='SP'); ax.set_ylabel('Temperatura (°C)'); ax.set_xlabel('Tempo (s)'); ax.legend(fontsize=8); ax.grid(alpha=.25); save('p-ganhos.png')
# Rectangle area comparisons, left endpoint; include exact line.
fig,axs=plt.subplots(1,2,figsize=(8.4,3.1),sharey=True)
for ax,ts in zip(axs,[1.,.25]):
    xx=np.arange(0,2,ts); ax.bar(xx,4+2*xx,width=ts,align='edge',alpha=.25,edgecolor=BLUE,color=BLUE)
    xxline=np.linspace(0,2,100); ax.plot(xxline,4+2*xxline,color=ORANGE,label='e(t) = 4 + 2t')
    ax.set_title(f'Ts = {ts:g} s; área ≈ {sum((4+2*xx)*ts):g} °C·s'); ax.set_xlabel('Tempo (s)'); ax.set_xlim(0,2); ax.set_ylim(0,9); ax.grid(alpha=.2)
axs[0].set_ylabel('Erro (°C)'); axs[0].legend(fontsize=8); save('integral-retangulos.png')
fig,axs=plt.subplots(2,1,figsize=(8,4.6),sharex=True)
xx=np.array([0,1,2,3,4]); ee=np.array([4,4,0,-2,-2]); axs[0].step(xx,ee,where='post',color=BLUE); axs[0].axhline(0,color='gray',lw=.6); axs[0].set_ylabel('Erro (°C)')
fine=np.linspace(0,4,401); area=np.where(fine<2,4*fine,np.where(fine<3,8,8-2*(fine-3)))
axs[1].plot(fine,area,color=GREEN); axs[1].set_ylabel('Área acumulada (°C·s)'); axeslabels(axs); save('integral-memoria.png')
# PI continuous solution matched to plant, sampled trajectory identical table algorithm.
ycont=40-20*np.exp(-t/10); pcont=40*np.exp(-t/10); icont=40-pcont
fig,axs=plt.subplots(3,1,figsize=(8.1,6.7),sharex=True)
axs[0].plot(t,yc,ls=':',color=ORANGE,label='P contínuo'); axs[0].plot(t,ycont,color=BLUE,label='PI contínuo'); axs[0].plot(pi[::5,0],pi[::5,2],'o',ms=3,color=GREEN,label='PI discreto, Ts = 1 s'); axs[0].axhline(40,color='black',ls='--',label='SP'); axs[0].set_ylabel('Temperatura (°C)'); axs[0].legend(fontsize=8,ncol=2)
axs[1].plot(t,40-ycont,color=ORANGE); axs[1].set_ylabel('Erro PI (°C)')
axs[2].plot(t,pcont,label='P',color=ORANGE); axs[2].plot(t,icont,label='I',color=GREEN); axs[2].plot(t,pcont+icont,label='u = P + I',color=BLUE); axs[2].set_ylabel('Parcelas (%)'); axs[2].legend(fontsize=8); axs[2].set_xlim(0,60); axeslabels(axs); save('pi-resposta.png')
# startup even without saturation
fig,axs=plt.subplots(3,1,figsize=(8.1,6.7),sharex=True)
for aw,label,color in [(False,'Sem anti-windup',ORANGE),(True,'Com anti-windup',BLUE)]:
    rr=trajectory(ts=.1,ki=.4,end=120,wind=True,aw=aw)
    axs[0].plot(rr[:,0],rr[:,2],label=label,color=color); axs[1].plot(rr[:,0],rr[:,5],color=color); axs[2].plot(rr[:,0],rr[:,8],color=color)
axs[0].plot(rr[:,0],rr[:,1],'k--',label='SP'); axs[0].legend(fontsize=8); axs[0].set_ylabel('Temperatura (°C)'); axs[1].set_ylabel('Integral (%)'); axs[2].set_ylabel('Saída aplicada (%)'); axeslabels(axs); save('pi-windup.png')
fig,axs=plt.subplots(2,1,figsize=(8.1,4.8),sharex=True)
for ts in [.1,1.,5.]:
    rr=trajectory(ts=ts,ki=.2); axs[0].plot(rr[:,0],rr[:,2],label=f'Ts = {ts:g} s'); axs[1].step(rr[:,0],rr[:,8],where='post')
axs[0].axhline(40,color='black',ls='--'); axs[0].legend(); axs[0].set_ylabel('Temperatura (°C)'); axs[1].set_ylabel('Potência (%)'); axeslabels(axs); save('pi-amostragem.png')
# filtered PID as practical extension, same controller law, small time step approximates continuous.
finepid=trajectory(ts=.01,ki=.2,kd=2,end=80)
fig,axs=plt.subplots(3,1,figsize=(8.1,6.7),sharex=True)
axs[0].plot(t,ycont,label='PI contínuo',color=ORANGE); axs[0].plot(finepid[:,0],finepid[:,2],label='PID filtrado, passo 0,01 s',color=BLUE); axs[0].plot(pid[::5,0],pid[::5,2],'o',ms=3,label='PID discreto, Ts = 1 s',color=GREEN); axs[0].axhline(40,color='black',ls='--'); axs[0].set_ylabel('Temperatura (°C)'); axs[0].legend(fontsize=8)
axs[1].plot(finepid[:,0],finepid[:,3],color=ORANGE); axs[1].set_ylabel('Erro PID (°C)')
for col,label in [(4,'P'),(5,'I'),(6,'D'),(8,'u')]: axs[2].plot(finepid[:,0],finepid[:,col],label=label)
axs[2].set_ylabel('Parcelas (%)'); axs[2].legend(fontsize=8,ncol=4); axeslabels(axs); save('pid-resposta.png')
# Derivative noise with precisely reproducible sinusoid.
nt=np.arange(0,3,.002); noise=.1*np.sin(2*np.pi*4*nt); measured=30+noise; dn=-.1*2*np.pi*4*np.cos(2*np.pi*4*nt)
df=np.zeros_like(nt); tf=.2; dt=.002
for k in range(1,len(nt)): df[k]=tf/(tf+dt)*df[k-1]-(measured[k]-measured[k-1])/(tf+dt)
fig,axs=plt.subplots(3,1,figsize=(8.1,6),sharex=True)
axs[0].plot(nt,measured,color=BLUE); axs[0].set_ylabel('PV (°C)'); axs[0].set_ylim(29.85,30.15)
axs[1].plot(nt,2*noise,color=ORANGE); axs[1].set_ylabel('Ruído em P (%)')
axs[2].plot(nt,dn,label='D ideal, Kd = 1',color=ORANGE); axs[2].plot(nt,df,label='D filtrado, Tf = 0,2 s',color=BLUE); axs[2].set_ylabel('Ruído em D (%)'); axs[2].legend(fontsize=8); axeslabels(axs); save('d-ruido.png')
# Physical picture of the heater: energy in, energy stored, energy lost.
from matplotlib.patches import FancyArrowPatch,FancyBboxPatch
fig,ax=plt.subplots(figsize=(8.2,3.3)); ax.set_xlim(0,10); ax.set_ylim(0,4.2); ax.axis('off')
ax.add_patch(FancyBboxPatch((3.35,1.0),3.3,2.0,boxstyle='round,pad=0.05',fc='#fde7d4',ec=ORANGE,lw=1.6))
ax.text(5,2.35,'bloco aquecido',ha='center',fontsize=11,weight='bold'); ax.text(5,1.85,'temperatura y (°C)',ha='center',fontsize=10)
ax.text(5,1.35,'capacidade térmica C = 50 J/°C',ha='center',fontsize=8.5,color='#444')
ax.add_patch(FancyArrowPatch((0.2,2.0),(3.3,2.0),arrowstyle='-|>',mutation_scale=22,lw=2.4,color=BLUE))
ax.text(1.75,2.25,'potência entregue',ha='center',fontsize=10,color=BLUE); ax.text(1.75,1.6,'q_in = 2,5·u  (W)',ha='center',fontsize=10,color=BLUE)
ax.text(1.75,1.2,'(u = 0…100 %, máx. 250 W)',ha='center',fontsize=8.5,color='#555')
ax.add_patch(FancyArrowPatch((6.7,2.0),(9.8,2.0),arrowstyle='-|>',mutation_scale=22,lw=2.4,color=GREEN))
ax.text(8.25,2.25,'perda para o ambiente',ha='center',fontsize=10,color=GREEN); ax.text(8.25,1.6,'q_out = (y − 20)/R  (W)',ha='center',fontsize=10,color=GREEN)
ax.text(8.25,1.2,'(R = 0,2 °C/W, ar a 20 °C)',ha='center',fontsize=8.5,color='#555')
ax.text(5,3.55,'variação da energia guardada = C·dy/dt = q_in − q_out',ha='center',fontsize=11,weight='bold')
ax.text(5,0.45,'mais potência → y sobe;   y mais alto → perde mais calor;   equilíbrio quando q_in = q_out',ha='center',fontsize=9.5,color='#333')
plt.savefig(IMG/'aquecedor-balanco.png',dpi=190,bbox_inches='tight'); plt.close()
# Open-loop step responses with the time constant marked.
fig,ax=plt.subplots(figsize=(8,3.6))
for uu,col in [(40,BLUE),(100,ORANGE)]:
    yeq=20+.5*uu; ax.plot(t,yeq+(20-yeq)*np.exp(-t/10),color=col,label=f'u = {uu}% constante → equilíbrio {yeq:g} °C'); ax.axhline(yeq,color=col,ls=':',lw=1)
y63=20+20*(1-np.exp(-1)); ax.plot([10,10],[20,y63],color='gray',ls='--',lw=1); ax.plot([0,10],[y63,y63],color='gray',ls='--',lw=1); ax.plot(10,y63,'o',color=BLUE)
ax.annotate('t = τ = 10 s: 63,2% do caminho\n(20 → 32,64 °C)',(10,y63),(15,25),fontsize=8.5,arrowprops=dict(arrowstyle='->',color='gray'))
ax.plot(50,20+20*(1-np.exp(-5)),'s',color=BLUE); ax.annotate('t = 5τ = 50 s: 99,3%',(50,39.87),(38,31),fontsize=8.5,arrowprops=dict(arrowstyle='->',color='gray'))
ax.set_xlim(0,60); ax.set_ylabel('Temperatura (°C)'); ax.set_xlabel('Tempo (s)'); ax.legend(fontsize=8,loc='lower right'); ax.grid(alpha=.25); save('planta-degrau.png')
# Discrete PI: the rectangles that build the integral (right-endpoint rule used by the controller).
fig,axs=plt.subplots(2,1,figsize=(8.1,5.2),sharex=True)
kk=np.arange(1,21); ek=pi[kk,3]
axs[0].bar(kk-1,ek,width=1,align='edge',color=GREEN,alpha=.25,edgecolor=GREEN,label='retângulo k: altura e[k], largura Ts = 1 s')
axs[0].plot(t,40-ycont,color=ORANGE,lw=1.2,label='erro do PI contínuo (referência)'); axs[0].plot(kk,ek,'o',ms=3.5,color=GREEN,label='amostra e[k] (canto direito)')
for k in range(1,7):
    axs[0].text(k-.5,ek[k-1]/2,f'ΔA[{k}] = {ek[k-1]:.2f}'.replace('.',','),rotation=90,ha='center',va='center',fontsize=7.5,color='#1b5e44')
axs[0].set_ylabel('Erro (°C)'); axs[0].legend(fontsize=7.5); axs[0].set_ylim(0,24)
area=np.concatenate([[0],np.cumsum(ek)]); axs[1].step(np.arange(0,21),area,where='post',color=GREEN,label='A[k] = soma dos retângulos até k')
axs[1].set_ylabel('Área A[k] (°C·s)'); axs[1].legend(fontsize=8,loc='lower right'); axs[1].set_xlim(0,20); axs[1].set_xticks(range(0,21,2))
ax2=axs[1].twinx(); lo,hi=axs[1].get_ylim(); ax2.set_ylim(lo*.2,hi*.2); ax2.set_ylabel('I[k] = Ki·A[k] (%)'); ax2.spines['right'].set_visible(True)
axeslabels(axs); save('pi-retangulos.png')
# Export all tabulated time histories.
for name,data in [('p-discreto',rp),('pi-discreto',pi),('pid-discreto',pid),('windup-sem',trajectory(ts=1,ki=.4,end=120,wind=True))]:
    with (ROOT/(name+'.csv')).open('w',newline='',encoding='utf-8-sig') as f:
        w=csv.writer(f); w.writerow(['t_s','SP_C','PV_C','erro_C','P_pct','I_pct','D_pct','v_pct','u_pct']); w.writerows(data)
# Tables are generated from the same equations and trajectories as the figures.
def fmt(x):
    return f'{float(x):.3f}'.replace('.',',')
def table(headers,rows):
    return '\n'.join(['| '+' | '.join(headers)+' |','| '+' | '.join(['---']*len(headers))+' |']+['| '+' | '.join(map(str,row))+' |' for row in rows])
blocks={}
SP='40,000'
# Open loop: constant 40 % power, no controller.
rows=[]
for ti in [0,5,10,20,30,50]:
    yy=40-20*np.exp(-ti/10); rows.append([str(ti),'40',SP,fmt(yy),fmt(40-yy),f'{100*(yy-20)/20:.1f}'.replace('.',',')+' %'])
blocks['MALHA_ABERTA']=table(['t (s)','u (%)','SP (°C)','PV (°C)','Falta para o SP (°C)','Caminho percorrido 20 → 40'],rows)
rows=[]
for ti in [0,1,5,10,20,40,60]:
    yy=30-10*np.exp(-ti/5); ee=40-yy; rows.append([str(ti),SP,fmt(yy),fmt(ee),fmt(2*ee)])
rows.append(['limite',SP,fmt(30),fmt(10),fmt(20)])
blocks['P_CONT']=table(['t (s)','SP (°C)','PV (°C)','Erro = SP − PV (°C)','P = u (%)'],rows)
blocks['P_DISC']=table(['k = t (s)','SP (°C)','PV (°C)','Erro (°C)','u mantida (%)'],[[str(k),SP]+[fmt(rp[k,j]) for j in [2,3,8]] for k in [0,1,2,5,10,20,40,60]])
a=np.exp(-.1); b=.5*(1-a)
blocks['P_PASSO']=table(['k','y[k] (°C)','e[k] = 40 − y[k]','u[k] = 2·e[k] (%)','a·(y[k] − 20)','0,04758·u[k]','y[k+1] = 20 + col.5 + col.6'],
    [[str(k),fmt(rp[k,2]),fmt(rp[k,3]),fmt(rp[k,8]),fmt(a*(rp[k,2]-20)),fmt(b*rp[k,8]),fmt(20+a*(rp[k,2]-20)+b*rp[k,8])] for k in range(5)])
rows=[]
for ti in [0,1,5,10,20,40,60]:
    ee=20*np.exp(-ti/10); pp=2*ee; ii=40-pp; rows.append([str(ti),SP,fmt(40-ee),fmt(ee),fmt(pp),fmt(ii),fmt(pp+ii)])
rows.append(['limite',SP,'40,000','0,000','0,000','40,000','40,000'])
blocks['PI_CONT']=table(['t (s)','SP (°C)','PV (°C)','Erro (°C)','P (%)','I (%)','u (%)'],rows)
area_pi=np.concatenate([[0],np.cumsum(pi[1:,3]*1.)])   # A[k], Ts = 1 s, A[0] = 0
blocks['PI_PASSO']=table(['k','y[k] (°C)','e[k] (°C)','ΔA[k] = e[k]·Ts (°C·s)','A[k] = A[k−1] + ΔA[k]','I[k] = 0,2·A[k] (%)','P[k] = 2·e[k] (%)','u[k] = P + I (%)'],
    [[str(k),fmt(pi[k,2]),fmt(pi[k,3]),'— (k = 0)' if k==0 else fmt(pi[k,3]),fmt(area_pi[k]),fmt(pi[k,5]),fmt(pi[k,4]),fmt(pi[k,8])] for k in range(6)])
blocks['PI_DISC']=table(['k = t (s)','SP (°C)','PV (°C)','Erro (°C)','ΔA (°C·s)','A (°C·s)','P (%)','I (%)','u (%)'],[[str(k),SP,fmt(pi[k,2]),fmt(pi[k,3]),'0,000' if k==0 else fmt(pi[k,3]),fmt(area_pi[k]),fmt(pi[k,4]),fmt(pi[k,5]),fmt(pi[k,8])] for k in [0,1,2,5,10,20,40,60]])
wr=trajectory(ts=1,ki=.4,end=120,wind=True)
blocks['WIND']=table(['t (s)','SP (°C)','PV (°C)','Erro (°C)','P (%)','I (%)','v calculado (%)','u aplicado (%)'],[[str(k),fmt(wr[k,1])]+[fmt(wr[k,j]) for j in [2,3,4,5,7,8]] for k in [0,10,20,39,40,45,60,80]])
blocks['PID_DISC']=table(['t (s)','SP (°C)','PV (°C)','Erro (°C)','P (%)','I (%)','D (%)','u (%)'],[[str(k),SP]+[fmt(pid[k,j]) for j in [2,3,4,5,6,8]] for k in [0,1,2,5,10,20,40,60]])
blocks['PID_PASSO']=table(['k','y[k] (°C)','Δy = y[k] − y[k−1]','(1/3)·D[k−1]','−(4/3)·Δy','D[k] = col.4 + col.5 (%)'],
    [[str(k),fmt(pid[k,2]),fmt(pid[k,2]-pid[k-1,2]),fmt(pid[k-1,6]/3),fmt(-4/3*(pid[k,2]-pid[k-1,2])),fmt(pid[k,6])] for k in range(1,5)])
mdfile=ROOT/'controle-pid.md'; md=mdfile.read_text(encoding='utf-8-sig')
for name,block in blocks.items():
    enclosed=f'<!--BEGIN {name}-->\n\n{block}\n\n<!--END {name}-->'
    md=md.replace('@@'+name+'@@',enclosed)
    md=re.sub(r'<!--BEGIN '+name+r'-->.*?<!--END '+name+r'-->',lambda m:enclosed,md,flags=re.S)
mdfile.write_text(md,encoding='utf-8')
# Consistency checks meaningful for the worked examples.
assert abs(rp[1,2]-21.90325163928)<1e-8
assert abs(pi[1,5]-3.61934967214)<1e-8
assert wr[40,3]<0 and wr[40,7]>100 and wr[40,8]==100
assert abs(pi[-1,2]-40)<.1
assert abs(pid[-1,2]-40)<.1
# Render equations once, keeping editable LaTeX in the Markdown source.
text=(ROOT/'controle-pid.md').read_text(encoding='utf-8-sig')
count=0
def equation(m):
    global count
    count+=1; formula=m.group(1).strip().replace(r'\mathrm{round}',r'\mathrm{round}')
    fig=plt.figure(figsize=(.1,.1)); fig.text(0,0,'$'+formula+'$',fontsize=13)
    name=f'equacao-{count:02}.png'; fig.savefig(IMG/name,dpi=210,bbox_inches='tight',pad_inches=.08); plt.close(fig)
    return f'<p class="equation"><img src="images/{name}" alt="Equação {count}"></p>'
htmltext=re.sub(r'\$\$(.*?)\$\$',equation,text,flags=re.S)
import markdown
body=markdown.markdown(htmltext,extensions=['tables','fenced_code','sane_lists'])
css='''@page { size:A4; margin:2cm 2.2cm; @bottom-center {content:counter(page) " / " counter(pages); font-size:9pt; color:#888;} }
body{font-family:Georgia,"DejaVu Serif",serif;font-size:10.5pt;line-height:1.5;color:#1a1a1a}
h1,h2,h3,h4{font-family:Arial,sans-serif;line-height:1.25;color:#111;break-after:avoid}
h1{font-size:20pt;border-bottom:2px solid #333;padding-bottom:.2em}h2{font-size:15pt;margin-top:1.6em;border-bottom:1px solid #ccc;padding-bottom:.15em}h3{font-size:12.5pt;margin-top:1.3em}
p{margin:.5em 0;text-align:justify}img{max-width:100%;display:block;margin:.8em auto;break-inside:avoid}
.equation img{max-width:100%;max-height:1.8cm;width:auto}table{border-collapse:collapse;margin:1em auto;width:100%;font-size:9.3pt;break-inside:avoid}th,td{border:1px solid #bbb;padding:.4em .5em;text-align:left;vertical-align:top}th{background:#f0f0f0;font-family:Arial,sans-serif}
pre{background:#f6f8fa;border:1px solid #e1e4e8;padding:.8em 1em;white-space:pre-wrap;overflow-wrap:anywhere;break-inside:avoid;line-height:1.35}code{font-family:Consolas,monospace;font-size:8.6pt}
blockquote{border-left:3px solid #ccc;margin:1em 0;padding-left:1em;color:#555}li{margin:.25em 0}'''
html='<!doctype html><html lang="pt-BR"><meta charset="utf-8"><title>Controle PID</title><style>'+css+'</style><body>'+body+'</body></html>'
(ROOT/'controle-pid.html').write_text(html,encoding='utf-8')
import xml.etree.ElementTree as ET
from reportlab.platypus import SimpleDocTemplate,Paragraph,Spacer,Table,TableStyle,Image,Preformatted,KeepTogether
from reportlab.lib.styles import getSampleStyleSheet,ParagraphStyle
from reportlab.lib.enums import TA_JUSTIFY,TA_CENTER
from reportlab.lib import colors
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen.canvas import Canvas
import html as htmlmod
fonts=pathlib.Path('C:/Windows/Fonts')
for name,file in [('Serif','georgia.ttf'),('SerifB','georgiab.ttf'),('SerifI','georgiai.ttf'),('Sans','arial.ttf'),('SansB','arialbd.ttf'),('Mono','consola.ttf')]:
    pdfmetrics.registerFont(TTFont(name,str(fonts/file)))
pdfmetrics.registerFontFamily('Serif',normal='Serif',bold='SerifB',italic='SerifI',boldItalic='SerifB')
styles=getSampleStyleSheet()
styles.add(ParagraphStyle('BodyPID',fontName='Serif',fontSize=10.5,leading=15.75,alignment=TA_JUSTIFY,spaceAfter=6))
for name,size in [('Heading1',20),('Heading2',15),('Heading3',12.5)]:
    styles[name].fontName='SansB'; styles[name].fontSize=size; styles[name].leading=size*1.25; styles[name].spaceBefore=14; styles[name].spaceAfter=8; styles[name].keepWithNext=True; styles[name].borderWidth=0; styles[name].borderColor=colors.HexColor('#cccccc'); styles[name].borderPadding=4
styles.add(ParagraphStyle('CellPID',fontName='Serif',fontSize=8.3,leading=11))
styles.add(ParagraphStyle('CodePID',fontName='Mono',fontSize=8,leading=10.5,backColor=colors.HexColor('#f6f8fa'),borderPadding=8,spaceBefore=8,spaceAfter=8))
styles.add(ParagraphStyle('QuotePID',parent=styles['BodyPID'],leftIndent=12,textColor=colors.HexColor('#555555')))
width=A4[0]-2*62.36

def inline(el):
    s=ET.tostring(el,encoding='unicode',method='xml')
    s=re.sub(r'^<[^>]+>|</[^>]+>$','',s)
    s=s.replace('<strong>','<b>').replace('</strong>','</b>').replace('<em>','<i>').replace('</em>','</i>')
    s=s.replace('<code>','<font name="Mono" size="9">').replace('</code>','</font>')
    s=s.replace('→','<font name="Sans">→</font>')   # Georgia não tem a seta; Arial tem
    return s

def pic(src,equ=False):
    from PIL import Image as PIL
    p=ROOT/src; w,h=PIL.open(p).size
    desired=min(width,w/(210 if equ else 180)*72)
    return Image(str(p),width=desired,height=desired*h/w,hAlign='CENTER')

story=[]
root=ET.fromstring('<root>'+re.sub(r'<img([^>]*?)(?<!/)>',r'<img\1 />',body)+'</root>')
for el in root:
    tag=el.tag
    if tag in ('h1','h2','h3','h4'):
        story.append(Paragraph(inline(el),styles[{'h1':'Heading1','h2':'Heading2','h3':'Heading3','h4':'Heading3'}[tag]]))
    elif tag=='p':
        im=el.find('img')
        if im is not None: story.extend([Spacer(1,6),pic(im.attrib['src'],el.attrib.get('class')=='equation'),Spacer(1,8)])
        else: story.append(Paragraph(inline(el),styles['BodyPID']))
    elif tag=='blockquote':
        for p in el: story.append(Paragraph(inline(p),styles['QuotePID']))
    elif tag in ('ul','ol'):
        for i,li in enumerate(el):
            prefix=(str(i+1)+'. ') if tag=='ol' else '• '
            story.append(Paragraph(prefix+inline(li),styles['BodyPID']))
    elif tag=='table':
        rows=[]
        for tr in el.iter('tr'):
            rows.append([Paragraph(inline(td),styles['CellPID']) for td in tr])
        # More width for explanatory columns, equal widths for numeric example.
        n=len(rows[0]); fractions=([.18,.45,.37] if n==3 else [.26,.74] if n==2 else [1/n]*n)
        tab=Table(rows,colWidths=[width*f for f in fractions],repeatRows=1,hAlign='CENTER')
        tab.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),colors.HexColor('#f0f0f0')),('GRID',(0,0),(-1,-1),.4,colors.HexColor('#bbbbbb')),('VALIGN',(0,0),(-1,-1),'TOP'),('LEFTPADDING',(0,0),(-1,-1),6),('RIGHTPADDING',(0,0),(-1,-1),6),('TOPPADDING',(0,0),(-1,-1),5),('BOTTOMPADDING',(0,0),(-1,-1),5)]))
        story.extend([Spacer(1,6),KeepTogether([tab]),Spacer(1,8)])
    elif tag=='pre':
        code=''.join(el.itertext())
        block=Preformatted(code.rstrip(),styles['CodePID'])
        if story and isinstance(story[-1],Paragraph) and story[-1].style.name.startswith('Heading'):
            heading=story.pop(); story.append(KeepTogether([heading,block]))
        else: story.append(KeepTogether([block]))
    elif tag=='hr': story.append(Spacer(1,10))
class NumberedCanvas(Canvas):
    def __init__(self,*a,**kw): super().__init__(*a,**kw); self.states=[]
    def showPage(self): self.states.append(dict(self.__dict__)); self._startPage()
    def save(self):
        total=len(self.states)
        for state in self.states:
            self.__dict__.update(state); self.setFont('Sans',9); self.setFillColor(colors.HexColor('#888888')); self.drawCentredString(A4[0]/2,29,f'{self._pageNumber} / {total}'); super().showPage()
        super().save()
doc=SimpleDocTemplate(str(ROOT/'controle-pid.pdf'),pagesize=A4,rightMargin=62.36,leftMargin=62.36,topMargin=56.7,bottomMargin=56.7,title='Controle PID: do tempo contínuo ao discreto',author='Material didático de Automação')
doc.build(story,canvasmaker=NumberedCanvas)
print('PDF gerado:',ROOT/'controle-pid.pdf')






