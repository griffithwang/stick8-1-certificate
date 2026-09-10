"""Exact finite sign description. This is NOT a nine-gon exclusion.

Only standard-library rational arithmetic; vertices are cyclic, zero-based.
"""
from fractions import Fraction as F
from itertools import combinations
import json
import random
from pathlib import Path


def sub(a, b):
    return tuple(x-y for x, y in zip(a, b))


def det(a, b):
    return a[0]*b[1]-a[1]*b[0]


def sign(x):
    return (x > 0)-(x < 0)


def adjacent(i, j, n):
    return i == j or (i-j) % n in (1, n-1)


def predicates(vertices):
    v = [tuple(F(x) for x in p) for p in vertices]
    n = len(v)
    u = [sub(v[(i+1) % n], v[i]) for i in range(n)]
    values = {}
    for i, j, k in combinations(range(n), 3):
        values['T', i, j, k] = det(sub(v[j], v[i]), sub(v[k], v[i]))
    terms = {}
    for i in range(n):
        for j in range(n):
            if adjacent(i, j, n):
                continue
            r = sub(v[j], v[i])
            d, a, b = det(u[i], u[j]), det(r, u[j]), det(r, u[i])
            terms[i, j] = a, d
            if i < j:
                values['D', i, j] = d
                values['H', i, j] = (v[i][2]-v[j][2])*d+a*u[i][2]-b*u[j][2]
    for i in range(n):
        partners = [j for j in range(n) if not adjacent(i, j, n)]
        for j, k in combinations(partners, 2):
            a, d = terms[i, j]
            b, e = terms[i, k]
            values['Q', i, j, k] = a*e-b*d
    if not all(values.values()):
        raise ValueError('outside the deliberately strengthened generic locus')
    return {key: sign(value) for key, value in values.items()}


def diagram_from_signs(s, n):
    """Reconstruct signed Gauss visits without coordinates or magnitudes."""
    def orient(i, j, k):
        p = [i, j, k]
        inversions = sum(p[a] > p[b] for a in range(3) for b in range(a+1, 3))
        return (-1)**inversions*s[('T', *sorted(p))]

    def direction(i, j):
        return s['D', i, j] if i < j else -s['D', j, i]

    from functools import cmp_to_key
    events = [[] for _ in range(n)]
    crossings = []
    for i, j in combinations(range(n), 2):
        if adjacent(i, j, n):
            continue
        if (orient(i, (i+1) % n, j) == orient(i, (i+1) % n, (j+1) % n)
                or orient(j, (j+1) % n, i) == orient(j, (j+1) % n, (i+1) % n)):
            continue
        d, h = s['D', i, j], s['H', i, j]
        # Height difference is H/D; usual crossing sign is sign(D*height)=sign(H).
        over = i if h*d > 0 else j
        crossings.append((i, j, over, h))
        events[i].append(j)
        events[j].append(i)
    ids = {(i, j): c for c, (i, j, _, _) in enumerate(crossings)}
    visits = []
    for i, partners in enumerate(events):
        def compare(j, k):
            q = s['Q', i, j, k] if j < k else -s['Q', i, k, j]
            return q*direction(i, j)*direction(i, k)
        for j in sorted(partners, key=cmp_to_key(compare)):
            c = ids[min(i, j), max(i, j)]
            visits.append((c, i == crossings[c][2], crossings[c][3]))
    return visits


def reduced_predicates(vertices):
    """Discard redundant Q predicates, retaining line concurrence for disjoint triples."""
    n = len(vertices)
    full = predicates(vertices)
    reduced = {key: value for key, value in full.items() if key[0] != 'Q'}
    for i, j, k in combinations(range(n), 3):
        if all(not adjacent(a, b, n) for a, b in ((i, j), (i, k), (j, k))):
            reduced['C', i, j, k] = -full['Q', i, j, k]
    return reduced


def expand_reduced(s, n):
    full = {key: value for key, value in s.items() if key[0] != 'C'}

    def orient(i, j, k):
        p = [i, j, k]
        parity = sum(p[a] > p[b] for a in range(3) for b in range(a+1, 3))
        return (-1)**parity*s[('T', *sorted(p))]

    for i in range(n):
        partners = [j for j in range(n) if not adjacent(i, j, n)]
        for j, k in combinations(partners, 2):
            if adjacent(j, k, n):
                if (j+1) % n == k:
                    shared = k
                    djk = orient(j, k, (k+1) % n)
                else:
                    shared = j
                    djk = -orient(k, j, (j+1) % n)
                q = -orient(i, (i+1) % n, shared)*djk
            else:
                p = [i, j, k]
                parity = sum(p[a] > p[b] for a in range(3) for b in range(a+1, 3))
                q = -(-1)**parity*s[('C', *sorted(p))]
            full['Q', i, j, k] = q
    return full


def conway_a2(visits):
    """Descending-diagram crossing changes and linking numbers of smoothings."""
    positions = {}
    signs = {}
    first_under = []
    for p, (c, over, s) in enumerate(visits):
        if c not in positions and not over:
            first_under.append(c)
        positions.setdefault(c, []).append(p)
        signs[c] = s
    total = 0
    for c in first_under:
        a, b = positions[c]
        linking_twice = sum(signs[d] for d, (x, y) in positions.items()
                            if d != c and ((a < x < b) != (a < y < b)))
        assert linking_twice % 2 == 0
        total += signs[c]*(linking_twice//2)
        signs[c] *= -1
    return total


def conway_a2_pair_sum(visits):
    """Closed sum: half the signed linked pairs with unlike first-visit status."""
    pos, first_over, signs = {}, {}, {}
    for p, (c, over, s) in enumerate(visits):
        if c not in pos:
            first_over[c] = over
        pos.setdefault(c, []).append(p)
        signs[c] = s
    twice = 0
    for c, d in combinations(pos, 2):
        a, b = pos[c]
        x, y = pos[d]
        if ((a < x < b) != (a < y < b)) and first_over[c] != first_over[d]:
            twice += signs[c]*signs[d]
    assert twice % 2 == 0
    return twice//2


def geometric_visits(cert):
    events = [[] for _ in range(cert['edges'])]
    c = 0
    for p in cert['pair_tests']:
        if p['result'] != 'crossing':
            continue
        for e, t in zip(p['edges'], p['parameters']):
            events[e-1].append((F(t), (c, e == p['over'], p['sign'])))
        c += 1
    return [entry for es in events for _, entry in sorted(es)]


def main():
    from exact_polygon import certificate
    root = Path(__file__).resolve().parent
    known = [line.split() for line in (root/'known_10gon.tab').read_text().splitlines()[1:]]
    known_visits = diagram_from_signs(predicates(known), 10)
    assert expand_reduced(reduced_predicates(known), 10) == predicates(known)
    assert known_visits == geometric_visits(certificate(known))
    assert conway_a2(known_visits) == -3
    assert conway_a2_pair_sum(known_visits) == -3
    rng = random.Random(20260910)
    checked, rejected = 0, 0
    histogram = {}
    while checked < 200:
        v = [[rng.randrange(-10000, 10001) for _ in range(3)] for _ in range(9)]
        try:
            s = predicates(v)
        except ValueError:
            rejected += 1
            continue
        visits = diagram_from_signs(s, 9)
        reduced = reduced_predicates(v)
        assert len(reduced) == 168
        assert expand_reduced(reduced, 9) == s
        assert visits == geometric_visits(certificate(v))
        assert len(s) == 273
        a2 = conway_a2(visits)
        assert a2 == conway_a2_pair_sum(visits)
        histogram[a2] = histogram.get(a2, 0)+1
        checked += 1
    result = {'status': 'PARTIAL', 'nine_gon_polynomials': 273,
              'reduced_nine_gon_polynomials': 168,
              'known_10gon_a2': -3, 'nine_gon_controls': checked,
              'rejected_nongeneric_controls': rejected, 'a2_histogram': histogram,
              'scope': 'Exact decoder validation only. No exhaustive sign feasibility or knot classification.'}
    (root/'sign_cells_validation.json').write_text(json.dumps(result, indent=2))
    print(json.dumps(result))


if __name__ == '__main__':
    main()
