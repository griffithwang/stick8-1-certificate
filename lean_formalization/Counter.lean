import Mathlib

namespace Stick81.Counter

def bit (b : Bool) : Nat := if b then 1 else 0
def value : List Bool → Nat
  | [] => 0
  | b::bs => bit b + 2*value bs
def majority (a b c : Bool) : Bool := (a && b) || (a && c) || (b && c)

theorem fullAdder (a b c : Bool) :
    bit (xor (xor a b) c) + 2*bit (majority a b c) = bit a+bit b+bit c := by
  cases a <;> cases b <;> cases c <;> rfl

def addPairs : List (Bool × Bool) → Bool → List Bool
  | [], c => [c]
  | (a,b)::ps, c => xor (xor a b) c :: addPairs ps (majority a b c)

theorem value_addPairs (ps : List (Bool × Bool)) (carry : Bool) :
    value (addPairs ps carry) = value (ps.map Prod.fst)+value (ps.map Prod.snd)+bit carry := by
  induction ps generalizing carry with
  | nil => simp [addPairs,value]
  | cons p ps ih =>
    rcases p with ⟨a,b⟩
    simp only [addPairs,value,List.map_cons,ih]
    have h := fullAdder a b carry
    omega

theorem value_append (xs ys : List Bool) :
    value (xs++ys) = value xs + 2^xs.length * value ys := by
  induction xs with
  | nil => simp [value]
  | cons a xs ih =>
    simp only [List.cons_append,value,List.length_cons,ih,pow_succ]
    ring

@[simp] theorem value_false_padding (n : Nat) : value (List.replicate n false) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [List.replicate_succ,value,bit,ih]

def addBits (xs ys : List Bool) : List Bool :=
  addPairs ((xs++List.replicate (ys.length-xs.length) false).zip
    (ys++List.replicate (xs.length-ys.length) false)) false

theorem addBits_correct (xs ys : List Bool) : value (addBits xs ys) = value xs+value ys := by
  have hlen : (xs++List.replicate (ys.length-xs.length) false).length =
      (ys++List.replicate (xs.length-ys.length) false).length := by
    simp only [List.length_append,List.length_replicate]
    omega
  unfold addBits
  rw [value_addPairs,List.map_fst_zip (Nat.le_of_eq hlen),
    List.map_snd_zip (Nat.le_of_eq hlen.symm)]
  simp [value_append,bit]

def pairRound : List (List Bool) → List (List Bool)
  | [] => []
  | [a] => [a]
  | a::b::rest => addBits a b :: pairRound rest

def total (xs : List (List Bool)) : Nat := (xs.map value).sum

theorem total_pairRound (xs : List (List Bool)) : total (pairRound xs) = total xs := by
  induction xs using pairRound.induct with
  | case1 => rfl
  | case2 a => rfl
  | case3 a b rest ih =>
    simp only [pairRound,total,List.map_cons,List.sum_cons,addBits_correct] at *
    omega

theorem pairRound_length (xs : List (List Bool)) : (pairRound xs).length = (xs.length+1)/2 := by
  induction xs using pairRound.induct with
  | case1 => rfl
  | case2 a => norm_num [pairRound]
  | case3 a b rest ih => simp only [pairRound,List.length_cons,ih]; omega

def rounds : Nat → List (List Bool) → List (List Bool)
  | 0, xs => xs
  | n+1, xs => rounds n (pairRound xs)

theorem total_rounds (n : Nat) (xs : List (List Bool)) : total (rounds n xs) = total xs := by
  induction n generalizing xs with
  | zero => rfl
  | succ n ih => rw [rounds,ih,total_pairRound]

theorem rounds_length (n : Nat) (xs : List (List Bool)) (h : xs.length ≤ n+1) :
    (rounds n xs).length ≤ 1 := by
  induction n generalizing xs with
  | zero => exact h
  | succ n ih =>
    apply ih
    rw [pairRound_length]
    omega

def countTrue (xs : List Bool) : Nat := (xs.map bit).sum
def countBits (xs : List Bool) : List Bool :=
  (rounds xs.length (xs.map (fun b => [b]))).headD []

theorem countBits_correct (xs : List Bool) : value (countBits xs) = countTrue xs := by
  have hlen := rounds_length xs.length (xs.map (fun b => [b])) (by simp)
  have htotal := total_rounds xs.length (xs.map (fun b => [b]))
  have hin : total (xs.map (fun b => [b])) = countTrue xs := by
    simp [total,countTrue,List.map_map,Function.comp_def,value]
  rw [hin] at htotal
  unfold countBits
  generalize heq : rounds xs.length (xs.map (fun b => [b])) = out at *
  cases out with
  | nil => simpa [total,value] using htotal
  | cons b bs =>
    cases bs with
    | nil => simpa [total] using htotal
    | cons c cs => simp at hlen

/- The low-to-high comparison recurrence in direct_cnf.py. The initial
   flag distinguishes >= from > for the already processed lower bits. -/
def gePairs : List (Bool × Bool) → Bool → Bool
  | [], r => r
  | (a,b)::ps, r => gePairs ps (if b then a && r else a || r)

theorem gePairs_correct (ps : List (Bool × Bool)) (r : Bool) :
    gePairs ps r = decide (value (ps.map Prod.snd) + (if r then 0 else 1) ≤
      value (ps.map Prod.fst)) := by
  induction ps generalizing r with
  | nil => cases r <;> rfl
  | cons p ps ih =>
    rcases p with ⟨a,b⟩
    simp only [gePairs,ih,List.map_cons,value]
    cases a <;> cases b <;> cases r <;> simp [bit] <;> omega

theorem value_injective_fixed_length (xs ys : List Bool)
    (hlen : xs.length=ys.length) (hv : value xs=value ys) : xs=ys := by
  induction xs generalizing ys with
  | nil => simpa using hlen.symm
  | cons a xs ih =>
    cases ys with
    | nil => simp at hlen
    | cons b ys =>
      have ht : xs.length=ys.length := by simpa using hlen
      cases a <;> cases b <;> simp only [value,bit,Bool.false_eq_true,ite_false,ite_true] at hv
      · have he : value xs=value ys := by omega
        simpa using congrArg (fun zs => false::zs) (ih ys ht he)
      · omega
      · omega
      · have he : value xs=value ys := by omega
        simpa using congrArg (fun zs => true::zs) (ih ys ht he)

def expandWeight (b : Bool) (w : Int) : List Bool :=
  List.replicate w.toNat b ++ List.replicate (-w).toNat (!b)

theorem countTrue_append (xs ys : List Bool) : countTrue (xs++ys)=countTrue xs+countTrue ys := by
  simp [countTrue]

theorem signed_weight (b : Bool) (w : Int) :
    (countTrue (expandWeight b w) : Int) - ((-w).toNat : Int) = w*(bit b : Int) := by
  cases w <;> cases b <;>
    simp [expandWeight,countTrue,bit,List.sum_replicate] <;> omega

def expandWeights (xs : List (Bool × Int)) : List Bool :=
  xs.flatMap (fun p => expandWeight p.1 p.2)
def negativeOffset (xs : List (Bool × Int)) : Int :=
  (xs.map (fun p => ((-p.2).toNat : Int))).sum
def weightedValue (xs : List (Bool × Int)) : Int :=
  (xs.map (fun p => p.2*(bit p.1 : Int))).sum

theorem weighted_normalization (xs : List (Bool × Int)) :
    (countTrue (expandWeights xs) : Int) = weightedValue xs + negativeOffset xs := by
  induction xs with
  | nil => simp [expandWeights,countTrue,weightedValue,negativeOffset]
  | cons p xs ih =>
    rcases p with ⟨b,w⟩
    simp only [expandWeights,List.flatMap_cons,countTrue_append,Nat.cast_add,
      weightedValue,negativeOffset,List.map_cons,List.sum_cons] at *
    have hw := signed_weight b w
    omega

end Stick81.Counter
