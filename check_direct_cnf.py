"""Independent structural and local-truth audit of the explicit gate CNF."""
from pathlib import Path
from itertools import product
from collections import Counter
import json
import argparse
ROOT = Path(__file__).resolve().parent


def clauses_for(y,op,args):
    if op == 'and':
        return [[-y,a] for a in args]+[[y,*[-a for a in args]]]
    if op == 'or':
        return [[y,-a] for a in args]+[[-y,*args]]
    if op == 'eq':
        a,b = args
        return [[-y,-a,b],[-y,a,-b],[y,a,b],[y,-a,-b]]
    if op == 'majority':
        a,b,c = args
        return [[-y,a,b],[-y,a,c],[-y,b,c],[y,-a,-b],[y,-a,-c],[y,-b,-c]]
    raise ValueError(op)


def semantics(op,values):
    if op == 'and':
        return all(values)
    if op == 'or':
        return any(values)
    if op == 'eq':
        return values[0] == values[1]
    if op == 'majority':
        return sum(values) >= 2
    raise ValueError(op)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--prefix',default='height_direct')
    options = parser.parse_args()
    data = json.loads((ROOT/f'{options.prefix}_gates.json').read_text())
    definitions = {1,*data['variables'].values()}
    assert len(definitions) == 1+len(data['variables'])
    expected = [[1]]
    templates = set()
    for gate in data['gates']:
        y,op,args = gate['out'],gate['op'],gate['args']
        assert y not in definitions
        assert all(abs(a) in definitions and abs(a) < y for a in args)
        definitions.add(y)
        expected += clauses_for(y,op,args)
        templates.add((op,len(args)))
    assert definitions == set(range(1,max(definitions)+1))
    for root in data['roots']:
        assert abs(root['literal']) in definitions
        expected.append([root['literal']])
    actual = []
    header = None
    for line in (ROOT/f'{options.prefix}.cnf').read_text().splitlines():
        if line.startswith('c'):
            continue
        if line.startswith('p'):
            _,_,nv,nc = line.split()
            header = int(nv),int(nc)
            continue
        numbers = list(map(int,line.split()))
        assert numbers[-1] == 0
        actual.append(numbers[:-1])
    assert header == (len(definitions),len(actual))
    assert Counter(map(tuple,actual)) == Counter(map(tuple,expected))
    truth_rows = 0
    for op,n in templates:
        assert n <= 16
        args = list(range(1,n+1))
        y = n+1
        clauses = clauses_for(y,op,args)
        for inputs in product((False,True),repeat=n):
            correct = semantics(op,inputs)
            for output in (False,True):
                values = dict(enumerate((*inputs,output),start=1))
                satisfied = all(any(values[abs(lit)] == (lit > 0) for lit in clause) for clause in clauses)
                assert satisfied == (output == correct)
                truth_rows += 1
    result = {'gate_definitions_checked':len(data['gates']),'source_variables':len(data['variables']),
              'root_assertions':len(data['roots']),'clauses_checked':len(actual),
              'local_truth_rows':truth_rows,'templates':sorted(templates),
              'scope':'Gate semantics and exact CNF serialization checked. Full mathematical coverage and any UNSAT certificate remain separate.'}
    (ROOT/f'{options.prefix}_audit.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result))


if __name__ == '__main__':
    main()
