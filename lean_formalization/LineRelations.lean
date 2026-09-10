import LineGeometry

namespace Stick81.LineRelations
open Geometry RoofFrame GeometricInput SignRules Expression LineDefinitions

def ta (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 := ![q 0,next (q 0),q 2]
def tb (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 := ![q 1,next (q 1),next (q 2)]
def tc (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 := ![q 0,next (q 0),next (q 2)]
def td (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 := ![q 1,next (q 1),q 2]
def te (q : Fin 3 → Fin 8) : Fin 3 → Fin 8 := ![q 1,q 2,next (q 2)]

theorem bracket_triangles : ∀ q : Fin 3 → Fin 8, independent q=true →
    Function.Injective (ta q) ∧ Function.Injective (tb q) ∧
      Function.Injective (tc q) ∧ Function.Injective (td q) := by
  unfold Function.Injective
  native_decide

theorem incidence_triangles : ∀ q : Fin 3 → Fin 8, Function.Injective q → next (q 1)=q 2 →
    Function.Injective (ta q) ∧ Function.Injective (te q) := by
  unfold Function.Injective
  native_decide

def bracketExpr (q : Fin 3 → Fin 8) : Expr :=
  let p := Expr.eq (orientExpr (ta q)) (orientExpr (tb q))
  let n := Expr.not (.eq (orientExpr (tc q)) (orientExpr (td q)))
  let r := Expr.not (lineExpr q)
  Expression.any [.ne p n,.ne n r]

def incidenceExpr (q : Fin 3 → Fin 8) : Expr :=
  .eq (lineExpr q) (.eq (orientExpr (ta q)) (orientExpr (te q)))

theorem incidence_geometric (f : Frame) (q : Fin 3 → Fin 8) (hq : Function.Injective q)
    (hnext : next (q 1)=q 2) : (incidenceExpr q).eval f.input=true := by
  obtain ⟨ha,he⟩ := incidence_triangles q hq hnext
  have hoa := orient_correct f.points f.pointGeneric (ta q) ha
  have hoe := orient_correct f.points f.pointGeneric (te q) he
  have hna := orient_nonzero f.points f.pointGeneric (ta q) ha
  have hne := orient_nonzero f.points f.pointGeneric (te q) he
  have hl := line_correct f.points f.pointGeneric f.lineGeneric q hq
  have hf : det3 (lines f.points (q 0)) (lines f.points (q 1)) (lines f.points (q 2)) =
      orient (f.points (q 0)) (f.points (next (q 0))) (f.points (q 2)) *
        orient (f.points (q 1)) (f.points (q 2)) (f.points (next (q 2))) := by
    unfold lines
    rw [hnext]
    exact adjacent_line_factor _ _ _ _ _
  have hb : (Expr.eq (orientExpr (ta q)) (orientExpr (te q))).eval f.input =
      positive (det3 (lines f.points (q 0)) (lines f.points (q 1)) (lines f.points (q 2))) := by
    simp only [Frame.input,Expr.eval,hoa,hoe]
    rw [← multiplication _ _ hna hne]
    congr 1
    simpa [ta,te] using hf.symm
  change ((lineExpr q).eval f.input == (Expr.eq (orientExpr (ta q)) (orientExpr (te q))).eval f.input)=true
  dsimp only [Frame.input] at hb ⊢
  rw [hl,hb]
  simp

theorem bracket_geometric (f : Frame) (q : Fin 3 → Fin 8) (hq : Function.Injective q)
    (hind : independent q=true) : (bracketExpr q).eval f.input=true := by
  obtain ⟨ha,hb,hc,hd⟩ := bracket_triangles q hind
  have hoa := orient_correct f.points f.pointGeneric (ta q) ha
  have hob := orient_correct f.points f.pointGeneric (tb q) hb
  have hoc := orient_correct f.points f.pointGeneric (tc q) hc
  have hod := orient_correct f.points f.pointGeneric (td q) hd
  have hna := orient_nonzero f.points f.pointGeneric (ta q) ha
  have hnb := orient_nonzero f.points f.pointGeneric (tb q) hb
  have hnc := orient_nonzero f.points f.pointGeneric (tc q) hc
  have hnd := orient_nonzero f.points f.pointGeneric (td q) hd
  have hl := line_correct f.points f.pointGeneric f.lineGeneric q hq
  have hn := f.lineGeneric q hq
  have hf : det3 (lines f.points (q 0)) (lines f.points (q 1)) (lines f.points (q 2)) =
      orient (f.points (ta q 0)) (f.points (ta q 1)) (f.points (ta q 2)) *
        orient (f.points (tb q 0)) (f.points (tb q 1)) (f.points (tb q 2)) -
      orient (f.points (tc q 0)) (f.points (tc q 1)) (f.points (tc q 2)) *
        orient (f.points (td q 0)) (f.points (td q 1)) (f.points (td q 2)) := by
    exact line_bracket_identity _ _ _ _ _ _
  have hs := gp_sign_rule _ _ _ _ _ 1 hna hnb hnc hnd (neg_ne_zero.mpr hn) (by norm_num) (by linarith [hf])
  have hOne : positive (1 : ℝ)=true := by norm_num [positive]
  simp only [hOne,beq_true] at hs
  rw [negation _ hn] at hs
  simpa only [Frame.input,bracketExpr,Expression.any,Expr.eval,hoa,hob,hoc,hod,hl,Bool.or_false,not_beq] using hs

end Stick81.LineRelations
