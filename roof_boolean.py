"""142-sign relaxation of the exposed-vertex/overclosure representation.

Edge 7 is all-over in the shadow; only edges 0..6 have affine height planes.
"""
from itertools import combinations
from pathlib import Path
import argparse
import json
import random
import time
import sys
ROOT = Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'solver_lib'))
import z3 as Z
from discrete_relaxation import flip,product
from export_obstruction_smt import parity
from sign_cells import adjacent,det,sub,expand_reduced,diagram_from_signs,conway_a2
from ear_obstruction import vol,ear_counts,det3
from roof_projection import exposed_projection,overclosure
from wheel_stress import wheels,coefficients
from inspect_discrete_model import gauss_pd,diagram_genus
from refine_discrete import determinant


def build(require_fox13=False,require_end_conditions=False,canonical=False,balanced=False,chord=False,chord_values=False,audit=None):
    n,apex = 8,8
    variables = {('V',*key):Z.Bool('RV_'+'_'.join(map(str,key))) for key in combinations(range(9),4)}
    independent = [key for key in combinations(range(n),3) if all(not adjacent(i,j,n) for i,j in combinations(key,2))]
    variables.update({('C',*key):Z.Bool('RC_'+'_'.join(map(str,key))) for key in independent})
    assert len(variables) == 142
    groups = {}
    def add(group,clause):
        groups.setdefault(group,[]).append(clause)
    def chi(*indices):
        assert len(set(indices)) == 4
        return flip(variables[('V',*sorted(indices))],parity(indices))
    def orient(i,j,k):
        return chi(i,j,k,apex)
    def line(i,j,k):
        indices = i,j,k
        key = tuple(sorted(indices))
        if key in independent:
            return flip(variables[('C',*key)],parity(indices))
        for a,b in combinations(key,2):
            if adjacent(a,b,n):
                if (a+1)%n != b:
                    a,b = b,a
                h = next(x for x in key if x not in (a,b))
                value = product(orient(h,(h+1)%n,b),orient(a,b,(b+1)%n))
                return flip(value,parity(indices)*parity((h,a,b)))
        raise AssertionError(key)
    def gp(ground,rank,chiro,group):
        for common in combinations(ground,rank-2):
            rest = [x for x in ground if x not in common]
            for a,b,c,d in combinations(rest,4):
                p = product(chiro(*common,a,b),chiro(*common,c,d))
                q = Z.Not(product(chiro(*common,a,c),chiro(*common,b,d)))
                r = product(chiro(*common,a,d),chiro(*common,b,c))
                add(group,Z.Or(p != q,q != r))
    gp(range(9),4,chi,'point_GP')
    gp(range(8),3,line,'line_GP')
    for triple in independent:
        for shift in range(3):
            i,j,k = triple[shift:]+triple[:shift]
            a,b,c,d,e,f = i,(i+1)%n,j,(j+1)%n,k,(k+1)%n
            p = product(orient(a,b,e),orient(c,d,f))
            q = Z.Not(product(orient(a,b,f),orient(c,d,e)))
            r = Z.Not(line(i,j,k))
            add('line_bracket_identity',Z.Or(p != q,q != r))
    for support in combinations(range(9),5):
        signs = [flip(chi(*(support[:i]+support[i+1:])),(-1)**i) for i in range(5)]
        add('acyclic',Z.And(Z.Or(*signs),Z.Or(*[Z.Not(x) for x in signs])))
    for support in combinations(range(8),4):
        signs = [flip(orient(*(support[:i]+support[i+1:])),(-1)**i) for i in range(4)]
        add('projected_acyclic',Z.And(Z.Or(*signs),Z.Or(*[Z.Not(x) for x in signs])))
    add('normalization',orient(0,1,2))
    if canonical:
        basis = list(combinations(range(9),4))
        left = [chi(*key) for key in basis]
        for chosen in range(9):
            rest = [x for x in range(9) if x != chosen]
            acyclic = []
            for support in combinations(rest,4):
                coeff = [flip(chi(*(support[:r]+support[r+1:]),chosen),(-1)**r) for r in range(4)]
                acyclic.append(Z.And(Z.Or(*coeff),Z.Or(*[Z.Not(x) for x in coeff])))
            exposed = Z.And(*acyclic)
            for direction in (1,-1):
                permutation = [(chosen+direction*(i+1))%9 for i in range(8)]+[chosen]
                if permutation == list(range(9)):
                    continue
                reference = chi(permutation[0],permutation[1],permutation[2],chosen)
                right = [product(chi(*(permutation[i] for i in key)),reference) for key in basis]
                lex = Z.BoolVal(True)
                for a,b in zip(reversed(left),reversed(right)):
                    lex = Z.Or(Z.And(Z.Not(a),b),Z.And(a == b,lex))
                add('canonical',Z.Implies(exposed,lex))
    for key in combinations(range(8),3):
        for a,b in combinations(key,2):
            if adjacent(a,b,n):
                if (a+1)%n != b:
                    a,b = b,a
                i = next(x for x in key if x not in (a,b))
                add('line_incidence',line(i,a,b) == product(orient(i,(i+1)%n,b),orient(a,b,(b+1)%n)))
    # If chord=True, edge 7 here is the auxiliary AFFINE chord, not the roof.
    height_lines = 8 if chord else 7
    for quad in combinations(range(height_lines),4):
        weights = [flip(line(*(quad[:r]+quad[r+1:])),(-1)**r) for r in range(4)]
        terms = [product(product(weights[r],weights[s]),chi(quad[r],(quad[r]+1)%n,quad[s],(quad[s]+1)%n))
                 for r,s in combinations(range(4),2) if not adjacent(quad[r],quad[s],n)]
        add('height_stress',Z.And(Z.Or(*terms),Z.Or(*[Z.Not(t) for t in terms])))
    for order in wheels(height_lines):
        terms = [product(mu,chi(i,(i+1)%n,j,(j+1)%n)) for (i,j),mu in coefficients(order,line,product,Z.Not)
                 if not adjacent(i,j,n)]
        add('wheel_height_stress',Z.And(Z.Or(*terms),Z.Or(*[Z.Not(t) for t in terms])))
    # Original polygon is 0,1,...,7,apex(8), not the eight-edge shadow cycle.
    for i in range(9):
        a,b,c = (i-1)%9,i,(i+1)%9
        choices = []
        for s in range(9):
            t = (s+1)%9
            if s not in (a,b,c) and t not in (a,b,c):
                choices.append(Z.And(chi(a,b,c,s) != chi(a,b,c,t),
                                     chi(s,t,a,b) == chi(s,t,b,c),chi(s,t,a,b) == chi(s,t,c,a)))
        add('blocked_ears',Z.Or(*choices))
    pairs = [(i,j) for i,j in combinations(range(n),2) if not adjacent(i,j,n)]
    assert len(pairs) == 20
    crosses,unders,heights,linear_heights,linear_unders = [],[],[],[],[]
    for i,j in pairs:
        cross = Z.And(orient(i,(i+1)%n,j) != orient(i,(i+1)%n,(j+1)%n),
                      orient(j,(j+1)%n,i) != orient(j,(j+1)%n,(i+1)%n))
        crosses.append(cross)
        d = orient(i,(i+1)%n,(j+1)%n)
        add('crossing_directions',Z.Implies(cross,d != orient(j,(j+1)%n,(i+1)%n)))
        h = Z.Not(d) if j == 7 else chi(i,i+1,j,j+1)
        heights.append(h)
        unders.append(h != d)
        linear = chi(i,(i+1)%n,j,(j+1)%n)
        linear_heights.append(linear)
        linear_unders.append(linear != d)
    ids = {key:i for i,key in enumerate(pairs)}
    if require_end_conditions:
        # Three ears involving the apex are upward vertical curtains.
        add('end_ear_crossings',Z.Or(*[Z.And(crosses[ids[0,j]],unders[ids[0,j]]) for j in range(2,7)]))
        add('end_ear_crossings',Z.Or(*[Z.And(crosses[ids[i,6]],Z.Not(unders[ids[i,6]])) for i in range(5)]))
        add('end_ear_crossings',Z.Or(*[Z.And(crosses[ids[i,7]],
             chi(i,i+1,7,0) == orient(i,i+1,0)) for i in range(1,6)]))
    def direction(i,j):
        return orient(i,(i+1)%n,(j+1)%n) if i < j else Z.Not(orient(j,(j+1)%n,(i+1)%n))
    def earlier(i,j,k,l):
        if i != k:
            return Z.BoolVal(i < k)
        return product(product(line(i,j,l),direction(i,j)),direction(i,l))
    ids = {key:i for i,key in enumerate(pairs)}
    information = [(Z.BoolVal(True),c) for c in crosses]
    for c in range(len(pairs)):
        information.extend([(crosses[c],heights[c]),(crosses[c],unders[c])])
    for i in range(n):
        partners = [j for j in range(n) if not adjacent(i,j,n)]
        for j,k in combinations(partners,2):
            live = Z.And(crosses[ids[tuple(sorted((i,j)))]],crosses[ids[tuple(sorted((i,k)))]])
            information.append((live,earlier(i,j,i,k)))
        for j,k,l in combinations(partners,3):
            live = Z.And(*[crosses[ids[tuple(sorted((i,x)))]] for x in (j,k,l)])
            a,b,c = earlier(i,j,i,k),earlier(i,k,i,l),earlier(i,l,i,j)
            add('event_transitivity',Z.Implies(live,Z.And(Z.Or(a,b,c),Z.Or(Z.Not(a),Z.Not(b),Z.Not(c)))))
    terms,weighted,Aweights,Bweights,Aterms,Bterms,chord_weights,chord_terms = [],[],[],[],[],[],[],[]
    for c,d in combinations(range(len(pairs)),2):
        i,j = pairs[c]
        k,l = pairs[d]
        inside1 = Z.And(earlier(i,j,k,l),earlier(k,l,j,i))
        inside2 = Z.And(earlier(i,j,l,k),earlier(l,k,j,i))
        active = Z.And(crosses[c],crosses[d],inside1 != inside2,unders[c] != unders[d])
        terms.append(Z.If(active,Z.If(heights[c] == heights[d],1,-1),0))
        weighted.extend([(Z.And(active,heights[c] == heights[d]),1),(Z.And(active,heights[c] != heights[d]),-1)])
        if chord:
            selected = Z.And(crosses[c],crosses[d],inside1 != inside2,linear_unders[c] != linear_unders[d])
            same = linear_heights[c] == linear_heights[d]
            chord_weights.extend([(Z.And(selected,same),1),(Z.And(selected,Z.Not(same)),-1)])
            chord_terms.append(Z.If(selected,Z.If(same,1,-1),0))
        if balanced:
            first_over = Z.If(earlier(i,j,k,l),Z.Not(unders[c]),Z.Not(unders[d]))
            for condition,weights,sums in ((Z.And(active,first_over),Aweights,Aterms),(Z.And(active,Z.Not(first_over)),Bweights,Bterms)):
                weights.extend([(Z.And(condition,heights[c] == heights[d]),1),(Z.And(condition,heights[c] != heights[d]),-1)])
                sums.append(Z.If(condition,Z.If(heights[c] == heights[d],1,-1),0))
    twice_a2 = Z.Sum(*terms)
    if balanced:
        add('target_a2',Z.PbEq(Aweights,-3))
        add('target_a2',Z.PbEq(Bweights,-3))
        if audit is not None:
            audit['A'],audit['B'] = Z.Sum(*Aterms),Z.Sum(*Bterms)
    else:
        add('target_a2',Z.PbEq(weighted,-6))
    add('target_crossings',Z.PbGe([(c,1) for c in crosses],8))
    if chord:
        if chord_values:
            add('eight_stick_bound',Z.Or(*[Z.PbEq(chord_weights,2*value) for value in (-2,-1,0,1,2,3,5)]))
        else:
            add('eight_stick_bound',Z.PbGe(chord_weights,-4))
        if audit is not None:
            audit['chord_twice'] = Z.Sum(*chord_terms)
    if require_fox13:
        from fox_coloring import constraints
        for clause in constraints(8,pairs,crosses,unders,earlier,prefix='roof_fox'):
            add('fox13',clause)
    return variables,groups,twice_a2,crosses,information


def signs_from_points(points,keys):
    lines = [(points[i][1]-points[(i+1)%8][1],points[(i+1)%8][0]-points[i][0],
              points[i][0]*points[(i+1)%8][1]-points[i][1]*points[(i+1)%8][0]) for i in range(8)]
    result = {}
    for key in keys:
        if key[0] == 'C':
            value = det3(*(lines[i] for i in key[1:]))
        elif key[-1] == 8:
            i,j,k = key[1:4]
            value = det(sub(points[j],points[i]),sub(points[k],points[i]))
        else:
            value = vol(points,*key[1:])
        assert value
        result[key] = value > 0
    return result


def decode(sign_list):
    signs = {tuple(key):1 if value else -1 for key,value in sign_list}
    def chi(*ids):
        return parity(ids)*signs[('V',*sorted(ids))]
    reduced = {('T',*key):chi(*key,8) for key in combinations(range(8),3)}
    reduced.update({key:value for key,value in signs.items() if key[0] == 'C'})
    for i,j in combinations(range(8),2):
        if adjacent(i,j,8):
            continue
        d = chi(i,(i+1)%8,(j+1)%8,8)
        reduced['D',i,j] = d
        reduced['H',i,j] = -d if j == 7 else chi(i,i+1,j,j+1)
    visits = diagram_from_signs(expand_reduced(reduced,8),8)
    return visits,gauss_pd(visits)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--timeout-ms',type=int,default=60000)
    parser.add_argument('--end-conditions',action='store_true')
    parser.add_argument('--canonical',action='store_true')
    parser.add_argument('--balanced',action='store_true')
    parser.add_argument('--chord',action='store_true')
    parser.add_argument('--chord-values',action='store_true')
    parser.add_argument('--validate-only',action='store_true')
    args = parser.parse_args()
    if args.chord_values:
        args.chord = True
    audit = {}
    variables,groups,twice,crosses,_ = build(require_end_conditions=args.end_conditions or args.canonical or args.balanced or args.chord,canonical=args.canonical or args.balanced or args.chord,balanced=args.balanced,chord=args.chord,chord_values=args.chord_values,audit=audit)
    rng = random.Random(818142)
    controls = [[[rng.randrange(-10000,10001) for _ in range(3)] for _ in range(9)] for _ in range(20)]
    known = [line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    controls.append(known[:2]+known[3:])
    universal = {g:Z.And(*cs) for g,cs in groups.items() if g not in ('blocked_ears','end_ear_crossings','canonical','target_a2','target_crossings')}
    for raw in controls:
        apex,points = exposed_projection(raw)
        if det(sub(points[1],points[0]),sub(points[2],points[0])) < 0:
            points = [(-x,y,z) for x,y,z in points]
        values = signs_from_points(points,variables)
        subs = [(var,Z.BoolVal(values[key])) for key,var in variables.items()]
        for group,clause in universal.items():
            assert Z.is_true(Z.simplify(Z.substitute(clause,*subs))),group
        expected = overclosure(points)['visits']
        visits,pd = decode([[list(k),v] for k,v in values.items()])
        assert visits == expected
        a2 = conway_a2(expected)
        assert Z.simplify(Z.substitute(twice,*subs)).as_long() == 2*a2
        for label,expr in audit.items():
            if label == 'chord_twice':
                from exact_polygon import certificate
                from sign_cells import geometric_visits
                expected_chord = conway_a2(geometric_visits(certificate(points)))
                assert Z.simplify(Z.substitute(expr,*subs)).as_long() == 2*expected_chord
                assert expected_chord >= -2
            else:
                assert Z.simplify(Z.substitute(expr,*subs)).as_long() == a2
        # Independently compare projective ear tests to the original polygon.
        from fractions import Fraction as F
        original = [[F(x) for x in p] for p in raw]
        ordered = [original[(apex+k)%9] for k in range(1,10)]
        counts = ear_counts(ordered)
        for clause,count in zip(groups['blocked_ears'],counts):
            assert Z.is_true(Z.simplify(Z.substitute(clause,*subs))) == (count > 0)
        if args.end_conditions or args.canonical or args.balanced or args.chord:
            for clause,index in zip(groups['end_ear_crossings'],(0,7,8)):
                assert Z.is_true(Z.simplify(Z.substitute(clause,*subs))) == (counts[index] > 0)
        if args.canonical or args.balanced or args.chord:
            # Check that a representative exists in the allowed dihedral orbit.
            numeric = {key:(1 if val else -1) for key,val in values.items()}
            def n_chi(*ids):
                return parity(ids)*numeric[('V',*sorted(ids))]
            candidates = []
            basis = list(combinations(range(9),4))
            for chosen in range(9):
                rest = [x for x in range(9) if x != chosen]
                exposed = True
                for support in combinations(rest,4):
                    coeff = [(-1)**r*n_chi(*(support[:r]+support[r+1:]),chosen) for r in range(4)]
                    if len(set(coeff)) == 1:
                        exposed = False
                        break
                if not exposed:
                    continue
                for direction in (1,-1):
                    permutation = [(chosen+direction*(i+1))%9 for i in range(8)]+[chosen]
                    reference = n_chi(permutation[0],permutation[1],permutation[2],chosen)
                    candidate = [n_chi(*(permutation[i] for i in key))*reference > 0 for key in basis]
                    candidates.append(candidate)
            assert candidates
            representative = min(candidates)
            test_subs = [(variables[('V',*key)],Z.BoolVal(val)) for key,val in zip(basis,representative)]
            assert Z.is_true(Z.simplify(Z.substitute(Z.And(*groups['canonical']),*test_subs)))
    print(f'Validated {len(controls)} exact roof controls and original ear tests.',flush=True)
    if args.validate_only:
        return
    solver = Z.Solver()
    solver.set(timeout=args.timeout_ms,max_memory=1024)
    solver.add(*[c for cs in groups.values() for c in cs])
    prefix = 'roof_chord_values_boolean' if args.chord_values else 'roof_chord_balanced_boolean' if args.chord and args.balanced else 'roof_chord_boolean' if args.chord else 'roof_balanced_boolean' if args.balanced else 'roof_canonical_boolean' if args.canonical else 'roof_end_boolean' if args.end_conditions else 'roof_boolean'
    (ROOT/f'{prefix}.smt2').write_text(solver.to_smt2())
    start = time.monotonic()
    answer = solver.check()
    result = {'result':str(answer),'variables':len(variables),'constraint_groups':{g:len(cs) for g,cs in groups.items()},
              'exact_controls':len(controls),'seconds':time.monotonic()-start,
              'scope':'Necessary overclosure sign model; no real realization or universal exclusion implied by SAT/UNKNOWN.'}
    if answer == Z.unknown:
        result['reason'] = solver.reason_unknown()
    if answer == Z.sat:
        model = solver.model()
        signs = [[list(key),Z.is_true(model.eval(v,model_completion=True))] for key,v in variables.items()]
        visits,pd = decode(signs)
        genus,_ = diagram_genus(pd)
        result.update(signs=signs,PD=pd,genus=genus,twice_a2=model.eval(twice).as_long())
        if genus == 0:
            result['determinant'] = determinant(visits)
    (ROOT/f'{prefix}_result.json').write_text(json.dumps(result,indent=2))
    print(json.dumps({k:v for k,v in result.items() if k not in ('signs','PD')}))


if __name__ == '__main__':
    main()
