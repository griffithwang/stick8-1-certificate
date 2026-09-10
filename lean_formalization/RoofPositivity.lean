import RoofFrame

namespace Stick81.RoofFrame
open Geometry GeometricInput SignRules

def Frame.Positive (f : Frame) : Prop := ∀ i : Fin 8, 0 < (f.points i).2.2
def depthFunctional : V4 := (0,0,1,0)
def projectionLift (p : V3) : V3 := (p.1,p.2.1,1)

theorem projection_determinant (a b c : V3) :
    det3 (projectionLift a) (projectionLift b) (projectionLift c)=orient a b c := by
  simp only [det3,dot,cross,projectionLift,orient]
  ring

theorem depth_positive (f : Frame) (hp : f.Positive) (i : Fin 9) :
    0 < dot4 depthFunctional (points4 f.points i) := by
  unfold points4
  split
  next h => simpa [dot4,depthFunctional,homogenize] using hp ⟨i.val,h⟩
  next h => norm_num [dot4,depthFunctional,infinity]

theorem projection_positive (p : V3) : 0 < dot (0,0,1) (projectionLift p) := by
  norm_num [dot,projectionLift]

theorem positive_scaling (x s : ℝ) (hs : 0<s) : positive (x*s)=positive x := by
  by_cases hx : 0<x
  · simp [positive,hx,mul_pos hx hs]
  · have hp : x*s ≤ 0 := mul_nonpos_of_nonpos_of_nonneg (le_of_not_gt hx) hs.le
    simp [positive,hx,not_lt_of_ge hp]

end Stick81.RoofFrame
