from pathlib import Path
import json
ROOT=Path(__file__).resolve().parent
nodes=json.loads((ROOT/'source_nodes.json').read_text())
lines=['import SourceData','import PBGlobalCrossings','import PBGlobalA2Fast','import CircuitExclusion','',
       'namespace Stick81','open Circuit Counter LocalReduction SourceSemantics','',
       'set_option maxRecDepth 100000','set_option maxHeartbeats 0','']
for name,idx,ns in [('A2',23563,'PBGlobalA2Fast'),('Crossings',23564,'PBGlobalCrossings')]:
    node=nodes[idx]; bound,*weights=node['parameters']
    if not weights: weights=[1]*len(node['children'])
    ts=','.join(f'(({j},true),({w} : Int))' for j,w in zip(node['children'],weights))
    enc=node['encoding']; literal=f'({abs(enc)-1},{"true" if enc>0 else "false"})'
    tag='pbEq' if name=='A2' else 'pbGe'
    lines += [f'def source{name}Terms : List (Lit × Int) := [{ts}]',
              f'theorem source{name}Shape : (nodeAt sourceNodes {idx}).op =',
              f'    .{tag} source{name}Terms ({bound}) := by native_decide',
              f'theorem source{name}Encoding : encoding sourceNodes {idx} = {literal} := by native_decide',
              f'theorem source{name}Subst : substWeights (encoding sourceNodes) source{name}Terms =',
              f'    {ns}.terms := by native_decide','']
    lines += [f'theorem source{name}_model (σ : Nat → Bool) (hzero : σ 0=true)',
              '    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :',
              f'    val σ (encoding sourceNodes {idx}) = (nodeAt sourceNodes {idx}).op.eval σ',
              '      (fun j => val σ (encoding sourceNodes j)) := by',
              f'  rw [source{name}Shape,source{name}Encoding]',
              f'  have h := {ns}.source_equivalence σ hzero models',
              f'  rw [← source{name}Subst,weighted_subst] at h',
              '  have hi : val σ '+literal+' = true ↔',
              '      NodeOp.eval σ (fun j => val σ (encoding sourceNodes j))',
              f'        (.{tag} source{name}Terms ({bound})) = true := by',
              '    simpa only [NodeOp.eval,decide_eq_true_eq] using h',
              '  cases hl : val σ '+literal+' <;>',
              '    cases hr : NodeOp.eval σ (fun j => val σ (encoding sourceNodes j))',
              f'      (.{tag} source{name}Terms ({bound})) <;> simp_all','']
lines += ['theorem circuit_source_model (σ : Nat → Bool) (hzero : σ 0=true)',
          '    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :',
          '    Models sourceNodes σ (fun j => val σ (encoding sourceNodes j)) := by',
          '  intro i',
          '  by_cases hi : i.val < 23563',
          '  · exact core_nodes_model σ hzero models ⟨i.val,hi⟩',
          '  · have hn := i.isLt',
          '    have hcount := sourceNodeCount',
          '    have hs : i.val=23563 ∨ i.val=23564 := by omega',
          '    rcases hs with hs | hs',
          '    · simpa only [hs] using sourceA2_model σ hzero models',
          '    · simpa only [hs] using sourceCrossings_model σ hzero models','',
          'theorem run_source_model (ρ : Nat → Bool) (hzero : ρ 0=true) :',
          '    Models sourceNodes ρ (fun j => val (run ρ roofGates) (encoding sourceNodes j)) := by',
          '  let σ := run ρ roofGates',
          '  have hz : σ 0=true := by',
          '    dsimp [σ]',
          '    rw [run_preserves ρ roofGates 1 0 gatesAboveZero (by decide),hzero]',
          '  have hm := gate_values_of_sat σ roofGates (run_satisfies ρ roofGates 0 roofGates_ordered)',
          '  have hs := circuit_source_model σ hz hm',
          '  intro i',
          '  refine (hs i).trans ?_',
          '  cases hop : (nodeAt sourceNodes i.val).op with',
          '  | input v =>',
          '    change σ v=ρ v',
          '    apply circuit_preserves_unused',
          '    have hu := sourceInputsUnused i',
          '    simpa only [hop,InputUnused] using hu',
          '  | boolean op => rfl',
          '  | pbEq ts k => rfl',
          '  | pbGe ts k => rfl','',
          'theorem source_formula_unsat (ρ values : Nat → Bool) (hzero : ρ 0=true)',
          '    (hm : Models sourceNodes ρ values)',
          '    (hr : ∀ i ∈ sourceRootIndices, values i=true) : False := by',
          '  have he := models_unique sourceNodes sourceOrdered ρ values',
          '    (fun j => val (run ρ roofGates) (encoding sourceNodes j)) hm (run_source_model ρ hzero)',
          '  apply circuit_roots_impossible ρ',
          '  intro a ha',
          '  rw [sourceRoots_encoding] at ha',
          '  rcases List.mem_cons.mp ha with ha | ha',
          '  · subst a',
          '    simp [val,run_preserves ρ roofGates 1 0 gatesAboveZero (by decide),hzero]',
          '  · obtain ⟨i,hi,rfl⟩ := List.mem_map.mp ha',
          '    exact (he ⟨i,sourceRoots_inBounds i hi⟩).symm.trans (hr i hi)','',
          '#print axioms source_formula_unsat','end Stick81','']
(ROOT/'SourceCorrect.lean').write_text('\n'.join(lines),encoding='utf-8')
print('Generated SourceCorrect.lean')
