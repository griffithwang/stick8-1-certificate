import HeightExpressions
import MixedSigns

namespace Stick81.FourHeight
open Geometry RoofFrame GeometricInput SignRules Expression HeightPlanes HeightExpressions MixedSigns

def odd (i : Fin 4) : Bool := decide (i.val % 2=1)
def omitted (q : Fin 4 → Fin 7) (i : Fin 4) (j : Fin 3) : Fin 8 := (q (i.succAbove j)).castSucc
def base (f : Frame) (q : Fin 4 → Fin 7) (i : Fin 4) : ℝ :=
  det3 (lines f.points (omitted q i 0)) (lines f.points (omitted q i 1)) (lines f.points (omitted q i 2))
def coeff (f : Frame) (q : Fin 4 → Fin 7) (i : Fin 4) : ℝ := flipReal (odd i) (base f q i)
def coeffExpr (q : Fin 4 → Fin 7) (i : Fin 4) : Expr := flipExpr (odd i) (LineDefinitions.lineExpr (omitted q i))
def pairs : List (Fin 4 × Fin 4) := [(0,1),(0,2),(0,3),(1,2),(1,3),(2,3)]
def selected (q : Fin 4 → Fin 7) : List (Fin 4 × Fin 4) := pairs.filter (fun p => nonadjacent (q p.1) (q p.2))
def term (f : Frame) (q : Fin 4 → Fin 7) (r : Fin 4 × Fin 4) : ℝ :=
  coeff f q r.1 * coeff f q r.2 * spatialHeight f.points (q r.1).castSucc (q r.2).castSucc
def termExpr (q : Fin 4 → Fin 7) (r : Fin 4 × Fin 4) : Expr :=
  .eq (.eq (coeffExpr q r.1) (coeffExpr q r.2)) (heightExpr (q r.1) (q r.2))
def constraint (q : Fin 4 → Fin 7) : Expr := mixedExpr ((selected q).map (termExpr q))

theorem omitted_injective : ∀ q : Fin 4 → Fin 7, Function.Injective q →
    ∀ i, Function.Injective (omitted q i) := by unfold Function.Injective; native_decide
theorem selected_nonempty : ∀ q : Fin 4 → Fin 7, Function.Injective q → selected q≠[] := by
  unfold Function.Injective
  native_decide

theorem coeff_nonzero (f : Frame) (q : Fin 4 → Fin 7) (hq : Function.Injective q) (i : Fin 4) : coeff f q i≠0 := by
  have h := f.lineGeneric (omitted q i) (omitted_injective q hq i)
  cases ho : odd i <;> simp [coeff,flipReal,ho,base] at * <;> assumption

theorem coeff_correct (f : Frame) (q : Fin 4 → Fin 7) (hq : Function.Injective q) (i : Fin 4) :
    (coeffExpr q i).eval f.input=positive (coeff f q i) :=
  flip_correct (odd i) (LineDefinitions.lineExpr (omitted q i)) f.input (base f q i)
    (f.lineGeneric (omitted q i) (omitted_injective q hq i))
    (LineDefinitions.line_correct f.points f.pointGeneric f.lineGeneric (omitted q i) (omitted_injective q hq i))

theorem term_nonzero (f : Frame) (q : Fin 4 → Fin 7) (hq : Function.Injective q) (r : Fin 4 × Fin 4)
    (hn : nonadjacent (q r.1) (q r.2)=true) : term f q r≠0 :=
  mul_ne_zero (mul_ne_zero (coeff_nonzero f q hq r.1) (coeff_nonzero f q hq r.2)) (height_nonzero f _ _ hn)

theorem term_correct (f : Frame) (q : Fin 4 → Fin 7) (hq : Function.Injective q) (r : Fin 4 × Fin 4)
    (hn : nonadjacent (q r.1) (q r.2)=true) : (termExpr q r).eval f.input=positive (term f q r) := by
  simp only [termExpr,Expr.eval,coeff_correct f q hq,height_correct f _ _ hn]
  rw [← multiplication _ _ (coeff_nonzero f q hq r.1) (coeff_nonzero f q hq r.2),
    ← multiplication _ _ (mul_ne_zero (coeff_nonzero f q hq r.1) (coeff_nonzero f q hq r.2)) (height_nonzero f _ _ hn)]
  rfl

theorem full_sum (f : Frame) (q : Fin 4 → Fin 7) : (pairs.map (term f q)).sum=0 := by
  have hc0 : coeff f q 0=det3 (lines f.points (q 1).castSucc) (lines f.points (q 2).castSucc) (lines f.points (q 3).castSucc) := rfl
  have hc1 : coeff f q 1= -det3 (lines f.points (q 0).castSucc) (lines f.points (q 2).castSucc) (lines f.points (q 3).castSucc) := rfl
  have hc2 : coeff f q 2=det3 (lines f.points (q 0).castSucc) (lines f.points (q 1).castSucc) (lines f.points (q 3).castSucc) := rfl
  have hc3 : coeff f q 3= -det3 (lines f.points (q 0).castSucc) (lines f.points (q 1).castSucc) (lines f.points (q 2).castSucc) := rfl
  have h := four_line_stress (lines f.points (q 0).castSucc) (lines f.points (q 1).castSucc)
    (lines f.points (q 2).castSucc) (lines f.points (q 3).castSucc)
    (edgePlane f (q 0).castSucc) (edgePlane f (q 1).castSucc)
    (edgePlane f (q 2).castSucc) (edgePlane f (q 3).castSucc)
  dsimp only at h
  simp only [pairs,List.map_cons,List.map_nil,List.sum_cons,List.sum_nil,term,hc0,hc1,hc2,hc3,
    spatial_height_form,heightForm]
  linear_combination h

theorem selected_sum (f : Frame) (q : Fin 4 → Fin 7) : ((selected q).map (term f q)).sum=0 := by
  rw [selected,sum_filter_of_zero]
  · exact full_sum f q
  · intro r hr hz
    simp [term,excluded_height_zero f.points _ _ hz]

theorem geometric (f : Frame) (q : Fin 4 → Fin 7) (hq : Function.Injective q) : (constraint q).eval f.input=true := by
  have hn : ∃ x ∈ (selected q).map (term f q), x≠0 := by
    cases hs : selected q with
    | nil => exact False.elim ((selected_nonempty q hq) hs)
    | cons r rs =>
      have hr : r ∈ selected q := by rw [hs]; simp
      refine ⟨term f q r,List.mem_map.mpr ⟨r,by simp,rfl⟩,?_⟩
      exact term_nonzero f q hq r (List.mem_filter.mp hr).2
  apply mixedExpr_correct ((selected q).map (termExpr q)) ((selected q).map (term f q)) f.input
  · simp only [List.map_map]
    exact List.map_congr_left (fun r hr => term_correct f q hq r (List.mem_filter.mp hr).2)
  · exact mixed_sum_boolean _ (selected_sum f q) hn

#print axioms geometric
end Stick81.FourHeight
