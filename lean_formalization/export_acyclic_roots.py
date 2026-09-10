from pathlib import Path
from itertools import combinations
import json
ROOT=Path(__file__).resolve().parent
roots=json.loads((ROOT/'source_roots.json').read_text())
for name,geo,group,n,k,start,positive in [
    ('AcyclicRoots','HomogeneousAcyclic','acyclic',9,5,1588,True),
    ('ProjectedAcyclicRoots','ProjectedAcyclic','projected_acyclic',8,4,1714,False)]:
    configs=list(combinations(range(n),k)); selected=[r for r in roots if r['group']==group]
    assert len(configs)==len(selected)
    count=len(configs)
    extra=' (hp : f.Positive)' if positive else ''
    extra_arg=' hp' if positive else ''
    geom_call=f'{geo}.frame_geometric f hp c.q hinj' if positive else f'{geo}.geometric f c.q hinj'
    lines=[f'import {geo}','import SourceData','',f'namespace Stick81.{name}',
       'open Geometry RoofFrame GeometricInput Expression SourceSemantics','',
       'structure Case where',f'  points : List (Fin {n})','  root : Nat','',
       f'def Case.q (c : Case) (i : Fin {k}) : Fin {n} := c.points.getD i.val 0','',
       'def cases : List Case := [',
       ',\n'.join('⟨['+','.join(map(str,q))+'],'+str(r['node'])+'⟩' for q,r in zip(configs,selected)),']','',
       f'def Case.Valid (c : Case) : Prop := c.points.length={k} ∧ Function.Injective c.q ∧',
       f'  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some ({geo}.constraint c.q)',
       'instance (c : Case) : Decidable c.Valid :=',
       f'  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin {k}, c.q a=c.q b → a=b) ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       f'theorem caseCount : cases.length={count} := by native_decide',
       f'theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop {start}).take {count} := by native_decide','',
       f'theorem root_true (f : Frame){extra} (values : Nat → Bool) (hm : Models sourceNodes f.input values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  obtain ⟨hlen,hinj,hbound,hex⟩ := hv',
       f'  have he := expand_sound 64 sourceNodes f.input values hm c.root ({geo}.constraint c.q) hex',
       f'  exact he.symm.trans ({geom_call})','',
       f'theorem all_roots (f : Frame){extra} (values : Nat → Bool) (hm : Models sourceNodes f.input values) :',
       f'    ∀ i ∈ (sourceRootIndices.drop {start}).take {count}, values i=true := by',
       '  intro i hi','  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi',
       f'  exact root_true f{extra_arg} values hm c hc','',
       '#print axioms all_roots',f'end Stick81.{name}','']
    (ROOT/f'{name}.lean').write_text('\n'.join(lines),encoding='utf-8')
    print(name,count,'cases')
root=next(r['node'] for r in roots if r['group']=='normalization')
lines=['import RoofFrame','import SourceData','', 'namespace Stick81.NormalizationRoot',
       'open Geometry RoofFrame GeometricInput SignRules Expression SourceSemantics','',
       'def Normalized (f : Frame) : Prop := 0<orient (f.points 0) (f.points 1) (f.points 2)',
       'def expr : Expr := orientExpr ![0,1,2]',f'def root : Nat := {root}','',
       'theorem shape : expand 64 sourceNodes root=some expr := by native_decide',
       'theorem rootsCovered : [root]=(sourceRootIndices.drop 1784).take 1 := by native_decide','',
       'theorem geometric (f : Frame) (hn : Normalized f) : expr.eval f.input=true := by',
       '  have h := orient_correct f.points f.pointGeneric ![0,1,2] (by decide)',
       '  exact h.trans (by simpa [positive] using hn)','',
       'theorem all_roots (f : Frame) (hn : Normalized f) (values : Nat → Bool)',
       '    (hm : Models sourceNodes f.input values) :',
       '    ∀ i ∈ (sourceRootIndices.drop 1784).take 1, values i=true := by',
       '  intro i hi','  rw [← rootsCovered] at hi',
       '  have hroot : i=root := by simpa using hi','  subst i',
       '  exact (expand_sound 64 sourceNodes f.input values hm root expr shape).symm.trans (geometric f hn)','',
       '#print axioms all_roots','end Stick81.NormalizationRoot','']
(ROOT/'NormalizationRoot.lean').write_text('\n'.join(lines),encoding='utf-8')
print('NormalizationRoot 1 case')
