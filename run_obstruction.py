"""Validate the SMT expression on exact controls, then run a bounded probe."""
from pathlib import Path
from fractions import Fraction as F
import argparse
import json
import random
import sys
import time
import sympy as S

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT/'solver_lib'))
import z3
from sign_cells import reduced_predicates, expand_reduced, diagram_from_signs, conway_a2


def normalize(vertices):
    v = [S.Matrix([S.Rational(str(x)) for x in p]) for p in vertices]
    basis = S.Matrix.hstack(*(v[i]-v[0] for i in (1, 2, 3)))
    if basis.det() == 0:
        raise ValueError('dependent first four vertices')
    target = S.Matrix([[1,0,1], [0,1,2], [0,0,1]])
    a = target*basis.inv()
    return [[F(str(x)) for x in a*(p-v[0])] for p in v]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--timeout-ms', type=int, default=30000)
    args = parser.parse_args()
    source = (ROOT/'a2_obstruction.smt2').read_text()
    prefix = source.split('(assert (<= twice_a2 (- 6)))')[0]
    rng = random.Random(81009)
    known = [line.split() for line in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    controls = [known[:i]+known[i+1:] for i in range(10)]
    controls += [[[rng.randrange(-1000,1001) for _ in range(3)] for _ in range(9)] for _ in range(90)]
    a2s, skipped = [], 0
    for raw in controls:
        try:
            v = normalize(raw)
            signs = reduced_predicates(v)
        except ValueError:
            skipped += 1
            continue
        a2 = conway_a2(diagram_from_signs(expand_reduced(signs, 9), 9))
        literal = str(2*a2) if a2 >= 0 else f'(- {-2*a2})'
        assertions = z3.parse_smt2_string(prefix+f'(assert (not (= twice_a2 {literal})))')
        values = [x for p in v[4:] for x in p]
        names = [f'{axis}{i}' for i in range(4,9) for axis in 'xyz']
        substitutions = [(z3.Real(n), z3.RealVal(str(x))) for n,x in zip(names,values)]
        for assertion in assertions[:-1]:
            assert z3.is_true(z3.simplify(z3.substitute(assertion,*substitutions)))
        assert z3.is_false(z3.simplify(z3.substitute(assertions[-1],*substitutions)))
        a2s.append(a2)
    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms, max_memory=1024)
    solver.add(z3.parse_smt2_string(source))
    start = time.monotonic()
    answer = solver.check()
    result = {'status': str(answer), 'elapsed_seconds': time.monotonic()-start,
              'timeout_ms': args.timeout_ms, 'exact_controls_verified': len(a2s),
              'skipped_controls': skipped, 'control_a2_values': sorted(set(a2s)),
              'z3_version': z3.get_version_string(),
              'scope': 'Necessary a2 obstruction only. No universal conclusion from UNKNOWN.'}
    if answer == z3.unknown:
        result['reason_unknown'] = solver.reason_unknown()
    if answer == z3.sat:
        result['model'] = str(solver.model())
        result['scope'] = 'Candidate only; exact coordinates and knot type still need certification.'
    if answer == z3.unsat:
        result['scope'] = 'Solver UNSAT claim; independent proof/encoding audit still required.'
    (ROOT/'obstruction_probe.json').write_text(json.dumps(result, indent=2))
    with (ROOT/'obstruction_probe_history.jsonl').open('a') as stream:
        stream.write(json.dumps(result)+'\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()
