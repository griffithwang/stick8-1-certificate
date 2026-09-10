"""Project from an exposed vertex and use an all-over closing edge in the shadow.

The closing shadow edge is NOT assumed to have an affine height function.
"""
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path
import json
import random
from exact_polygon import certificate,sub,det
from sign_cells import conway_a2,geometric_visits
from inspect_discrete_model import gauss_pd,diagram_genus
from refine_discrete import determinant

ROOT = Path(__file__).resolve().parent


def exposed_projection(vertices):
    v = [tuple(F(x) for x in p) for p in vertices]
    apex = max(range(len(v)),key=lambda i:v[i][0])
    assert all(v[apex][0] > v[i][0] for i in range(len(v)) if i != apex)
    a = v[apex]
    output = []
    for k in range(1,len(v)):
        p = v[(apex+k)%len(v)]
        z = a[0]-p[0]
        output.append(((p[1]-a[1])/z,(p[2]-a[2])/z,1/z))
    return apex,output


def overclosure(points):
    n = len(points)
    for i,j,k in combinations(range(n),3):
        assert det(sub(points[j],points[i]),sub(points[k],points[i]))
    events = [[] for _ in points]
    crossings = []
    positions = set()
    for i,j in combinations(range(n),2):
        if j == i+1 or (i == 0 and j == n-1):
            continue
        p,q = points[i],points[j]
        u,w = sub(points[(i+1)%n],p),sub(points[(j+1)%n],q)
        r = sub(q,p)
        d = det(u,w)
        if not d:
            continue
        t,s = det(r,w)/d,det(r,u)/d
        if 0 < t < 1 and 0 < s < 1:
            xy = p[0]+t*u[0],p[1]+t*u[1]
            assert xy not in positions
            positions.add(xy)
            if j == n-1:
                over,h = j,F(-1)  # only the sign is used for the closing edge
            else:
                h = p[2]+t*u[2]-q[2]-s*w[2]
                assert h
                over = i if h > 0 else j
            sign = 1 if d*h > 0 else -1
            c = len(crossings)
            crossings.append({'edges':[i,j],'parameters':[str(t),str(s)],'over':over,'sign':sign})
            events[i].append((t,(c,i == over,sign)))
            events[j].append((s,(c,j == over,sign)))
    visits = [value for es in events for _,value in sorted(es)]
    pd = gauss_pd(visits) if visits else []
    return {'visits':visits,'PD':pd,'crossings':crossings}


def main():
    known = [line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    apex,points = exposed_projection(known)
    diagram = overclosure(points)
    assert conway_a2(diagram['visits']) == -3
    assert determinant(diagram['visits']) == 13
    assert diagram_genus(diagram['PD'])[0] == 0
    rng = random.Random(81908)
    checked,rejected = 0,0
    while checked < 100:
        v = [[rng.randrange(-10000,10001) for _ in range(3)] for _ in range(9)]
        try:
            original = certificate(v)
            _,lift = exposed_projection(v)
            shadow = overclosure(lift)
        except AssertionError:
            rejected += 1
            continue
        expected = geometric_visits(original)
        assert conway_a2(shadow['visits']) == conway_a2(expected)
        assert determinant(shadow['visits']) == determinant(expected)
        if shadow['PD']:
            assert diagram_genus(shadow['PD'])[0] == 0
        checked += 1
    result = {'known_10gon_apex':apex,'known_10gon_shadow_crossings':len(diagram['crossings']),
              'known_10gon_a2':-3,'known_10gon_determinant':13,'known_10gon_shadow_PD':diagram['PD'],
              'nine_gon_exact_controls':checked,'nongeneric_rejections':rejected,
              'scope':'Exact checks of the exposed-vertex/overclosure representation. No nine-stick target construction or exclusion.'}
    (ROOT/'roof_projection_validation.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result))


if __name__ == '__main__':
    main()
