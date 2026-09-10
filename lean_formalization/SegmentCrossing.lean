import CrossingOrder

namespace Stick81.SegmentCrossing
open Geometry RoofFrame GeometricInput SignRules LineDefinitions CrossingGeometry CrossingOrder

def along (a b : V3) (t : ℝ) : V3 :=
  (a.1+t*(b.1-a.1),a.2.1+t*(b.2.1-a.2.1),a.2.2+t*(b.2.2-a.2.2))
def SameXY (a b : V3) : Prop := a.1=b.1 ∧ a.2.1=b.2.1
def Intersects (p : Fin 8 → V3) (i j : Fin 8) : Prop :=
  ∃ t u : ℝ, 0<t ∧ t<1 ∧ 0<u ∧ u<1 ∧ SameXY (along (p i) (p (next i)) t) (along (p j) (p (next j)) u)

theorem numerator_orient (p : Fin 8 → V3) (i j : Fin 8) : numerator p i j=orient (p j) (p (next j)) (p i) := by
  simp only [numerator,planarDet,sub,orient]
  ring

theorem D_reverse_difference (p : Fin 8 → V3) (i j : Fin 8) :
    D p i j=orient (p j) (p (next j)) (p i)-orient (p j) (p (next j)) (p (next i)) := by
  have h := D_difference p j i
  rw [D_symmetric] at h
  linarith

theorem parameter_ratio (p : Fin 8 → V3) (i j : Fin 8) :
    parameter p i j=orient (p j) (p (next j)) (p i) /
      (orient (p j) (p (next j)) (p i)-orient (p j) (p (next j)) (p (next i))) := by
  rw [parameter,numerator_orient,D_reverse_difference]

theorem opposite_ratio (a b : ℝ) (ha : a≠0) (hb : b≠0) (h : positive a≠positive b) :
    0<a/(a-b) ∧ a/(a-b)<1 := by
  rcases lt_or_gt_of_ne ha with hna | hpa <;> rcases lt_or_gt_of_ne hb with hnb | hpb
  · exact False.elim (h (by simp [positive,not_lt_of_ge hna.le,not_lt_of_ge hnb.le]))
  · have hd : a-b<0 := by linarith
    exact ⟨div_pos_of_neg_of_neg hna hd,(div_lt_iff_of_neg hd).mpr (by linarith)⟩
  · have hd : 0<a-b := by linarith
    exact ⟨div_pos hpa hd,(div_lt_iff₀ hd).mpr (by linarith)⟩
  · exact False.elim (h (by simp [positive,hpa,hpb]))

theorem parameter_between (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) (hc : Straddles f.points i j) :
    0<parameter f.points i j ∧ parameter f.points i j<1 := by
  obtain ⟨h1,h2,h3,h4⟩ := triangles_injective i j ha
  rw [parameter_ratio]
  exact opposite_ratio _ _ (orient_nonzero f.points f.pointGeneric (startTri j i) h3)
    (orient_nonzero f.points f.pointGeneric (endTri j i) h4) hc.2

theorem numerator_reverse (p : Fin 8 → V3) (i j : Fin 8) :
    numerator p j i= -planarDet (sub (p j) (p i)) (sub (p (next i)) (p i)) := by
  simp only [numerator,planarDet,sub]
  ring

theorem parameter_reverse (p : Fin 8 → V3) (i j : Fin 8) :
    parameter p j i=planarDet (sub (p j) (p i)) (sub (p (next i)) (p i)) / D p i j := by
  rw [parameter,numerator_reverse,D_symmetric]
  simp

theorem cramer_xy (a b c d : V3) (h : planarDet (sub b a) (sub d c)≠0) :
    SameXY (along a b (planarDet (sub c a) (sub d c)/planarDet (sub b a) (sub d c)))
      (along c d (planarDet (sub c a) (sub b a)/planarDet (sub b a) (sub d c))) := by
  constructor <;> dsimp only [along] <;> field_simp [h] <;> simp only [planarDet,sub] <;> ring

theorem straddles_intersects (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) (hc : Straddles f.points i j) :
    Intersects f.points i j := by
  have ht := parameter_between f i j ha hc
  have hu := parameter_between f j i (nonadj_symmetric i j ha) ((straddles_symmetric f.points i j).mp hc)
  refine ⟨parameter f.points i j,parameter f.points j i,ht.1,ht.2,hu.1,hu.2,?_⟩
  rw [parameter_reverse f.points i j]
  exact cramer_xy _ _ _ _ (crossing_directions f i j ha hc).1

theorem orient_along (a b c d : V3) (t : ℝ) :
    orient a b (along c d t)=(1-t)*orient a b c+t*orient a b d := by
  simp only [orient,along]
  ring

theorem orient_self (a b : V3) (t : ℝ) : orient a b (along a b t)=0 := by
  simp only [orient,along]
  ring

theorem orient_xy (a b x y : V3) (h : SameXY x y) : orient a b x=orient a b y := by
  simp only [orient,h.1,h.2]

theorem weighted_opposite (a b u v : ℝ) (ha : a≠0) (hb : b≠0) (hu : 0<u) (hv : 0<v)
    (h : u*a+v*b=0) : positive a≠positive b := by
  rcases lt_or_gt_of_ne ha with hna | hpa <;> rcases lt_or_gt_of_ne hb with hnb | hpb
  · have h1 := mul_neg_of_pos_of_neg hu hna
    have h2 := mul_neg_of_pos_of_neg hv hnb
    exfalso
    linarith
  · simp [positive,not_lt_of_ge hna.le,hpb]
  · simp [positive,hpa,not_lt_of_ge hnb.le]
  · have h1 := mul_pos hu hpa
    have h2 := mul_pos hv hpb
    exfalso
    linarith

theorem intersects_straddles (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) (hc : Intersects f.points i j) :
    Straddles f.points i j := by
  obtain ⟨t,u,ht0,ht1,hu0,hu1,hxy⟩ := hc
  obtain ⟨h1,h2,h3,h4⟩ := triangles_injective i j ha
  have hi := (orient_xy (f.points i) (f.points (next i)) _ _ hxy).symm.trans
    (orient_self (f.points i) (f.points (next i)) t)
  have hj := (orient_xy (f.points j) (f.points (next j)) _ _ hxy).trans
    (orient_self (f.points j) (f.points (next j)) u)
  rw [orient_along] at hi hj
  constructor
  · exact weighted_opposite _ _ (1-u) u (orient_nonzero f.points f.pointGeneric (startTri i j) h1)
      (orient_nonzero f.points f.pointGeneric (endTri i j) h2) (by linarith) hu0 hi
  · exact weighted_opposite _ _ (1-t) t (orient_nonzero f.points f.pointGeneric (startTri j i) h3)
      (orient_nonzero f.points f.pointGeneric (endTri j i) h4) (by linarith) ht0 hj

theorem cross_iff_intersects (f : Frame) (i j : Fin 8) (ha : adjacent i j=false) :
    (crossExpr i j).eval f.input=true ↔ Intersects f.points i j :=
  (cross_correct f i j ha).trans ⟨straddles_intersects f i j ha,intersects_straddles f i j ha⟩

#print axioms cross_iff_intersects
end Stick81.SegmentCrossing
