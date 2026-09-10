from pathlib import Path
from itertools import combinations
import json
ROOT=Path(__file__).resolve().parent
roots=json.loads((ROOT/'source_roots.json').read_text())
def adjacent(a,b): return a==b or (a-b)%8 in (1,7)
configs=[(i,j) for i,j in combinations(range(8),2) if not adjacent(i,j)]
selected=[r for r in roots if r['group']=='crossing_directions']
assert len(configs)==len(selected)==20
lines=['import CrossingGeometry','import SourceData','', 'namespace Stick81.DirectionRoots',
       'open Geometry RoofFrame Expression SourceSemantics','',
       'structure Case where','  i : Fin 8','  j : Fin 8','  root : Nat','',
       'def cases : List Case := [',
       ',\n'.join(f'⟨{i},{j},{r["node"]}⟩' for (i,j),r in zip(configs,selected)),']','',
       'def Case.Valid (c : Case) : Prop := c.i<c.j ∧ LineDefinitions.adjacent c.i c.j=false ∧',
       '  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (CrossingGeometry.constraint c.i c.j)',
       'instance (c : Case) : Decidable c.Valid := inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       'theorem caseCount : cases.length=20 := by native_decide',
       'theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 2192).take 20 := by native_decide','',
       'theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  obtain ⟨hlt,hadj,hbound,hex⟩ := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  exact (expand_sound 64 sourceNodes f.input values hm c.root _ hex).symm.trans',
       '    (CrossingGeometry.geometric f c.i c.j hadj)','',
       'theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :',
       '    ∀ i ∈ (sourceRootIndices.drop 2192).take 20, values i=true := by',
       '  intro i hi','  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi','  exact root_true f values hm c hc','',
       '#print axioms all_roots','end Stick81.DirectionRoots','']
(ROOT/'DirectionRoots.lean').write_text('\n'.join(lines),encoding='utf-8')
configs=[]
for i in range(8):
    for partners in combinations([j for j in range(8) if not adjacent(i,j)],3): configs.append((i,*partners))
selected=[r for r in roots if r['group']=='event_transitivity']
assert len(configs)==len(selected)==80
lines=['import CrossingOrder','import SourceData','', 'namespace Stick81.OrderRoots',
       'open Geometry RoofFrame Expression SourceSemantics','',
       'structure Case where','  edges : List (Fin 8)','  root : Nat',
       'def Case.q (c : Case) (i : Fin 4) : Fin 8 := c.edges.getD i.val 0','',
       'def cases : List Case := [',
       ',\n'.join('⟨['+','.join(map(str,q))+'],'+str(r['node'])+'⟩' for q,r in zip(configs,selected)),']','',
       'def Case.Valid (c : Case) : Prop := c.edges.length=4 ∧ Function.Injective c.q ∧',
       '  LineDefinitions.adjacent (c.q 0) (c.q 1)=false ∧ LineDefinitions.adjacent (c.q 0) (c.q 2)=false ∧',
       '  LineDefinitions.adjacent (c.q 0) (c.q 3)=false ∧ c.root<sourceNodes.size ∧',
       '  expand 64 sourceNodes c.root=some (CrossingOrder.constraint c.q)',
       'instance (c : Case) : Decidable c.Valid :=',
       '  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 4, c.q a=c.q b → a=b) ∧ _ ∧ _ ∧ _ ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       'theorem caseCount : cases.length=80 := by native_decide',
       'theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 2212).take 80 := by native_decide','',
       'theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  obtain ⟨hlen,hinj,h1,h2,h3,hbound,hex⟩ := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  exact (expand_sound 64 sourceNodes f.input values hm c.root _ hex).symm.trans',
       '    (CrossingOrder.geometric f c.q hinj h1 h2 h3)','',
       'theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :',
       '    ∀ i ∈ (sourceRootIndices.drop 2212).take 80, values i=true := by',
       '  intro i hi','  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi','  exact root_true f values hm c hc','',
       '#print axioms all_roots','end Stick81.OrderRoots','']
(ROOT/'OrderRoots.lean').write_text('\n'.join(lines),encoding='utf-8')
print('Generated 20 direction and 80 ordering root cases')
