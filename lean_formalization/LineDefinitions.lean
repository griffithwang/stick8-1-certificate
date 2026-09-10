import RoofFrame

namespace Stick81.LineDefinitions
open Geometry RoofFrame GeometricInput SignRules Expression

def permTable : List (List (Fin 3)) := [[0,1,2],
[0,2,1],
[1,0,2],
[1,2,0],
[2,0,1],
[2,1,0]]
def evenTable : List Bool := [true,false,false,true,true,false]
def perm (p : Fin 6) (i : Fin 3) : Fin 3 := (permTable.getD p.val []).getD i.val 0
def even (p : Fin 6) : Bool := evenTable.getD p.val true

theorem determinant_permuted (v : Fin 3 → V3) (p : Fin 6) :
    det3 (v (perm p 0)) (v (perm p 1)) (v (perm p 2)) =
      if even p then det3 (v 0) (v 1) (v 2) else -det3 (v 0) (v 1) (v 2) := by
  fin_cases p
  · change det3 (v 0) (v 1) (v 2) = det3 (v 0) (v 1) (v 2)
    rfl
  · change det3 (v 0) (v 2) (v 1) = -det3 (v 0) (v 1) (v 2)
    simp only [det3,dot,cross]
    ring
  · change det3 (v 1) (v 0) (v 2) = -det3 (v 0) (v 1) (v 2)
    simp only [det3,dot,cross]
    ring
  · change det3 (v 1) (v 2) (v 0) = det3 (v 0) (v 1) (v 2)
    simp only [det3,dot,cross]
    ring
  · change det3 (v 2) (v 0) (v 1) = det3 (v 0) (v 1) (v 2)
    simp only [det3,dot,cross]
    ring
  · change det3 (v 2) (v 1) (v 0) = -det3 (v 0) (v 1) (v 2)
    simp only [det3,dot,cross]
    ring

def adjacent (a b : Fin 8) : Bool := a==b || next a==b || next b==a
def independent (q : Fin 3 → Fin 8) : Bool :=
  (Bool.not (adjacent (q 0) (q 1))) && (Bool.not (adjacent (q 0) (q 2))) &&
    (Bool.not (adjacent (q 1) (q 2)))

def sorted (q : Fin 3 → Fin 8) (i : Fin 3) : Fin 8 :=
  ((List.ofFn q).mergeSort (fun a b => decide (a ≤ b))).getD i.val 0
def relativePerm (q base : Fin 3 → Fin 8) : Fin 6 :=
  ((List.finRange 6).find? (fun p => (List.finRange 3).all (fun i => q i==base (perm p i)))).getD 0

def adjacentOrder (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 :=
  let x := sorted q 0; let y := sorted q 1; let z := sorted q 2
  let (a,b,h) := if adjacent x y then (x,y,z) else if adjacent x z then (x,z,y) else (y,z,x)
  let (a,b) := if next a==b then (a,b) else (b,a)
  ![h,a,b]

def firstTriangle (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 :=
  ![adjacentOrder q 0,next (adjacentOrder q 0),adjacentOrder q 2]
def secondTriangle (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 :=
  ![adjacentOrder q 1,adjacentOrder q 2,next (adjacentOrder q 2)]

def SortedFacts : Prop := ∀ q : Fin 3 → Fin 8, Function.Injective q →
  (sorted q 0 < sorted q 1 ∧ sorted q 1 < sorted q 2) ∧ Function.Injective (sorted q) ∧
  independent (sorted q)=independent q ∧ ∀ i, q i=sorted q (perm (relativePerm q (sorted q)) i)
theorem sorted_verified : SortedFacts := by unfold SortedFacts Function.Injective; native_decide

def AdjacentFacts : Prop := ∀ q : Fin 3 → Fin 8, Function.Injective q → independent q=false →
  Function.Injective (adjacentOrder q) ∧ next (adjacentOrder q 1)=adjacentOrder q 2 ∧
  (∀ i, q i=adjacentOrder q (perm (relativePerm q (adjacentOrder q)) i)) ∧
  Function.Injective (firstTriangle q) ∧ Function.Injective (secondTriangle q)
theorem adjacent_verified : AdjacentFacts := by unfold AdjacentFacts Function.Injective; native_decide

def lineVar (a b c : Fin 8) : Nat :=
  ((inputAtoms.find? (fun p => p.2==Atom.line a b c)).map Prod.fst).getD 0
theorem line_lookup : ∀ a b c : Fin 8, a<b → b<c → independent ![a,b,c]=true →
  lookupAtom (lineVar a b c)=some (.line a b c) := by native_decide

def lineExpr (q : Fin 3 → Fin 8) : Expr :=
  if independent q then
    let e := Expr.atom (lineVar (sorted q 0) (sorted q 1) (sorted q 2))
    if even (relativePerm q (sorted q)) then e else .not e
  else
    let e := Expr.eq (orientExpr (firstTriangle q)) (orientExpr (secondTriangle q))
    if even (relativePerm q (adjacentOrder q)) then e else .not e

end Stick81.LineDefinitions
