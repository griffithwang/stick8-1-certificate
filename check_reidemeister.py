"""Standard-library-only rotation-system checker for a proposed local move trace."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
TARGET = [[1,9,2,8],[3,7,4,6],[5,12,6,13],[7,3,8,2],[9,1,10,16],[11,15,12,14],[13,4,14,5],[15,11,16,10]]

def graph(raw):
    return {(c,i):tuple(v) for c,row in raw.items() for i,v in enumerate(row)}

def pd_graph(pd):
    arcs={}
    for c,row in enumerate(pd):
        for i,a in enumerate(row): arcs.setdefault(a,[]).append((str(c),i))
    assert all(len(v)==2 for v in arcs.values())
    return {a:b for pair in arcs.values() for a,b in [pair,pair[::-1]]}

def valid(g):
    assert all(g.get(v)==u and u!=v for u,v in g.items())
    assert all((c,i) in g for c,_ in g for i in range(4))

def delete(g, removed):
    out={}
    for u in g:
        if u[0] in removed: continue
        v=g[u];seen=set()
        while v[0] in removed:
            assert v not in seen
            seen.add(v);v=g[v[0],(v[1]+2)%4]
        out[u]=v
    return out

def check_move(m):
    g,h=graph(m['before']),graph(m['after']);valid(g);valid(h)
    if m['type']=='I/II':
        removed={u[0] for u in g}-{u[0] for u in h}
        if len(removed)==1:
            c=next(iter(removed))
            assert any(g[c,i]==(c,(i+1)%4) for i in range(4))
        else:
            assert len(removed)==2
            ok=False
            for c in removed:
                for a in range(4):
                    b,j=g[c,a]
                    if b!=c and b in removed and g[c,(a+1)%4]==(b,(j-1)%4) and (a+j)%2==0:
                        ok=True
            assert ok,'not a cancellable empty bigon'
        assert delete(g,removed)==h
    else:
        assert m['type']=='III'
        t=[tuple(x) for x in m['at']]
        assert len({c for c,_ in t})==3
        for (c,i),nxt in zip(t,t[1:]+t[:1]): assert g[c,(i+1)%4]==nxt
        assert sum(i%2 for _,i in t) in (1,2),'cyclic over-under triangle'
        (A,a),(B,b),(C,c)=t
        assert b%2==0 and c%2==1
        port=lambda X,i:(X,i%4)
        old=[port(C,c-1),port(C,c-2),port(A,a-1),port(A,a-2),port(B,b-1),port(B,b-2)]
        new=[port(A,a),port(B,b+1),port(B,b),port(C,c+1),port(C,c),port(A,a+1)]
        replace=dict(zip(old,new));inside={u for u in g if u[0] in {A,B,C}}
        expected={}
        # Transport the six boundary connections, including any boundary-to-boundary arcs.
        for u,v in g.items():
            if u in inside and u not in replace: continue
            if v in inside and v not in replace: continue
            expected[replace.get(u,u)]=replace.get(v,v)
        for u,v in [(port(A,a-1),port(B,b+2)),(port(B,b-1),port(C,c+2)),(port(C,c-1),port(A,a+2))]:
            expected[u]=v;expected[v]=u
        assert expected==h,'incorrect triangle rewiring'
    return g,h

def isomorphism(g,h):
    # Preserve plane orientation and under/over parity; never identify a mirror by reflection.
    first=next(iter(g))
    for direction in (1,):
        for target in h:
            if target[1]%2!=first[1]%2: continue
            todo=[(first,target)];f={};rev={};ok=True
            while todo and ok:
                u,v=todo.pop()
                if u in f:
                    ok=f[u]==v;continue
                if v in rev:ok=False;break
                f[u]=v;rev[v]=u
                todo.extend([(g[u],h[v]),((u[0],(u[1]+1)%4),(v[0],(v[1]+direction)%4))])
            if ok and len(f)==len(g)==len(h):return direction,f
    return None

def main():
    data=json.loads((ROOT/'reidemeister_proposed.json').read_text())
    from exact_polygon import certificate
    vertices=[line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    assert certificate(vertices)['PD']==data['initial_PD']
    current=pd_graph(data['initial_PD'])
    for number,m in enumerate(data['moves'],1):
        before,after=check_move(m)
        assert before==current,number
        current=after
    # The proposer may rotate crossing indices when rebuilding orientations.
    assert isomorphism(current,graph(data['final'])) is not None
    iso=isomorphism(current,pd_graph(TARGET))
    assert iso is not None,'final diagram is not isomorphic to standard target'
    result={'verified_moves':len(data['moves']),'final_crossings':len(current)//4,'target_PD':TARGET,'plane_orientation':iso[0],
            'dart_isomorphism':[[list(u),list(v)] for u,v in sorted(iso[1].items())],
            'scope':'Exact local Reidemeister trace and final diagram isomorphism. No nine-stick exclusion.'}
    (ROOT/'reidemeister_verified.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result))

if __name__=='__main__':main()
