"""Finite Fox 13-coloring constraints using ordered crossing events."""
from pathlib import Path
from itertools import combinations
from fractions import Fraction as F
import sys
import json
ROOT = Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'solver_lib'))
import z3 as Z
from sign_cells import adjacent


def constraints(n,pairs,crosses,unders,earlier,prefix='fox'):
    assert 3 <= n <= 10
    width = 8
    zero,modulus = Z.BitVecVal(0,width),Z.BitVecVal(13,width)
    colors = [Z.BitVec(f'{prefix}_vertex_{i}',width) for i in range(n)]
    delta = {(i,j):Z.BitVec(f'{prefix}_delta_{i}_{j}',width)
             for i in range(n) for j in range(n) if not adjacent(i,j,n)}
    cs = [Z.ULE(x,12) for x in colors+list(delta.values())]
    cs += [colors[0] == zero,Z.Or(*[x != zero for x in colors+list(delta.values())])]

    def add_mod(a,b):
        # Inputs lie in 0..12. The sum is <=24 and one subtraction suffices.
        total = a+b
        return Z.If(Z.UGE(total,modulus),total-modulus,total)
    ids = {key:c for c,key in enumerate(pairs)}
    for i,j in delta:
        c = ids[tuple(sorted((i,j)))]
        under_here = unders[c] if i < j else Z.Not(unders[c])
        cs.append(Z.Implies(Z.Not(Z.And(crosses[c],under_here)),delta[i,j] == zero))

    def before(i,j):
        # Reduce after each addition so every intermediate remains in 0..12.
        terms = [Z.If(earlier(i,k,i,j),delta[i,k],zero)
                 for k in range(n) if k != j and (i,k) in delta]
        total = colors[i]
        for term in terms:
            total = add_mod(total,term)
        return total

    for i in range(n):
        total = colors[i]
        for j in range(n):
            if (i,j) in delta:
                total = add_mod(total,delta[i,j])
        cs.append(colors[(i+1)%n] == total)
    for c,(i,j) in enumerate(pairs):
        a,b = before(i,j),before(j,i)
        aa,bb = add_mod(a,delta[i,j]),add_mod(b,delta[j,i])
        cs.append(Z.Implies(crosses[c],Z.If(unders[c],
            add_mod(b,b) == add_mod(a,aa),
            add_mod(a,a) == add_mod(b,bb))))
    return cs


def main():
    from exact_polygon import certificate
    rows = [line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    results = []
    for label,v,expected in [('known_8_1_ten_gon',rows,Z.sat),
                              ('deletion_2_nine_gon',rows[:2]+rows[3:],Z.unsat)]:
        cert = certificate(v)
        n = len(v)
        pairs = [(i,j) for i,j in combinations(range(n),2) if not adjacent(i,j,n)]
        actual = {tuple(e-1 for e in row['edges']):row for row in cert['pair_tests']}
        crosses,unders = [],[]
        times = {}
        for i,j in pairs:
            row = actual[i,j]
            active = row['result'] == 'crossing'
            crosses.append(Z.BoolVal(active))
            unders.append(Z.BoolVal(active and row['over'] != i+1))
            if active:
                times[i,j],times[j,i] = map(F,row['parameters'])
        def earlier(i,j,k,l):
            assert i == k
            return Z.BoolVal((i,j) in times and (k,l) in times and times[i,j] < times[k,l])
        solver = Z.Solver()
        solver.set(timeout=10000)
        solver.add(*constraints(n,pairs,crosses,unders,earlier,prefix=label))
        answer = solver.check()
        assert answer == expected,(label,answer)
        results.append({'control':label,'result':str(answer)})
    (ROOT/'fox13_validation.json').write_text(json.dumps(results,indent=2))
    print(json.dumps(results))


if __name__ == '__main__':
    main()
