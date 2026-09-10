"""Exact rational certificate for a generic xy projection; knot type is separate."""
from fractions import Fraction as Q
from itertools import combinations
from pathlib import Path
import json

def sub(a,b): return tuple(x-y for x,y in zip(a,b))
def det(a,b): return a[0]*b[1]-a[1]*b[0]

def certificate(vertices):
    v=[tuple(Q(x) for x in p) for p in vertices]; n=len(v)
    assert n>=3 and all(len(p)==3 for p in v)
    assert len({p[:2] for p in v})==n, 'coincident projected vertices'
    for i,j,k in combinations(range(n),3):
        assert det(sub(v[j],v[i]),sub(v[k],v[i])), 'collinear projected vertices'
    pairs=[]; crossings=[]; positions=set(); events=[[] for _ in v]
    for i,j in combinations(range(n),2):
        if j==i+1 or (i==0 and j==n-1): continue
        p,q=v[i],v[j]; u=sub(v[(i+1)%n],p); w=sub(v[(j+1)%n],q); r=sub(q,p)
        d=det(u,w); a=det(r,w); b=det(r,u)
        row={'edges':[i+1,j+1],'D':str(d),'A':str(a),'B':str(b)}
        if not d:
            row['result']='parallel_disjoint_projection'
        else:
            t,s=a/d,b/d
            if not (0<t<1 and 0<s<1): row['result']='disjoint_projection'
            else:
                xy=tuple(p[k]+t*u[k] for k in (0,1))
                assert xy not in positions, 'multiple projected crossing'
                positions.add(xy)
                h=p[2]+t*u[2]-q[2]-s*w[2]
                assert h, 'spatial intersection'
                ci=len(crossings)
                row.update(result='crossing',parameters=[str(t),str(s)],height=str(h),
                           over=i+1 if h>0 else j+1, sign=1 if d*h>0 else -1)
                crossings.append((i,j,d,h))
                events[i].append((t,ci));events[j].append((s,ci))
        pairs.append(row)
    assert len(pairs)==n*(n-3)//2
    visits=[(edge,ci) for edge,es in enumerate(events) for _,ci in sorted(es)]
    m=len(visits); labels={}
    for k,(edge,ci) in enumerate(visits): labels[(edge,ci)]=((k-1)%m+1,k+1)
    pd=[]
    for ci,(i,j,d,h) in enumerate(crossings):
        under,over=(j,i) if h>0 else (i,j)
        ui,uo=labels[under,ci];oi,oo=labels[over,ci]
        duv=-d if h>0 else d
        pd.append([ui,oi,uo,oo] if duv>0 else [ui,oo,uo,oi])
    return {'vertices':[[str(x) for x in p] for p in v], 'edges':n,
            'nonadjacent_pairs':len(pairs),'embedded':True,'projection':'xy',
            'generic':True,'crossings':len(crossings),'pair_tests':pairs,'PD':pd,
            'scope':'Exact embedding and generic crossing data only; no knot-type certification.'}

if __name__=='__main__':
    root=Path(__file__).resolve().parent
    v=[line.split() for line in (root/'known_10gon.tab').read_text().splitlines()[1:]]
    c=certificate(v)
    (root/'exact_10gon.json').write_text(json.dumps(c,indent=2),encoding='utf-8')
    print(json.dumps({k:c[k] for k in ('edges','nonadjacent_pairs','embedded','generic','crossings','PD','scope')}))
