from pathlib import Path
from itertools import permutations
import json
ROOT=Path(__file__).resolve().parent
ps=list(permutations(range(4)))
evens=[sum(p[i]>p[j] for i in range(4) for j in range(i+1,4))%2==0 for p in ps]
lines=['import ProjectiveAlgebra','import SignRules','',
       'namespace Stick81.Permutation4','open Geometry SignRules','',
       'def permTable : List (List (Fin 4)) := ['+',\n'.join('['+','.join(map(str,p))+']' for p in ps)+']',
       'def evenTable : List Bool := ['+','.join(str(b).lower() for b in evens)+']','',
       'def perm (p : Fin 24) (i : Fin 4) : Fin 4 := (permTable.getD p.val []).getD i.val 0',
       'def even (p : Fin 24) : Bool := evenTable.getD p.val true','',
       'set_option maxHeartbeats 0 in',
       'theorem determinant_permuted (v : Fin 4 → V4) (p : Fin 24) :',
       '    det4 (v (perm p 0)) (v (perm p 1)) (v (perm p 2)) (v (perm p 3)) =',
       '      if even p then det4 (v 0) (v 1) (v 2) (v 3) else -det4 (v 0) (v 1) (v 2) (v 3) := by',
       '  fin_cases p',
       *[f'  · change det4 (v {p[0]}) (v {p[1]}) (v {p[2]}) (v {p[3]}) = '+
         ('' if ev else '-')+'det4 (v 0) (v 1) (v 2) (v 3)\n'+
         '    simp only [det4,det3,dot,cross] <;> ring' for p,ev in zip(ps,evens)],'',
       'def sorted (q : Fin 4 → Fin 9) (i : Fin 4) : Fin 9 :=',
       '  ((List.ofFn q).mergeSort (fun a b => decide (a ≤ b))).getD i.val 0',
       'def findPerm (q : Fin 4 → Fin 9) : Fin 24 :=',
       '  ((List.finRange 24).find? (fun p => (List.finRange 4).all',
       '    (fun i => q i == sorted q (perm p i)))).getD 0','',
       'def SortFacts : Prop := ∀ q : Fin 4 → Fin 9, Function.Injective q →',
       '  (sorted q 0 < sorted q 1 ∧ sorted q 1 < sorted q 2 ∧ sorted q 2 < sorted q 3) ∧',
       '  Function.Injective (sorted q) ∧ ∀ i, q i=sorted q (perm (findPerm q) i)','',
       'theorem sorting_verified : SortFacts := by unfold SortFacts Function.Injective; native_decide','',
       'end Stick81.Permutation4','']
(ROOT/'Permutation4.lean').write_text('\n'.join(lines),encoding='utf-8')
inputs=json.loads((ROOT/'input_map.json').read_text())
lines=['import Permutation4','import Expression','',
       'namespace Stick81.GeometricInput','open Geometry SignRules Expression Permutation4','',
       'inductive Atom where','  | point (a b c d : Fin 9)','  | line (a b c : Fin 8)',
       '  deriving Repr, DecidableEq, BEq','',
       'def inputAtoms : List (Nat × Atom) := [']
rows=[]
for key,ident in inputs.items():
    tag,*indices=key.split('_'); indices=list(map(int,indices))
    assert all(0<=i<(9 if tag=='RV' else 8) for i in indices)
    ctor='point' if tag=='RV' else 'line'
    rows.append(f'({ident},.{ctor} '+ ' '.join(map(str,indices))+')')
lines += [',\n'.join(rows),']','',
          'def lookupAtom (i : Nat) : Option Atom := (inputAtoms.find? (fun p => p.1==i)).map Prod.snd',
          'def pointVar (a b c d : Fin 9) : Nat :=',
          '  ((inputAtoms.find? (fun p => p.2==Atom.point a b c d)).map Prod.fst).getD 0','',
          'theorem lookup_zero : lookupAtom 0=none := by native_decide',
          'theorem point_lookup : ∀ a b c d : Fin 9, a<b → b<c → c<d →',
          '    lookupAtom (pointVar a b c d)=some (.point a b c d) := by native_decide','',
          'noncomputable def Atom.eval (w : Fin 9 → V4) (l : Fin 8 → V3) : Atom → Bool',
          '  | .point a b c d => positive (-det4 (w a) (w b) (w c) (w d))',
          '  | .line a b c => positive (det3 (l a) (l b) (l c))','',
          'noncomputable def assignment (w : Fin 9 → V4) (l : Fin 8 → V3) (i : Nat) : Bool :=',
          '  match lookupAtom i with',
          '  | some a => a.eval w l',
          '  | none => decide (i=0)','',
          'theorem assignment_zero (w : Fin 9 → V4) (l : Fin 8 → V3) : assignment w l 0=true := by',
          '  simp [assignment,lookup_zero]','',
          'theorem assignment_point (w : Fin 9 → V4) (l : Fin 8 → V3) (a b c d : Fin 9)',
          '    (hab : a<b) (hbc : b<c) (hcd : c<d) :',
          '    assignment w l (pointVar a b c d)=positive (-det4 (w a) (w b) (w c) (w d)) := by',
          '  unfold assignment',
          '  rw [point_lookup a b c d hab hbc hcd]',
          '  rfl','',
          'def chiExpr (q : Fin 4 → Fin 9) : Expr :=',
          '  let atom := Expr.atom (pointVar (sorted q 0) (sorted q 1) (sorted q 2) (sorted q 3))',
          '  if even (findPerm q) then atom else .not atom','',
          'end Stick81.GeometricInput','']
(ROOT/'GeometricInput.lean').write_text('\n'.join(lines),encoding='utf-8')
print('Generated permutation and geometric input definitions')
