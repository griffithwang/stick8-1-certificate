import RoofPositivity
import Expression

namespace Stick81.MixedSigns
open Geometry RoofFrame SignRules Expression

theorem weighted_mixed (xs : List (ℝ × ℝ))
    (hp : ∀ p ∈ xs, 0<p.2)
    (hs : (xs.map (fun p => p.1*p.2)).sum=0)
    (hn : ∃ p ∈ xs, p.1≠0) :
    ((xs.map Prod.fst).any positive && (xs.map Prod.fst).any (fun x => !positive x))=true := by
  obtain ⟨p,hp_mem,hp_ne⟩ := hn
  have hn' : ∃ x ∈ xs.map (fun p => p.1*p.2), x≠0 :=
    ⟨p.1*p.2,List.mem_map.mpr ⟨p,hp_mem,rfl⟩,mul_ne_zero hp_ne (ne_of_gt (hp p hp_mem))⟩
  have hm := mixed_sum_boolean _ hs hn'
  have he : xs.map (fun p => positive (p.1*p.2))=xs.map (fun p => positive p.1) :=
    List.map_congr_left (fun p h => positive_scaling p.1 p.2 (hp p h))
  have hbool := congrArg (fun bs : List Bool => bs.any id && bs.any Bool.not) he
  have hbool' : ((xs.map (fun p => p.1*p.2)).any positive &&
      (xs.map (fun p => p.1*p.2)).any (fun x => !positive x)) =
      ((xs.map Prod.fst).any positive && (xs.map Prod.fst).any (fun x => !positive x)) := by
    simpa [List.any_map,Function.comp_def] using hbool
  exact hbool'.symm.trans hm

def flipExpr (b : Bool) (e : Expr) : Expr := if b then .not e else e
def flipReal (b : Bool) (x : ℝ) : ℝ := if b then -x else x

theorem flip_correct (b : Bool) (e : Expr) (ρ : Nat → Bool) (x : ℝ)
    (hx : x≠0) (he : e.eval ρ=positive x) : (flipExpr b e).eval ρ=positive (flipReal b x) := by
  cases b <;> simp [flipExpr,flipReal,Expr.eval,he,negation x hx]

def mixedExpr (es : List Expr) : Expr := Expression.all [Expression.any es,Expression.any (es.map Expr.not)]

theorem mixedExpr_correct (es : List Expr) (xs : List ℝ) (ρ : Nat → Bool)
    (he : es.map (Expr.eval ρ)=xs.map positive)
    (hm : (xs.any positive && xs.any (fun x => !positive x))=true) : (mixedExpr es).eval ρ=true := by
  have hh := congrArg (fun bs : List Bool => bs.any id && bs.any Bool.not) he
  have ht : (mixedExpr es).eval ρ=(xs.any positive && xs.any (fun x => !positive x)) := by
    simpa [mixedExpr,eval_all,eval_any,Expr.eval,List.any_map,Function.comp_def] using hh
  exact ht.trans hm

end Stick81.MixedSigns
