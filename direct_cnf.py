"""Explicit Tseitin gates and balanced binary counters for the sign formula.

Avoid distributive expansion of long parity expressions. No SMT-to-CNF tactic.
"""
from pathlib import Path
import json
import hashlib
import argparse
import sys
from itertools import product as assignments
ROOT = Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'solver_lib'))
import z3 as Z
from pysat.solvers import Solver
from discrete_relaxation import build


class Encoder:
    def __init__(self):
        self.count = 1
        self.clauses = [[1]]
        self.variables = {}
        self.memo = {}
        self.cache = {}
        self.gates = []

    def fresh(self):
        self.count += 1
        return self.count

    def gate(self,op,args):
        key = (op,*args)
        if key in self.cache:
            return self.cache[key]
        y = self.fresh()
        self.cache[key] = y
        if op == 'and':
            self.clauses += [[-y,a] for a in args]+[[y,*[-a for a in args]]]
        elif op == 'or':
            self.clauses += [[y,-a] for a in args]+[[-y,*args]]
        elif op == 'eq':
            a,b = args
            self.clauses += [[-y,-a,b],[-y,a,-b],[y,a,b],[y,-a,-b]]
        elif op == 'majority':
            a,b,c = args
            self.clauses += [[-y,a,b],[-y,a,c],[-y,b,c],[y,-a,-b],[y,-a,-c],[y,-b,-c]]
        else:
            raise ValueError(op)
        self.gates.append({'out':y,'op':op,'args':list(args)})
        return y

    def and_(self,*args):
        args = set(args)
        if -1 in args or any(-a in args for a in args):
            return -1
        args.discard(1)
        if not args:
            return 1
        if len(args) == 1:
            return next(iter(args))
        if len(args) > 12:
            ordered = sorted(args)
            return self.and_(*[self.and_(*ordered[i:i+8]) for i in range(0,len(ordered),8)])
        return self.gate('and',tuple(sorted(args)))

    def or_(self,*args):
        return -self.and_(*[-a for a in args])

    def eq(self,a,b):
        if a == b:
            return 1
        if a == -b:
            return -1
        if a == 1:
            return b
        if a == -1:
            return -b
        if b == 1:
            return a
        if b == -1:
            return -a
        key = min(tuple(sorted((a,b))),tuple(sorted((-a,-b))))
        return self.gate('eq',key)

    def majority(self,a,b,c):
        if a == b or a == c:
            return a
        if b == c:
            return b
        if a == -b:
            return c
        if a == -c:
            return b
        if b == -c:
            return a
        if 1 in (a,b,c):
            return self.or_(*[x for x in (a,b,c) if x != 1])
        if -1 in (a,b,c):
            return self.and_(*[x for x in (a,b,c) if x != -1])
        return self.gate('majority',tuple(sorted((a,b,c))))

    def add(self,left,right):
        result,carry = [],-1
        for i in range(max(len(left),len(right))):
            a = left[i] if i < len(left) else -1
            b = right[i] if i < len(right) else -1
            result.append(-self.eq(-self.eq(a,b),carry))
            carry = self.majority(a,b,carry)
        if carry != -1:
            result.append(carry)
        return result

    def count_bits(self,literals):
        vectors = [[a] for a in literals]
        if not vectors:
            return [-1]
        while len(vectors) > 1:
            vectors = [self.add(vectors[i],vectors[i+1]) if i+1 < len(vectors) else vectors[i]
                       for i in range(0,len(vectors),2)]
        return vectors[0]

    def cardinality(self,literals,bound,equality):
        true_count = literals.count(1)
        bound -= true_count
        literals = [a for a in literals if abs(a) != 1]
        if bound < 0:
            return -1 if equality else 1
        if bound > len(literals):
            return -1
        bits = self.count_bits(literals)
        if equality:
            return self.and_(*[a if (bound>>i)&1 else -a for i,a in enumerate(bits)])
        result = 1
        for i,a in enumerate(bits):
            result = self.and_(a,result) if (bound>>i)&1 else self.or_(a,result)
        return result

    def encode(self,expr):
        if expr.get_id() in self.memo:
            return self.memo[expr.get_id()]
        if Z.is_true(expr):
            result = 1
        elif Z.is_false(expr):
            result = -1
        elif Z.is_const(expr) and Z.is_bool(expr):
            name = str(expr.decl().name())
            if name not in self.variables:
                self.variables[name] = self.fresh()
            result = self.variables[name]
        else:
            kind = expr.decl().kind()
            args = [self.encode(a) for a in expr.children()]
            if kind == Z.Z3_OP_NOT:
                result = -args[0]
            elif kind == Z.Z3_OP_AND:
                result = self.and_(*args)
            elif kind == Z.Z3_OP_OR:
                result = self.or_(*args)
            elif kind == Z.Z3_OP_IMPLIES:
                result = self.or_(-args[0],args[1])
            elif kind == Z.Z3_OP_EQ:
                assert len(args) == 2
                result = self.eq(*args)
            elif kind in (Z.Z3_OP_XOR,Z.Z3_OP_DISTINCT):
                assert len(args) == 2
                result = -self.eq(*args)
            elif kind == Z.Z3_OP_ITE:
                c,a,b = args
                result = self.or_(self.and_(c,a),self.and_(-c,b))
            elif kind in (Z.Z3_OP_PB_AT_LEAST,Z.Z3_OP_PB_AT_MOST):
                bound, = expr.params()
                if kind == Z.Z3_OP_PB_AT_MOST:
                    args,bound = [-a for a in args],len(args)-bound
                result = self.cardinality(args,bound,False)
            elif kind in (Z.Z3_OP_PB_EQ,Z.Z3_OP_PB_GE):
                bound,*weights = expr.params()
                literals = []
                assert len(weights) == len(args)
                for a,w in zip(args,weights):
                    assert isinstance(w,int)
                    if w < 0:
                        bound -= w
                        literals += [-a]*(-w)
                    else:
                        literals += [a]*w
                result = self.cardinality(literals,bound,kind == Z.Z3_OP_PB_EQ)
            else:
                raise ValueError((kind,str(expr)))
        self.memo[expr.get_id()] = result
        return result


def validate():
    a,b,c,d,e,f = Z.Bools('a b c d e f')
    expressions = [Z.And(a,Z.Or(b,c),Z.Not(d)),a == b,a != b,Z.If(c,a,b),
        Z.Implies(Z.And(a,b),Z.Or(c,d)),Z.PbEq([(a,1),(b,-1),(c,2),(d,-2)],-1),
        Z.PbGe([(a,1),(b,1),(c,1),(d,1),(e,1),(f,1)],3),
        Z.PbEq([(a,1),(b,1),(c,1),(d,1),(e,1),(f,1)],4)]
    cases = 0
    for expr in expressions:
        encoder = Encoder()
        output = encoder.encode(expr)
        with Solver(name='glucose42',bootstrap_with=encoder.clauses) as solver:
            for values in assignments((False,True),repeat=6):
                expected = Z.is_true(Z.simplify(Z.substitute(expr,*[(x,Z.BoolVal(v)) for x,v in zip((a,b,c,d,e,f),values)])))
                assumptions = [encoder.variables[str(x)]*(1 if v else -1) for x,v in zip((a,b,c,d,e,f),values)
                               if str(x) in encoder.variables]
                assert solver.solve(assumptions=assumptions+[output if expected else -output])
                assert not solver.solve(assumptions=assumptions+[-output if expected else output])
                cases += 1
    return cases


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model',choices=('full','roof','roof-end','roof-canonical','roof-chord-values'),default='full')
    parser.add_argument('--prefix')
    args = parser.parse_args()
    checks = validate()
    if args.model.startswith('roof'):
        from roof_boolean import build as model_build
    else:
        model_build = build
    prefix = 'roof_chord_values_direct' if args.model == 'roof-chord-values' else 'roof_canonical_direct' if args.model == 'roof-canonical' else 'roof_end_direct' if args.model == 'roof-end' else 'roof_direct' if args.model == 'roof' else 'height_direct'
    if args.prefix:
        prefix = args.prefix
    if args.model == 'roof-chord-values':
        variables,groups,_,_,_ = model_build(require_end_conditions=True,canonical=True,chord=True,chord_values=True)
    elif args.model == 'roof-canonical':
        variables,groups,_,_,_ = model_build(require_end_conditions=True,canonical=True)
    elif args.model == 'roof-end':
        variables,groups,_,_,_ = model_build(require_end_conditions=True)
    else:
        variables,groups,_,_,_ = model_build()
    encoder = Encoder()
    roots = []
    for group,clauses in groups.items():
        for clause in clauses:
            lit = encoder.encode(clause)
            encoder.clauses.append([lit])
            roots.append({'group':group,'literal':lit})
    text = f'p cnf {encoder.count} {len(encoder.clauses)}\n'
    text += ''.join(' '.join(map(str,clause))+' 0\n' for clause in encoder.clauses)
    (ROOT/f'{prefix}.cnf').write_text(text)
    (ROOT/f'{prefix}_gates.json').write_text(json.dumps({'variables':encoder.variables,'gates':encoder.gates,'roots':roots},indent=2))
    result = {'variables':encoder.count,'clauses':len(encoder.clauses),'gates':len(encoder.gates),
              'exhaustive_small_truth_assignments':checks,
              'sha256':hashlib.sha256((ROOT/f'{prefix}.cnf').read_bytes()).hexdigest(),
              'normalized_lf_sha256':hashlib.sha256(text.encode()).hexdigest(),
              'scope':'Explicit gate encoding. No SAT/UNSAT or universal conclusion yet.'}
    (ROOT/f'{prefix}_export.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result))


if __name__ == '__main__':
    main()
