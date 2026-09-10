import ChiGeometry

namespace Stick81.RoofFrame
open Geometry GeometricInput Expression SignRules

def next (i : Fin 8) : Fin 8 := i+1

def points4 (p : Fin 8 → V3) (i : Fin 9) : V4 :=
  if h : i.val<8 then homogenize (p ⟨i.val,h⟩) else infinity

def lines (p : Fin 8 → V3) (i : Fin 8) : V3 := line (p i) (p (next i))

@[simp] theorem finite_point (p : Fin 8 → V3) (i : Fin 8) :
    points4 p i.castSucc=homogenize (p i) := by
  simp [points4,i.isLt]

@[simp] theorem infinite_point (p : Fin 8 → V3) : points4 p (Fin.last 8)=infinity := rfl
@[simp] theorem infinite_point_nat (p : Fin 8 → V3) : points4 p (8 : Fin 9)=infinity := rfl

def orientationQuad (q : Fin 3 → Fin 8) : Fin 4 → Fin 9 :=
  ![(q 0).castSucc,(q 1).castSucc,(q 2).castSucc,Fin.last 8]

theorem orientationQuad_injective : ∀ q : Fin 3 → Fin 8,
    Function.Injective q → Function.Injective (orientationQuad q) := by
  unfold Function.Injective
  native_decide

def orientExpr (q : Fin 3 → Fin 8) : Expr := chiExpr (orientationQuad q)

theorem orientationQuad_det (p : Fin 8 → V3) (q : Fin 3 → Fin 8) :
    -det4 (points4 p (orientationQuad q 0)) (points4 p (orientationQuad q 1))
      (points4 p (orientationQuad q 2)) (points4 p (orientationQuad q 3)) =
        orient (p (q 0)) (p (q 1)) (p (q 2)) := by
  simp [orientationQuad,homogeneous_projection]

theorem orient_correct (p : Fin 8 → V3) (hp : GeneralPoints (points4 p))
    (q : Fin 3 → Fin 8) (hq : Function.Injective q) :
    (orientExpr q).eval (assignment (points4 p) (lines p)) =
      positive (orient (p (q 0)) (p (q 1)) (p (q 2))) := by
  have h := chi_correct (points4 p) (lines p) hp (orientationQuad q) (orientationQuad_injective q hq)
  rw [orientationQuad_det] at h
  exact h

theorem orient_nonzero (p : Fin 8 → V3) (hp : GeneralPoints (points4 p))
    (q : Fin 3 → Fin 8) (hq : Function.Injective q) : orient (p (q 0)) (p (q 1)) (p (q 2)) ≠ 0 := by
  have h := neg_ne_zero.mpr (hp (orientationQuad q) (orientationQuad_injective q hq))
  rw [orientationQuad_det] at h
  exact h

def GeneralLines (ls : Fin 8 → V3) : Prop := ∀ q : Fin 3 → Fin 8,
  Function.Injective q → det3 (ls (q 0)) (ls (q 1)) (ls (q 2)) ≠ 0

structure Frame where
  points : Fin 8 → V3
  pointGeneric : GeneralPoints (points4 points)
  lineGeneric : GeneralLines (lines points)

noncomputable def Frame.input (f : Frame) : Nat → Bool := assignment (points4 f.points) (lines f.points)

theorem frame_input_zero (f : Frame) : f.input 0=true := assignment_zero _ _

end Stick81.RoofFrame
