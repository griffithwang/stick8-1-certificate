import AlgebraicRoots
import DirectionRoots
import OrderRoots
import FixedCertificate
import SourceCorrect

namespace Stick81.Submission
open RoofFrame SourceSemantics

/-- The only source roots whose geometric interpretation remains external. -/
def externalRoots : List Nat :=
  (sourceRootIndices.drop 2183).take 9 ++ sourceRootIndices.drop 2292

theorem externalRoots_count : externalRoots.length = 11 := by native_decide

theorem full_root_partition : sourceRootIndices =
    sourceRootIndices.take 2183 ++
    (sourceRootIndices.drop 2183).take 9 ++
    (sourceRootIndices.drop 2192).take 20 ++
    (sourceRootIndices.drop 2212).take 80 ++
    sourceRootIndices.drop 2292 := by native_decide

/-- Geometric exclusion with exactly nine ear and two target root premises.
This is not itself a theorem about the knot type of an arbitrary polygon. -/
theorem geometric_exclusion_eleven
    (f : Frame) (hp : f.Positive) (hn : NormalizationRoot.Normalized f)
    (values : Nat → Bool) (model : Models sourceNodes f.input values)
    (external : ∀ i ∈ externalRoots, values i = true) : False := by
  have ha := AlgebraicRoots.all_roots f hp hn values model
  have hd := DirectionRoots.all_roots f values model
  have ho := OrderRoots.all_roots f values model
  apply source_formula_unsat f.input values (frame_input_zero f) model
  intro i hi
  rw [full_root_partition] at hi
  simp only [List.mem_append] at hi
  rcases hi with (((h | h) | h) | h) | h
  · exact ha i h
  · exact external i (List.mem_append_left _ h)
  · exact hd i h
  · exact ho i h
  · exact external i (List.mem_append_right _ h)

theorem root_split :
    sourceRootIndices = sourceRootIndices.take 2183 ++ sourceRootIndices.drop 2183 := by
  exact (List.take_append_drop 2183 sourceRootIndices).symm

theorem finite_formalized_exclusion
    (f : Frame) (hp : f.Positive) (hn : NormalizationRoot.Normalized f)
    (values : Nat → Bool)
    (model : Models sourceNodes f.input values)
    (remaining : ∀ i ∈ sourceRootIndices.drop 2183, values i = true) : False := by
  have hprefix := AlgebraicRoots.all_roots f hp hn values model
  have hall : ∀ i ∈ sourceRootIndices, values i = true := by
    intro i hi
    rw [root_split] at hi
    rcases List.mem_append.mp hi with h | h
    · exact hprefix i h
    · exact remaining i h
  exact source_formula_unsat f.input values (frame_input_zero f) model hall

/--
The theorem above is the exact formalized finite core. It deliberately exposes
the remaining-root premise instead of hiding the unformalized geometric
coverage argument in an axiom or a definition.
-/
theorem finite_formalized_exclusion_without_new_axiom :
    ∀ (f : Frame) (hp : f.Positive) (hn : NormalizationRoot.Normalized f)
      (values : Nat → Bool),
      Models sourceNodes f.input values →
      (∀ i ∈ sourceRootIndices.drop 2183, values i = true) → False := by
  intro f hp hn values model remaining
  exact finite_formalized_exclusion f hp hn values model remaining

#check roofUnsat
#check circuit_roots_impossible
#check source_formula_unsat
#check finite_formalized_exclusion
#print axioms finite_formalized_exclusion
#print axioms geometric_exclusion_eleven

end Stick81.Submission
