import LineDefinitions

namespace Stick81.LineDefinitions
open Geometry RoofFrame GeometricInput SignRules Expression

theorem eval_signed (b : Bool) (e : Expr) (ρ : Nat → Bool) :
    (if b then e else Expr.not e).eval ρ = if b then e.eval ρ else Bool.not (e.eval ρ) := by
  cases b <;> rfl

theorem line_permutation (ls : Fin 8 → V3) (q base : Fin 3 → Fin 8)
    (hmap : ∀ i, q i=base (perm (relativePerm q base) i))
    (hn : det3 (ls (base 0)) (ls (base 1)) (ls (base 2)) ≠ 0) :
    positive (det3 (ls (q 0)) (ls (q 1)) (ls (q 2))) =
      if even (relativePerm q base) then positive (det3 (ls (base 0)) (ls (base 1)) (ls (base 2)))
      else Bool.not (positive (det3 (ls (base 0)) (ls (base 1)) (ls (base 2)))) := by
  have h := determinant_permuted (fun i => ls (base i)) (relativePerm q base)
  have hd : det3 (ls (q 0)) (ls (q 1)) (ls (q 2)) =
      if even (relativePerm q base) then det3 (ls (base 0)) (ls (base 1)) (ls (base 2))
      else -det3 (ls (base 0)) (ls (base 1)) (ls (base 2)) := by
    simpa only [← hmap 0,← hmap 1,← hmap 2] using h
  cases he : even (relativePerm q base)
  · have hd' : det3 (ls (q 0)) (ls (q 1)) (ls (q 2)) =
        -det3 (ls (base 0)) (ls (base 1)) (ls (base 2)) := by simpa [he] using hd
    simp [he,hd',negation _ hn]
  · have hd' : det3 (ls (q 0)) (ls (q 1)) (ls (q 2)) =
        det3 (ls (base 0)) (ls (base 1)) (ls (base 2)) := by simpa [he] using hd
    simp [he,hd']

theorem line_correct (p : Fin 8 → V3) (hp : GeneralPoints (points4 p))
    (hl : GeneralLines (lines p)) (q : Fin 3 → Fin 8) (hq : Function.Injective q) :
    (lineExpr q).eval (assignment (points4 p) (lines p)) =
      positive (det3 (lines p (q 0)) (lines p (q 1)) (lines p (q 2))) := by
  cases hind : independent q
  · obtain ⟨hbase,hnext,hmap,hfirst,hsecond⟩ := adjacent_verified q hq hind
    have ho1 := orient_correct p hp (firstTriangle q) hfirst
    have ho2 := orient_correct p hp (secondTriangle q) hsecond
    have hn1 := orient_nonzero p hp (firstTriangle q) hfirst
    have hn2 := orient_nonzero p hp (secondTriangle q) hsecond
    have hf : det3 (lines p (adjacentOrder q 0)) (lines p (adjacentOrder q 1))
        (lines p (adjacentOrder q 2)) =
        orient (p (adjacentOrder q 0)) (p (next (adjacentOrder q 0))) (p (adjacentOrder q 2)) *
          orient (p (adjacentOrder q 1)) (p (adjacentOrder q 2)) (p (next (adjacentOrder q 2))) := by
      unfold lines
      rw [hnext]
      exact adjacent_line_factor _ _ _ _ _
    have hb : (Expr.eq (orientExpr (firstTriangle q)) (orientExpr (secondTriangle q))).eval
        (assignment (points4 p) (lines p)) =
        positive (det3 (lines p (adjacentOrder q 0)) (lines p (adjacentOrder q 1)) (lines p (adjacentOrder q 2))) := by
      simp only [Expr.eval,ho1,ho2]
      rw [← multiplication _ _ hn1 hn2]
      congr 1
      simpa [firstTriangle,secondTriangle] using hf.symm
    rw [line_permutation (lines p) q (adjacentOrder q) hmap (hl _ hbase)]
    unfold lineExpr
    rw [if_neg (by rw [hind]; decide)]
    dsimp only
    rw [eval_signed,hb]
  · obtain ⟨⟨h01,h12⟩,hbase,hindSorted,hmap⟩ := sorted_verified q hq
    have heta : (![sorted q 0,sorted q 1,sorted q 2] : Fin 3 → Fin 8)=sorted q := by
      funext i
      fin_cases i <;> rfl
    have hsort : independent ![sorted q 0,sorted q 1,sorted q 2]=true := by
      rw [heta,hindSorted,hind]
    have hb : (Expr.atom (lineVar (sorted q 0) (sorted q 1) (sorted q 2))).eval
        (assignment (points4 p) (lines p)) =
        positive (det3 (lines p (sorted q 0)) (lines p (sorted q 1)) (lines p (sorted q 2))) := by
      change assignment (points4 p) (lines p) (lineVar (sorted q 0) (sorted q 1) (sorted q 2)) = _
      unfold assignment
      rw [line_lookup _ _ _ h01 h12 hsort]
      rfl
    rw [line_permutation (lines p) q (sorted q) hmap (hl _ hbase)]
    unfold lineExpr
    rw [if_pos hind]
    dsimp only
    rw [eval_signed,hb]

end Stick81.LineDefinitions
