import CertificateCodec
import CNFParser

open Std.Sat Std.Tactic.BVDecide

namespace Stick81

def cnfText : String := embed_text% "../roof_direct.cnf"
def compressedProofHex : String := embed_text% "roof.lz4.hex"

def roofCNF : CNF Nat :=
  match parseProjectCNF cnfText with
  | .ok cnf => cnf
  | .error _ => []

def roofProof : Array LRAT.IntAction :=
  match decompressLZ4 (fromHex compressedProofHex) 308782290 with
  | .error _ => #[]
  | .ok bytes =>
    match LRAT.parseLRATProof bytes with
    | .ok proof => proof
    | .error _ => #[]

set_option maxRecDepth 100000 in
theorem roofClauseCount : roofCNF.length = 76298 := by native_decide

/- Native reflection has the same Lean compiler trust boundary as bv_decide.
   No acceptance hypothesis, external IO call, or user axiom occurs here. -/
set_option maxRecDepth 100000 in
theorem roofAccepted : LRAT.check roofProof roofCNF = true := by native_decide

theorem roofUnsat : roofCNF.Unsat :=
  LRAT.check_sound roofProof roofCNF roofAccepted

#print axioms roofUnsat

end Stick81
