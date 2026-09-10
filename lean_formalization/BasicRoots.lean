import PointGP
import LineGP
import LineBracket
import LineIncidence
import AcyclicRoots
import ProjectedAcyclicRoots
import NormalizationRoot

namespace Stick81.BasicRoots
open RoofFrame GeometricInput SourceSemantics

theorem prefix_partition : sourceRootIndices.take 1833 =
    sourceRootIndices.take 1260 ++ (sourceRootIndices.drop 1260).take 280 ++
    (sourceRootIndices.drop 1540).take 48 ++ (sourceRootIndices.drop 1588).take 126 ++
    (sourceRootIndices.drop 1714).take 70 ++ (sourceRootIndices.drop 1784).take 1 ++
    (sourceRootIndices.drop 1785).take 48 := by native_decide

theorem all_roots (f : Frame) (hp : f.Positive) (hn : NormalizationRoot.Normalized f)
    (values : Nat → Bool) (hm : Models sourceNodes f.input values) :
    ∀ i ∈ sourceRootIndices.take 1833, values i=true := by
  intro i hi
  rw [prefix_partition] at hi
  simp only [List.mem_append,or_assoc] at hi
  rcases hi with h | h | h | h | h | h | h
  · exact PointGP.all_point_gp_roots (points4 f.points) (lines f.points) f.pointGeneric values hm i h
  · exact LineGP.all_line_gp_roots f values hm i h
  · exact LineBracket.all_roots f values hm i h
  · exact AcyclicRoots.all_roots f hp values hm i h
  · exact ProjectedAcyclicRoots.all_roots f values hm i h
  · exact NormalizationRoot.all_roots f hn values hm i h
  · exact LineIncidence.all_roots f values hm i h

#print axioms all_roots

end Stick81.BasicRoots
