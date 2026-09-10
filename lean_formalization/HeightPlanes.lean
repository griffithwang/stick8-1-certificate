import RoofFrame
import Wheel

namespace Stick81.HeightPlanes
open Geometry RoofFrame GeometricInput

noncomputable def plane (a b : V3) : V3 := by
  classical
  exact if a.1=b.1 then
    (0,(a.2.2-b.2.2)/(a.2.1-b.2.1),a.2.2-((a.2.2-b.2.2)/(a.2.1-b.2.1))*a.2.1)
  else
    ((a.2.2-b.2.2)/(a.1-b.1),0,a.2.2-((a.2.2-b.2.2)/(a.1-b.1))*a.1)

theorem plane_fits (a b : V3) (h : a.1≠b.1 ∨ a.2.1≠b.2.1) :
    dot (plane a b) (a.1,a.2.1,1)=a.2.2 ∧ dot (plane a b) (b.1,b.2.1,1)=b.2.2 := by
  classical
  by_cases hx : a.1=b.1
  · have hy := h.resolve_left (fun hne => hne hx)
    unfold plane
    rw [if_pos hx]
    simp only [dot]
    constructor <;> field_simp [sub_ne_zero.mpr hy] <;> ring
  · unfold plane
    rw [if_neg hx]
    simp only [dot]
    constructor <;> field_simp [sub_ne_zero.mpr hx] <;> ring

theorem next_triple_injective : ∀ i : Fin 8, Function.Injective (![i,next i,next (next i)] : Fin 3 → Fin 8) := by
  unfold Function.Injective
  native_decide

theorem projected_endpoints_distinct (f : Frame) (i : Fin 8) :
    (f.points i).1≠(f.points (next i)).1 ∨ (f.points i).2.1≠(f.points (next i)).2.1 := by
  have h := orient_nonzero f.points f.pointGeneric ![i,next i,next (next i)] (next_triple_injective i)
  by_contra hc
  push_neg at hc
  obtain ⟨hx,hy⟩ := hc
  apply h
  simp [orient,hx,hy]

/- At i=7 this is the auxiliary affine chord, not the roof overpass.
   The actual height-stress constraints must be instantiated only on edges 0..6. -/
noncomputable def edgePlane (f : Frame) (i : Fin 8) : V3 := plane (f.points i) (f.points (next i))

theorem lift_eq (p a : V3) (h : dot a (p.1,p.2.1,1)=p.2.2) : heightLift p a=p := by
  rcases p with ⟨x,y,z⟩
  simp only [heightLift,h]

theorem edge_lifts (f : Frame) (i : Fin 8) :
    heightLift (f.points i) (edgePlane f i)=f.points i ∧
    heightLift (f.points (next i)) (edgePlane f i)=f.points (next i) := by
  have h := plane_fits (f.points i) (f.points (next i)) (projected_endpoints_distinct f i)
  exact ⟨lift_eq _ _ h.1,lift_eq _ _ h.2⟩

def spatialHeight (p : Fin 8 → V3) (i j : Fin 8) : ℝ := volume (p i) (p (next i)) (p j) (p (next j))

theorem spatial_height_form (f : Frame) (i j : Fin 8) :
    spatialHeight f.points i j = heightForm (lines f.points i) (lines f.points j) (edgePlane f i) (edgePlane f j) := by
  have hi := edge_lifts f i
  have hj := edge_lifts f j
  have h := affine_height_identity (f.points i) (f.points (next i)) (f.points j) (f.points (next j))
    (edgePlane f i) (edgePlane f j)
  rw [hi.1,hi.2,hj.1,hj.2] at h
  exact h

theorem volume_repeat_middle (a b c : V3) : volume a b b c=0 := by
  simp only [volume,sub,det3,dot,cross]
  ring

theorem volume_repeat_outer (a b c : V3) : volume a b c a=0 := by
  simp only [volume,sub,det3,dot,cross]
  ring

theorem height_adjacent_forward (p : Fin 8 → V3) (i j : Fin 8) (h : next i=j) : spatialHeight p i j=0 := by
  subst j
  exact volume_repeat_middle _ _ _

theorem height_adjacent_backward (p : Fin 8 → V3) (i j : Fin 8) (h : next j=i) : spatialHeight p i j=0 := by
  unfold spatialHeight
  rw [h]
  exact volume_repeat_outer _ _ _

#print axioms spatial_height_form

end Stick81.HeightPlanes
