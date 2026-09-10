import CrossingGeometry
import SourceData

namespace Stick81.DirectionRoots
open Geometry RoofFrame Expression SourceSemantics

structure Case where
  i : Fin 8
  j : Fin 8
  root : Nat

def cases : List Case := [
⟨0,2,21417⟩,
⟨0,3,21422⟩,
⟨0,4,21427⟩,
⟨0,5,21432⟩,
⟨0,6,21437⟩,
⟨1,3,21442⟩,
⟨1,4,21447⟩,
⟨1,5,21452⟩,
⟨1,6,21457⟩,
⟨1,7,21461⟩,
⟨2,4,21466⟩,
⟨2,5,21471⟩,
⟨2,6,21476⟩,
⟨2,7,21480⟩,
⟨3,5,21485⟩,
⟨3,6,21490⟩,
⟨3,7,21494⟩,
⟨4,6,21499⟩,
⟨4,7,21503⟩,
⟨5,7,21507⟩
]

def Case.Valid (c : Case) : Prop := c.i<c.j ∧ LineDefinitions.adjacent c.i c.j=false ∧
  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (CrossingGeometry.constraint c.i c.j)
instance (c : Case) : Decidable c.Valid := inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _))

theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide
theorem caseCount : cases.length=20 := by native_decide
theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 2192).take 20 := by native_decide

theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)
    (c : Case) (hc : c ∈ cases) : values c.root=true := by
  obtain ⟨hlt,hadj,hbound,hex⟩ := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)
  exact (expand_sound 64 sourceNodes f.input values hm c.root _ hex).symm.trans
    (CrossingGeometry.geometric f c.i c.j hadj)

theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 2192).take 20, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi
  exact root_true f values hm c hc

#print axioms all_roots
end Stick81.DirectionRoots
