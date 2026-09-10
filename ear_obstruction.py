"""Add necessary non-collapsible-ear conditions for a nine-stick 8_1.

Uses the known lower bound s(8_1)>=9, not an assumed universal a2 bound.
"""
from itertools import combinations
from fractions import Fraction as F
from pathlib import Path
import json
import random
import sympy as S
from export_obstruction_smt import parity, mul

ROOT = Path(__file__).resolve().parent


def det3(a, b, c):
    return (a[0]*(b[1]*c[2]-b[2]*c[1])
            -a[1]*(b[0]*c[2]-b[2]*c[0])
            +a[2]*(b[0]*c[1]-b[1]*c[0]))


def sub(a, b):
    return tuple(x-y for x,y in zip(a,b))


def vol(v, a, b, c, d):
    return det3(sub(v[b],v[a]),sub(v[c],v[a]),sub(v[d],v[a]))


def pierces(v, s, t, a, b, c):
    plane1, plane2 = vol(v,a,b,c,s), vol(v,a,b,c,t)
    sides = [vol(v,s,t,a,b),vol(v,s,t,b,c),vol(v,s,t,c,a)]
    return plane1*plane2 < 0 and sides[0]*sides[1] > 0 and sides[0]*sides[2] > 0


def pierces_cramer(v, s, t, a, b, c):
    # v_s + q(v_t-v_s) = v_a + r(v_b-v_a) + h(v_c-v_a).
    x = sub(v[t],v[s])
    y = sub(v[a],v[b])
    z = sub(v[a],v[c])
    w = sub(v[a],v[s])
    den = det3(x,y,z)
    if not den:
        return None
    q,r,h = F(det3(w,y,z),den),F(det3(x,w,z),den),F(det3(x,y,w),den)
    return 0 < q < 1 and r > 0 and h > 0 and r+h < 1


def ear_counts(v):
    n = len(v)
    return [sum(pierces(v,j,(j+1)%n,*tri) for j in range(n)
                if j not in tri and (j+1)%n not in tri)
            for i in range(n) for tri in [((i-1)%n,i,(i+1)%n)]]


def main():
    data = json.loads((ROOT/'normalized_predicates.json').read_text())
    names = data['variables']
    variables = S.symbols(' '.join(names))
    v = [S.Matrix(x) for x in data['fixed_vertices']]
    v += [S.Matrix(variables[3*i:3*i+3]) for i in range(5)]
    out = []
    lookup = {}
    for index, key in enumerate(combinations(range(9),4)):
        a,b,c,d = key
        expr = S.Matrix.hstack(v[b]-v[a],v[c]-v[a],v[d]-v[a]).det()
        poly = S.Poly(S.expand(expr),*variables)
        assert not poly.is_zero
        terms = []
        for powers, coeff in poly.terms():
            factors = [str(coeff) if coeff >= 0 else f'(- {-coeff})']
            factors += [x for x,p in zip(names,powers) for _ in range(p)]
            terms.append(mul(*factors))
        out += [f'(define-fun v{index} () Real (+ '+' '.join(terms)+'))',
                f'(assert (not (= v{index} 0)))',
                f'(define-fun w{index} () Real (ite (> v{index} 0) 1 (- 1)))']
        lookup[key] = f'w{index}'

    def v4(a,b,c,d):
        p = [a,b,c,d]
        term = lookup[tuple(sorted(p))]
        return term if parity(p) == 1 else f'(- {term})'

    tests = []
    for i in range(9):
        a,b,c = (i-1)%9,i,(i+1)%9
        eligible = [j for j in range(9) if j not in (a,b,c) and (j+1)%9 not in (a,b,c)]
        assert len(eligible) == 5
        for j in eligible:
            k = (j+1)%9
            plane = mul(v4(a,b,c,j),v4(a,b,c,k))
            p,q,r = v4(j,k,a,b),v4(j,k,b,c),v4(j,k,c,a)
            out.append(f'(define-fun pierce_{i}_{j} () Bool (and (< {plane} 0) (> {mul(p,q)} 0) (> {mul(p,r)} 0)))')
            tests.append((i,j,(a,b,c)))
        out.append(f'(define-fun blocked_ear{i} () Bool (or '+' '.join(f'pierce_{i}_{j}' for j in eligible)+'))')
    out.append('(define-fun all_ears_blocked () Bool (and '+' '.join(f'blocked_ear{i}' for i in range(9))+'))')
    extension = '\n'.join(out)+'\n'
    base = (ROOT/'a2_obstruction.smt2').read_text().replace('(check-sat)','')
    (ROOT/'ear_obstruction.smt2').write_text(base+extension+'(assert all_ears_blocked)\n(check-sat)\n')
    (ROOT/'ear_definitions.smt2').write_text(extension)
    rng = random.Random(8190)
    count, skipped, irreducible = 0,0,0
    for _ in range(200):
        points = [[rng.randrange(-1000,1001) for _ in range(3)] for _ in range(9)]
        for _,j,(a,b,c) in tests:
            answer = pierces_cramer(points,j,(j+1)%9,a,b,c)
            if answer is None:
                skipped += 1
            else:
                assert answer == pierces(points,j,(j+1)%9,a,b,c)
                count += 1
        irreducible += int(all(ear_counts(points)))
    result = {'exact_segment_triangle_controls': count,'parallel_controls_skipped':skipped,
              'volume_predicates':len(lookup),'ear_constraints':9,'piercing_choices':45,
              'random_polygons':200,'random_polygons_with_all_ears_blocked':irreducible,
              'scope':'Predicate validation and necessary condition only. No nine-gon exclusion.'}
    (ROOT/'ear_validation.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result))


if __name__ == '__main__':
    main()
