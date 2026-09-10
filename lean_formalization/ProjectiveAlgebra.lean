import Geometry

namespace Stick81.Geometry

abbrev V4 := ℝ × ℝ × ℝ × ℝ
def dot4 (a b : V4) : ℝ :=
  a.1*b.1 + a.2.1*b.2.1 + a.2.2.1*b.2.2.1 + a.2.2.2*b.2.2.2
def det4 (a b c d : V4) : ℝ :=
  a.1 * det3 (b.2.1,b.2.2.1,b.2.2.2) (c.2.1,c.2.2.1,c.2.2.2) (d.2.1,d.2.2.1,d.2.2.2) -
  a.2.1 * det3 (b.1,b.2.2.1,b.2.2.2) (c.1,c.2.2.1,c.2.2.2) (d.1,d.2.2.1,d.2.2.2) +
  a.2.2.1 * det3 (b.1,b.2.1,b.2.2.2) (c.1,c.2.1,c.2.2.2) (d.1,d.2.1,d.2.2.2) -
  a.2.2.2 * det3 (b.1,b.2.1,b.2.2.1) (c.1,c.2.1,c.2.2.1) (d.1,d.2.1,d.2.2.1)

def homogenize (p : V3) : V4 := (p.1,p.2.1,p.2.2,1)
def infinity : V4 := (0,0,1,0)

theorem homogeneous_volume (a b c d : V3) :
    -det4 (homogenize a) (homogenize b) (homogenize c) (homogenize d) = volume a b c d := by
  simp only [det4,homogenize,volume,det3,dot,cross,sub]
  ring

theorem homogeneous_projection (a b c : V3) :
    -det4 (homogenize a) (homogenize b) (homogenize c) infinity = orient a b c := by
  simp only [det4,homogenize,infinity,orient,det3,dot,cross]
  ring

set_option maxHeartbeats 0 in
theorem plucker_homogeneous_four (a b c d e f : V4) :
    det4 a b c d * det4 a b e f - det4 a b c e * det4 a b d f +
      det4 a b c f * det4 a b d e = 0 := by
  simp only [det4,det3,dot,cross]
  ring

set_option maxHeartbeats 0 in
theorem homogeneous_circuit (a b c d e functional : V4) :
    det4 b c d e * dot4 functional a - det4 a c d e * dot4 functional b +
      det4 a b d e * dot4 functional c - det4 a b c e * dot4 functional d +
      det4 a b c d * dot4 functional e = 0 := by
  simp only [det4,dot4,det3,dot,cross]
  ring

set_option maxHeartbeats 0 in
theorem planar_circuit (a b c d functional : V3) :
    det3 b c d * dot functional a - det3 a c d * dot functional b +
      det3 a b d * dot functional c - det3 a b c * dot functional d = 0 := by
  simp only [det3,dot,cross]
  ring

def heightLift (p f : V3) : V3 := (p.1,p.2.1,dot f (p.1,p.2.1,1))

theorem affine_height_identity (a b c d fa fc : V3) :
    volume (heightLift a fa) (heightLift b fa) (heightLift c fc) (heightLift d fc) =
      dot (sub fa fc) (cross (line a b) (line c d)) := by
  simp only [heightLift,volume,line,sub,det3,dot,cross]
  ring

def planarDet (a b : V3) : ℝ := a.1*b.2.1-a.2.1*b.1

theorem parameter_difference_numerator (a b c d e f : V3) :
    planarDet (sub c a) (sub d c) * planarDet (sub b a) (sub f e) -
      planarDet (sub e a) (sub f e) * planarDet (sub b a) (sub d c) =
        -det3 (line a b) (line c d) (line e f) := by
  simp only [planarDet,sub,det3,dot,cross,line]
  ring

#print axioms plucker_homogeneous_four
#print axioms homogeneous_circuit

end Stick81.Geometry
