import SourceSemantics

namespace Stick81.Expression
open Circuit LocalReduction SourceSemantics

inductive Expr where
  | atom (v : Nat)
  | constant (b : Bool)
  | not (a : Expr)
  | and (a b : Expr)
  | or (a b : Expr)
  | eq (a b : Expr)
  | ne (a b : Expr)
  | ite (a b c : Expr)
  deriving Repr, DecidableEq

def Expr.eval (ρ : Nat → Bool) : Expr → Bool
  | .atom v => ρ v
  | .constant b => b
  | .not a => !a.eval ρ
  | .and a b => a.eval ρ && b.eval ρ
  | .or a b => a.eval ρ || b.eval ρ
  | .eq a b => a.eval ρ == b.eval ρ
  | .ne a b => a.eval ρ != b.eval ρ
  | .ite a b c => if a.eval ρ then b.eval ρ else c.eval ρ

def all : List Expr → Expr
  | [] => .constant true
  | a::xs => .and a (all xs)
def any : List Expr → Expr
  | [] => .constant false
  | a::xs => .or a (any xs)

theorem eval_all (ρ : Nat → Bool) (xs : List Expr) : (all xs).eval ρ=xs.all (Expr.eval ρ) := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp only [all,Expr.eval,List.all_cons,ih]

theorem eval_any (ρ : Nat → Bool) (xs : List Expr) : (any xs).eval ρ=xs.any (Expr.eval ρ) := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp only [any,Expr.eval,List.any_cons,ih]

theorem mapM_sound {α : Type} (f : α → Option Expr) (v : α → Bool) (ρ : Nat → Bool)
    (hf : ∀ a e, f a=some e → e.eval ρ=v a)
    (xs : List α) (es : List Expr) (h : xs.mapM f=some es) : es.map (Expr.eval ρ)=xs.map v := by
  induction xs generalizing es with
  | nil => simpa using h.symm
  | cons a xs ih =>
    cases ha : f a with
    | none => simp [List.mapM_cons,ha] at h
    | some e =>
      cases ht : xs.mapM f with
      | none => simp [List.mapM_cons,ha,ht] at h
      | some rest =>
        simp [List.mapM_cons,ha,ht] at h
        subst es
        simp only [List.map_cons,hf a e ha,ih rest ht]

def instantiate (lookup : Lit → Option Expr) : SourceOp → Option Expr
  | .literal a => lookup a
  | .constant b => some (.constant b)
  | .not a => (lookup a).map Expr.not
  | .and xs => (xs.mapM lookup).map all
  | .or xs => (xs.mapM lookup).map any
  | .eq a b => do return .eq (← lookup a) (← lookup b)
  | .xor a b => do return .ne (← lookup a) (← lookup b)
  | .implies a b => do return .or (.not (← lookup a)) (← lookup b)
  | .ite a b c => do return .ite (← lookup a) (← lookup b) (← lookup c)

theorem instantiate_sound (lookup : Lit → Option Expr) (values ρ : Nat → Bool)
    (hl : ∀ a e, lookup a=some e → e.eval ρ=val values a)
    (op : SourceOp) (e : Expr) (h : instantiate lookup op=some e) :
    e.eval ρ=op.eval values := by
  cases op with
  | literal a => exact hl a e h
  | constant b => simp [instantiate] at h; subst e; rfl
  | not a =>
    cases ha : lookup a with
    | none => simp [instantiate,ha] at h
    | some ea =>
      simp [instantiate,ha] at h
      subst e
      simp [Expr.eval,SourceOp.eval,hl a ea ha]
  | and xs =>
    cases hs : xs.mapM lookup with
    | none => simp [instantiate,hs] at h
    | some es =>
      simp [instantiate,hs] at h
      subst e
      have hm := mapM_sound lookup (val values) ρ hl xs es hs
      rw [eval_all]
      change es.all (Expr.eval ρ)=xs.all (val values)
      simpa using congrArg (fun bs : List Bool => bs.all id) hm
  | or xs =>
    cases hs : xs.mapM lookup with
    | none => simp [instantiate,hs] at h
    | some es =>
      simp [instantiate,hs] at h
      subst e
      have hm := mapM_sound lookup (val values) ρ hl xs es hs
      rw [eval_any]
      change es.any (Expr.eval ρ)=xs.any (val values)
      simpa using congrArg (fun bs : List Bool => bs.any id) hm
  | eq a b =>
    cases ha : lookup a <;> cases hb : lookup b <;> simp [instantiate,ha,hb] at h
    rename_i ea eb
    subst e
    simp [Expr.eval,SourceOp.eval,hl a ea ha,hl b eb hb]
  | xor a b =>
    cases ha : lookup a <;> cases hb : lookup b <;> simp [instantiate,ha,hb] at h
    rename_i ea eb
    subst e
    simp [Expr.eval,SourceOp.eval,hl a ea ha,hl b eb hb]
  | implies a b =>
    cases ha : lookup a <;> cases hb : lookup b <;> simp [instantiate,ha,hb] at h
    rename_i ea eb
    subst e
    simp [Expr.eval,SourceOp.eval,hl a ea ha,hl b eb hb]
  | ite a b c =>
    cases ha : lookup a <;> cases hb : lookup b <;> cases hc : lookup c <;>
      simp [instantiate,ha,hb,hc] at h
    rename_i ea eb ec
    subst e
    simp [Expr.eval,SourceOp.eval,hl a ea ha,hl b eb hb,hl c ec hc]

def liftLiteral (f : Nat → Option Expr) (a : Lit) : Option Expr :=
  (f a.1).map (fun e => if a.2 then e else .not e)

theorem liftLiteral_sound (f : Nat → Option Expr) (values ρ : Nat → Bool)
    (hf : ∀ i e, f i=some e → e.eval ρ=values i)
    (a : Lit) (e : Expr) (h : liftLiteral f a=some e) : e.eval ρ=val values a := by
  rcases a with ⟨i,p⟩
  cases hi : f i with
  | none => simp [liftLiteral,hi] at h
  | some ei =>
    cases p <;> simp [liftLiteral,hi] at h <;> subst e <;>
      simp [Expr.eval,val,hf i ei hi]

def expand : Nat → Array Node → Nat → Option Expr
  | 0, _, _ => none
  | fuel+1, nodes, i =>
    if i<nodes.size then
      match (nodeAt nodes i).op with
      | .input v => some (.atom v)
      | .boolean op => instantiate (liftLiteral (expand fuel nodes)) op
      | .pbEq _ _ | .pbGe _ _ => none
    else none

theorem expand_sound (fuel : Nat) (nodes : Array Node) (ρ values : Nat → Bool)
    (model : Models nodes ρ values) (i : Nat) (e : Expr)
    (h : expand fuel nodes i=some e) : e.eval ρ=values i := by
  induction fuel generalizing i e with
  | zero => simp [expand] at h
  | succ fuel ih =>
    by_cases hi : i<nodes.size
    · have hm := model ⟨i,hi⟩
      cases hop : (nodeAt nodes i).op with
      | input v =>
        simp [expand,hi,hop] at h
        subst e
        simpa [hop,NodeOp.eval,Expr.eval] using hm.symm
      | boolean op =>
        have hs : instantiate (liftLiteral (expand fuel nodes)) op=some e := by
          simpa [expand,hi,hop] using h
        have he := instantiate_sound (liftLiteral (expand fuel nodes)) values ρ
          (liftLiteral_sound (expand fuel nodes) values ρ ih) op e hs
        have hm' : values i=op.eval values := by simpa only [hop,NodeOp.eval] using hm
        exact he.trans hm'.symm
      | pbEq ts k => simp [expand,hi,hop] at h
      | pbGe ts k => simp [expand,hi,hop] at h
    · simp [expand,hi] at h

end Stick81.Expression
