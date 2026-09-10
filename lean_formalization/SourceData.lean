import SourceSemantics
import SourceLinks

namespace Stick81
open Circuit LocalReduction SourceSemantics

def parseWeightedArgs : List String → Except String (List (Lit × Int))
  | [] => .ok []
  | a::w::rest => do
    let lit ← parseLit a
    let some weight := w.toInt? | throw "invalid weight"
    return (lit,weight)::(← parseWeightedArgs rest)
  | _ => .error "odd number of weighted arguments"

def parseNode (s : String) : Except String Node := do
  let [enc,desc] := s.trim.splitOn "|" | throw "invalid source node"
  let out ← parseLit enc
  let tag::args := desc.splitOn " " | throw "invalid source node operation"
  match tag,args with
  | "v",[n] =>
    let some v := n.toNat? | throw "invalid input variable"
    return ⟨out,.input v⟩
  | "b",_ => return ⟨out,.boolean (← parseSourceOp (String.intercalate " " args))⟩
  | "q",bound::rest =>
    let some k := bound.toInt? | throw "invalid equality bound"
    return ⟨out,.pbEq (← parseWeightedArgs rest) k⟩
  | "g",bound::rest =>
    let some k := bound.toInt? | throw "invalid inequality bound"
    return ⟨out,.pbGe (← parseWeightedArgs rest) k⟩
  | _,_ => throw "invalid source node operation/arity"

def sourceDAGText : String := embed_text% "../source_dag.txt"
def sourceRootIndicesText : String := embed_text% "../source_root_indices.txt"
def sourceNodes : Array Node :=
  match (sourceDAGText.splitOn "\n").mapM parseNode with
  | .ok ns => ns.toArray
  | .error _ => #[]
def sourceRootIndices : List Nat :=
  match natList sourceRootIndicesText with
  | .ok rs => rs
  | .error _ => []

theorem sourceNodeCount : sourceNodes.size=23565 := by native_decide
theorem sourceRootIndexCount : sourceRootIndices.length=2294 := by native_decide
theorem sourceOrdered : Ordered sourceNodes := by unfold Ordered; native_decide

def linkArray : Array SourceLink := sourceLinks.toArray
def linkAt (i : Nat) : SourceLink :=
  (linkArray[i]?).getD ⟨[],[],(0,true),.constant false⟩

theorem linkAt_mem (i : Nat) (hi : i<23563) : linkAt i ∈ sourceLinks := by
  have hlen : i<sourceLinks.length := by rw [sourceLinkCount]; exact hi
  have h : i<linkArray.size := by simpa [linkArray] using hlen
  unfold linkAt
  rw [Array.getElem?_eq_getElem h]
  simpa only [Option.getD_some,linkArray,List.getElem_toArray] using (List.getElem_mem hlen)

def CoreShapes : Prop := ∀ i : Fin 23563,
  (nodeAt sourceNodes i.val).encoding=(linkAt i.val).root ∧
  translatedBoolean (encoding sourceNodes) (nodeAt sourceNodes i.val).op=some (linkAt i.val).op

theorem coreShapesVerified : CoreShapes := by unfold CoreShapes; native_decide

theorem core_nodes_model (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    ∀ i : Fin 23563,
      val σ (encoding sourceNodes i.val) =
        (nodeAt sourceNodes i.val).op.eval σ (fun j => val σ (encoding sourceNodes j)) := by
  intro i
  obtain ⟨henc,hop⟩ := coreShapesVerified i
  have hl := source_links_sound σ hzero models (linkAt i.val) (linkAt_mem i.val i.isLt)
  change val σ (nodeAt sourceNodes i.val).encoding = _
  rw [henc,hl]
  exact translatedBoolean_sound σ (encoding sourceNodes) _ _ hop

theorem sourceRoots_encoding : roofRoots =
    (0,true) :: sourceRootIndices.map (encoding sourceNodes) := by native_decide

theorem sourceRoots_inBounds : ∀ i ∈ sourceRootIndices, i<sourceNodes.size := by native_decide

def InputUnused : NodeOp → Prop
  | .input v => ∀ g ∈ roofGates, g.out ≠ v
  | _ => True

instance (op : NodeOp) : Decidable (InputUnused op) := by
  cases op <;> unfold InputUnused <;> infer_instance

def InputsUnused : Prop := ∀ i : Fin sourceNodes.size, InputUnused (nodeAt sourceNodes i.val).op

theorem sourceInputsUnused : InputsUnused := by unfold InputsUnused; native_decide
theorem gatesAboveZero : GoodOrder 1 roofGates := by native_decide

end Stick81
