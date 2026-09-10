import FourHeight
import SourceData

namespace Stick81.FourHeightRoots
open Geometry RoofFrame GeometricInput Expression SourceSemantics

structure Case where
  edges : List (Fin 7)
  root : Nat
def Case.q (c : Case) (i : Fin 4) : Fin 7 := c.edges.getD i.val 0

def cases : List Case := [
⟨[0,1,2,3],12192⟩,
⟨[0,1,2,4],12207⟩,
⟨[0,1,2,5],12222⟩,
⟨[0,1,2,6],12237⟩,
⟨[0,1,3,4],12252⟩,
⟨[0,1,3,5],12270⟩,
⟨[0,1,3,6],12288⟩,
⟨[0,1,4,5],12303⟩,
⟨[0,1,4,6],12321⟩,
⟨[0,1,5,6],12336⟩,
⟨[0,2,3,4],12351⟩,
⟨[0,2,3,5],12369⟩,
⟨[0,2,3,6],12387⟩,
⟨[0,2,4,5],12405⟩,
⟨[0,2,4,6],12426⟩,
⟨[0,2,5,6],12444⟩,
⟨[0,3,4,5],12459⟩,
⟨[0,3,4,6],12477⟩,
⟨[0,3,5,6],12495⟩,
⟨[0,4,5,6],12510⟩,
⟨[1,2,3,4],12522⟩,
⟨[1,2,3,5],12537⟩,
⟨[1,2,3,6],12552⟩,
⟨[1,2,4,5],12567⟩,
⟨[1,2,4,6],12585⟩,
⟨[1,2,5,6],12600⟩,
⟨[1,3,4,5],12615⟩,
⟨[1,3,4,6],12633⟩,
⟨[1,3,5,6],12651⟩,
⟨[1,4,5,6],12666⟩,
⟨[2,3,4,5],12678⟩,
⟨[2,3,4,6],12693⟩,
⟨[2,3,5,6],12708⟩,
⟨[2,4,5,6],12723⟩,
⟨[3,4,5,6],12735⟩
]

def Case.Valid (c : Case) : Prop := c.edges.length=4 ∧ Function.Injective c.q ∧
  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (FourHeight.constraint c.q)
instance (c : Case) : Decidable c.Valid :=
  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 4, c.q a=c.q b → a=b) ∧ _ ∧ _))

theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide
theorem caseCount : cases.length=35 := by native_decide
theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 1833).take 35 := by native_decide

theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)
    (c : Case) (hc : c ∈ cases) : values c.root=true := by
  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)
  obtain ⟨hlen,hinj,hbound,hex⟩ := hv
  have he := expand_sound 64 sourceNodes f.input values hm c.root (FourHeight.constraint c.q) hex
  exact he.symm.trans (FourHeight.geometric f c.q hinj)

theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 1833).take 35, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi
  exact root_true f values hm c hc

#print axioms all_roots
end Stick81.FourHeightRoots
