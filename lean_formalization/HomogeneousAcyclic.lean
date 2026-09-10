import MixedSigns

namespace Stick81.HomogeneousAcyclic
open Geometry RoofFrame GeometricInput SignRules Expression MixedSigns

def odd (i : Fin 5) : Bool := decide (i.val % 2=1)
def omitted (q : Fin 5 → Fin 9) (i : Fin 5) : Fin 4 → Fin 9 := q ∘ i.succAbove

theorem skip_injective : ∀ i : Fin 5, Function.Injective (i.succAbove : Fin 4 → Fin 5) := by
  unfold Function.Injective
  native_decide

def base (w : Fin 9 → V4) (q : Fin 5 → Fin 9) (i : Fin 5) : ℝ :=
  -det4 (w (omitted q i 0)) (w (omitted q i 1)) (w (omitted q i 2)) (w (omitted q i 3))
def coeff (w : Fin 9 → V4) (q : Fin 5 → Fin 9) (i : Fin 5) : ℝ := flipReal (odd i) (base w q i)
def coefficients (w : Fin 9 → V4) (q : Fin 5 → Fin 9) : List ℝ := List.ofFn (coeff w q)
def signs (q : Fin 5 → Fin 9) : List Expr := List.ofFn (fun i => flipExpr (odd i) (chiExpr (omitted q i)))
def constraint (q : Fin 5 → Fin 9) : Expr := mixedExpr (signs q)
def pairs (w : Fin 9 → V4) (functional : V4) (q : Fin 5 → Fin 9) : List (ℝ × ℝ) :=
  List.ofFn (fun i => (coeff w q i,dot4 functional (w (q i))))

theorem pairs_sum (w : Fin 9 → V4) (functional : V4) (q : Fin 5 → Fin 9) :
    ((pairs w functional q).map (fun p => p.1*p.2)).sum=0 := by
  change (-det4 (w (q 1)) (w (q 2)) (w (q 3)) (w (q 4))) * dot4 functional (w (q 0)) +
    ((-(-det4 (w (q 0)) (w (q 2)) (w (q 3)) (w (q 4)))) * dot4 functional (w (q 1)) +
    ((-det4 (w (q 0)) (w (q 1)) (w (q 3)) (w (q 4))) * dot4 functional (w (q 2)) +
    ((-(-det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 4)))) * dot4 functional (w (q 3)) +
    ((-det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3))) * dot4 functional (w (q 4)) + 0)))) = 0
  have h := homogeneous_circuit (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3)) (w (q 4)) functional
  linear_combination -h

theorem signs_correct (w : Fin 9 → V4) (l : Fin 8 → V3) (hw : GeneralPoints w)
    (q : Fin 5 → Fin 9) (hq : Function.Injective q) :
    (signs q).map (Expr.eval (assignment w l))=(coefficients w q).map positive := by
  simp only [signs,coefficients,List.map_ofFn]
  apply congrArg List.ofFn
  funext i
  have hinj := hq.comp (skip_injective i)
  exact flip_correct (odd i) (chiExpr (omitted q i)) (assignment w l) (base w q i)
    (neg_ne_zero.mpr (hw (omitted q i) hinj)) (chi_correct w l hw (omitted q i) hinj)

theorem geometric (w : Fin 9 → V4) (l : Fin 8 → V3) (hw : GeneralPoints w)
    (functional : V4) (hp : ∀ i, 0<dot4 functional (w i))
    (q : Fin 5 → Fin 9) (hq : Function.Injective q) : (constraint q).eval (assignment w l)=true := by
  have hwgt : ∀ p ∈ pairs w functional q, 0<p.2 := by
    intro p h
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp h
    exact hp (q i)
  have hn : ∃ p ∈ pairs w functional q, p.1≠0 := by
    refine ⟨(coeff w q 0,dot4 functional (w (q 0))),List.mem_ofFn.mpr ⟨0,rfl⟩,?_⟩
    exact neg_ne_zero.mpr (hw (omitted q 0) (hq.comp (skip_injective 0)))
  have hm := weighted_mixed (pairs w functional q) hwgt (pairs_sum w functional q) hn
  have hc : (pairs w functional q).map Prod.fst=coefficients w q := by
    simp [pairs,coefficients,List.map_ofFn]
  rw [hc] at hm
  exact mixedExpr_correct (signs q) (coefficients w q) (assignment w l) (signs_correct w l hw q hq) hm

theorem frame_geometric (f : Frame) (hp : f.Positive) (q : Fin 5 → Fin 9) (hq : Function.Injective q) :
    (constraint q).eval f.input=true :=
  geometric (points4 f.points) (lines f.points) f.pointGeneric depthFunctional (depth_positive f hp) q hq

end Stick81.HomogeneousAcyclic
