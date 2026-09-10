import Circuit
import CertificateCodec

namespace Stick81
open Circuit

def parseLit (s : String) : Except String Lit := do
  let some n := s.toInt? | throw "invalid integer literal"
  if n == 0 then throw "zero literal"
  return (n.natAbs-1,decide (n>0))

def parseGate (s : String) : Except String Gate := do
  let out :: op :: args := s.trim.splitOn " " | throw "invalid gate"
  let some y := out.toNat? | throw "invalid output"
  let args ← args.mapM parseLit
  match op,args with
  | "a", xs => return ⟨y,.and xs⟩
  | "e", [a,b] => return ⟨y,.eq a b⟩
  | "m", [a,b,c] => return ⟨y,.majority a b c⟩
  | _,_ => throw "invalid gate type/arity"

def gateText : String := embed_text% "../gates.txt"
def rootText : String := embed_text% "../roots.txt"

def roofGates : List Gate :=
  match ((gateText.splitOn "\n").filter (fun s => !s.isEmpty)).mapM parseGate with
  | .ok gs => gs
  | .error _ => []

def roofRoots : List Lit :=
  match (rootText.splitOn " ").mapM parseLit with
  | .ok rs => rs
  | .error _ => []

set_option maxRecDepth 100000 in
theorem roofGates_ordered : GoodOrder 0 roofGates := by native_decide

theorem roofGateCount : roofGates.length = 18454 := by native_decide
theorem roofRootCount : roofRoots.length = 2295 := by native_decide

end Stick81
