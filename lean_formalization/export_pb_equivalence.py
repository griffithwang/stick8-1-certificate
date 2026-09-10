"""Generate fully quantified Lean goals for the two actual PB-node encodings."""
from pathlib import Path
import json
ROOT=Path(__file__).resolve().parent
nodes=json.loads((ROOT/'source_nodes.json').read_text())
gates=json.loads((ROOT.parent/'roof_direct_gates.json').read_text())['gates']
byout={g['out']:(i,g) for i,g in enumerate(gates)}

def lit(a):
    if a==1: return 'true'
    if a==-1: return 'false'
    return f'b{a}' if a>0 else f'(!b{-a})'

def gate_expr(g):
    args=list(map(lit,g['args']))
    if g['op']=='and': return '('+' && '.join(args)+')'
    if g['op']=='eq': return f'({args[0]} == {args[1]})'
    if g['op']=='majority':
        a,b,c=args
        return f'(({a} && {b}) || ({a} && {c}) || ({b} && {c}))'
    raise ValueError(g)

def balanced(xs):
    while len(xs)>1:
        xs=[f'({xs[i]} + {xs[i+1]})' if i+1<len(xs) else xs[i] for i in range(0,len(xs),2)]
    return xs[0] if xs else '0'

for node in nodes[-2:]:
    args=[nodes[j]['encoding'] for j in node['children']]
    cut={1,*map(abs,args)}; used=set()
    def rec(v):
        if v in cut: return
        i,g=byout[v]
        if i in used: return
        for a in g['args']: rec(abs(a))
        used.add(i)
    rec(abs(node['encoding']))
    bound,*weights=node['parameters']
    equality=len(weights)>0
    if not weights: weights=[1]*len(args)
    expanded=[]
    for a,w in zip(args,weights):
        if w<0:
            bound-=w; expanded.extend([-a]*(-w))
        else: expanded.extend([a]*w)
    bound-=expanded.count(1)
    expanded=[a for a in expanded if abs(a)!=1]
    width=max(1,len(expanded).bit_length())
    variables=sorted((cut|{gates[i]['out'] for i in used})-{1})
    name='A2' if equality else 'Crossings'
    total=balanced([f'(if {lit(a)} then (1 : BitVec {width}) else 0)' for a in expanded])
    target=f'({total} == ({bound} : BitVec {width}))' if equality else f'(({bound} : BitVec {width}).ule {total})'
    lines=['import Lean','',f'namespace Stick81.PB{name}','',
           'set_option maxRecDepth 100000',
           'set_option maxHeartbeats 0','',
           'theorem local_equivalence ('+' '.join('b'+str(v) for v in variables)+' : Bool)']
    for i in sorted(used):
        g=gates[i]
        lines.append(f'    (h{i} : b{g["out"]} = {gate_expr(g)})')
    lines += [f'    : {lit(node["encoding"])} = {target} := by',
              '  bv_decide? (config := { timeout := 120 })', '', '#print axioms local_equivalence',f'end Stick81.PB{name}','']
    proof_line=next(i+1 for i,line in enumerate(lines) if 'bv_decide?' in line)
    cert=f'PB{name}.lean-Stick81.PB{name}.local_equivalence-{proof_line}-2.lrat'
    if (ROOT/cert).exists():
        lines[proof_line-1]=f'  bv_check (config := {{ timeout := 120 }}) "{cert}"'
    (ROOT/f'PB{name}.lean').write_text('\n'.join(lines),encoding='utf-8')
    report={'source_node':node['index'],'boundary_variables':len(cut)-1,'local_gates':len(used),
            'expanded_nonconstant_terms':len(expanded),'adjusted_bound':bound,'bit_width':width,
            'equality':equality,'expanded_literals':expanded,'gate_indices':sorted(used)}
    (ROOT/f'pb_{name.lower()}.json').write_text(json.dumps(report,indent=2))
    print(json.dumps({k:v for k,v in report.items() if k not in ('expanded_literals','gate_indices')}))
