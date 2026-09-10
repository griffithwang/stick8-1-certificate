import MixedSigns

namespace Stick81.ProjectedAcyclic
open Geometry RoofFrame GeometricInput SignRules Expression MixedSigns

def odd (i : Fin 4) : Bool := decide (i.val % 2=1)
def omitted (q : Fin 4 → Fin 8) (i : Fin 4) : Fin 3 → Fin 8 := q ∘ i.succAbove

theorem skip_injective : ∀ i : Fin 4, Function.Injective (i.succAbove : Fin 3 → Fin 4) := by
  unfold Function.Injective
  native_decide

def base (p : Fin 8 → V3) (q : Fin 4 → Fin 8) (i : Fin 4) : ℝ :=
  orient (p (omitted q i 0)) (p (omitted q i 1)) (p (omitted q i 2))
def coeff (p : Fin 8 → V3) (q : Fin 4 → Fin 8) (i : Fin 4) : ℝ := flipReal (odd i) (base p q i)
def coefficients (p : Fin 8 → V3) (q : Fin 4 → Fin 8) : List ℝ := List.ofFn (coeff p q)
def signs (q : Fin 4 → Fin 8) : List Expr := List.ofFn (fun i => flipExpr (odd i) (orientExpr (omitted q i)))
def constraint (q : Fin 4 → Fin 8) : Expr := mixedExpr (signs q)

theorem coefficient_sum (p : Fin 8 → V3) (q : Fin 4 → Fin 8) : (coefficients p q).sum=0 := by
  change orient (p (q 1)) (p (q 2)) (p (q 3)) +
    (-orient (p (q 0)) (p (q 2)) (p (q 3)) +
    (orient (p (q 0)) (p (q 1)) (p (q 3)) + (-orient (p (q 0)) (p (q 1)) (p (q 2)) + 0)))=0
  have h := planar_circuit (projectionLift (p (q 0))) (projectionLift (p (q 1)))
    (projectionLift (p (q 2))) (projectionLift (p (q 3))) (0,0,1)
  simp only [projection_determinant] at h
  norm_num [dot,projectionLift] at h
  linear_combination h

theorem signs_correct (f : Frame) (q : Fin 4 → Fin 8) (hq : Function.Injective q) :
    (signs q).map (Expr.eval f.input)=(coefficients f.points q).map positive := by
  simp only [signs,coefficients,List.map_ofFn]
  apply congrArg List.ofFn
  funext i
  have hi := hq.comp (skip_injective i)
  exact flip_correct (odd i) (orientExpr (omitted q i)) f.input (base f.points q i)
    (orient_nonzero f.points f.pointGeneric (omitted q i) hi)
    (orient_correct f.points f.pointGeneric (omitted q i) hi)

theorem geometric (f : Frame) (q : Fin 4 → Fin 8) (hq : Function.Injective q) :
    (constraint q).eval f.input=true := by
  have hn : ∃ x ∈ coefficients f.points q, x≠0 := by
    refine ⟨coeff f.points q 0,List.mem_ofFn.mpr ⟨0,rfl⟩,?_⟩
    exact orient_nonzero f.points f.pointGeneric (omitted q 0) (hq.comp (skip_injective 0))
  have hm := mixed_sum_boolean (coefficients f.points q) (coefficient_sum f.points q) hn
  exact mixedExpr_correct (signs q) (coefficients f.points q) f.input (signs_correct f q hq) hm

end Stick81.ProjectedAcyclic
