"""Finite necessary sign constraints; SAT does NOT imply geometric realizability.

Rank-4 signs of nine vertices plus the projection direction, and rank-3
signs of the nine supporting lines. No AutoProve runtime is involved.
"""
from itertools import combinations
from pathlib import Path
import argparse
import json
import random
import sys
import time
ROOT = Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'solver_lib'))
import z3 as Z
from export_obstruction_smt import parity
from sign_cells import adjacent, reduced_predicates, expand_reduced, diagram_from_signs, conway_a2
from ear_obstruction import vol
from run_obstruction import normalize


def flip(s, p):
    return s if p == 1 else Z.Not(s)


def product(a,b):
    return a == b


def build(require_fox13=False):
    variables = {('V',*key):Z.Bool('V_'+'_'.join(map(str,key))) for key in combinations(range(10),4)}
    independent = [key for key in combinations(range(9),3)
                   if all(not adjacent(a,b,9) for a,b in combinations(key,2))]
    variables.update({('C',*key):Z.Bool('C_'+'_'.join(map(str,key))) for key in independent})
    groups = {}

    def add(group,condition):
        groups.setdefault(group,[]).append(condition)

    def chi(*indices):
        assert len(set(indices)) == 4
        return flip(variables[('V',*sorted(indices))],parity(indices))

    def orient(i,j,k):
        return chi(i,j,k,9)

    def line(i,j,k):
        indices = [i,j,k]
        key = tuple(sorted(indices))
        if key in independent:
            return flip(variables[('C',*key)],parity(indices))
        for a,b in combinations(key,2):
            if adjacent(a,b,9):
                if (a+1)%9 != b:
                    a,b = b,a
                anchor = next(x for x in key if x not in (a,b))
                value = product(orient(anchor,(anchor+1)%9,b),orient(a,b,(b+1)%9))
                return flip(value,parity([anchor,a,b])*parity(indices))
        raise AssertionError(key)

    def gp(ground,rank,chiro,group):
        for common in combinations(ground,rank-2):
            rest = [i for i in ground if i not in common]
            for a,b,c,d in combinations(rest,4):
                p = product(chiro(*common,a,b),chiro(*common,c,d))
                q = Z.Not(product(chiro(*common,a,c),chiro(*common,b,d)))
                r = product(chiro(*common,a,d),chiro(*common,b,c))
                add(group,Z.Or(p != q,q != r))

    gp(range(10),4,chi,'point_GP')
    gp(range(9),3,line,'line_GP')
    # Exact Grassmann-Cayley identity for lines ab, cd, ef:
    # det(L_ab,L_cd,L_ef) = T(a,b,e)T(c,d,f)-T(a,b,f)T(c,d,e).
    # This couples line order signs to point signs beyond adjacent incidence.
    for triple in independent:
        for shift in range(3):
            i,j,k = triple[shift:]+triple[:shift]
            a,b,c,d,e,f = i,(i+1)%9,j,(j+1)%9,k,(k+1)%9
            p = product(orient(a,b,e),orient(c,d,f))
            q = Z.Not(product(orient(a,b,f),orient(c,d,e)))
            r = Z.Not(line(i,j,k))
            add('line_bracket_identity',Z.Or(p != q,q != r))
    # Four-line height compatibility: if sum lambda_i L_i=0, then
    # sum_{i<j} lambda_i lambda_j H_ij=0. Adjacent H_ij vanish identically.
    for quad in combinations(range(9),4):
        lambdas = [flip(line(*(quad[:r]+quad[r+1:])),(-1)**r) for r in range(4)]
        terms = []
        for r,s in combinations(range(4),2):
            i,j = quad[r],quad[s]
            if adjacent(i,j,9):
                continue
            terms.append(product(product(lambdas[r],lambdas[s]),chi(i,(i+1)%9,j,(j+1)%9)))
        add('height_stress',Z.And(Z.Or(*terms),Z.Or(*[Z.Not(t) for t in terms])))
    from wheel_stress import wheels,coefficients
    for order in wheels(9):
        terms = []
        for (i,j),coefficient in coefficients(order,line,product,Z.Not):
            if not adjacent(i,j,9):
                terms.append(product(coefficient,chi(i,(i+1)%9,j,(j+1)%9)))
        add('wheel_height_stress',Z.And(Z.Or(*terms),Z.Or(*[Z.Not(t) for t in terms])))
    # Actual homogeneous vectors admit a strictly positive functional.
    for support in combinations(range(10),5):
        coefficients = [flip(chi(*(support[:i]+support[i+1:])),(-1)**i) for i in range(5)]
        add('acyclic',Z.And(Z.Or(*coefficients),Z.Or(*[Z.Not(x) for x in coefficients])))
    # The projected vectors (x_i,y_i,1) also lie in a positive affine chart.
    for support in combinations(range(9),4):
        coefficients = [flip(orient(*(support[:i]+support[i+1:])),(-1)**i) for i in range(4)]
        add('projected_acyclic',Z.And(Z.Or(*coefficients),Z.Or(*[Z.Not(x) for x in coefficients])))
    for key,value in [((0,1,2,3),True),((0,1,2,9),True),((0,1,3,9),True),
                      ((0,2,3,9),False),((1,2,3,9),False)]:
        add('normalization',chi(*key) == value)
    # Different adjacent-pair factorizations must agree when there is a choice.
    for key in combinations(range(9),3):
        for a,b in combinations(key,2):
            if not adjacent(a,b,9):
                continue
            if (a+1)%9 != b:
                a,b = b,a
            i = next(x for x in key if x not in (a,b))
            add('line_incidence',line(i,a,b) == product(orient(i,(i+1)%9,b),orient(a,b,(b+1)%9)))
    for i in range(9):
        a,b,c = (i-1)%9,i,(i+1)%9
        choices = []
        for s in range(9):
            t = (s+1)%9
            if s in (a,b,c) or t in (a,b,c):
                continue
            choices.append(Z.And(chi(a,b,c,s) != chi(a,b,c,t),
                                 chi(s,t,a,b) == chi(s,t,b,c),
                                 chi(s,t,a,b) == chi(s,t,c,a)))
        add('blocked_ears',Z.Or(*choices))

    pairs = [(i,j) for i,j in combinations(range(9),2) if not adjacent(i,j,9)]
    crosses,unders,heights = [],[],[]
    for i,j in pairs:
        crosses.append(Z.And(orient(i,(i+1)%9,j) != orient(i,(i+1)%9,(j+1)%9),
                             orient(j,(j+1)%9,i) != orient(j,(j+1)%9,(i+1)%9)))
        add('crossing_directions',Z.Implies(crosses[-1],
            orient(i,(i+1)%9,(j+1)%9) != orient(j,(j+1)%9,(i+1)%9)))
        h = chi(i,(i+1)%9,j,(j+1)%9)
        # For an actual crossing, sign(D_ij)=sign T(i,i+1,j+1).
        d = orient(i,(i+1)%9,(j+1)%9)
        heights.append(h)
        unders.append(h != d)

    def direction(i,j):
        if i < j:
            return orient(i,(i+1)%9,(j+1)%9)
        return Z.Not(orient(j,(j+1)%9,(i+1)%9))

    def earlier(e,partner,f,other):
        if e != f:
            return Z.BoolVal(e < f)
        # sign(t_e,partner - t_e,other) = sign(-C * D1 * D2).
        p = product(line(e,partner,other),direction(e,partner))
        return product(p,direction(e,other))

    pair_ids = {key:c for c,key in enumerate(pairs)}
    for i in range(9):
        partners = [j for j in range(9) if not adjacent(i,j,9)]
        for j,k,l in combinations(partners,3):
            live = [crosses[pair_ids[tuple(sorted((i,x)))]] for x in (j,k,l)]
            a,b,c = earlier(i,j,i,k),earlier(i,k,i,l),earlier(i,l,i,j)
            add('event_transitivity',Z.Implies(Z.And(*live),Z.And(Z.Or(a,b,c),Z.Or(Z.Not(a),Z.Not(b),Z.Not(c)))))

    summands = []
    weighted = []
    for c,d in combinations(range(27),2):
        i,j = pairs[c]
        k,l = pairs[d]
        inside1 = Z.And(earlier(i,j,k,l),earlier(k,l,j,i))
        inside2 = Z.And(earlier(i,j,l,k),earlier(l,k,j,i))
        active = Z.And(crosses[c],crosses[d],inside1 != inside2,unders[c] != unders[d])
        summands.append(Z.If(active,Z.If(heights[c] == heights[d],1,-1),0))
        weighted.extend([(Z.And(active,heights[c] == heights[d]),1),
                         (Z.And(active,heights[c] != heights[d]),-1)])
    twice_a2 = Z.Sum(*summands)
    add('target_a2',Z.PbEq(weighted,-6))
    add('target_crossings',Z.PbGe([(c,1) for c in crosses],8))
    diagram_information = [(Z.BoolVal(True),c) for c in crosses]
    for c in range(27):
        diagram_information.extend([(crosses[c],heights[c]),(crosses[c],unders[c])])
    for i in range(9):
        partners = [j for j in range(9) if not adjacent(i,j,9)]
        for j,k in combinations(partners,2):
            live = Z.And(crosses[pair_ids[tuple(sorted((i,j)))]],crosses[pair_ids[tuple(sorted((i,k)))]])
            diagram_information.append((live,earlier(i,j,i,k)))
    if require_fox13:
        from fox_coloring import constraints
        for clause in constraints(9,pairs,crosses,unders,earlier):
            add('fox13',clause)
    return variables,groups,twice_a2,crosses,diagram_information


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--timeout-ms',type=int,default=60000)
    args = parser.parse_args()
    variables,groups,twice,crosses,_ = build()
    print('Built Boolean constraints; validating exact controls.',flush=True)
    rng = random.Random(81024)
    validated = 0
    raw_controls = [[[rng.randrange(-10000,10001) for _ in range(3)] for _ in range(9)] for _ in range(12)]
    known = [line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    raw_controls.append(known[:2]+known[3:])
    universal = {group:Z.And(*clauses) for group,clauses in groups.items()
                 if group not in ('blocked_ears','target_a2','target_crossings')}
    for raw in raw_controls:
        v = normalize(raw)
        reduced = reduced_predicates(v)
        values = {}
        for key in variables:
            if key[0] == 'C':
                values[key] = reduced[key] > 0
            elif key[-1] == 9:
                values[key] = reduced[('T',*key[1:-1])] > 0
            else:
                values[key] = vol(v,*key[1:]) > 0
        substitutions = [(var,Z.BoolVal(values[key])) for key,var in variables.items()]
        for group,clause in universal.items():
            assert Z.is_true(Z.simplify(Z.substitute(clause,*substitutions))),group
        a2 = conway_a2(diagram_from_signs(expand_reduced(reduced,9),9))
        assert Z.simplify(Z.substitute(twice,*substitutions)).as_long() == 2*a2
        assert Z.is_true(Z.simplify(Z.substitute(groups['target_a2'][0],*substitutions))) == (a2 == -3)
        validated += 1
    print(f'Validated {validated} exact controls; starting bounded solver.',flush=True)
    solver = Z.Solver()
    solver.set(timeout=args.timeout_ms,max_memory=1024)
    solver.add(*[clause for clauses in groups.values() for clause in clauses])
    (ROOT/'discrete_relaxation.smt2').write_text(solver.to_smt2())
    started = time.monotonic()
    answer = solver.check()
    result = {'result':str(answer),'variables':len(variables),'constraint_groups':{g:len(c) for g,c in groups.items()},
              'exact_coordinate_controls':validated,'seconds':time.monotonic()-started,
              'scope':'Necessary Boolean sign relaxation. SAT is not a realizable knot; UNKNOWN proves nothing.'}
    if answer == Z.unknown:
        result['reason'] = solver.reason_unknown()
    if answer == Z.sat:
        model = solver.model()
        result['signs'] = [[list(key),Z.is_true(model.eval(var,model_completion=True))] for key,var in variables.items()]
        result['twice_a2'] = model.eval(twice).as_long()
        result['projection_crossings'] = sum(Z.is_true(model.eval(c)) for c in crosses)
    (ROOT/'discrete_relaxation_result.json').write_text(json.dumps(result,indent=2))
    print(json.dumps({k:v for k,v in result.items() if k != 'signs'}))


if __name__ == '__main__':
    main()
