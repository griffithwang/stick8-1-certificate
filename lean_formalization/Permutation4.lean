import ProjectiveAlgebra
import SignRules

namespace Stick81.Permutation4
open Geometry SignRules

def permTable : List (List (Fin 4)) := [[0,1,2,3],
[0,1,3,2],
[0,2,1,3],
[0,2,3,1],
[0,3,1,2],
[0,3,2,1],
[1,0,2,3],
[1,0,3,2],
[1,2,0,3],
[1,2,3,0],
[1,3,0,2],
[1,3,2,0],
[2,0,1,3],
[2,0,3,1],
[2,1,0,3],
[2,1,3,0],
[2,3,0,1],
[2,3,1,0],
[3,0,1,2],
[3,0,2,1],
[3,1,0,2],
[3,1,2,0],
[3,2,0,1],
[3,2,1,0]]
def evenTable : List Bool := [true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true]

def perm (p : Fin 24) (i : Fin 4) : Fin 4 := (permTable.getD p.val []).getD i.val 0
def even (p : Fin 24) : Bool := evenTable.getD p.val true

set_option maxHeartbeats 0 in
theorem determinant_permuted (v : Fin 4 → V4) (p : Fin 24) :
    det4 (v (perm p 0)) (v (perm p 1)) (v (perm p 2)) (v (perm p 3)) =
      if even p then det4 (v 0) (v 1) (v 2) (v 3) else -det4 (v 0) (v 1) (v 2) (v 3) := by
  fin_cases p
  · change det4 (v 0) (v 1) (v 2) (v 3) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 0) (v 1) (v 3) (v 2) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 0) (v 2) (v 1) (v 3) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 0) (v 2) (v 3) (v 1) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 0) (v 3) (v 1) (v 2) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 0) (v 3) (v 2) (v 1) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 1) (v 0) (v 2) (v 3) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 1) (v 0) (v 3) (v 2) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 1) (v 2) (v 0) (v 3) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 1) (v 2) (v 3) (v 0) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 1) (v 3) (v 0) (v 2) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 1) (v 3) (v 2) (v 0) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 2) (v 0) (v 1) (v 3) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 2) (v 0) (v 3) (v 1) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 2) (v 1) (v 0) (v 3) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 2) (v 1) (v 3) (v 0) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 2) (v 3) (v 0) (v 1) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 2) (v 3) (v 1) (v 0) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 3) (v 0) (v 1) (v 2) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 3) (v 0) (v 2) (v 1) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 3) (v 1) (v 0) (v 2) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 3) (v 1) (v 2) (v 0) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 3) (v 2) (v 0) (v 1) = -det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring
  · change det4 (v 3) (v 2) (v 1) (v 0) = det4 (v 0) (v 1) (v 2) (v 3)
    simp only [det4,det3,dot,cross] <;> ring

def sorted (q : Fin 4 → Fin 9) (i : Fin 4) : Fin 9 :=
  ((List.ofFn q).mergeSort (fun a b => decide (a ≤ b))).getD i.val 0
def findPerm (q : Fin 4 → Fin 9) : Fin 24 :=
  ((List.finRange 24).find? (fun p => (List.finRange 4).all
    (fun i => q i == sorted q (perm p i)))).getD 0

def SortFacts : Prop := ∀ q : Fin 4 → Fin 9, Function.Injective q →
  (sorted q 0 < sorted q 1 ∧ sorted q 1 < sorted q 2 ∧ sorted q 2 < sorted q 3) ∧
  Function.Injective (sorted q) ∧ ∀ i, q i=sorted q (perm (findPerm q) i)

theorem sorting_verified : SortFacts := by unfold SortFacts Function.Injective; native_decide

end Stick81.Permutation4
