import ProjectiveAlgebra
import Mathlib.Tactic.LinearCombination

namespace Stick81.Geometry

theorem wheel_factor_a (h a b c d : V3) :
    det3 h a d * det3 a b c - det3 h a c * det3 a b d =
      -det3 h a b * det3 a c d := by
  simp only [det3,dot,cross]
  ring

theorem wheel_factor_b (h a b c d : V3) :
    (-det3 h b d) * det3 a b c - (-det3 h b c) * det3 a b d =
      det3 h a b * det3 b c d := by
  simp only [det3,dot,cross]
  ring

def heightForm (a b fa fb : V3) : ℝ := dot (sub fa fb) (cross a b)

theorem heightForm_symmetric (a b fa fb : V3) : heightForm a b fa fb=heightForm b a fb fa := by
  simp only [heightForm,dot,sub,cross]
  ring

set_option maxHeartbeats 0 in
theorem wheel_height_identity (h a b c d fh fa fb fc fd : V3) :
    let v0 := det3 a b c
    let v1 := -det3 h b c
    let v2 := det3 h a c
    let v3 := -det3 h a b
    let w0 := det3 a b d
    let w1 := -det3 h b d
    let w2 := det3 h a d
    let w4 := -det3 h a b
    (-v1*w1*det3 h a b*det3 a c d) * heightForm h a fh fa +
    (v2*w2*det3 h a b*det3 b c d) * heightForm h b fh fb +
    (w1*w2*v0*v3) * heightForm h c fh fc +
    (-v1*v2*w0*w4) * heightForm h d fh fd +
    (w1*w2*v1*v3) * heightForm a c fa fc +
    (-v1*v2*w1*w4) * heightForm a d fa fd +
    (w1*w2*v2*v3) * heightForm b c fb fc +
    (-v1*v2*w2*w4) * heightForm b d fb fd = 0 := by
  have hv := four_line_stress h a b c fh fa fb fc
  have hw := four_line_stress h a b d fh fa fb fd
  have hfa := wheel_factor_a h a b c d
  have hfb := wheel_factor_b h a b c d
  dsimp only at hv hw ⊢
  unfold heightForm
  linear_combination
    ((-det3 h b d)*(det3 h a d))*hv -
    ((-det3 h b c)*(det3 h a c))*hw -
    ((-det3 h b c)*(-det3 h b d)*dot (sub fh fa) (cross h a))*hfa -
    ((det3 h a c)*(det3 h a d)*dot (sub fh fb) (cross h b))*hfb

#print axioms wheel_height_identity

end Stick81.Geometry
