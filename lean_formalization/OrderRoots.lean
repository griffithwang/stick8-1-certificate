import CrossingOrder
import SourceData

namespace Stick81.OrderRoots
open Geometry RoofFrame Expression SourceSemantics

structure Case where
  edges : List (Fin 8)
  root : Nat
def Case.q (c : Case) (i : Fin 4) : Fin 8 := c.edges.getD i.val 0

def cases : List Case := [
⟨[0,2,3,4],21521⟩,
⟨[0,2,3,5],21532⟩,
⟨[0,2,3,6],21543⟩,
⟨[0,2,4,5],21554⟩,
⟨[0,2,4,6],21562⟩,
⟨[0,2,5,6],21573⟩,
⟨[0,3,4,5],21581⟩,
⟨[0,3,4,6],21589⟩,
⟨[0,3,5,6],21594⟩,
⟨[0,4,5,6],21602⟩,
⟨[1,3,4,5],21616⟩,
⟨[1,3,4,6],21627⟩,
⟨[1,3,4,7],21638⟩,
⟨[1,3,5,6],21649⟩,
⟨[1,3,5,7],21657⟩,
⟨[1,3,6,7],21668⟩,
⟨[1,4,5,6],21676⟩,
⟨[1,4,5,7],21684⟩,
⟨[1,4,6,7],21689⟩,
⟨[1,5,6,7],21697⟩,
⟨[2,0,4,5],21711⟩,
⟨[2,0,4,6],21722⟩,
⟨[2,0,4,7],21733⟩,
⟨[2,0,5,6],21744⟩,
⟨[2,0,5,7],21752⟩,
⟨[2,0,6,7],21763⟩,
⟨[2,4,5,6],21771⟩,
⟨[2,4,5,7],21779⟩,
⟨[2,4,6,7],21784⟩,
⟨[2,5,6,7],21792⟩,
⟨[3,0,1,5],21806⟩,
⟨[3,0,1,6],21817⟩,
⟨[3,0,1,7],21828⟩,
⟨[3,0,5,6],21839⟩,
⟨[3,0,5,7],21847⟩,
⟨[3,0,6,7],21858⟩,
⟨[3,1,5,6],21866⟩,
⟨[3,1,5,7],21874⟩,
⟨[3,1,6,7],21879⟩,
⟨[3,5,6,7],21887⟩,
⟨[4,0,1,2],21901⟩,
⟨[4,0,1,6],21912⟩,
⟨[4,0,1,7],21923⟩,
⟨[4,0,2,6],21934⟩,
⟨[4,0,2,7],21942⟩,
⟨[4,0,6,7],21953⟩,
⟨[4,1,2,6],21961⟩,
⟨[4,1,2,7],21969⟩,
⟨[4,1,6,7],21974⟩,
⟨[4,2,6,7],21982⟩,
⟨[5,0,1,2],21996⟩,
⟨[5,0,1,3],22007⟩,
⟨[5,0,1,7],22018⟩,
⟨[5,0,2,3],22029⟩,
⟨[5,0,2,7],22037⟩,
⟨[5,0,3,7],22048⟩,
⟨[5,1,2,3],22056⟩,
⟨[5,1,2,7],22064⟩,
⟨[5,1,3,7],22069⟩,
⟨[5,2,3,7],22077⟩,
⟨[6,0,1,2],22091⟩,
⟨[6,0,1,3],22102⟩,
⟨[6,0,1,4],22113⟩,
⟨[6,0,2,3],22124⟩,
⟨[6,0,2,4],22132⟩,
⟨[6,0,3,4],22143⟩,
⟨[6,1,2,3],22151⟩,
⟨[6,1,2,4],22159⟩,
⟨[6,1,3,4],22164⟩,
⟨[6,2,3,4],22172⟩,
⟨[7,1,2,3],22186⟩,
⟨[7,1,2,4],22197⟩,
⟨[7,1,2,5],22208⟩,
⟨[7,1,3,4],22219⟩,
⟨[7,1,3,5],22227⟩,
⟨[7,1,4,5],22238⟩,
⟨[7,2,3,4],22246⟩,
⟨[7,2,3,5],22254⟩,
⟨[7,2,4,5],22259⟩,
⟨[7,3,4,5],22267⟩
]

def Case.Valid (c : Case) : Prop := c.edges.length=4 ∧ Function.Injective c.q ∧
  LineDefinitions.adjacent (c.q 0) (c.q 1)=false ∧ LineDefinitions.adjacent (c.q 0) (c.q 2)=false ∧
  LineDefinitions.adjacent (c.q 0) (c.q 3)=false ∧ c.root<sourceNodes.size ∧
  expand 64 sourceNodes c.root=some (CrossingOrder.constraint c.q)
instance (c : Case) : Decidable c.Valid :=
  inferInstanceAs (Decidable (_ ∧ (∀ a b : Fin 4, c.q a=c.q b → a=b) ∧ _ ∧ _ ∧ _ ∧ _ ∧ _))

theorem casesVerified : cases.all (fun c => decide c.Valid)=true := by native_decide
theorem caseCount : cases.length=80 := by native_decide
theorem rootsCovered : cases.map Case.root=(sourceRootIndices.drop 2212).take 80 := by native_decide

theorem root_true (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values)
    (c : Case) (hc : c ∈ cases) : values c.root=true := by
  obtain ⟨hlen,hinj,h1,h2,h3,hbound,hex⟩ := of_decide_eq_true (List.all_eq_true.mp casesVerified c hc)
  exact (expand_sound 64 sourceNodes f.input values hm c.root _ hex).symm.trans
    (CrossingOrder.geometric f c.q hinj h1 h2 h3)

theorem all_roots (f : Frame) (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 2212).take 80, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  obtain ⟨c,hc,rfl⟩ := List.mem_map.mp hi
  exact root_true f values hm c hc

#print axioms all_roots
end Stick81.OrderRoots
