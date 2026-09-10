import HeightExpressions

namespace Stick81.MinorProducts
open Geometry RoofFrame SignRules Expression

inductive Coeff where
  | minor (a b c : Fin 5)
  | neg (a : Coeff)
  | mul (a b : Coeff)
  deriving Repr, DecidableEq

def minorIndices (q : Fin 5 → Fin 7) (a b c : Fin 5) : Fin 3 → Fin 8 :=
  ![(q a).castSucc,(q b).castSucc,(q c).castSucc]

def Coeff.Valid : Coeff → Prop
  | .minor a b c => a≠b ∧ a≠c ∧ b≠c
  | .neg a => a.Valid
  | .mul a b => a.Valid ∧ b.Valid

instance coeffDecidable : (c : Coeff) → Decidable c.Valid
  | .minor a b c => inferInstanceAs (Decidable (a≠b ∧ a≠c ∧ b≠c))
  | .neg a => coeffDecidable a
  | .mul a b =>
    letI := coeffDecidable a
    letI := coeffDecidable b
    inferInstanceAs (Decidable (a.Valid ∧ b.Valid))

def Coeff.eval (f : Frame) (q : Fin 5 → Fin 7) : Coeff → ℝ
  | .minor a b c => det3 (lines f.points (q a).castSucc) (lines f.points (q b).castSucc) (lines f.points (q c).castSucc)
  | .neg a => -a.eval f q
  | .mul a b => a.eval f q*b.eval f q

def Coeff.expr (q : Fin 5 → Fin 7) : Coeff → Expr
  | .minor a b c => LineDefinitions.lineExpr (minorIndices q a b c)
  | .neg a => .not (a.expr q)
  | .mul a b => .eq (a.expr q) (b.expr q)

theorem selector_injective : ∀ a b c : Fin 5, a≠b → a≠c → b≠c →
    Function.Injective (![a,b,c] : Fin 3 → Fin 5) := by unfold Function.Injective; native_decide

theorem minor_injective (q : Fin 5 → Fin 7) (hq : Function.Injective q) (a b c : Fin 5)
    (h : a≠b ∧ a≠c ∧ b≠c) : Function.Injective (minorIndices q a b c) := by
  have hcast : Function.Injective (fun i : Fin 5 => (q i).castSucc) := by
    intro i j hij
    apply hq
    apply Fin.ext
    exact congrArg (fun x : Fin 8 => x.val) hij
  have he : minorIndices q a b c=(fun i : Fin 5 => (q i).castSucc) ∘ ![a,b,c] := by
    funext i
    fin_cases i <;> rfl
  rw [he]
  exact hcast.comp (selector_injective a b c h.1 h.2.1 h.2.2)

theorem coeff_nonzero (f : Frame) (q : Fin 5 → Fin 7) (hq : Function.Injective q) (c : Coeff)
    (h : c.Valid) : c.eval f q≠0 := by
  induction c with
  | minor a b c => exact f.lineGeneric (minorIndices q a b c) (minor_injective q hq a b c h)
  | neg a ih => exact neg_ne_zero.mpr (ih h)
  | mul a b iha ihb => exact mul_ne_zero (iha h.1) (ihb h.2)

theorem coeff_correct (f : Frame) (q : Fin 5 → Fin 7) (hq : Function.Injective q) (c : Coeff)
    (h : c.Valid) : (c.expr q).eval f.input=positive (c.eval f q) := by
  induction c with
  | minor a b c =>
    exact LineDefinitions.line_correct f.points f.pointGeneric f.lineGeneric
      (minorIndices q a b c) (minor_injective q hq a b c h)
  | neg a ih =>
    simp only [Coeff.expr,Expr.eval,Coeff.eval,ih h,negation _ (coeff_nonzero f q hq a h)]
  | mul a b iha ihb =>
    simp only [Coeff.expr,Expr.eval,Coeff.eval,iha h.1,ihb h.2,
      multiplication _ _ (coeff_nonzero f q hq a h.1) (coeff_nonzero f q hq b h.2)]

end Stick81.MinorProducts
