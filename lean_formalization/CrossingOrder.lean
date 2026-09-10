import CrossingGeometry
import MixedSigns

namespace Stick81.CrossingOrder
open Geometry RoofFrame GeometricInput SignRules Expression LineDefinitions CrossingGeometry MixedSigns

def numerator (p : Fin 8 → V3) (i j : Fin 8) : ℝ := planarDet (sub (p j) (p i)) (sub (p (next j)) (p j))
noncomputable def parameter (p : Fin 8 → V3) (i j : Fin 8) : ℝ := numerator p i j / D p i j

theorem division_difference (a b x y z : ℝ) (hx : x≠0) (hy : y≠0) (h : a*y-b*x= -z) :
    a/x-b/y= -z/(x*y) := by
  field_simp [hx,hy]
  linear_combination h

theorem parameter_difference (p : Fin 8 → V3) (i j k : Fin 8) (hj : D p i j≠0) (hk : D p i k≠0) :
    parameter p i j-parameter p i k= -det3 (lines p i) (lines p j) (lines p k)/(D p i j*D p i k) := by
  apply division_difference _ _ _ _ _ hj hk
  exact parameter_difference_numerator _ _ _ _ _ _

theorem division_sign (a b : ℝ) : positive (a/b)=positive (a*b) := by
  simp [positive,div_pos_iff,mul_pos_iff]

def earlierExpr (i j k : Fin 8) : Expr :=
  .eq (.eq (lineExpr ![i,j,k]) (directionExpr i j)) (directionExpr i k)

theorem earlier_correct (f : Frame) (i j k : Fin 8) (hj : adjacent i j=false) (hk : adjacent i k=false)
    (hijk : Function.Injective (![i,j,k] : Fin 3 → Fin 8))
    (hcj : Straddles f.points i j) (hck : Straddles f.points i k) :
    (earlierExpr i j k).eval f.input=decide (parameter f.points i j<parameter f.points i k) := by
  have hdj := (crossing_directions f i j hj hcj).1
  have hdk := (crossing_directions f i k hk hck).1
  have hc := f.lineGeneric ![i,j,k] hijk
  have hl := line_correct f.points f.pointGeneric f.lineGeneric ![i,j,k] hijk
  have hdirj := direction_correct f i j hj hcj
  have hdirk := direction_correct f i k hk hck
  have hp := parameter_difference f.points i j k hdj hdk
  have hd : parameter f.points i k-parameter f.points i j =
      det3 (lines f.points i) (lines f.points j) (lines f.points k)/(D f.points i j*D f.points i k) := by
    rw [neg_div] at hp
    linarith
  have he : (earlierExpr i j k).eval f.input=
      positive ((det3 (lines f.points i) (lines f.points j) (lines f.points k)*D f.points i j)*D f.points i k) := by
    simp only [earlierExpr,Expr.eval,Frame.input] at hdirj hdirk ⊢
    rw [hl,hdirj,hdirk,← multiplication _ _ hc hdj,← multiplication _ _ (mul_ne_zero hc hdj) hdk]
    rfl
  rw [he]
  have hr : positive ((det3 (lines f.points i) (lines f.points j) (lines f.points k)*D f.points i j)*D f.points i k) =
      positive (det3 (lines f.points i) (lines f.points j) (lines f.points k)/(D f.points i j*D f.points i k)) := by
    rw [division_sign,mul_assoc]
  rw [hr,← hd]
  simp [positive,sub_pos]

theorem parameter_ne (f : Frame) (i j k : Fin 8) (hj : adjacent i j=false) (hk : adjacent i k=false)
    (hijk : Function.Injective (![i,j,k] : Fin 3 → Fin 8))
    (hcj : Straddles f.points i j) (hck : Straddles f.points i k) : parameter f.points i j≠parameter f.points i k := by
  have hdj := (crossing_directions f i j hj hcj).1
  have hdk := (crossing_directions f i k hk hck).1
  have hc := f.lineGeneric ![i,j,k] hijk
  have hp := parameter_difference f.points i j k hdj hdk
  intro heq
  rw [heq,sub_self] at hp
  exact (div_ne_zero (neg_ne_zero.mpr hc) (mul_ne_zero hdj hdk)) hp.symm

noncomputable def cycleValue (x y z : ℝ) : Bool := by
  classical
  exact [decide (x<y),decide (y<z),decide (z<x)].any id &&
    [decide (x<y),decide (y<z),decide (z<x)].any Bool.not

theorem real_cycle (x y z : ℝ) (h : x≠y) : cycleValue x y z=true := by
  by_cases h1 : x<y <;> by_cases h2 : y<z <;> by_cases h3 : z<x <;> simp [cycleValue,h1,h2,h3]
  · linarith
  · apply h
    linarith

def liveExpr (q : Fin 4 → Fin 8) : Expr := Expression.all [crossExpr (q 0) (q 1),crossExpr (q 0) (q 2),crossExpr (q 0) (q 3)]
def events (q : Fin 4 → Fin 8) : List Expr :=
  [earlierExpr (q 0) (q 1) (q 2),earlierExpr (q 0) (q 2) (q 3),earlierExpr (q 0) (q 3) (q 1)]
def constraint (q : Fin 4 → Fin 8) : Expr := .or (.not (liveExpr q)) (mixedExpr (events q))

theorem triples_injective : ∀ q : Fin 4 → Fin 8, Function.Injective q →
    Function.Injective (![q 0,q 1,q 2] : Fin 3 → Fin 8) ∧
    Function.Injective (![q 0,q 2,q 3] : Fin 3 → Fin 8) ∧
    Function.Injective (![q 0,q 3,q 1] : Fin 3 → Fin 8) := by
  unfold Function.Injective
  native_decide

theorem geometric (f : Frame) (q : Fin 4 → Fin 8) (hq : Function.Injective q)
    (h1 : adjacent (q 0) (q 1)=false) (h2 : adjacent (q 0) (q 2)=false) (h3 : adjacent (q 0) (q 3)=false) :
    (constraint q).eval f.input=true := by
  cases hl : (liveExpr q).eval f.input
  · simp [constraint,Expr.eval,hl]
  · have hl' := hl
    simp only [liveExpr,Expression.all,Expr.eval,Bool.and_true,Bool.and_eq_true] at hl'
    obtain ⟨hc1,hc2,hc3⟩ := hl'
    have hs1 := (cross_correct f _ _ h1).mp hc1
    have hs2 := (cross_correct f _ _ h2).mp hc2
    have hs3 := (cross_correct f _ _ h3).mp hc3
    obtain ⟨hi12,hi23,hi31⟩ := triples_injective q hq
    have he12 := earlier_correct f _ _ _ h1 h2 hi12 hs1 hs2
    have he23 := earlier_correct f _ _ _ h2 h3 hi23 hs2 hs3
    have he31 := earlier_correct f _ _ _ h3 h1 hi31 hs3 hs1
    have hn := parameter_ne f _ _ _ h1 h2 hi12 hs1 hs2
    have hr := real_cycle _ _ (parameter f.points (q 0) (q 3)) hn
    simp only [constraint,Expr.eval,hl,Bool.not_true,Bool.false_or]
    simpa only [mixedExpr,events,Expression.all,Expression.any,List.map_cons,List.map_nil,
      Expr.eval,he12,he23,he31,Bool.and_true,Bool.or_false,cycleValue,List.any_cons,List.any_nil] using hr

end Stick81.CrossingOrder
