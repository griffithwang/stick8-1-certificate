from pathlib import Path
from itertools import combinations
import json
ROOT=Path(__file__).resolve().parent
roots=json.loads((ROOT/'source_roots.json').read_text())
configs=[]
for common in combinations(range(9),2):
    rest=[i for i in range(9) if i not in common]
    for four in combinations(rest,4): configs.append((*common,*four))
selected=[r for r in roots if r['group']=='point_GP']
assert len(selected)==len(configs)==1260
lines=['import ChiGeometry','import SourceData','',
       'namespace Stick81.PointGP','open Geometry GeometricInput Expression SourceSemantics','',
       'structure Case where','  points : List (Fin 9)','  root : Nat','',
       'def Case.q (c : Case) (i : Fin 6) : Fin 9 := c.points.getD i.val 0','',
       'def cases : List Case := [',
       ',\n'.join('⟨['+','.join(map(str,q))+'],'+str(r['node'])+'⟩' for q,r in zip(configs,selected)),']','',
       'def Case.Valid (c : Case) : Prop :=',
       '  c.points.length=6 ∧ Function.Injective c.q ∧ c.root<sourceNodes.size ∧',
       '    expand 64 sourceNodes c.root=some (gpExpr c.q)','',
       'instance (c : Case) : Decidable c.Valid :=',
       '  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 6, c.q a=c.q b → a=b) ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       'theorem caseCount : cases.length=1260 := by native_decide',
       'theorem rootsCovered : cases.map Case.root=sourceRootIndices.take 1260 := by native_decide','',
       'theorem root_true (w : Fin 9 → V4) (l : Fin 8 → V3) (hw : GeneralPoints w)',
       '    (values : Nat → Bool) (hm : Models sourceNodes (assignment w l) values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  obtain ⟨hlen,hinj,hbound,hex⟩ := hv',
       '  have he := expand_sound 64 sourceNodes (assignment w l) values hm c.root (gpExpr c.q) hex',
       '  exact he.symm.trans (gp_geometric w l hw c.q hinj)','',
       'theorem all_point_gp_roots (w : Fin 9 → V4) (l : Fin 8 → V3) (hw : GeneralPoints w)',
       '    (values : Nat → Bool) (hm : Models sourceNodes (assignment w l) values) :',
       '    ∀ i ∈ sourceRootIndices.take 1260, values i=true := by',
       '  intro i hi',
       '  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi',
       '  exact root_true w l hw values hm c hc','',
       '#print axioms all_point_gp_roots','end Stick81.PointGP','']
(ROOT/'PointGP.lean').write_text('\n'.join(lines),encoding='utf-8')
print('Generated 1260 point GP case certificates')
