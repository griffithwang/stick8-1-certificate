import LineRelations
import SourceData

namespace Stick81.LineIncidence
open Geometry RoofFrame GeometricInput Expression SourceSemantics LineRelations

structure Case where
  edges : List (Fin 8)
  root : Nat

def Case.q (c : Case) (i : Fin 3) : Fin 8 := c.edges.getD i.val 0

def cases : List Case := [
⟨[2,0,1],12125⟩,
⟨[0,1,2],12127⟩,
⟨[3,0,1],12128⟩,
⟨[4,0,1],12129⟩,
⟨[5,0,1],12130⟩,
⟨[6,0,1],12131⟩,
⟨[7,0,1],12132⟩,
⟨[1,7,0],12134⟩,
⟨[0,2,3],12135⟩,
⟨[2,7,0],12136⟩,
⟨[0,3,4],12137⟩,
⟨[3,7,0],12138⟩,
⟨[0,4,5],12139⟩,
⟨[4,7,0],12140⟩,
⟨[0,5,6],12141⟩,
⟨[5,7,0],12142⟩,
⟨[6,7,0],12143⟩,
⟨[0,6,7],12145⟩,
⟨[3,1,2],12146⟩,
⟨[1,2,3],12148⟩,
⟨[4,1,2],12149⟩,
⟨[5,1,2],12150⟩,
⟨[6,1,2],12151⟩,
⟨[7,1,2],12152⟩,
⟨[1,3,4],12153⟩,
⟨[1,4,5],12154⟩,
⟨[1,5,6],12155⟩,
⟨[1,6,7],12156⟩,
⟨[4,2,3],12157⟩,
⟨[2,3,4],12159⟩,
⟨[5,2,3],12160⟩,
⟨[6,2,3],12161⟩,
⟨[7,2,3],12162⟩,
⟨[2,4,5],12163⟩,
⟨[2,5,6],12164⟩,
⟨[2,6,7],12165⟩,
⟨[5,3,4],12166⟩,
⟨[3,4,5],12168⟩,
⟨[6,3,4],12169⟩,
⟨[7,3,4],12170⟩,
⟨[3,5,6],12171⟩,
⟨[3,6,7],12172⟩,
⟨[6,4,5],12173⟩,
⟨[4,5,6],12175⟩,
⟨[7,4,5],12176⟩,
⟨[4,6,7],12177⟩,
⟨[7,5,6],12178⟩,
⟨[5,6,7],12180⟩
]

def Case.Valid (c : Case) : Prop := c.edges.length=3 ∧ Function.Injective c.q ∧ next (c.q 1)=c.q 2 ∧
  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (incidenceExpr c.q)
instance (c : Case) : Decidable c.Valid :=
  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 3, c.q a=c.q b → a=b) ∧ _ ∧ _ ∧ _))

theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide
theorem caseCount : cases.length=48 := by native_decide
theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 1785).take 48 := by native_decide

theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)
    (c : Case) (hc : c ∈ cases) : values c.root=true := by
  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)
  obtain ⟨hlen,hinj,hguard,hbound,hex⟩ := hv
  have he := expand_sound 64 sourceNodes f.input values hm c.root (incidenceExpr c.q) hex
  exact he.symm.trans (incidence_geometric f c.q hinj hguard)

theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 1785).take 48, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi
  exact root_true f values hm c hc

#print axioms all_roots
end Stick81.LineIncidence
