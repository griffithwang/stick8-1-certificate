import GeometricInput

namespace Stick81.GeometricInput
open Geometry SignRules Expression Permutation4

def GeneralPoints (w : Fin 9 → V4) : Prop := ∀ q : Fin 4 → Fin 9,
  Function.Injective q → det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3)) ≠ 0

theorem chi_correct (w : Fin 9 → V4) (l : Fin 8 → V3) (hw : GeneralPoints w)
    (q : Fin 4 → Fin 9) (hq : Function.Injective q) :
    (chiExpr q).eval (assignment w l) = positive (-det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3))) := by
  obtain ⟨⟨h01,h12,h23⟩,hsi,hperm⟩ := sorting_verified q hq
  have hb := assignment_point w l (sorted q 0) (sorted q 1) (sorted q 2) (sorted q 3) h01 h12 h23
  have hd := determinant_permuted (fun i => w (sorted q i)) (findPerm q)
  have hd' : det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3)) =
      if even (findPerm q) then det4 (w (sorted q 0)) (w (sorted q 1)) (w (sorted q 2)) (w (sorted q 3))
      else -det4 (w (sorted q 0)) (w (sorted q 1)) (w (sorted q 2)) (w (sorted q 3)) := by
    simpa only [← hperm 0,← hperm 1,← hperm 2,← hperm 3] using hd
  cases he : even (findPerm q)
  · have hd'' : det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3)) =
        -det4 (w (sorted q 0)) (w (sorted q 1)) (w (sorted q 2)) (w (sorted q 3)) := by
      simpa [he] using hd'
    have hn := negation
      (-det4 (w (sorted q 0)) (w (sorted q 1)) (w (sorted q 2)) (w (sorted q 3)))
      (neg_ne_zero.mpr (hw (sorted q) hsi))
    simpa [chiExpr,Expr.eval,he,hb,hd''] using hn.symm
  · have hd'' : det4 (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3)) =
        det4 (w (sorted q 0)) (w (sorted q 1)) (w (sorted q 2)) (w (sorted q 3)) := by
      simpa [he] using hd'
    simp [chiExpr,Expr.eval,he,hb,hd'']

def pick (q : Fin 6 → Fin 9) (s : Fin 4 → Fin 6) : Fin 4 → Fin 9 := q ∘ s

def gpExpr (q : Fin 6 → Fin 9) : Expr :=
  let p := Expr.eq (chiExpr (pick q ![0,1,2,3])) (chiExpr (pick q ![0,1,4,5]))
  let n := Expr.not (.eq (chiExpr (pick q ![0,1,2,4])) (chiExpr (pick q ![0,1,3,5])))
  let r := Expr.eq (chiExpr (pick q ![0,1,2,5])) (chiExpr (pick q ![0,1,3,4]))
  Expression.any [.ne p n,.ne n r]

theorem not_beq (a b : Bool) : !(a == b) = ((!a) == b) := by
  cases a <;> cases b <;> rfl

theorem gp_sign_rule (a b c d e f : ℝ)
    (ha : a≠0) (hb : b≠0) (hc : c≠0) (hd : d≠0) (he : e≠0) (hf : f≠0)
    (h : a*b + -(c*d) + e*f=0) :
    (((positive a == positive b) != Bool.not (positive c == positive d)) ||
      ((Bool.not (positive c == positive d)) != (positive e == positive f)))=true := by
  have hab := mul_ne_zero ha hb
  have hcd := mul_ne_zero hc hd
  have hef := mul_ne_zero he hf
  have hs := zero_sum_boolean_signs (a*b) (-(c*d)) (e*f) h hab (neg_ne_zero.mpr hcd) hef
  have hs' : ((positive (a*b) != positive (-(c*d))) || (positive (-(c*d)) != positive (e*f)))=true := by
    simpa only [positive,Bool.or_eq_true,bne_iff_ne] using hs
  rw [multiplication a b ha hb,negation (c*d) hcd,multiplication c d hc hd,
    multiplication e f he hf] at hs'
  simpa only [not_beq] using hs'

theorem gp_geometric (w : Fin 9 → V4) (l : Fin 8 → V3) (hw : GeneralPoints w)
    (q : Fin 6 → Fin 9) (hq : Function.Injective q) : (gpExpr q).eval (assignment w l)=true := by
  have hc (s : Fin 4 → Fin 6) (hs : Function.Injective s) := chi_correct w l hw (pick q s) (hq.comp hs)
  have hz (s : Fin 4 → Fin 6) (hs : Function.Injective s) := neg_ne_zero.mpr (hw (pick q s) (hq.comp hs))
  have hc1 := hc ![0,1,2,3] (by decide)
  have hc2 := hc ![0,1,4,5] (by decide)
  have hc3 := hc ![0,1,2,4] (by decide)
  have hc4 := hc ![0,1,3,5] (by decide)
  have hc5 := hc ![0,1,2,5] (by decide)
  have hc6 := hc ![0,1,3,4] (by decide)
  have hs := gp_sign_rule _ _ _ _ _ _
    (hz ![0,1,2,3] (by decide)) (hz ![0,1,4,5] (by decide))
    (hz ![0,1,2,4] (by decide)) (hz ![0,1,3,5] (by decide))
    (hz ![0,1,2,5] (by decide)) (hz ![0,1,3,4] (by decide)) (by
      have hp := plucker_homogeneous_four (w (q 0)) (w (q 1)) (w (q 2)) (w (q 3)) (w (q 4)) (w (q 5))
      simpa [pick,Function.comp_def] using hp)
  simpa only [gpExpr,Expression.any,Expr.eval,hc1,hc2,hc3,hc4,hc5,hc6,Bool.or_false,not_beq] using hs

end Stick81.GeometricInput
