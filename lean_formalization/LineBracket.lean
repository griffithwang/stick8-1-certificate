import LineRelations
import SourceData

namespace Stick81.LineBracket
open Geometry RoofFrame GeometricInput Expression SourceSemantics LineRelations

structure Case where
  edges : List (Fin 8)
  root : Nat

def Case.q (c : Case) (i : Fin 3) : Fin 8 := c.edges.getD i.val 0

def cases : List Case := [
⟨[0,2,4],11149⟩,
⟨[2,4,0],11155⟩,
⟨[4,0,2],11161⟩,
⟨[0,2,5],11167⟩,
⟨[2,5,0],11173⟩,
⟨[5,0,2],11179⟩,
⟨[0,2,6],11185⟩,
⟨[2,6,0],11191⟩,
⟨[6,0,2],11197⟩,
⟨[0,3,5],11203⟩,
⟨[3,5,0],11209⟩,
⟨[5,0,3],11215⟩,
⟨[0,3,6],11221⟩,
⟨[3,6,0],11227⟩,
⟨[6,0,3],11233⟩,
⟨[0,4,6],11239⟩,
⟨[4,6,0],11245⟩,
⟨[6,0,4],11251⟩,
⟨[1,3,5],11257⟩,
⟨[3,5,1],11263⟩,
⟨[5,1,3],11269⟩,
⟨[1,3,6],11275⟩,
⟨[3,6,1],11281⟩,
⟨[6,1,3],11287⟩,
⟨[1,3,7],11293⟩,
⟨[3,7,1],11299⟩,
⟨[7,1,3],11305⟩,
⟨[1,4,6],11311⟩,
⟨[4,6,1],11317⟩,
⟨[6,1,4],11323⟩,
⟨[1,4,7],11329⟩,
⟨[4,7,1],11335⟩,
⟨[7,1,4],11341⟩,
⟨[1,5,7],11347⟩,
⟨[5,7,1],11353⟩,
⟨[7,1,5],11359⟩,
⟨[2,4,6],11365⟩,
⟨[4,6,2],11371⟩,
⟨[6,2,4],11377⟩,
⟨[2,4,7],11383⟩,
⟨[4,7,2],11389⟩,
⟨[7,2,4],11395⟩,
⟨[2,5,7],11401⟩,
⟨[5,7,2],11407⟩,
⟨[7,2,5],11413⟩,
⟨[3,5,7],11419⟩,
⟨[5,7,3],11425⟩,
⟨[7,3,5],11431⟩
]

def Case.Valid (c : Case) : Prop := c.edges.length=3 ∧ Function.Injective c.q ∧ LineDefinitions.independent c.q=true ∧
  c.root<sourceNodes.size ∧ expand 64 sourceNodes c.root=some (bracketExpr c.q)
instance (c : Case) : Decidable c.Valid :=
  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 3, c.q a=c.q b → a=b) ∧ _ ∧ _ ∧ _))

theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide
theorem caseCount : cases.length=48 := by native_decide
theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 1540).take 48 := by native_decide

theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)
    (c : Case) (hc : c ∈ cases) : values c.root=true := by
  have hv : c.Valid := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)
  obtain ⟨hlen,hinj,hguard,hbound,hex⟩ := hv
  have he := expand_sound 64 sourceNodes f.input values hm c.root (bracketExpr c.q) hex
  exact he.symm.trans (bracket_geometric f c.q hinj hguard)

theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 1540).take 48, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi
  exact root_true f values hm c hc

#print axioms all_roots
end Stick81.LineBracket
