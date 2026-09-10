import ProjectedAcyclic
import SourceData

namespace Stick81.ProjectedAcyclicRoots
open Geometry RoofFrame GeometricInput Expression SourceSemantics

structure Case where
  points : List (Fin 8)
  root : Nat

def Case.q (c : Case) (i : Fin 4) : Fin 8 := c.points.getD i.val 0

def cases : List Case := [
⟨[0,1,2,3],11917⟩,
⟨[0,1,2,4],11920⟩,
⟨[0,1,2,5],11923⟩,
⟨[0,1,2,6],11926⟩,
⟨[0,1,2,7],11929⟩,
⟨[0,1,3,4],11932⟩,
⟨[0,1,3,5],11935⟩,
⟨[0,1,3,6],11938⟩,
⟨[0,1,3,7],11941⟩,
⟨[0,1,4,5],11944⟩,
⟨[0,1,4,6],11947⟩,
⟨[0,1,4,7],11950⟩,
⟨[0,1,5,6],11953⟩,
⟨[0,1,5,7],11956⟩,
⟨[0,1,6,7],11959⟩,
⟨[0,2,3,4],11962⟩,
⟨[0,2,3,5],11965⟩,
⟨[0,2,3,6],11968⟩,
⟨[0,2,3,7],11971⟩,
⟨[0,2,4,5],11974⟩,
⟨[0,2,4,6],11977⟩,
⟨[0,2,4,7],11980⟩,
⟨[0,2,5,6],11983⟩,
⟨[0,2,5,7],11986⟩,
⟨[0,2,6,7],11989⟩,
⟨[0,3,4,5],11992⟩,
⟨[0,3,4,6],11995⟩,
⟨[0,3,4,7],11998⟩,
⟨[0,3,5,6],12001⟩,
⟨[0,3,5,7],12004⟩,
⟨[0,3,6,7],12007⟩,
⟨[0,4,5,6],12010⟩,
⟨[0,4,5,7],12013⟩,
⟨[0,4,6,7],12016⟩,
⟨[0,5,6,7],12019⟩,
⟨[1,2,3,4],12022⟩,
⟨[1,2,3,5],12025⟩,
⟨[1,2,3,6],12028⟩,
⟨[1,2,3,7],12031⟩,
⟨[1,2,4,5],12034⟩,
⟨[1,2,4,6],12037⟩,
⟨[1,2,4,7],12040⟩,
⟨[1,2,5,6],12043⟩,
⟨[1,2,5,7],12046⟩,
⟨[1,2,6,7],12049⟩,
⟨[1,3,4,5],12052⟩,
⟨[1,3,4,6],12055⟩,
⟨[1,3,4,7],12058⟩,
⟨[1,3,5,6],12061⟩,
⟨[1,3,5,7],12064⟩,
⟨[1,3,6,7],12067⟩,
⟨[1,4,5,6],12070⟩,
⟨[1,4,5,7],12073⟩,
⟨[1,4,6,7],12076⟩,
⟨[1,5,6,7],12079⟩,
⟨[2,3,4,5],12082⟩,
⟨[2,3,4,6],12085⟩,
⟨[2,3,4,7],12088⟩,
⟨[2,3,5,6],12091⟩,
⟨[2,3,5,7],12094⟩,
⟨[2,3,6,7],12097⟩,
⟨[2,4,5,6],12100⟩,
⟨[2,4,5,7],12103⟩,
⟨[2,4,6,7],12106⟩,
⟨[2,5,6,7],12109⟩,
⟨[3,4,5,6],12112⟩,
⟨[3,4,5,7],12115⟩,
⟨[3,4,6,7],12118⟩,
⟨[3,5,6,7],12121⟩,
⟨[4,5,6,7],12124⟩
]

def Case.Valid (c : Case) : Prop := c.points.length=4 ∧ Function.Injective c.q ∧
  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (ProjectedAcyclic.constraint c.q)
instance (c : Case) : Decidable c.Valid :=
  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 4, c.q a=c.q b → a=b) ∧ _ ∧ _))

theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide
theorem caseCount : cases.length=70 := by native_decide
theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 1714).take 70 := by native_decide

theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)
    (c : Case) (hc : c ∈ cases) : values c.root=true := by
  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)
  obtain ⟨hlen,hinj,hbound,hex⟩ := hv
  have he := expand_sound 64 sourceNodes f.input values hm c.root (ProjectedAcyclic.constraint c.q) hex
  exact he.symm.trans (ProjectedAcyclic.geometric f c.q hinj)

theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 1714).take 70, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi
  exact root_true f values hm c hc

#print axioms all_roots
end Stick81.ProjectedAcyclicRoots
