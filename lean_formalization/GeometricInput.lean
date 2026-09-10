import Permutation4
import Expression

namespace Stick81.GeometricInput
open Geometry SignRules Expression Permutation4

inductive Atom where
  | point (a b c d : Fin 9)
  | line (a b c : Fin 8)
  deriving Repr, DecidableEq, BEq

def inputAtoms : List (Nat × Atom) := [
(1,.point 0 1 2 3),
(2,.point 0 1 4 5),
(4,.point 0 1 2 4),
(5,.point 0 1 3 5),
(8,.point 0 1 2 5),
(9,.point 0 1 3 4),
(13,.point 0 1 4 6),
(15,.point 0 1 3 6),
(18,.point 0 1 2 6),
(22,.point 0 1 4 7),
(24,.point 0 1 3 7),
(27,.point 0 1 2 7),
(31,.point 0 1 4 8),
(33,.point 0 1 3 8),
(36,.point 0 1 2 8),
(40,.point 0 1 5 6),
(47,.point 0 1 5 7),
(54,.point 0 1 5 8),
(61,.point 0 1 6 7),
(68,.point 0 1 6 8),
(75,.point 0 1 7 8),
(232,.point 0 2 4 5),
(234,.point 0 2 3 5),
(237,.point 0 2 3 4),
(241,.point 0 2 4 6),
(243,.point 0 2 3 6),
(249,.point 0 2 4 7),
(251,.point 0 2 3 7),
(257,.point 0 2 4 8),
(259,.point 0 2 3 8),
(265,.point 0 2 5 6),
(272,.point 0 2 5 7),
(279,.point 0 2 5 8),
(286,.point 0 2 6 7),
(293,.point 0 2 6 8),
(300,.point 0 2 7 8),
(457,.point 0 3 4 5),
(464,.point 0 3 4 6),
(471,.point 0 3 4 7),
(478,.point 0 3 4 8),
(485,.point 0 3 5 6),
(492,.point 0 3 5 7),
(499,.point 0 3 5 8),
(506,.point 0 3 6 7),
(513,.point 0 3 6 8),
(520,.point 0 3 7 8),
(701,.point 0 4 5 6),
(708,.point 0 4 5 7),
(715,.point 0 4 5 8),
(722,.point 0 4 6 7),
(729,.point 0 4 6 8),
(736,.point 0 4 7 8),
(935,.point 0 5 6 7),
(942,.point 0 5 6 8),
(949,.point 0 5 7 8),
(1160,.point 0 6 7 8),
(1737,.point 1 2 4 5),
(1739,.point 1 2 3 5),
(1742,.point 1 2 3 4),
(1746,.point 1 2 4 6),
(1748,.point 1 2 3 6),
(1754,.point 1 2 4 7),
(1756,.point 1 2 3 7),
(1762,.point 1 2 4 8),
(1764,.point 1 2 3 8),
(1770,.point 1 2 5 6),
(1777,.point 1 2 5 7),
(1784,.point 1 2 5 8),
(1791,.point 1 2 6 7),
(1798,.point 1 2 6 8),
(1805,.point 1 2 7 8),
(1962,.point 1 3 4 5),
(1969,.point 1 3 4 6),
(1976,.point 1 3 4 7),
(1983,.point 1 3 4 8),
(1990,.point 1 3 5 6),
(1997,.point 1 3 5 7),
(2004,.point 1 3 5 8),
(2011,.point 1 3 6 7),
(2018,.point 1 3 6 8),
(2025,.point 1 3 7 8),
(2206,.point 1 4 5 6),
(2213,.point 1 4 5 7),
(2220,.point 1 4 5 8),
(2227,.point 1 4 6 7),
(2234,.point 1 4 6 8),
(2241,.point 1 4 7 8),
(2440,.point 1 5 6 7),
(2447,.point 1 5 6 8),
(2454,.point 1 5 7 8),
(2665,.point 1 6 7 8),
(3242,.point 2 3 4 5),
(3249,.point 2 3 4 6),
(3256,.point 2 3 4 7),
(3263,.point 2 3 4 8),
(3270,.point 2 3 5 6),
(3277,.point 2 3 5 7),
(3284,.point 2 3 5 8),
(3291,.point 2 3 6 7),
(3298,.point 2 3 6 8),
(3305,.point 2 3 7 8),
(3486,.point 2 4 5 6),
(3493,.point 2 4 5 7),
(3500,.point 2 4 5 8),
(3507,.point 2 4 6 7),
(3514,.point 2 4 6 8),
(3521,.point 2 4 7 8),
(3720,.point 2 5 6 7),
(3727,.point 2 5 6 8),
(3734,.point 2 5 7 8),
(3945,.point 2 6 7 8),
(4546,.point 3 4 5 6),
(4553,.point 3 4 5 7),
(4560,.point 3 4 5 8),
(4567,.point 3 4 6 7),
(4574,.point 3 4 6 8),
(4581,.point 3 4 7 8),
(4780,.point 3 5 6 7),
(4787,.point 3 5 6 8),
(4794,.point 3 5 7 8),
(5005,.point 3 6 7 8),
(5624,.point 4 5 6 7),
(5631,.point 4 5 6 8),
(5638,.point 4 5 7 8),
(5849,.point 4 6 7 8),
(6480,.point 5 6 7 8),
(7691,.line 0 2 4),
(7699,.line 0 3 5),
(7701,.line 0 2 5),
(7708,.line 0 3 6),
(7710,.line 0 2 6),
(7731,.line 0 4 6),
(7923,.line 1 3 5),
(7931,.line 1 3 6),
(7939,.line 1 3 7),
(7953,.line 1 4 6),
(7960,.line 1 4 7),
(7974,.line 1 5 7),
(8171,.line 2 4 6),
(8178,.line 2 4 7),
(8192,.line 2 5 7),
(8406,.line 3 5 7)
]

def lookupAtom (i : Nat) : Option Atom := (inputAtoms.find? (fun p => p.1==i)).map Prod.snd
def pointVar (a b c d : Fin 9) : Nat :=
  ((inputAtoms.find? (fun p => p.2==Atom.point a b c d)).map Prod.fst).getD 0

theorem lookup_zero : lookupAtom 0=none := by native_decide
theorem point_lookup : ∀ a b c d : Fin 9, a<b → b<c → c<d →
    lookupAtom (pointVar a b c d)=some (.point a b c d) := by native_decide

noncomputable def Atom.eval (w : Fin 9 → V4) (l : Fin 8 → V3) : Atom → Bool
  | .point a b c d => positive (-det4 (w a) (w b) (w c) (w d))
  | .line a b c => positive (det3 (l a) (l b) (l c))

noncomputable def assignment (w : Fin 9 → V4) (l : Fin 8 → V3) (i : Nat) : Bool :=
  match lookupAtom i with
  | some a => a.eval w l
  | none => decide (i=0)

theorem assignment_zero (w : Fin 9 → V4) (l : Fin 8 → V3) : assignment w l 0=true := by
  simp [assignment,lookup_zero]

theorem assignment_point (w : Fin 9 → V4) (l : Fin 8 → V3) (a b c d : Fin 9)
    (hab : a<b) (hbc : b<c) (hcd : c<d) :
    assignment w l (pointVar a b c d)=positive (-det4 (w a) (w b) (w c) (w d)) := by
  unfold assignment
  rw [point_lookup a b c d hab hbc hcd]
  rfl

def chiExpr (q : Fin 4 → Fin 9) : Expr :=
  let atom := Expr.atom (pointVar (sorted q 0) (sorted q 1) (sorted q 2) (sorted q 3))
  if even (findPerm q) then atom else .not atom

end Stick81.GeometricInput
