"""Illustration only: exact intersection data determines the underpass gaps."""
from pathlib import Path
from fractions import Fraction
import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

HERE=Path(__file__).resolve().parent
# In the release this script and its output live in paper/, directly below ROOT.
ROOT=HERE.parent
sys.path.insert(0,str(ROOT))
from exact_polygon import certificate

raw=[line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
cert=certificate(raw)
points=np.array([[float(Fraction(x)) for x in row] for row in raw])
events={i:[0.0,1.0] for i in range(10)}
under={i:[] for i in range(10)}
for test in cert['pair_tests']:
    if test['result']!='crossing':
        continue
    for edge,value in zip(test['edges'],test['parameters']):
        t=float(Fraction(value))
        events[edge-1].append(t)
        if edge!=test['over']:
            under[edge-1].append(t)
fig=plt.figure(figsize=(7.2,3.2),layout='constrained')
ax=fig.add_subplot(121,projection='3d')
closed=np.vstack([points,points[0]])
ax.plot(*closed.T,color='#254665',linewidth=1.6)
ax.scatter(*points.T,s=12,color='#254665',depthshade=False)
ax.view_init(elev=22,azim=-63)
ax.set_box_aspect(np.ptp(points,axis=0))
ax.set_axis_off()
ax.set_title('Spatial polygon',fontsize=10)
ax2=fig.add_subplot(122)
for i,a in enumerate(points[:,:2]):
    b=points[(i+1)%10,:2]
    cuts=[]
    for t in under[i]:
        nearest=min(abs(t-s) for s in events[i] if abs(t-s)>1e-12)
        half=min(0.013/np.linalg.norm(b-a),nearest/4)
        cuts.append((t-half,t+half))
    cursor=0
    for left,right in sorted(cuts)+[(1,1)]:
        q=a+(b-a)*cursor
        r=a+(b-a)*left
        ax2.plot([q[0],r[0]],[q[1],r[1]],color='#254665',linewidth=1.35,solid_capstyle='butt')
        cursor=right
ax2.scatter(*points[:,:2].T,s=9,color='#254665')
for i,(x,y) in enumerate(points[:,:2]):
    ax2.annotate(str(i+1),(x,y),xytext=(3,4),textcoords='offset points',fontsize=7)
ax2.set_aspect('equal')
ax2.margins(.10)
ax2.set_axis_off()
ax2.set_title('Certified xy projection (18 crossings)',fontsize=10)
fig.savefig(HERE/'tengon.pdf',bbox_inches='tight')
fig.savefig(HERE/'tengon.png',dpi=180,bbox_inches='tight')
print('Rendered exact ten-gon illustration; floating point is used only for display.')
