import LineGeometry

namespace Stick81.LineDefinitions
open Geometry RoofFrame GeometricInput SignRules Expression

def pick (q : Fin 5 → Fin 8) (s : Fin 3 → Fin 5) : Fin 3 → Fin 8 := q ∘ s

def gpExpr (q : Fin 5 → Fin 8) : Expr :=
  let p := Expr.eq (lineExpr (pick q ![0,1,2])) (lineExpr (pick q ![0,3,4]))
  let n := Expr.not (.eq (lineExpr (pick q ![0,1,3])) (lineExpr (pick q ![0,2,4])))
  let r := Expr.eq (lineExpr (pick q ![0,1,4])) (lineExpr (pick q ![0,2,3]))
  Expression.any [.ne p n,.ne n r]

theorem gp_geometric (p : Fin 8 → V3) (hp : GeneralPoints (points4 p))
    (hl : GeneralLines (lines p)) (q : Fin 5 → Fin 8) (hq : Function.Injective q) :
    (gpExpr q).eval (assignment (points4 p) (lines p))=true := by
  have hc (s : Fin 3 → Fin 5) (hs : Function.Injective s) := line_correct p hp hl (pick q s) (hq.comp hs)
  have hz (s : Fin 3 → Fin 5) (hs : Function.Injective s) := hl (pick q s) (hq.comp hs)
  have hc1 := hc ![0,1,2] (by decide)
  have hc2 := hc ![0,3,4] (by decide)
  have hc3 := hc ![0,1,3] (by decide)
  have hc4 := hc ![0,2,4] (by decide)
  have hc5 := hc ![0,1,4] (by decide)
  have hc6 := hc ![0,2,3] (by decide)
  have hs := gp_sign_rule _ _ _ _ _ _
    (hz ![0,1,2] (by decide)) (hz ![0,3,4] (by decide))
    (hz ![0,1,3] (by decide)) (hz ![0,2,4] (by decide))
    (hz ![0,1,4] (by decide)) (hz ![0,2,3] (by decide)) (by
      have h := plucker_rank_three (lines p (q 0)) (lines p (q 1)) (lines p (q 2)) (lines p (q 3)) (lines p (q 4))
      simpa [pick,Function.comp_def,sub_eq_add_neg] using h)
  simpa only [gpExpr,Expression.any,Expr.eval,hc1,hc2,hc3,hc4,hc5,hc6,Bool.or_false,not_beq] using hs

end Stick81.LineDefinitions
