"""Generate checked global-model applications of the finite PB theorems."""
from pathlib import Path
import json,argparse
ROOT=Path(__file__).resolve().parent
ap=argparse.ArgumentParser()
ap.add_argument('--fast',action='store_true')
ap.add_argument('--legacy',action='store_true')
ap.add_argument('--only',choices=['Crossings','A2'])
options=ap.parse_args()
nodes=json.loads((ROOT/'source_nodes.json').read_text())
gates=json.loads((ROOT.parent/'roof_direct_gates.json').read_text())['gates']

def lit(a): return f'({abs(a)-1},{"true" if a>0 else "false"})'
def gate(g):
    args=list(map(lit,g['args']))
    op=f'.and [{",".join(args)}]' if g['op']=='and' else '.'+g['op']+' '+' '.join(args)
    return f'⟨{g["out"]-1},{op}⟩'
def tree(xs):
    xs=[f'(.leaf {lit(a)})' for a in xs]
    if not xs: return '.zero'
    while len(xs)>1:
        xs=[f'(.fork {xs[i]} {xs[i+1]})' if i+1<len(xs) else xs[i] for i in range(0,len(xs),2)]
    return xs[0]

for name in ('Crossings','A2'):
    if options.only and options.only!=name: continue
    fast_mode=options.fast or (name=='A2' and not options.legacy)
    module_name=name+('Fast' if fast_mode else '')
    report=json.loads((ROOT/f'pb_{name.lower()}.json').read_text())
    node=nodes[report['source_node']]
    args=[nodes[j]['encoding'] for j in node['children']]
    target,*weights=node['parameters']
    if not weights: weights=[1]*len(args)
    gids=report['gate_indices']
    variables=sorted(({abs(a) for a in args}|{gates[i]['out'] for i in gids})-{1})
    offset=sum(max(-w,0) for w in weights)
    expanded=[]
    for a,w in zip(args,weights): expanded.extend([a if w>=0 else -a]*abs(w))
    constants=expanded.count(1)
    bound=report['adjusted_bound']; width=report['bit_width']; equality=report['equality']
    lines=[f'import PB{name}','import CounterBV','import CircuitData','',
           f'namespace Stick81.PBGlobal{module_name}','open Circuit Counter','',
           'set_option maxRecDepth 100000','set_option maxHeartbeats 0','',
           'def localGates : List Gate := [',',\n'.join(gate(gates[i]) for i in gids),']','',
           'theorem gates_sublist : localGates.Sublist roofGates := by native_decide','',
           'def terms : List (Lit × Int) := [',
           ',\n'.join(f'({lit(a)},({w} : Int))' for a,w in zip(args,weights)),']','',
           f'def sumTree : SumTree Lit := {tree(report["expanded_literals"])}','',
           'theorem leaves_normalized : sumTree.leaves =',
           '    (expandLiteralWeights terms).filter (fun a => a.1 != 0) := by native_decide',
           f'theorem negative_offset : literalNegativeOffset terms = {offset} := by native_decide',
           f'theorem true_constants : (expandLiteralWeights terms).count (0,true) = {constants} := by native_decide','']
    result=f'(sumTree.evalBV {width} (val σ) == ({bound} : BitVec {width}))' if equality else f'(({bound} : BitVec {width}).ule (sumTree.evalBV {width} (val σ)))'
    lines += ['theorem global_equivalence (σ : Nat → Bool) (hzero : σ 0=true)',
              '    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :',
              f'    val σ {lit(node["encoding"])} = {result} := by']
    if not fast_mode:
        lines += ['  have hh : ∀ g ∈ localGates, σ g.out=g.op.eval σ :=',
              '    fun g hg => models g (gates_sublist.subset hg)',
              '  simp only [localGates,List.forall_mem_cons] at hh',
              '  rcases hh with ⟨'+','.join(f'h{i}' for i in range(len(gids)))+',_⟩']
    lines += [f'  have hp := PB{name}.local_equivalence']
    lines += [f'    (σ {v-1})' for v in variables]
    if fast_mode:
        for gi in gids:
            g=gate(gates[gi])
            lines += [f'    (by have hg : ({g} : Gate) ∈ localGates := by native_decide',
                      f'        simpa [Op.eval,val,hzero,Bool.and_assoc] using models {g} (gates_sublist.subset hg))']
    else:
        lines += [f'    (by simpa [Op.eval,val,hzero,Bool.and_assoc] using h{i})' for i in range(len(gids))]
    lines += ['  simpa [sumTree,SumTree.evalBV,val,hzero] using hp','']
    goal=f'literalWeightedValue σ terms = ({target} : Int)' if equality else f'({target} : Int) ≤ literalWeightedValue σ terms'
    conversion='sumTree_eq_correct' if equality else 'sumTree_ge_correct'
    lines += ['theorem source_equivalence (σ : Nat → Bool) (hzero : σ 0=true)',
              '    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :',
              f'    val σ {lit(node["encoding"])}=true ↔ {goal} := by',
              '  rw [global_equivalence σ hzero models]',
              f'  refine ({conversion} sumTree {width} (val σ) {bound} (by decide) (by decide)).trans ?_',
              '  have hn := literal_normalization σ hzero terms',
              '  rw [← leaves_normalized,negative_offset,true_constants] at hn',
              '  omega','', '#print axioms source_equivalence',f'end Stick81.PBGlobal{module_name}','']
    (ROOT/f'PBGlobal{module_name}.lean').write_text('\n'.join(lines),encoding='utf-8')
    print(name,'gates',len(gids),'offset',offset,'constants',constants)
