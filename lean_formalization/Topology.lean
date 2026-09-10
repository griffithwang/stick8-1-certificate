import Mathlib

/- Polygonal knots in actual real three-space. These definitions impose no
   generic-position assumption and do not encode the desired stick number. -/
namespace Stick81.Topology

abbrev E3 := Fin 3 → ℝ

def next {n : Nat} (i : Fin n) : Fin n :=
  ⟨(i.val+1)%n,Nat.mod_lt _ (by have := i.isLt; omega)⟩

def edgePoint {n : Nat} (p : Fin n → E3) (i : Fin n) (t : ℝ) : E3 :=
  (1-t) • p i + t • p (next i)

def Embedded {n : Nat} (p : Fin n → E3) : Prop :=
  3 ≤ n ∧ ∀ (i j : Fin n) (t u : ℝ), t ∈ Set.Icc (0:ℝ) 1 → u ∈ Set.Icc (0:ℝ) 1 →
    edgePoint p i t = edgePoint p j u →
      (i=j ∧ t=u) ∨ (next i=j ∧ t=1 ∧ u=0) ∨ (i=next j ∧ t=0 ∧ u=1)

structure Polygon where
  edges : Nat
  vertices : Fin edges → E3
  embedded : Embedded vertices

def Polygon.trace (p : Polygon) : Set E3 :=
  {x | ∃ (i : Fin p.edges) (t : ℝ), t ∈ Set.Icc (0:ℝ) 1 ∧ x=edgePoint p.vertices i t}

/- An ambient isotopy is a jointly continuous family of homeomorphisms,
   with jointly continuous inverses and identity at time zero. Defining the
   family on R rather than I is harmless: interval families extend by clamp. -/
structure AmbientIsotopy where
  map : ℝ → E3 ≃ₜ E3
  joint : Continuous (fun p : ℝ × E3 => map p.1 p.2)
  joint_inv : Continuous (fun p : ℝ × E3 => (map p.1).symm p.2)
  at_zero : map 0 = Homeomorph.refl E3

def AmbientIsotopy.refl : AmbientIsotopy where
  map := fun _ => Homeomorph.refl E3
  joint := continuous_snd
  joint_inv := continuous_snd
  at_zero := rfl

def AmbientIsotopy.symm (h : AmbientIsotopy) : AmbientIsotopy where
  map := fun t => (h.map t).symm
  joint := h.joint_inv
  joint_inv := by simpa using h.joint
  at_zero := by rw [h.at_zero]; rfl

def AmbientIsotopy.trans (h k : AmbientIsotopy) : AmbientIsotopy where
  map := fun t => (h.map t).trans (k.map t)
  joint := k.joint.comp (continuous_fst.prodMk h.joint)
  joint_inv := h.joint_inv.comp (continuous_fst.prodMk k.joint_inv)
  at_zero := by rw [h.at_zero,k.at_zero]; rfl

def AmbientEquivalent (A B : Set E3) : Prop :=
  ∃ h : AmbientIsotopy, ∀ x, x ∈ A ↔ h.map 1 x ∈ B

theorem ambient_refl (A : Set E3) : AmbientEquivalent A A :=
  ⟨AmbientIsotopy.refl,fun _ => Iff.rfl⟩

theorem ambient_symm {A B : Set E3} (h : AmbientEquivalent A B) : AmbientEquivalent B A := by
  rcases h with ⟨h,hh⟩
  refine ⟨h.symm,?_⟩
  intro x
  have hx := (hh ((h.map 1).symm x)).symm
  simpa [AmbientIsotopy.symm] using hx

theorem ambient_trans {A B C : Set E3} (h : AmbientEquivalent A B)
    (k : AmbientEquivalent B C) : AmbientEquivalent A C := by
  rcases h with ⟨h,hh⟩
  rcases k with ⟨k,hk⟩
  exact ⟨h.trans k,fun x => (hh x).trans (hk (h.map 1 x))⟩

instance polygonSetoid : Setoid Polygon where
  r p q := AmbientEquivalent p.trace q.trace
  iseqv := ⟨fun p => ambient_refl p.trace,fun h => ambient_symm h,fun h k => ambient_trans h k⟩

def Knot := Quotient polygonSetoid
def Polygon.knot (p : Polygon) : Knot := Quotient.mk polygonSetoid p

theorem realized (K : Knot) : ∃ n : Nat, ∃ p : Polygon, p.edges=n ∧ p.knot=K := by
  induction K using Quotient.inductionOn with
  | h p => exact ⟨p.edges,p,rfl,rfl⟩

noncomputable def stick (K : Knot) : Nat := by
  classical
  exact Nat.find (realized K)

theorem stick_realized (K : Knot) : ∃ p : Polygon, p.edges=stick K ∧ p.knot=K := by
  classical
  exact Nat.find_spec (realized K)

theorem stick_le (p : Polygon) : stick p.knot ≤ p.edges := by
  classical
  exact Nat.find_min' (realized p.knot) ⟨p,rfl,rfl⟩

theorem stick_ge_three (K : Knot) : 3 ≤ stick K := by
  obtain ⟨p,hp,hK⟩ := stick_realized K
  have h := p.embedded.1
  omega

theorem exclude_stick_value (K : Knot) (n : Nat)
    (h : ∀ p : Polygon, p.edges=n → p.knot ≠ K) : stick K ≠ n := by
  intro heq
  obtain ⟨p,hp,hK⟩ := stick_realized K
  exact h p (hp.trans heq) hK

end Stick81.Topology
