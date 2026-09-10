import CircuitData
import FixedCertificate

namespace Stick81
open Circuit Std.Sat

def circuitCNF : CNF Nat := toCNF roofGates ++ roofRoots.map (fun a => [a])

set_option maxRecDepth 100000 in
theorem circuit_matches_fixed_cnf : canonical circuitCNF = canonical roofCNF := by
  native_decide

theorem circuit_roots_impossible (ρ : Nat → Bool) :
    ¬ (∀ a ∈ roofRoots, val (run ρ roofGates) a = true) := by
  intro h
  have sat := extension_with_roots ρ roofGates 0 roofRoots roofGates_ordered h
  change CNF.eval (run ρ roofGates) circuitCNF = true at sat
  rw [eval_eq_of_canonical_eq _ circuit_matches_fixed_cnf] at sat
  have unsat := roofUnsat (run ρ roofGates)
  simp [unsat] at sat

#print axioms circuit_roots_impossible

end Stick81
