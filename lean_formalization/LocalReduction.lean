import Circuit

namespace Stick81.LocalReduction
open Circuit Std.Sat

def LocalOrder (inputs : List Nat) : List Gate → Prop
  | [] => True
  | g::gs => (∀ a ∈ g.op.args, a.1 ∈ inputs) ∧ LocalOrder (g.out::inputs) gs

instance localOrderDecidable (inputs : List Nat) : (gs : List Gate) → Decidable (LocalOrder inputs gs)
  | [] => isTrue trivial
  | g::gs =>
    letI := localOrderDecidable (g.out::inputs) gs
    inferInstanceAs (Decidable (_ ∧ LocalOrder (g.out::inputs) gs))

def knownAfter (inputs : List Nat) : List Gate → List Nat
  | [] => inputs
  | g::gs => knownAfter (g.out::inputs) gs

theorem run_congr (ρ σ : Nat → Bool) (gs : List Gate) (inputs : List Nat)
    (good : LocalOrder inputs gs) (agree : ∀ i ∈ inputs, ρ i=σ i) :
    ∀ i ∈ knownAfter inputs gs, run ρ gs i=run σ gs i := by
  induction gs generalizing ρ σ inputs with
  | nil => exact agree
  | cons g gs ih =>
    rcases good with ⟨hargs,htail⟩
    apply ih (update ρ g) (update σ g) (g.out::inputs) htail
    intro i hi
    by_cases heq : i=g.out
    · subst i
      simp only [update,ite_true]
      apply op_congr
      intro a ha
      exact agree a.1 (hargs a ha)
    · have hm : i ∈ inputs := by simpa [heq] using hi
      simp [update,heq,agree i hm]

theorem run_fixed (σ : Nat → Bool) (gs : List Gate)
    (models : ∀ g ∈ gs, σ g.out=g.op.eval σ) : run σ gs=σ := by
  induction gs with
  | nil => rfl
  | cons g gs ih =>
    have hu : update σ g=σ := by
      funext i
      by_cases h : i=g.out
      · subst i
        simp [update,models g (by simp)]
      · simp [update,h]
    rw [run,hu]
    exact ih (fun k hk => models k (by simp [hk]))

theorem gate_values_of_sat (σ : Nat → Bool) (gs : List Gate)
    (h : CNF.eval σ (toCNF gs)=true) : ∀ g ∈ gs, σ g.out=g.op.eval σ := by
  intro g hg
  apply (gate_correct σ g).mp
  simp only [CNF.eval,List.all_eq_true] at h ⊢
  intro c hc
  apply h c
  simp only [toCNF,List.mem_flatMap]
  exact ⟨g,hg,hc⟩

theorem local_derivation (σ ρ : Nat → Bool) (gs : List Gate) (inputs : List Nat) (root : Lit)
    (good : LocalOrder inputs gs) (agree : ∀ i ∈ inputs, ρ i=σ i)
    (models : ∀ g ∈ gs, σ g.out=g.op.eval σ)
    (hr : root.1 ∈ knownAfter inputs gs) : val (run ρ gs) root=val σ root := by
  have h := run_congr ρ σ gs inputs good agree root.1 hr
  rw [run_fixed σ gs models] at h
  simp [val,h]

inductive SourceOp where
  | literal (a : Lit)
  | constant (b : Bool)
  | not (a : Lit)
  | and (xs : List Lit)
  | or (xs : List Lit)
  | eq (a b : Lit)
  | xor (a b : Lit)
  | implies (a b : Lit)
  | ite (a b c : Lit)
  deriving Repr, DecidableEq

def SourceOp.args : SourceOp → List Lit
  | .literal a | .not a => [a]
  | .constant _ => []
  | .and xs | .or xs => xs
  | .eq a b | .xor a b | .implies a b => [a,b]
  | .ite a b c => [a,b,c]

def SourceOp.eval (ρ : Nat → Bool) : SourceOp → Bool
  | .literal a => val ρ a
  | .constant b => b
  | .not a => !val ρ a
  | .and xs => xs.all (val ρ)
  | .or xs => xs.any (val ρ)
  | .eq a b => val ρ a == val ρ b
  | .xor a b => val ρ a != val ρ b
  | .implies a b => !val ρ a || val ρ b
  | .ite a b c => if val ρ a then val ρ b else val ρ c

theorem source_congr (op : SourceOp) (ρ σ : Nat → Bool)
    (h : ∀ a ∈ op.args, ρ a.1=σ a.1) : op.eval ρ=op.eval σ := by
  cases op with
  | and xs => exact op_congr (.and xs) ρ σ h
  | or xs =>
    change ∀ a ∈ xs, ρ a.1=σ a.1 at h
    change xs.any (val ρ)=xs.any (val σ)
    induction xs with
    | nil => rfl
    | cons a xs ih =>
      simp only [List.any_cons]
      rw [show val ρ a=val σ a by simp [val,h a (by simp)]]
      rw [ih (fun b hb => h b (by simp [hb]))]
  | _ => simp_all [SourceOp.args,SourceOp.eval,val]

/- Eight is the maximum arity of the Boolean source nodes in the actual
   model. The two pseudo-Boolean nodes are handled separately, not truncated. -/
def bind (ids : Fin 8 → Nat) (env : Fin 8 → Bool) (i : Nat) : Bool :=
  if i=0 then true else decide (∃ j : Fin 8, ids j=i ∧ env j=true)

def inputs (ids : Fin 8 → Nat) : List Nat := 0 :: List.ofFn ids

theorem bind_agrees (ids : Fin 8 → Nat) (σ : Nat → Bool) (hzero : σ 0=true) :
    ∀ i ∈ inputs ids, bind ids (fun j => σ (ids j)) i=σ i := by
  intro i hi
  by_cases hz : i=0
  · subst i
    simp [bind,hzero]
  · have hex : ∃ j : Fin 8, ids j=i := by
      have hm : i ∈ List.ofFn ids := (List.mem_cons.mp hi).resolve_left hz
      exact List.mem_ofFn.mp hm
    have hiff : (∃ j : Fin 8, ids j=i ∧ σ (ids j)=true) ↔ σ i=true := by
      constructor
      · rintro ⟨j,hj,hs⟩
        simpa [hj] using hs
      · intro hs
        obtain ⟨j,hj⟩ := hex
        exact ⟨j,hj,by simpa [hj] using hs⟩
    simp [bind,hz,hiff]

def checked (ids : Fin 8 → Nat) (gs : List Gate) (root : Lit) (op : SourceOp) : Bool :=
  decide (∀ env : Fin 8 → Bool, val (run (bind ids env) gs) root=op.eval (bind ids env))

theorem checked_sound (ids : Fin 8 → Nat) (gs : List Gate) (root : Lit) (op : SourceOp)
    (check : checked ids gs root op=true)
    (good : LocalOrder (inputs ids) gs)
    (hr : root.1 ∈ knownAfter (inputs ids) gs)
    (ha : ∀ a ∈ op.args, a.1 ∈ inputs ids)
    (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ gs, σ g.out=g.op.eval σ) : val σ root=op.eval σ := by
  have hc := of_decide_eq_true check
  specialize hc (fun j => σ (ids j))
  have hbind := bind_agrees ids σ hzero
  rw [local_derivation σ _ gs (inputs ids) root good hbind models hr] at hc
  rw [source_congr op _ σ (fun a h => hbind a.1 (ha a h))] at hc
  exact hc

end Stick81.LocalReduction
