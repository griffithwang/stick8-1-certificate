import HeightPlanes
import LineGeometry

namespace Stick81.HeightExpressions
open Geometry RoofFrame GeometricInput SignRules Expression HeightPlanes

/- Fin 7 excludes the auxiliary closing chord from every height constraint. -/
def nonadjacent (i j : Fin 7) : Bool := Bool.not (LineDefinitions.adjacent i.castSucc j.castSucc)
def edgeQuad (i j : Fin 7) : Fin 4 → Fin 9 :=
  ![i.castSucc.castSucc,(next i.castSucc).castSucc,j.castSucc.castSucc,(next j.castSucc).castSucc]
def heightExpr (i j : Fin 7) : Expr := chiExpr (edgeQuad i j)

theorem quad_injective : ∀ i j : Fin 7, nonadjacent i j=true → Function.Injective (edgeQuad i j) := by
  unfold Function.Injective
  native_decide

theorem quad_volume (p : Fin 8 → V3) (i j : Fin 7) :
    -det4 (points4 p (edgeQuad i j 0)) (points4 p (edgeQuad i j 1))
      (points4 p (edgeQuad i j 2)) (points4 p (edgeQuad i j 3)) =
        spatialHeight p i.castSucc j.castSucc := by
  simp [edgeQuad,spatialHeight,homogeneous_volume]

theorem height_correct (f : Frame) (i j : Fin 7) (hn : nonadjacent i j=true) :
    (heightExpr i j).eval f.input=positive (spatialHeight f.points i.castSucc j.castSucc) := by
  have h := chi_correct (points4 f.points) (lines f.points) f.pointGeneric (edgeQuad i j) (quad_injective i j hn)
  rw [quad_volume] at h
  exact h

theorem height_nonzero (f : Frame) (i j : Fin 7) (hn : nonadjacent i j=true) :
    spatialHeight f.points i.castSucc j.castSucc ≠ 0 := by
  have h := neg_ne_zero.mpr (f.pointGeneric (edgeQuad i j) (quad_injective i j hn))
  rw [quad_volume] at h
  exact h

theorem adjacent_height_zero (p : Fin 8 → V3) (i j : Fin 8)
    (h : LineDefinitions.adjacent i j=true) : spatialHeight p i j=0 := by
  simp only [LineDefinitions.adjacent,Bool.or_eq_true,beq_iff_eq,or_assoc] at h
  rcases h with h | h | h
  · subst j
    simp [spatialHeight,volume,sub,det3,dot,cross]
  · exact height_adjacent_forward p i j h
  · exact height_adjacent_backward p i j h

theorem excluded_height_zero (p : Fin 8 → V3) (i j : Fin 7)
    (h : nonadjacent i j=false) : spatialHeight p i.castSucc j.castSucc=0 := by
  apply adjacent_height_zero
  cases hc : LineDefinitions.adjacent i.castSucc j.castSucc <;> simp_all [nonadjacent]

theorem sum_filter_of_zero {α : Type} (xs : List α) (keep : α → Bool) (value : α → ℝ)
    (hz : ∀ x ∈ xs, keep x=false → value x=0) :
    ((xs.filter keep).map value).sum=(xs.map value).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    have ht := ih (fun y hy => hz y (by simp [hy]))
    cases hk : keep x
    · have hx := hz x (by simp) hk
      simp [hk,hx,ht]
    · simp [hk,ht]

end Stick81.HeightExpressions
