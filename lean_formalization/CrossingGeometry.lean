import LineGeometry

namespace Stick81.CrossingGeometry
open Geometry RoofFrame GeometricInput SignRules Expression LineDefinitions

def startTri (i j : Fin 8) : Fin 3 → Fin 8 := ![i,next i,j]
def endTri (i j : Fin 8) : Fin 3 → Fin 8 := ![i,next i,next j]
def D (p : Fin 8 → V3) (i j : Fin 8) : ℝ := planarDet (sub (p (next i)) (p i)) (sub (p (next j)) (p j))

theorem triangles_injective : ∀ i j : Fin 8, adjacent i j=false →
    Function.Injective (startTri i j) ∧ Function.Injective (endTri i j) ∧
    Function.Injective (startTri j i) ∧ Function.Injective (endTri j i) := by
  unfold Function.Injective
  native_decide

theorem nonadj_symmetric : ∀ i j : Fin 8, adjacent i j=false → adjacent j i=false := by native_decide

theorem D_difference (p : Fin 8 → V3) (i j : Fin 8) :
    D p i j=orient (p i) (p (next i)) (p (next j)) - orient (p i) (p (next i)) (p j) := by
  simp only [D,planarDet,sub,orient]
  ring

theorem D_symmetric (p : Fin 8 → V3) (i j : Fin 8) : D p j i= -D p i j := by
  simp only [D,planarDet]
  ring

theorem difference_sign (a b : ℝ) (ha : a≠0) (hb : b≠0) (h : positive a≠positive b) :
    positive (b-a)=positive b ∧ b-a≠0 := by
  rcases lt_or_gt_of_ne ha with hna | hpa <;> rcases lt_or_gt_of_ne hb with hnb | hpb
  · exact False.elim (h (by simp [positive,not_lt_of_ge hna.le,not_lt_of_ge hnb.le]))
  · have hd : 0<b-a := by linarith
    exact ⟨by simp [positive,hd,hpb],ne_of_gt hd⟩
  · have hd : b-a<0 := by linarith
    exact ⟨by simp [positive,not_lt_of_ge hd.le,not_lt_of_ge hnb.le],ne_of_lt hd⟩
  · exact False.elim (h (by simp [positive,hpa,hpb]))

def Straddles (p : Fin 8 → V3) (i j : Fin 8) : Prop :=
  positive (orient (p i) (p (next i)) (p j)) ≠ positive (orient (p i) (p (next i)) (p (next j))) ∧
  positive (orient (p j) (p (next j)) (p i)) ≠ positive (orient (p j) (p (next j)) (p (next i)))

theorem straddles_symmetric (p : Fin 8 → V3) (i j : Fin 8) : Straddles p i j ↔ Straddles p j i := and_comm

def rawCrossExpr (i j : Fin 8) : Expr := Expression.all [
  .ne (orientExpr (startTri i j)) (orientExpr (endTri i j)),
  .ne (orientExpr (startTri j i)) (orientExpr (endTri j i))]

def crossExpr (i j : Fin 8) : Expr := if i<j then rawCrossExpr i j else rawCrossExpr j i
def directionExpr (i j : Fin 8) : Expr := if i<j then orientExpr (endTri i j) else .not (orientExpr (endTri j i))
def constraint (i j : Fin 8) : Expr := .or (.not (rawCrossExpr i j))
  (.ne (orientExpr (endTri i j)) (orientExpr (endTri j i)))

theorem rawCross_correct (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) :
    (rawCrossExpr i j).eval f.input=true ↔ Straddles f.points i j := by
  obtain ⟨h1,h2,h3,h4⟩ := triangles_injective i j ha
  have h1' := orient_correct f.points f.pointGeneric (startTri i j) h1
  have h2' := orient_correct f.points f.pointGeneric (endTri i j) h2
  have h3' := orient_correct f.points f.pointGeneric (startTri j i) h3
  have h4' := orient_correct f.points f.pointGeneric (endTri j i) h4
  simp only [rawCrossExpr,Expression.all,Expr.eval,Frame.input,h1',h2',h3',h4',
    Bool.and_true,Bool.and_eq_true,bne_iff_ne]
  rfl

theorem cross_correct (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) :
    (crossExpr i j).eval f.input=true ↔ Straddles f.points i j := by
  unfold crossExpr
  split
  · exact rawCross_correct f i j ha
  · exact (rawCross_correct f j i (nonadj_symmetric i j ha)).trans (straddles_symmetric f.points j i)

theorem crossing_directions (f : Frame) (i j : Fin 8) (ha : adjacent i j=false)
    (hc : Straddles f.points i j) : D f.points i j≠0 ∧
    positive (D f.points i j)=positive (orient (f.points i) (f.points (next i)) (f.points (next j))) ∧
    positive (orient (f.points j) (f.points (next j)) (f.points (next i)))=Bool.not (positive (D f.points i j)) := by
  obtain ⟨h1,h2,h3,h4⟩ := triangles_injective i j ha
  have hs := difference_sign _ _ (orient_nonzero f.points f.pointGeneric (startTri i j) h1)
    (orient_nonzero f.points f.pointGeneric (endTri i j) h2) hc.1
  have ht := difference_sign _ _ (orient_nonzero f.points f.pointGeneric (startTri j i) h3)
    (orient_nonzero f.points f.pointGeneric (endTri j i) h4) hc.2
  change positive (orient (f.points i) (f.points (next i)) (f.points (next j)) -
    orient (f.points i) (f.points (next i)) (f.points j)) =
    positive (orient (f.points i) (f.points (next i)) (f.points (next j))) ∧
    orient (f.points i) (f.points (next i)) (f.points (next j)) -
      orient (f.points i) (f.points (next i)) (f.points j) ≠ 0 at hs
  rw [← D_difference] at hs
  change positive (orient (f.points j) (f.points (next j)) (f.points (next i)) -
    orient (f.points j) (f.points (next j)) (f.points i)) =
    positive (orient (f.points j) (f.points (next j)) (f.points (next i))) ∧
    orient (f.points j) (f.points (next j)) (f.points (next i)) -
      orient (f.points j) (f.points (next j)) (f.points i) ≠ 0 at ht
  rw [← D_difference] at ht
  refine ⟨hs.2,hs.1,?_⟩
  rw [← ht.1,D_symmetric,negation _ hs.2]

theorem direction_correct (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) (hc : Straddles f.points i j) :
    (directionExpr i j).eval f.input=positive (D f.points i j) := by
  obtain ⟨h1,h2,h3,h4⟩ := triangles_injective i j ha
  obtain ⟨hn,hf,hb⟩ := crossing_directions f i j ha hc
  have h2' := orient_correct f.points f.pointGeneric (endTri i j) h2
  have h4' := orient_correct f.points f.pointGeneric (endTri j i) h4
  unfold directionExpr
  split
  · dsimp only [Frame.input]
    rw [h2']
    exact hf.symm
  · simp only [Expr.eval,Frame.input,h4']
    change Bool.not (positive (orient (f.points j) (f.points (next j)) (f.points (next i))))=positive (D f.points i j)
    rw [hb]
    simp

theorem geometric (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) : (constraint i j).eval f.input=true := by
  cases hc : (rawCrossExpr i j).eval f.input
  · simp [constraint,Expr.eval,hc]
  · have hs := (rawCross_correct f i j ha).mp hc
    obtain ⟨h1,h2,h3,h4⟩ := triangles_injective i j ha
    obtain ⟨hn,hf,hb⟩ := crossing_directions f i j ha hs
    have h2' := orient_correct f.points f.pointGeneric (endTri i j) h2
    have h4' := orient_correct f.points f.pointGeneric (endTri j i) h4
    simp only [constraint,Expr.eval,Frame.input] at hc ⊢
    rw [hc,h2',h4']
    change (Bool.not true || (positive (orient (f.points i) (f.points (next i)) (f.points (next j))) !=
      positive (orient (f.points j) (f.points (next j)) (f.points (next i)))))=true
    rw [← hf,hb]
    cases positive (D f.points i j) <;> rfl

end Stick81.CrossingGeometry
