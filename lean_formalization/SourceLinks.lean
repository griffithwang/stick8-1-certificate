import LocalReduction
import CircuitData

namespace Stick81
open Circuit LocalReduction

structure SourceLink where
  idList : List Nat
  gateIds : List Nat
  root : Lit
  op : SourceOp

def gateArray : Array Gate := roofGates.toArray
def gateAt (i : Nat) : Gate := (gateArray[i]?).getD ⟨0,.and []⟩

theorem gateAt_mem (i : Nat) (hi : i < roofGates.length) : gateAt i ∈ roofGates := by
  have h : i < gateArray.size := by simpa [gateArray] using hi
  unfold gateAt
  rw [Array.getElem?_eq_getElem h]
  simpa only [Option.getD_some,gateArray,List.getElem_toArray] using (List.getElem_mem hi)

def SourceLink.ids (l : SourceLink) (i : Fin 8) : Nat := l.idList.getD i.val 0
def SourceLink.gates (l : SourceLink) : List Gate := l.gateIds.map gateAt

def SourceLink.Valid (l : SourceLink) : Prop :=
  l.idList.length=8 ∧
  (∀ i ∈ l.gateIds, i < roofGates.length) ∧
  LocalOrder (inputs l.ids) l.gates ∧
  l.root.1 ∈ knownAfter (inputs l.ids) l.gates ∧
  (∀ a ∈ l.op.args, a.1 ∈ inputs l.ids)

instance (l : SourceLink) : Decidable l.Valid :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _))

def SourceLink.verify (l : SourceLink) : Bool :=
  decide l.Valid && checked l.ids l.gates l.root l.op

theorem link_sound (l : SourceLink) (h : l.verify=true) (σ : Nat → Bool)
    (hzero : σ 0=true) (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ l.root=l.op.eval σ := by
  have hs : decide l.Valid=true ∧ checked l.ids l.gates l.root l.op=true := by
    simpa only [SourceLink.verify,Bool.and_eq_true] using h
  have hv : l.Valid := of_decide_eq_true hs.1
  rcases hv with ⟨hsize,hbounds,horder,hroot,hargs⟩
  apply checked_sound l.ids l.gates l.root l.op hs.2 horder hroot hargs σ hzero
  intro g hg
  obtain ⟨i,hi,rfl⟩ := List.mem_map.mp hg
  exact models (gateAt i) (gateAt_mem i (hbounds i hi))

def natList (s : String) : Except String (List Nat) := do
  if s.trim.isEmpty then return []
  (s.trim.splitOn " ").mapM fun s =>
    match s.toNat? with
    | some n => .ok n
    | none => .error "invalid natural"

def parseSourceOp (s : String) : Except String SourceOp := do
  let op::args := s.trim.splitOn " " | throw "missing source operation"
  if op=="c" then
    match args with
    | ["0"] => return .constant false
    | ["1"] => return .constant true
    | _ => throw "invalid source constant"
  let as ← args.mapM parseLit
  match op,as with
  | "v",[a] => return .literal a
  | "n",[a] => return .not a
  | "a",xs => return .and xs
  | "o",xs => return .or xs
  | "e",[a,b] => return .eq a b
  | "x",[a,b] => return .xor a b
  | "i",[a,b] => return .implies a b
  | "t",[a,b,c] => return .ite a b c
  | _,_ => throw "invalid source operation/arity"

def parseSourceLink (s : String) : Except String SourceLink := do
  let [ids,gs,out,op] := s.trim.splitOn "|" | throw "invalid source link"
  return ⟨← natList ids,← natList gs,← parseLit out,← parseSourceOp op⟩

def sourceLinksText : String := embed_text% "../source_links.txt"
def sourceLinks : List SourceLink :=
  match (sourceLinksText.splitOn "\n").mapM parseSourceLink with
  | .ok ls => ls
  | .error _ => []

theorem sourceLinkCount : sourceLinks.length=23563 := by native_decide

set_option maxRecDepth 100000 in
theorem allSourceLinksVerified : sourceLinks.all SourceLink.verify=true := by native_decide

theorem source_links_sound (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    ∀ l ∈ sourceLinks, val σ l.root=l.op.eval σ := by
  intro l hl
  exact link_sound l (List.all_eq_true.mp allSourceLinksVerified l hl) σ hzero models

#print axioms source_links_sound

end Stick81
