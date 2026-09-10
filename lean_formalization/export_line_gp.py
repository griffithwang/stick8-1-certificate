from pathlib import Path
from itertools import combinations
import json
ROOT=Path(__file__).resolve().parent
roots=json.loads((ROOT/'source_roots.json').read_text())
configs=[]
for common in range(8):
    for four in combinations([i for i in range(8) if i!=common],4): configs.append((common,*four))
selected=[r for r in roots if r['group']=='line_GP']
assert len(configs)==len(selected)==280
lines=['import LineGPGeometry','import SourceData','',
       'namespace Stick81.LineGP','open Geometry RoofFrame GeometricInput Expression SourceSemantics','',
       'structure Case where','  edges : List (Fin 8)','  root : Nat','',
       'def Case.q (c : Case) (i : Fin 5) : Fin 8 := c.edges.getD i.val 0','',
       'def cases : List Case := [',
       ',\n'.join('⟨['+','.join(map(str,q))+'],'+str(r['node'])+'⟩' for q,r in zip(configs,selected)),']','',
       'def Case.Valid (c : Case) : Prop := c.edges.length=5 ∧ Function.Injective c.q ∧',
       '  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (LineDefinitions.gpExpr c.q)',
       'instance (c : Case) : Decidable c.Valid :=',
       '  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 5, c.q a=c.q b → a=b) ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       'theorem caseCount : cases.length=280 := by native_decide',
       'theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 1260).take 280 := by native_decide','',
       'theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  obtain ⟨hlen,hinj,hbound,hex⟩ := hv',
       '  have he := expand_sound 64 sourceNodes f.input values hm c.root (LineDefinitions.gpExpr c.q) hex',
       '  exact he.symm.trans (LineDefinitions.gp_geometric f.points f.pointGeneric f.lineGeneric c.q hinj)','',
       'theorem all_line_gp_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :',
       '    ∀ i ∈ (sourceRootIndices.drop 1260).take 280, values i=true := by',
       '  intro i hi',
       '  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi',
       '  exact root_true f values hm c hc','',
       '#print axioms all_line_gp_roots','end Stick81.LineGP','']
(ROOT/'LineGP.lean').write_text('\n'.join(lines),encoding='utf-8')
print('Generated 280 line GP case certificates')
