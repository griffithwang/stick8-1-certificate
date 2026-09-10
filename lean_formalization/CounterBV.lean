import Counter
import Circuit

namespace Stick81.Counter

theorem countTrue_le_length (xs : List Bool) : countTrue xs ≤ xs.length := by
  induction xs with
  | nil => rfl
  | cons b xs ih => cases b <;> simp [countTrue,bit] at * <;> omega

theorem weighted_eq_iff (xs : List (Bool × Int)) (k : Int) :
    weightedValue xs=k ↔ (countTrue (expandWeights xs) : Int)=k+negativeOffset xs := by
  rw [weighted_normalization]
  omega

theorem weighted_ge_iff (xs : List (Bool × Int)) (k : Int) :
    k ≤ weightedValue xs ↔ k+negativeOffset xs ≤ (countTrue (expandWeights xs) : Int) := by
  rw [weighted_normalization]
  omega

theorem remove_literal_constants (ρ : Nat → Bool) (hzero : ρ 0=true) (xs : List Circuit.Lit) :
    countTrue (xs.map (Circuit.val ρ)) = xs.count (0,true) +
      countTrue ((xs.filter (fun a => a.1 != 0)).map (Circuit.val ρ)) := by
  induction xs with
  | nil => simp [countTrue]
  | cons a xs ih =>
    rcases a with ⟨i,p⟩
    by_cases hi : i=0
    · subst i
      cases p <;> simp [Circuit.val,hzero,countTrue,bit,List.count_cons,ih] at * <;> omega
    · cases p <;> simp [Circuit.val,hzero,countTrue,bit,List.count_cons,hi] at * <;> omega

def expandLiteralWeights (xs : List (Circuit.Lit × Int)) : List Circuit.Lit :=
  xs.flatMap (fun p => List.replicate p.2.toNat p.1 ++
    List.replicate (-p.2).toNat (Circuit.neg p.1))

def literalWeightedValue (ρ : Nat → Bool) (xs : List (Circuit.Lit × Int)) : Int :=
  weightedValue (xs.map (fun p => (Circuit.val ρ p.1,p.2)))

def literalNegativeOffset (xs : List (Circuit.Lit × Int)) : Int :=
  (xs.map (fun p => ((-p.2).toNat : Int))).sum

theorem eval_expand_literals (ρ : Nat → Bool) (xs : List (Circuit.Lit × Int)) :
    (expandLiteralWeights xs).map (Circuit.val ρ) =
      expandWeights (xs.map (fun p => (Circuit.val ρ p.1,p.2))) := by
  induction xs with
  | nil => rfl
  | cons p xs ih =>
    rcases p with ⟨a,w⟩
    simp only [expandLiteralWeights,expandWeights,List.flatMap_cons,List.map_cons,
      List.map_append,List.map_replicate,expandWeight,Circuit.val_neg] at *
    rw [ih]

theorem literal_normalization (ρ : Nat → Bool) (hzero : ρ 0=true)
    (xs : List (Circuit.Lit × Int)) :
    (countTrue (((expandLiteralWeights xs).filter (fun a => a.1 != 0)).map (Circuit.val ρ)) : Int) =
      literalWeightedValue ρ xs + literalNegativeOffset xs -
        ((expandLiteralWeights xs).count (0,true) : Int) := by
  have hn := weighted_normalization (xs.map (fun p => (Circuit.val ρ p.1,p.2)))
  rw [← eval_expand_literals] at hn
  have hc := remove_literal_constants ρ hzero (expandLiteralWeights xs)
  have ho : negativeOffset (xs.map (fun p => (Circuit.val ρ p.1,p.2))) =
      literalNegativeOffset xs := by simp [negativeOffset,literalNegativeOffset,List.map_map,Function.comp_def]
  rw [ho] at hn
  change (countTrue ((expandLiteralWeights xs).map (Circuit.val ρ)) : Int) =
    literalWeightedValue ρ xs + literalNegativeOffset xs at hn
  rw [hc,Nat.cast_add] at hn
  omega

inductive SumTree (α : Type) where
  | zero
  | leaf (a : α)
  | fork (left right : SumTree α)
  deriving Repr, DecidableEq

def SumTree.leaves {α : Type} : SumTree α → List α
  | .zero => []
  | .leaf a => [a]
  | .fork l r => l.leaves++r.leaves

def SumTree.evalBV {α : Type} (w : Nat) (env : α → Bool) : SumTree α → BitVec w
  | .zero => 0
  | .leaf a => if env a then 1 else 0
  | .fork l r => l.evalBV w env+r.evalBV w env

theorem sumTree_ofNat {α : Type} (t : SumTree α) (w : Nat) (env : α → Bool) :
    t.evalBV w env=BitVec.ofNat w (countTrue (t.leaves.map env)) := by
  induction t with
  | zero => rfl
  | leaf a => cases h : env a <;> simp [SumTree.evalBV,SumTree.leaves,countTrue,bit,h]
  | fork l r hl hr =>
    simp only [SumTree.evalBV,SumTree.leaves,List.map_append,countTrue_append,hl,hr]
    exact (BitVec.ofNat_add _ _).symm

theorem sumTree_toNat {α : Type} (t : SumTree α) (w : Nat) (env : α → Bool)
    (hsize : t.leaves.length < 2^w) :
    (t.evalBV w env).toNat=countTrue (t.leaves.map env) := by
  rw [sumTree_ofNat,BitVec.toNat_ofNat]
  apply Nat.mod_eq_of_lt
  have h := countTrue_le_length (t.leaves.map env)
  simp only [List.length_map] at h
  omega

theorem sumTree_eq_correct {α : Type} (t : SumTree α) (w : Nat) (env : α → Bool) (k : Nat)
    (hsize : t.leaves.length < 2^w) (hk : k < 2^w) :
    (t.evalBV w env == BitVec.ofNat w k)=true ↔ countTrue (t.leaves.map env)=k := by
  simp only [beq_iff_eq,BitVec.toNat_eq,sumTree_toNat t w env hsize,
    BitVec.toNat_ofNat,Nat.mod_eq_of_lt hk]

theorem sumTree_ge_correct {α : Type} (t : SumTree α) (w : Nat) (env : α → Bool) (k : Nat)
    (hsize : t.leaves.length < 2^w) (hk : k < 2^w) :
    (BitVec.ofNat w k).ule (t.evalBV w env)=true ↔ k ≤ countTrue (t.leaves.map env) := by
  simp [BitVec.ule,sumTree_toNat t w env hsize,Nat.mod_eq_of_lt hk]

end Stick81.Counter
