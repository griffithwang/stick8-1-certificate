from pathlib import Path
import json,sys
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent))
from wheel_stress import wheels
configs=list(wheels(7))
selected=[r for r in json.loads((ROOT/'source_roots.json').read_text()) if r['group']=='wheel_height_stress']
assert len(configs)==len(selected)==315
assert all(len(set(q))==5 and all(0<=i<7 for i in q) for q in configs)
lines=['import FiveHeight','import SourceData','', 'namespace Stick81.FiveHeightRoots',
       'open Geometry RoofFrame GeometricInput Expression SourceSemantics','',
       'structure Case where','  edges : List (Fin 7)','  root : Nat',
       'def Case.q (c : Case) (i : Fin 5) : Fin 7 := c.edges.getD i.val 0','',
       'def cases : List Case := [',
       ',\n'.join('⟨['+','.join(map(str,q))+'],'+str(r['node'])+'⟩' for q,r in zip(configs,selected)),']','',
       'def Case.Valid (c : Case) : Prop := c.edges.length=5 ∧ Function.Injective c.q ∧',
       '  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (FiveHeight.constraint c.q)',
       'instance (c : Case) : Decidable c.Valid :=',
       '  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 5, c.q a=c.q b → a=b) ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       'theorem caseCount : cases.length=315 := by native_decide',
       'theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 1868).take 315 := by native_decide','',
       'theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  obtain ⟨hlen,hinj,hbound,hex⟩ := hv',
       '  have he := expand_sound 64 sourceNodes f.input values hm c.root (FiveHeight.constraint c.q) hex',
       '  exact he.symm.trans (FiveHeight.geometric f c.q hinj)','',
       'theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :',
       '    ∀ i ∈ (sourceRootIndices.drop 1868).take 315, values i=true := by',
       '  intro i hi','  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi','  exact root_true f values hm c hc','',
       '#print axioms all_roots','end Stick81.FiveHeightRoots','']
(ROOT/'FiveHeightRoots.lean').write_text('\n'.join(lines),encoding='utf-8')
print('Generated 315 five-line height root cases')
