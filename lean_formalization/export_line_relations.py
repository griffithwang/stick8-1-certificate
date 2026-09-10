from pathlib import Path
from itertools import combinations
import json
ROOT=Path(__file__).resolve().parent
roots=json.loads((ROOT/'source_roots.json').read_text())
def adjacent(a,b): return a==b or (a-b)%8 in (1,7)
independent=[q for q in combinations(range(8),3) if all(not adjacent(a,b) for a,b in combinations(q,2))]
bracket=[q[s:]+q[:s] for q in independent for s in range(3)]
incidence=[]
for q in combinations(range(8),3):
    for a,b in combinations(q,2):
        if adjacent(a,b):
            if (a+1)%8!=b: a,b=b,a
            incidence.append((next(i for i in q if i not in (a,b)),a,b))
for name,group,configs,start,expr,guard,geo in [
    ('LineBracket','line_bracket_identity',bracket,1540,'bracketExpr','LineDefinitions.independent c.q=true','bracket_geometric'),
    ('LineIncidence','line_incidence',incidence,1785,'incidenceExpr','next (c.q 1)=c.q 2','incidence_geometric')]:
    selected=[r for r in roots if r['group']==group]
    assert len(configs)==len(selected)==48
    lines=['import LineRelations','import SourceData','',f'namespace Stick81.{name}',
       'open Geometry RoofFrame GeometricInput Expression SourceSemantics LineRelations','',
       'structure Case where','  edges : List (Fin 8)','  root : Nat','',
       'def Case.q (c : Case) (i : Fin 3) : Fin 8 := c.edges.getD i.val 0','',
       'def cases : List Case := [',
       ',\n'.join('⟨['+','.join(map(str,q))+'],'+str(r['node'])+'⟩' for q,r in zip(configs,selected)),']','',
       f'def Case.Valid (c : Case) : Prop := c.edges.length=3 ∧ Function.Injective c.q ∧ {guard} ∧',
       f'  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some ({expr} c.q)',
       'instance (c : Case) : Decidable c.Valid :=',
       '  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 3, c.q a=c.q b → a=b) ∧ _ ∧ _ ∧ _))','',
       'theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide',
       'theorem caseCount : cases.length=48 := by native_decide',
       f'theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop {start}).take 48 := by native_decide','',
       'theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)',
       '    (c : Case) (hc : c ∈ cases) : values c.root=true := by',
       '  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)',
       '  obtain ⟨hlen,hinj,hguard,hbound,hex⟩ := hv',
       f'  have he := expand_sound 64 sourceNodes f.input values hm c.root ({expr} c.q) hex',
       f'  exact he.symm.trans ({geo} f c.q hinj hguard)','',
       'theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :',
       f'    ∀ i ∈ (sourceRootIndices.drop {start}).take 48, values i=true := by',
       '  intro i hi','  rw [← rootsCovered] at hi',
       '  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi','  exact root_true f values hm c hc','',
       '#print axioms all_roots',f'end Stick81.{name}','']
    (ROOT/f'{name}.lean').write_text('\n'.join(lines),encoding='utf-8')
    print(name,len(configs),'cases')
