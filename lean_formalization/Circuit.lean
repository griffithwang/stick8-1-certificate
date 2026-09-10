import Mathlib.Data.List.GetD
import Mathlib.Tactic
import Std.Sat.CNF

namespace Stick81.Circuit
open Std.Sat

abbrev Lit := Nat × Bool
def val (ρ : Nat → Bool) (a : Lit) : Bool := ρ a.1 == a.2
def neg (a : Lit) : Lit := (a.1,!a.2)

@[simp] theorem val_neg (ρ : Nat → Bool) (a : Lit) : val ρ (neg a) = !val ρ a := by
  rcases a with ⟨i,p⟩
  dsimp only [val,neg]
  cases p <;> cases ρ i <;> rfl

inductive Op where
  | and (args : List Lit)
  | eq (a b : Lit)
  | majority (a b c : Lit)
  deriving Repr, DecidableEq

def Op.args : Op → List Lit
  | .and xs => xs
  | .eq a b => [a,b]
  | .majority a b c => [a,b,c]

def Op.eval (ρ : Nat → Bool) : Op → Bool
  | .and xs => xs.all (val ρ)
  | .eq a b => val ρ a == val ρ b
  | .majority a b c =>
    (val ρ a && val ρ b) || (val ρ a && val ρ c) || (val ρ b && val ρ c)

structure Gate where
  out : Nat
  op : Op
  deriving Repr, DecidableEq

def Gate.clauses (g : Gate) : CNF Nat :=
  let y : Lit := (g.out,true)
  let ny : Lit := (g.out,false)
  match g.op with
  | .and xs => xs.map (fun a => [ny,a]) ++ [[y] ++ xs.map neg]
  | .eq a b => [[ny,neg a,b],[ny,a,neg b],[y,a,b],[y,neg a,neg b]]
  | .majority a b c =>
    [[ny,a,b],[ny,a,c],[ny,b,c],[y,neg a,neg b],[y,neg a,neg c],[y,neg b,neg c]]

@[simp] theorem clause_val (ρ : Nat → Bool) (xs : List Lit) :
    CNF.Clause.eval ρ xs = xs.any (val ρ) := rfl

theorem gate_correct (ρ : Nat → Bool) (g : Gate) :
    CNF.eval ρ g.clauses = true ↔ ρ g.out = g.op.eval ρ := by
  rcases g with ⟨y,op⟩
  cases op with
  | and xs =>
    cases h : ρ y <;>
      simp [Gate.clauses,CNF.eval,Op.eval,val,neg,List.all_eq_true,List.any_eq_true,h]
  | eq a b =>
    simp only [Gate.clauses,CNF.eval,clause_val,List.all_cons,List.all_nil,
      List.any_cons,List.any_nil,val_neg,Op.eval]
    dsimp only [val]
    cases ρ y <;> cases ρ a.1 <;> cases a.2 <;>
      cases ρ b.1 <;> cases b.2 <;> decide
  | majority a b c =>
    simp only [Gate.clauses,CNF.eval,clause_val,List.all_cons,List.all_nil,
      List.any_cons,List.any_nil,val_neg,Op.eval]
    dsimp only [val]
    cases ρ y <;> cases ρ a.1 <;> cases a.2 <;>
      cases ρ b.1 <;> cases b.2 <;> cases ρ c.1 <;> cases c.2 <;> decide

def update (ρ : Nat → Bool) (g : Gate) : Nat → Bool :=
  fun i => if i = g.out then g.op.eval ρ else ρ i

def run (ρ : Nat → Bool) : List Gate → Nat → Bool
  | [] => ρ
  | g :: gs => run (update ρ g) gs

def GoodOrder (start : Nat) : List Gate → Prop
  | [] => True
  | g :: gs => start ≤ g.out ∧ (∀ a ∈ g.op.args, a.1 < g.out) ∧ GoodOrder (g.out+1) gs

instance goodOrderDecidable (start : Nat) : (gs : List Gate) → Decidable (GoodOrder start gs)
  | [] => isTrue trivial
  | g :: gs =>
    letI := goodOrderDecidable (g.out+1) gs
    inferInstanceAs (Decidable (_ ∧ _ ∧ GoodOrder (g.out+1) gs))

def toCNF (gs : List Gate) : CNF Nat := gs.flatMap Gate.clauses

theorem run_preserves (ρ : Nat → Bool) (gs : List Gate) (start i : Nat)
    (good : GoodOrder start gs) (hi : i < start) : run ρ gs i = ρ i := by
  induction gs generalizing ρ start with
  | nil => rfl
  | cons g gs ih =>
    rcases good with ⟨hout,hargs,htail⟩
    rw [run,ih (update ρ g) (g.out+1) htail (by omega)]
    simp [update,show i ≠ g.out by omega]

theorem op_congr (op : Op) (ρ σ : Nat → Bool)
    (h : ∀ a ∈ op.args, ρ a.1 = σ a.1) : op.eval ρ = op.eval σ := by
  cases op with
  | and xs =>
    change ∀ a ∈ xs, ρ a.1 = σ a.1 at h
    change xs.all (val ρ) = xs.all (val σ)
    induction xs with
    | nil => rfl
    | cons a xs ih =>
      simp only [List.all_cons]
      rw [show val ρ a = val σ a by simp [val,h a (by simp)]]
      rw [ih (fun b hb => h b (by simp [hb]))]
  | eq a b => simp_all [Op.args,Op.eval,val]
  | majority a b c => simp_all [Op.args,Op.eval,val]

/- Existential extension is proved for every input assignment and every
   well-ordered circuit, not by sampling the fixed circuit's input values. -/
theorem run_satisfies (ρ : Nat → Bool) (gs : List Gate) (start : Nat)
    (good : GoodOrder start gs) : CNF.eval (run ρ gs) (toCNF gs) = true := by
  induction gs generalizing ρ start with
  | nil => rfl
  | cons g gs ih =>
    rcases good with ⟨hout,hargs,htail⟩
    simp only [run,toCNF,List.flatMap_cons,CNF.eval_append,Bool.and_eq_true]
    constructor
    · apply (gate_correct _ g).mpr
      have hy : run (update ρ g) gs g.out = g.op.eval ρ := by
        rw [run_preserves _ gs (g.out+1) _ htail (by omega)]
        simp [update]
      rw [hy]
      apply op_congr
      intro a ha
      have hi := hargs a ha
      rw [run_preserves _ gs (g.out+1) _ htail (by omega)]
      simp [update,show a.1 ≠ g.out by omega]
    · exact ih (update ρ g) (g.out+1) htail

theorem extension_with_roots (ρ : Nat → Bool) (gs : List Gate) (start : Nat)
    (roots : List Lit) (good : GoodOrder start gs)
    (hr : ∀ a ∈ roots, val (run ρ gs) a = true) :
    CNF.eval (run ρ gs) (toCNF gs ++ roots.map (fun a => [a])) = true := by
  rw [CNF.eval_append,run_satisfies ρ gs start good]
  simp only [Bool.true_and,CNF.eval,List.all_map,List.all_eq_true]
  intro a ha
  simpa [CNF.Clause.eval,val] using hr a ha

def litKey (a : Lit) : Nat := 2*a.1 + if a.2 then 1 else 0
def canonical (f : CNF Nat) : CNF Nat :=
  f.mergeSort (fun a b => !(b.lex a (fun x y => decide (litKey x < litKey y))))

theorem eval_perm (ρ : Nat → Bool) {a b : CNF Nat} (p : a.Perm b) :
    CNF.eval ρ a = CNF.eval ρ b := by
  have hh : CNF.eval ρ a = true ↔ CNF.eval ρ b = true := by
    simp only [CNF.eval,List.all_eq_true]
    constructor
    · intro h c hc
      exact h c (p.mem_iff.mpr hc)
    · intro h c hc
      exact h c (p.mem_iff.mp hc)
  cases h₁ : CNF.eval ρ a <;> cases h₂ : CNF.eval ρ b <;> simp_all

theorem eval_canonical (ρ : Nat → Bool) (f : CNF Nat) :
    CNF.eval ρ (canonical f) = CNF.eval ρ f :=
  eval_perm ρ (List.mergeSort_perm f _)

theorem eval_eq_of_canonical_eq (ρ : Nat → Bool) {a b : CNF Nat}
    (h : canonical a = canonical b) : CNF.eval ρ a = CNF.eval ρ b := by
  rw [← eval_canonical ρ a,← eval_canonical ρ b,h]

end Stick81.Circuit
