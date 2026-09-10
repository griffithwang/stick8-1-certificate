"""Block abstract diagrams that fail planarity or the exact target determinant.

Diagram exclusions are necessary-condition filters, not coordinate certificates.
"""
from pathlib import Path
import json
import argparse
import sys
import time
import sympy as S
ROOT = Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'solver_lib'))
import z3 as Z
from discrete_relaxation import build
from inspect_discrete_model import decode,diagram_genus
from sign_cells import geometric_visits
from exact_polygon import certificate


def determinant(visits):
    n = len(visits)//2
    if n == 0:
        return 1
    over,incoming,outgoing = {},{},{}
    arc = 0
    for c,is_over,_ in visits:
        if is_over:
            over[c] = arc
        else:
            incoming[c] = arc
            arc = (arc+1)%n
            outgoing[c] = arc
    a = S.zeros(n,n)
    for c in range(n):
        a[c,over[c]] += 2
        a[c,incoming[c]] -= 1
        a[c,outgoing[c]] -= 1
    return abs(int(a[:n-1,:n-1].det()))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--fox13',action='store_true')
    args = parser.parse_args()
    known = [line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    assert determinant(geometric_visits(certificate(known))) == 13
    assert determinant(geometric_visits(certificate(known[:2]+known[3:]))) == 9
    variables,groups,twice,crosses,information = build(require_fox13=args.fox13)
    solver = Z.Solver()
    solver.set(timeout=15000,max_memory=1024)
    solver.add(*[c for cs in groups.values() for c in cs])
    records = []
    started = time.monotonic()
    for iteration in range(40):
        answer = solver.check()
        if answer != Z.sat:
            records.append({'iteration':iteration,'solver_result':str(answer),
                            'reason':solver.reason_unknown() if answer == Z.unknown else None})
            break
        model = solver.model()
        signs = [[list(key),Z.is_true(model.eval(value,model_completion=True))] for key,value in variables.items()]
        visits,pd = decode(signs)
        genus,faces = diagram_genus(pd)
        det = determinant(visits) if genus == 0 else None
        row = {'iteration':iteration,'crossings':len(pd),'genus':genus,'determinant':det}
        records.append(row)
        print(json.dumps(row),flush=True)
        row['PD'] = pd
        row['signs'] = signs
        if genus == 0 and det == 13:
            result = {'result':'sat','signs':signs,'twice_a2':model.eval(twice).as_long(),
                      'projection_crossings':len(pd),'PD':pd,'determinant':det,
                      'scope':'Planar abstract candidate with target invariants. No real coordinates.'}
            try:
                import snappy
                result['numerical_census_matches'] = [str(x) for x in snappy.Link(pd).exterior().identify()]
            except Exception as exc:
                result['identification_error'] = str(exc)
            (ROOT/'filtered_discrete_model.json').write_text(json.dumps(result,indent=2))
            print(json.dumps({k:v for k,v in result.items() if k not in ('signs','PD')}),flush=True)
            break
        same_diagram = []
        for guard,expr in information:
            if Z.is_true(model.eval(guard)):
                same_diagram.append(expr if Z.is_true(model.eval(expr)) else Z.Not(expr))
        row['blocking_literals'] = len(same_diagram)
        row['blocking_clause_smt2'] = Z.Not(Z.And(*same_diagram)).sexpr()
        solver.add(Z.Not(Z.And(*same_diagram)))
    (ROOT/('discrete_refinement_fox13.json' if args.fox13 else 'discrete_refinement.json')).write_text(json.dumps({'records':records,
         'seconds':time.monotonic()-started,'scope':'Finite diagram filtering only; no complete enumeration.'},indent=2))


if __name__ == '__main__':
    main()
