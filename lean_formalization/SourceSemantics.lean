import LocalReduction
import CounterBV

namespace Stick81.SourceSemantics
open Circuit LocalReduction Counter

def substLit (enc : Nat → Lit) (a : Lit) : Lit :=
  if a.2 then enc a.1 else neg (enc a.1)

theorem val_subst (σ : Nat → Bool) (enc : Nat → Lit) (a : Lit) :
    val σ (substLit enc a) = val (fun i => val σ (enc i)) a := by
  rcases a with ⟨i,p⟩
  cases p
  · change val σ (neg (enc i)) = (val σ (enc i) == false)
    rw [val_neg]
    simp
  · change val σ (enc i) = (val σ (enc i) == true)
    simp

def substOp (enc : Nat → Lit) : SourceOp → SourceOp
  | .literal a => .literal (substLit enc a)
  | .constant b => .constant b
  | .not a => .not (substLit enc a)
  | .and xs => .and (xs.map (substLit enc))
  | .or xs => .or (xs.map (substLit enc))
  | .eq a b => .eq (substLit enc a) (substLit enc b)
  | .xor a b => .xor (substLit enc a) (substLit enc b)
  | .implies a b => .implies (substLit enc a) (substLit enc b)
  | .ite a b c => .ite (substLit enc a) (substLit enc b) (substLit enc c)

theorem eval_subst (σ : Nat → Bool) (enc : Nat → Lit) (op : SourceOp) :
    (substOp enc op).eval σ = op.eval (fun i => val σ (enc i)) := by
  cases op <;> simp [substOp,SourceOp.eval,List.all_map,List.any_map,val_subst,Function.comp_def]

def substWeights (enc : Nat → Lit) (xs : List (Lit × Int)) : List (Lit × Int) :=
  xs.map (fun p => (substLit enc p.1,p.2))

theorem weighted_subst (σ : Nat → Bool) (enc : Nat → Lit) (xs : List (Lit × Int)) :
    literalWeightedValue σ (substWeights enc xs) =
      literalWeightedValue (fun i => val σ (enc i)) xs := by
  simp [substWeights,literalWeightedValue,weightedValue,List.map_map,Function.comp_def,val_subst]

theorem weighted_congr (ρ σ : Nat → Bool) (xs : List (Lit × Int))
    (h : ∀ p ∈ xs, ρ p.1.1=σ p.1.1) : literalWeightedValue ρ xs=literalWeightedValue σ xs := by
  induction xs with
  | nil => rfl
  | cons p xs ih =>
    rcases p with ⟨a,w⟩
    have ha : val ρ a=val σ a := by simp [val,h (a,w) (by simp)]
    have ht := ih (fun p hp => h p (by simp [hp]))
    simpa only [literalWeightedValue,weightedValue,List.map_cons,List.sum_cons,ha] using
      congrArg (fun z : Int => w*(bit (val σ a) : Int)+z) ht

inductive NodeOp where
  | input (v : Nat)
  | boolean (op : SourceOp)
  | pbEq (terms : List (Lit × Int)) (bound : Int)
  | pbGe (terms : List (Lit × Int)) (bound : Int)
  deriving Repr, DecidableEq

def NodeOp.args : NodeOp → List Lit
  | .input _ => []
  | .boolean op => op.args
  | .pbEq ts _ | .pbGe ts _ => ts.map Prod.fst

def NodeOp.eval (input values : Nat → Bool) : NodeOp → Bool
  | .input v => input v
  | .boolean op => op.eval values
  | .pbEq ts k => decide (literalWeightedValue values ts=k)
  | .pbGe ts k => decide (k ≤ literalWeightedValue values ts)

theorem node_congr (input ρ σ : Nat → Bool) (op : NodeOp)
    (h : ∀ a ∈ op.args, ρ a.1=σ a.1) : op.eval input ρ=op.eval input σ := by
  cases op with
  | input v => rfl
  | boolean op => exact source_congr op ρ σ h
  | pbEq ts k =>
    have ht := weighted_congr ρ σ ts (fun p hp => h p.1 (List.mem_map.mpr ⟨p,hp,rfl⟩))
    simp [NodeOp.eval,ht]
  | pbGe ts k =>
    have ht := weighted_congr ρ σ ts (fun p hp => h p.1 (List.mem_map.mpr ⟨p,hp,rfl⟩))
    simp [NodeOp.eval,ht]

structure Node where
  encoding : Lit
  op : NodeOp
  deriving Repr, DecidableEq

def nodeAt (nodes : Array Node) (i : Nat) : Node :=
  (nodes[i]?).getD ⟨(0,true),.input 0⟩

def encoding (nodes : Array Node) (i : Nat) : Lit := (nodeAt nodes i).encoding

def Ordered (nodes : Array Node) : Prop :=
  ∀ i : Fin nodes.size, ∀ a ∈ (nodeAt nodes i.val).op.args, a.1 < i.val

def Models (nodes : Array Node) (input values : Nat → Bool) : Prop :=
  ∀ i : Fin nodes.size, values i.val = (nodeAt nodes i.val).op.eval input values

theorem models_unique (nodes : Array Node) (good : Ordered nodes) (input ρ σ : Nat → Bool)
    (hρ : Models nodes input ρ) (hσ : Models nodes input σ) :
    ∀ i : Fin nodes.size, ρ i.val=σ i.val := by
  have hn : ∀ n, n < nodes.size → ρ n=σ n := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro hn
      rw [hρ ⟨n,hn⟩,hσ ⟨n,hn⟩]
      apply node_congr
      intro a ha
      have hlt := good ⟨n,hn⟩ a ha
      exact ih a.1 hlt (Nat.lt_trans hlt hn)
  exact fun i => hn i.val i.isLt

theorem circuit_preserves_unused (ρ : Nat → Bool) (gs : List Gate) (i : Nat)
    (h : ∀ g ∈ gs, g.out ≠ i) : run ρ gs i=ρ i := by
  induction gs generalizing ρ with
  | nil => rfl
  | cons g gs ih =>
    rw [run,ih (update ρ g) (fun k hk => h k (by simp [hk]))]
    simp [update,Ne.symm (h g (by simp))]

def translatedBoolean (enc : Nat → Lit) : NodeOp → Option SourceOp
  | .input v => some (.literal (v,true))
  | .boolean op => some (substOp enc op)
  | .pbEq _ _ | .pbGe _ _ => none

theorem translatedBoolean_sound (σ : Nat → Bool) (enc : Nat → Lit) (op : NodeOp)
    (b : SourceOp) (h : translatedBoolean enc op=some b) :
    b.eval σ=op.eval σ (fun i => val σ (enc i)) := by
  cases op with
  | input v => simp [translatedBoolean] at h; subst b; simp [NodeOp.eval,SourceOp.eval,val]
  | boolean op => simp [translatedBoolean] at h; subst b; exact eval_subst σ enc op
  | pbEq ts k => simp [translatedBoolean] at h
  | pbGe ts k => simp [translatedBoolean] at h

end Stick81.SourceSemantics
