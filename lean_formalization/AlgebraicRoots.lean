import BasicRoots
import FourHeightRoots
import FiveHeightRoots

namespace Stick81.AlgebraicRoots
open RoofFrame SourceSemantics

theorem prefix_partition : sourceRootIndices.take 2183 =
    sourceRootIndices.take 1833 ++ (sourceRootIndices.drop 1833).take 35 ++
      (sourceRootIndices.drop 1868).take 315 := by native_decide

theorem all_roots (f : Frame) (hp : f.Positive) (hn : NormalizationRoot.Normalized f)
    (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ sourceRootIndices.take 2183, values i=true := by
  intro i hi
  rw [prefix_partition] at hi
  simp only [List.mem_append,or_assoc] at hi
  rcases hi with h | h | h
  · exact BasicRoots.all_roots f hp hn values hm i h
  · exact FourHeightRoots.all_roots f values hm i h
  · exact FiveHeightRoots.all_roots f values hm i h

#print axioms all_roots
end Stick81.AlgebraicRoots
