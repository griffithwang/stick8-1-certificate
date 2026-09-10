import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

namespace Stick81.Geometry

abbrev V3 := ℝ × ℝ × ℝ
def sub (a b : V3) : V3 := (a.1-b.1, a.2.1-b.2.1, a.2.2-b.2.2)
def dot (a b : V3) : ℝ := a.1*b.1+a.2.1*b.2.1+a.2.2*b.2.2
def cross (a b : V3) : V3 :=
  (a.2.1*b.2.2-a.2.2*b.2.1, a.2.2*b.1-a.1*b.2.2, a.1*b.2.1-a.2.1*b.1)
def det3 (a b c : V3) : ℝ := dot a (cross b c)
def orient (a b c : V3) : ℝ :=
  (b.1-a.1)*(c.2.1-a.2.1)-(b.2.1-a.2.1)*(c.1-a.1)
def volume (a b c d : V3) : ℝ := det3 (sub b a) (sub c a) (sub d a)
def line (a b : V3) : V3 := (a.2.1-b.2.1,b.1-a.1,a.1*b.2.1-a.2.1*b.1)

theorem det3_swap (a b c : V3) : det3 a b c = -det3 b a c := by
  simp only [det3,dot,cross]
  ring

theorem det3_cycle (a b c : V3) : det3 a b c = det3 b c a := by
  simp only [det3,dot,cross]
  ring

theorem orient_swap (a b c : V3) : orient a b c = -orient a c b := by
  simp only [orient]
  ring

theorem line_incidence (a b : V3) : dot (line a b) (a.1,a.2.1,1) = 0 := by
  simp only [dot,line]
  ring

theorem adjacent_line_factor (p q a b c : V3) :
    det3 (line p q) (line a b) (line b c) = orient p q b * orient a b c := by
  simp only [det3,dot,cross,line,orient]
  ring

theorem line_bracket_identity (a b c d e f : V3) :
    det3 (line a b) (line c d) (line e f) =
      orient a b e * orient c d f - orient a b f * orient c d e := by
  simp only [det3,dot,cross,line,orient]
  ring

theorem height_numerator (p q r s : V3) :
    volume p q r s =
      (p.2.2-r.2.2)*((q.1-p.1)*(s.2.1-r.2.1)-(q.2.1-p.2.1)*(s.1-r.1)) +
      ((r.1-p.1)*(s.2.1-r.2.1)-(r.2.1-p.2.1)*(s.1-r.1))*(q.2.2-p.2.2) -
      ((r.1-p.1)*(q.2.1-p.2.1)-(r.2.1-p.2.1)*(q.1-p.1))*(s.2.2-r.2.2) := by
  simp only [volume,det3,dot,cross,sub]
  ring

/- This universal identity underlies all 35 four-line height constraints.
   The four height planes are arbitrary, not sampled or discretized. -/
set_option maxHeartbeats 0 in
theorem four_line_stress (a b c d fa fb fc fd : V3) :
    let la := det3 b c d
    let lb := -det3 a c d
    let lc := det3 a b d
    let ld := -det3 a b c
    la*lb*dot (sub fa fb) (cross a b) +
    la*lc*dot (sub fa fc) (cross a c) +
    la*ld*dot (sub fa fd) (cross a d) +
    lb*lc*dot (sub fb fc) (cross b c) +
    lb*ld*dot (sub fb fd) (cross b d) +
    lc*ld*dot (sub fc fd) (cross c d) = 0 := by
  dsimp [det3,dot,cross,sub]
  ring

/- Projective reciprocal-depth map used in the exposed-vertex reduction. -/
noncomputable def reciprocal (p : V3) : V3 := (p.1/p.2.2,p.2.1/p.2.2,1/p.2.2)

theorem reciprocal_involutive (p : V3) (h : p.2.2 ≠ 0) :
    reciprocal (reciprocal p) = p := by
  rcases p with ⟨x,y,z⟩
  simp only [reciprocal,Prod.mk.injEq] at *
  constructor
  · field_simp
  constructor
  · field_simp
  · field_simp

theorem reciprocal_height_positive (p : V3) (h : 0 < p.2.2) :
    0 < (reciprocal p).2.2 := by
  exact one_div_pos.mpr h

theorem zero_sum_not_strictly_one_sign (a b c : ℝ)
    (h : a+b+c=0) :
    ¬ ((0<a ∧ 0<b ∧ 0<c) ∨ (a<0 ∧ b<0 ∧ c<0)) := by
  rintro (⟨h₁,h₂,h₃⟩ | ⟨h₁,h₂,h₃⟩) <;> linarith

theorem zero_sum_boolean_signs (a b c : ℝ)
    (h : a+b+c=0) (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) :
    (decide (0<a) ≠ decide (0<b)) ∨ (decide (0<b) ≠ decide (0<c)) := by
  by_cases h₁ : 0<a <;> by_cases h₂ : 0<b <;> by_cases h₃ : 0<c <;>
    simp_all
  · linarith
  · have hneg : a < 0 := lt_of_le_of_ne h₁ ha
    linarith

set_option maxHeartbeats 0 in
theorem plucker_rank_three (u a b c d : V3) :
    det3 u a b * det3 u c d - det3 u a c * det3 u b d +
      det3 u a d * det3 u b c = 0 := by
  simp only [det3,dot,cross]
  ring

set_option maxHeartbeats 0 in
theorem plucker_affine_rank_four (a b c d e f : V3) :
    volume a b c d * volume a b e f - volume a b c e * volume a b d f +
      volume a b c f * volume a b d e = 0 := by
  simp only [volume,det3,dot,cross,sub]
  ring

end Stick81.Geometry
