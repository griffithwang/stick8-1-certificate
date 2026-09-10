import MinorProducts
import MixedSigns

namespace Stick81.FiveHeight
open Geometry RoofFrame SignRules Expression HeightPlanes HeightExpressions MixedSigns MinorProducts

def mul4 (a b c d : Coeff) : Coeff := .mul (.mul a b) (.mul c d)
def v0 : Coeff := .minor 1 2 3
def v1 : Coeff := .neg (.minor 0 2 3)
def v2 : Coeff := .minor 0 1 3
def v3 : Coeff := .neg (.minor 0 1 2)
def w0 : Coeff := .minor 1 2 4
def w1 : Coeff := .neg (.minor 0 2 4)
def w2 : Coeff := .minor 0 1 4
def w4 : Coeff := .neg (.minor 0 1 2)
abbrev Item := (Fin 5 × Fin 5) × Coeff
def items : List Item := [
  ((0,1),.neg (mul4 v1 w1 (.minor 0 1 2) (.minor 1 3 4))),
  ((0,2),mul4 v2 w2 (.minor 0 1 2) (.minor 2 3 4)),
  ((0,3),mul4 w1 w2 v0 v3),
  ((0,4),.neg (mul4 v1 v2 w0 w4)),
  ((1,3),mul4 w1 w2 v1 v3),
  ((1,4),.neg (mul4 v1 v2 w1 w4)),
  ((2,3),mul4 w1 w2 v2 v3),
  ((2,4),.neg (mul4 v1 v2 w2 w4))]

def keep (q : Fin 5 → Fin 7) (r : Item) : Bool := nonadjacent (q r.1.1) (q r.1.2)
def selected (q : Fin 5 → Fin 7) : List Item := items.filter (keep q)
def term (f : Frame) (q : Fin 5 → Fin 7) (r : Item) : ℝ :=
  r.2.eval f q * spatialHeight f.points (q r.1.1).castSucc (q r.1.2).castSucc
def termExpr (q : Fin 5 → Fin 7) (r : Item) : Expr :=
  .eq (r.2.expr q) (heightExpr (q r.1.1) (q r.1.2))
def constraint (q : Fin 5 → Fin 7) : Expr := mixedExpr ((selected q).map (termExpr q))

theorem items_valid : ∀ r ∈ items, r.2.Valid := by native_decide
theorem selected_nonempty : ∀ q : Fin 5 → Fin 7, Function.Injective q → selected q≠[] := by
  unfold Function.Injective
  native_decide

theorem term_nonzero (f : Frame) (q : Fin 5 → Fin 7) (hq : Function.Injective q) (r : Item)
    (hr : r ∈ selected q) : term f q r≠0 := by
  have h := List.mem_filter.mp hr
  exact mul_ne_zero (coeff_nonzero f q hq r.2 (items_valid r h.1)) (height_nonzero f _ _ h.2)

theorem term_correct (f : Frame) (q : Fin 5 → Fin 7) (hq : Function.Injective q) (r : Item)
    (hr : r ∈ selected q) : (termExpr q r).eval f.input=positive (term f q r) := by
  have h := List.mem_filter.mp hr
  have hc := coeff_correct f q hq r.2 (items_valid r h.1)
  have hh := height_correct f (q r.1.1) (q r.1.2) h.2
  simp only [termExpr,Expr.eval,hc,hh]
  rw [← multiplication _ _ (coeff_nonzero f q hq r.2 (items_valid r h.1)) (height_nonzero f _ _ h.2)]
  rfl

theorem full_sum (f : Frame) (q : Fin 5 → Fin 7) : (items.map (term f q)).sum=0 := by
  have h := wheel_height_identity (lines f.points (q 0).castSucc) (lines f.points (q 1).castSucc)
    (lines f.points (q 2).castSucc) (lines f.points (q 3).castSucc) (lines f.points (q 4).castSucc)
    (edgePlane f (q 0).castSucc) (edgePlane f (q 1).castSucc) (edgePlane f (q 2).castSucc)
    (edgePlane f (q 3).castSucc) (edgePlane f (q 4).castSucc)
  dsimp only at h
  simp only [items,term,List.map_cons,List.map_nil,List.sum_cons,List.sum_nil,
    mul4,v0,v1,v2,v3,w0,w1,w2,w4,Coeff.eval,spatial_height_form]
  linear_combination h

theorem selected_sum (f : Frame) (q : Fin 5 → Fin 7) : ((selected q).map (term f q)).sum=0 := by
  rw [selected,sum_filter_of_zero]
  · exact full_sum f q
  · intro r hr hz
    simp [term,excluded_height_zero f.points _ _ hz]

theorem geometric (f : Frame) (q : Fin 5 → Fin 7) (hq : Function.Injective q) : (constraint q).eval f.input=true := by
  have hn : ∃ x ∈ (selected q).map (term f q), x≠0 := by
    cases hs : selected q with
    | nil => exact False.elim ((selected_nonempty q hq) hs)
    | cons r rs =>
      have hr : r ∈ selected q := by rw [hs]; simp
      exact ⟨term f q r,List.mem_map.mpr ⟨r,by simp,rfl⟩,term_nonzero f q hq r hr⟩
  apply mixedExpr_correct ((selected q).map (termExpr q)) ((selected q).map (term f q)) f.input
  · simp only [List.map_map]
    exact List.map_congr_left (fun r hr => term_correct f q hq r hr)
  · exact mixed_sum_boolean _ (selected_sum f q) hn

#print axioms geometric
end Stick81.FiveHeight
