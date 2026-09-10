"""Necessary-condition search: a normalized nine-gon with Conway a2 <= -3.

UNSAT needs a full encoding and proof audit. SAT needs knot identification.
"""
from itertools import combinations
from pathlib import Path
import json
from sign_cells import adjacent


def mul(*xs):
    return '(* '+' '.join(str(x) for x in xs)+')'


def parity(p):
    return (-1)**sum(p[a] > p[b] for a in range(len(p)) for b in range(a+1, len(p)))


def main():
    root = Path(__file__).resolve().parent
    data = json.loads((root/'normalized_predicates.json').read_text())
    names = data['variables']
    out = ['; Necessary condition only; NOT a proof of the stick number.', '(set-logic QF_NRA)']
    out += [f'(declare-fun {x} () Real)' for x in names]
    lookup = {}
    for i, item in enumerate(data['predicates']):
        terms = []
        for c, powers in item['terms']:
            factors = [str(c) if c >= 0 else f'(- {-c})']
            factors += [x for x, p in zip(names, powers) for _ in range(p)]
            terms.append(mul(*factors))
        out.append(f'(define-fun p{i} () Real (+ '+' '.join(terms)+'))')
        out.append(f'(assert (not (= p{i} 0)))')
        out.append(f'(define-fun s{i} () Real (ite (> p{i} 0) 1 (- 1)))')
        lookup[tuple(item['key'])] = f's{i}'

    def orient(i, j, k):
        s = lookup[('T', *sorted((i, j, k)))]
        return s if parity([i, j, k]) == 1 else f'(- {s})'

    def direction(i, j):
        s = lookup['D', min(i, j), max(i, j)]
        return s if i < j else f'(- {s})'

    def qsign(i, j, k):
        if j > k:
            return f'(- {qsign(i, k, j)})'
        if adjacent(j, k, 9):
            if (j+1) % 9 == k:
                shared, d = k, orient(j, k, (k+1) % 9)
            else:
                shared, d = j, f'(- {orient(k, j, (j+1) % 9)})'
            return f'(- {mul(orient(i, (i+1) % 9, shared), d)})'
        c = lookup[('C', *sorted((i, j, k)))]
        return c if parity([i, j, k]) == -1 else f'(- {c})'

    def before(e, partner, f, other):
        if e != f:
            return 'true' if e < f else 'false'
        return '(< '+mul(qsign(e, partner, other), direction(e, partner), direction(e, other))+' 0)'

    pairs = [(i, j) for i, j in combinations(range(9), 2) if not adjacent(i, j, 9)]
    for c, (i, j) in enumerate(pairs):
        a, b = orient(i, (i+1) % 9, j), orient(i, (i+1) % 9, (j+1) % 9)
        d, e = orient(j, (j+1) % 9, i), orient(j, (j+1) % 9, (i+1) % 9)
        out.append(f'(define-fun cross{c} () Bool (and (< {mul(a,b)} 0) (< {mul(d,e)} 0)))')
        out.append(f'(define-fun under{c} () Bool (< {mul(lookup["H",i,j],lookup["D",i,j])} 0))')
    summands = []
    for c, d in combinations(range(len(pairs)), 2):
        i, j = pairs[c]
        k, l = pairs[d]
        inside1 = f'(and {before(i,j,k,l)} {before(k,l,j,i)})'
        inside2 = f'(and {before(i,j,l,k)} {before(l,k,j,i)})'
        cond = f'(and cross{c} cross{d} (xor {inside1} {inside2}) (xor under{c} under{d}))'
        summands.append(f'(ite {cond} {mul(lookup["H",i,j],lookup["H",k,l])} 0)')
    out += ['(define-fun twice_a2 () Real (+ '+' '.join(summands)+'))',
            '(assert (<= twice_a2 (- 6)))', '(check-sat)']
    (root/'a2_obstruction.smt2').write_text('\n'.join(out)+'\n')
    print(json.dumps({'variables': 15, 'predicates': len(lookup), 'potential_crossings': len(pairs),
                      'crossing_pairs': len(summands), 'target': 'a2 <= -3', 'status': 'UNSOLVED'}))


if __name__ == '__main__':
    main()
