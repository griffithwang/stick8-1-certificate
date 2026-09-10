import RoofFrame
import SourceData

namespace Stick81.NormalizationRoot
open Geometry RoofFrame GeometricInput SignRules Expression SourceSemantics

def Normalized (f : Frame) : Prop := 0<orient (f.points 0) (f.points 1) (f.points 2)
def expr : Expr := orientExpr ![0,1,2]
def root : Nat := 39

theorem shape : expand 64 sourceNodes root=some expr := by native_decide
theorem rootsCovered : [root]=(sourceRootIndices.drop 1784).take 1 := by native_decide

theorem geometric (f : Frame) (hn : Normalized f) : expr.eval f.input=true := by
  have h := orient_correct f.points f.pointGeneric ![0,1,2] (by decide)
  exact h.trans (by simpa [positive] using hn)

theorem all_roots (f : Frame) (hn : Normalized f) (values : Nat → Bool)
    (hm : Models sourceNodes f.input values) :
    ∀ i ∈ (sourceRootIndices.drop 1784).take 1, values i=true := by
  intro i hi
  rw [← rootsCovered] at hi
  have hroot : i=root := by simpa using hi
  subst i
  exact (expand_sound 64 sourceNodes f.input values hm root expr shape).symm.trans (geometric f hn)

#print axioms all_roots
end Stick81.NormalizationRoot
