import SourceData
import PBGlobalCrossings
import PBGlobalA2Fast
import CircuitExclusion

namespace Stick81
open Circuit Counter LocalReduction SourceSemantics

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def sourceA2Terms : List (Lit × Int) := [((22277,true),(1 : Int)),((22279,true),(-1 : Int)),((22285,true),(1 : Int)),((22287,true),(-1 : Int)),((22293,true),(1 : Int)),((22295,true),(-1 : Int)),((22303,true),(1 : Int)),((22305,true),(-1 : Int)),((22312,true),(1 : Int)),((22314,true),(-1 : Int)),((22318,true),(1 : Int)),((22320,true),(-1 : Int)),((22324,true),(1 : Int)),((22326,true),(-1 : Int)),((22330,true),(1 : Int)),((22332,true),(-1 : Int)),((22337,true),(1 : Int)),((22339,true),(-1 : Int)),((22347,true),(1 : Int)),((22349,true),(-1 : Int)),((22355,true),(1 : Int)),((22357,true),(-1 : Int)),((22363,true),(1 : Int)),((22365,true),(-1 : Int)),((22372,true),(1 : Int)),((22374,true),(-1 : Int)),((22380,true),(1 : Int)),((22382,true),(-1 : Int)),((22387,true),(1 : Int)),((22389,true),(-1 : Int)),((22394,true),(1 : Int)),((22396,true),(-1 : Int)),((22401,true),(1 : Int)),((22403,true),(-1 : Int)),((22408,true),(1 : Int)),((22410,true),(-1 : Int)),((22415,true),(1 : Int)),((22417,true),(-1 : Int)),((22422,true),(1 : Int)),((22424,true),(-1 : Int)),((22429,true),(1 : Int)),((22431,true),(-1 : Int)),((22436,true),(1 : Int)),((22438,true),(-1 : Int)),((22445,true),(1 : Int)),((22447,true),(-1 : Int)),((22451,true),(1 : Int)),((22453,true),(-1 : Int)),((22457,true),(1 : Int)),((22459,true),(-1 : Int)),((22463,true),(1 : Int)),((22465,true),(-1 : Int)),((22469,true),(1 : Int)),((22471,true),(-1 : Int)),((22474,true),(1 : Int)),((22476,true),(-1 : Int)),((22480,true),(1 : Int)),((22482,true),(-1 : Int)),((22486,true),(1 : Int)),((22488,true),(-1 : Int)),((22492,true),(1 : Int)),((22494,true),(-1 : Int)),((22499,true),(1 : Int)),((22501,true),(-1 : Int)),((22506,true),(1 : Int)),((22508,true),(-1 : Int)),((22514,true),(1 : Int)),((22516,true),(-1 : Int)),((22520,true),(1 : Int)),((22522,true),(-1 : Int)),((22526,true),(1 : Int)),((22528,true),(-1 : Int)),((22532,true),(1 : Int)),((22534,true),(-1 : Int)),((22539,true),(1 : Int)),((22541,true),(-1 : Int)),((22546,true),(1 : Int)),((22548,true),(-1 : Int)),((22552,true),(1 : Int)),((22554,true),(-1 : Int)),((22561,true),(1 : Int)),((22563,true),(-1 : Int)),((22567,true),(1 : Int)),((22569,true),(-1 : Int)),((22573,true),(1 : Int)),((22575,true),(-1 : Int)),((22579,true),(1 : Int)),((22581,true),(-1 : Int)),((22586,true),(1 : Int)),((22588,true),(-1 : Int)),((22592,true),(1 : Int)),((22594,true),(-1 : Int)),((22598,true),(1 : Int)),((22600,true),(-1 : Int)),((22604,true),(1 : Int)),((22606,true),(-1 : Int)),((22609,true),(1 : Int)),((22611,true),(-1 : Int)),((22615,true),(1 : Int)),((22617,true),(-1 : Int)),((22621,true),(1 : Int)),((22623,true),(-1 : Int)),((22628,true),(1 : Int)),((22630,true),(-1 : Int)),((22636,true),(1 : Int)),((22638,true),(-1 : Int)),((22642,true),(1 : Int)),((22644,true),(-1 : Int)),((22649,true),(1 : Int)),((22651,true),(-1 : Int)),((22655,true),(1 : Int)),((22657,true),(-1 : Int)),((22660,true),(1 : Int)),((22662,true),(-1 : Int)),((22669,true),(1 : Int)),((22671,true),(-1 : Int)),((22675,true),(1 : Int)),((22677,true),(-1 : Int)),((22681,true),(1 : Int)),((22683,true),(-1 : Int)),((22687,true),(1 : Int)),((22689,true),(-1 : Int)),((22694,true),(1 : Int)),((22696,true),(-1 : Int)),((22700,true),(1 : Int)),((22702,true),(-1 : Int)),((22706,true),(1 : Int)),((22708,true),(-1 : Int)),((22713,true),(1 : Int)),((22715,true),(-1 : Int)),((22719,true),(1 : Int)),((22721,true),(-1 : Int)),((22725,true),(1 : Int)),((22727,true),(-1 : Int)),((22730,true),(1 : Int)),((22732,true),(-1 : Int)),((22736,true),(1 : Int)),((22738,true),(-1 : Int)),((22744,true),(1 : Int)),((22746,true),(-1 : Int)),((22750,true),(1 : Int)),((22752,true),(-1 : Int)),((22756,true),(1 : Int)),((22758,true),(-1 : Int)),((22761,true),(1 : Int)),((22763,true),(-1 : Int)),((22770,true),(1 : Int)),((22772,true),(-1 : Int)),((22776,true),(1 : Int)),((22778,true),(-1 : Int)),((22782,true),(1 : Int)),((22784,true),(-1 : Int)),((22788,true),(1 : Int)),((22790,true),(-1 : Int)),((22795,true),(1 : Int)),((22797,true),(-1 : Int)),((22801,true),(1 : Int)),((22803,true),(-1 : Int)),((22807,true),(1 : Int)),((22809,true),(-1 : Int)),((22814,true),(1 : Int)),((22816,true),(-1 : Int)),((22820,true),(1 : Int)),((22822,true),(-1 : Int)),((22827,true),(1 : Int)),((22829,true),(-1 : Int)),((22833,true),(1 : Int)),((22835,true),(-1 : Int)),((22839,true),(1 : Int)),((22841,true),(-1 : Int)),((22846,true),(1 : Int)),((22848,true),(-1 : Int)),((22853,true),(1 : Int)),((22855,true),(-1 : Int)),((22860,true),(1 : Int)),((22862,true),(-1 : Int)),((22870,true),(1 : Int)),((22872,true),(-1 : Int)),((22876,true),(1 : Int)),((22878,true),(-1 : Int)),((22881,true),(1 : Int)),((22883,true),(-1 : Int)),((22886,true),(1 : Int)),((22888,true),(-1 : Int)),((22892,true),(1 : Int)),((22894,true),(-1 : Int)),((22901,true),(1 : Int)),((22903,true),(-1 : Int)),((22908,true),(1 : Int)),((22910,true),(-1 : Int)),((22916,true),(1 : Int)),((22918,true),(-1 : Int)),((22922,true),(1 : Int)),((22924,true),(-1 : Int)),((22928,true),(1 : Int)),((22930,true),(-1 : Int)),((22934,true),(1 : Int)),((22936,true),(-1 : Int)),((22941,true),(1 : Int)),((22943,true),(-1 : Int)),((22948,true),(1 : Int)),((22950,true),(-1 : Int)),((22956,true),(1 : Int)),((22958,true),(-1 : Int)),((22965,true),(1 : Int)),((22967,true),(-1 : Int)),((22971,true),(1 : Int)),((22973,true),(-1 : Int)),((22977,true),(1 : Int)),((22979,true),(-1 : Int)),((22983,true),(1 : Int)),((22985,true),(-1 : Int)),((22988,true),(1 : Int)),((22990,true),(-1 : Int)),((22994,true),(1 : Int)),((22996,true),(-1 : Int)),((23000,true),(1 : Int)),((23002,true),(-1 : Int)),((23007,true),(1 : Int)),((23009,true),(-1 : Int)),((23015,true),(1 : Int)),((23017,true),(-1 : Int)),((23021,true),(1 : Int)),((23023,true),(-1 : Int)),((23028,true),(1 : Int)),((23030,true),(-1 : Int)),((23036,true),(1 : Int)),((23038,true),(-1 : Int)),((23041,true),(1 : Int)),((23043,true),(-1 : Int)),((23050,true),(1 : Int)),((23052,true),(-1 : Int)),((23056,true),(1 : Int)),((23058,true),(-1 : Int)),((23062,true),(1 : Int)),((23064,true),(-1 : Int)),((23069,true),(1 : Int)),((23071,true),(-1 : Int)),((23075,true),(1 : Int)),((23077,true),(-1 : Int)),((23081,true),(1 : Int)),((23083,true),(-1 : Int)),((23086,true),(1 : Int)),((23088,true),(-1 : Int)),((23092,true),(1 : Int)),((23094,true),(-1 : Int)),((23100,true),(1 : Int)),((23102,true),(-1 : Int)),((23108,true),(1 : Int)),((23110,true),(-1 : Int)),((23114,true),(1 : Int)),((23116,true),(-1 : Int)),((23119,true),(1 : Int)),((23121,true),(-1 : Int)),((23128,true),(1 : Int)),((23130,true),(-1 : Int)),((23134,true),(1 : Int)),((23136,true),(-1 : Int)),((23140,true),(1 : Int)),((23142,true),(-1 : Int)),((23147,true),(1 : Int)),((23149,true),(-1 : Int)),((23153,true),(1 : Int)),((23155,true),(-1 : Int)),((23160,true),(1 : Int)),((23162,true),(-1 : Int)),((23166,true),(1 : Int)),((23168,true),(-1 : Int)),((23172,true),(1 : Int)),((23174,true),(-1 : Int)),((23178,true),(1 : Int)),((23180,true),(-1 : Int)),((23184,true),(1 : Int)),((23186,true),(-1 : Int)),((23190,true),(1 : Int)),((23192,true),(-1 : Int)),((23199,true),(1 : Int)),((23201,true),(-1 : Int)),((23205,true),(1 : Int)),((23207,true),(-1 : Int)),((23211,true),(1 : Int)),((23213,true),(-1 : Int)),((23219,true),(1 : Int)),((23221,true),(-1 : Int)),((23225,true),(1 : Int)),((23227,true),(-1 : Int)),((23233,true),(1 : Int)),((23235,true),(-1 : Int)),((23241,true),(1 : Int)),((23243,true),(-1 : Int)),((23248,true),(1 : Int)),((23250,true),(-1 : Int)),((23255,true),(1 : Int)),((23257,true),(-1 : Int)),((23263,true),(1 : Int)),((23265,true),(-1 : Int)),((23269,true),(1 : Int)),((23271,true),(-1 : Int)),((23274,true),(1 : Int)),((23276,true),(-1 : Int)),((23280,true),(1 : Int)),((23282,true),(-1 : Int)),((23289,true),(1 : Int)),((23291,true),(-1 : Int)),((23297,true),(1 : Int)),((23299,true),(-1 : Int)),((23303,true),(1 : Int)),((23305,true),(-1 : Int)),((23310,true),(1 : Int)),((23312,true),(-1 : Int)),((23318,true),(1 : Int)),((23320,true),(-1 : Int)),((23327,true),(1 : Int)),((23329,true),(-1 : Int)),((23333,true),(1 : Int)),((23335,true),(-1 : Int)),((23339,true),(1 : Int)),((23341,true),(-1 : Int)),((23344,true),(1 : Int)),((23346,true),(-1 : Int)),((23350,true),(1 : Int)),((23352,true),(-1 : Int)),((23358,true),(1 : Int)),((23360,true),(-1 : Int)),((23366,true),(1 : Int)),((23368,true),(-1 : Int)),((23371,true),(1 : Int)),((23373,true),(-1 : Int)),((23380,true),(1 : Int)),((23382,true),(-1 : Int)),((23386,true),(1 : Int)),((23388,true),(-1 : Int)),((23393,true),(1 : Int)),((23395,true),(-1 : Int)),((23399,true),(1 : Int)),((23401,true),(-1 : Int)),((23405,true),(1 : Int)),((23407,true),(-1 : Int)),((23411,true),(1 : Int)),((23413,true),(-1 : Int)),((23417,true),(1 : Int)),((23419,true),(-1 : Int)),((23426,true),(1 : Int)),((23428,true),(-1 : Int)),((23432,true),(1 : Int)),((23434,true),(-1 : Int)),((23440,true),(1 : Int)),((23442,true),(-1 : Int)),((23448,true),(1 : Int)),((23450,true),(-1 : Int)),((23455,true),(1 : Int)),((23457,true),(-1 : Int)),((23463,true),(1 : Int)),((23465,true),(-1 : Int)),((23469,true),(1 : Int)),((23471,true),(-1 : Int)),((23475,true),(1 : Int)),((23477,true),(-1 : Int)),((23485,true),(1 : Int)),((23487,true),(-1 : Int)),((23493,true),(1 : Int)),((23495,true),(-1 : Int)),((23502,true),(1 : Int)),((23504,true),(-1 : Int)),((23508,true),(1 : Int)),((23510,true),(-1 : Int)),((23514,true),(1 : Int)),((23516,true),(-1 : Int)),((23520,true),(1 : Int)),((23522,true),(-1 : Int)),((23529,true),(1 : Int)),((23531,true),(-1 : Int)),((23537,true),(1 : Int)),((23539,true),(-1 : Int)),((23545,true),(1 : Int)),((23547,true),(-1 : Int)),((23551,true),(1 : Int)),((23553,true),(-1 : Int)),((23560,true),(1 : Int)),((23562,true),(-1 : Int))]
theorem sourceA2Shape : (nodeAt sourceNodes 23563).op =
    .pbEq sourceA2Terms (-6) := by native_decide
theorem sourceA2Encoding : encoding sourceNodes 23563 = (18510,true) := by native_decide
theorem sourceA2Subst : substWeights (encoding sourceNodes) sourceA2Terms =
    PBGlobalA2Fast.terms := by native_decide

theorem sourceA2_model (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ (encoding sourceNodes 23563) = (nodeAt sourceNodes 23563).op.eval σ
      (fun j => val σ (encoding sourceNodes j)) := by
  rw [sourceA2Shape,sourceA2Encoding]
  have h := PBGlobalA2Fast.source_equivalence σ hzero models
  rw [← sourceA2Subst,weighted_subst] at h
  have hi : val σ (18510,true) = true ↔
      NodeOp.eval σ (fun j => val σ (encoding sourceNodes j))
        (.pbEq sourceA2Terms (-6)) = true := by
    simpa only [NodeOp.eval,decide_eq_true_eq] using h
  cases hl : val σ (18510,true) <;>
    cases hr : NodeOp.eval σ (fun j => val σ (encoding sourceNodes j))
      (.pbEq sourceA2Terms (-6)) <;> simp_all

def sourceCrossingsTerms : List (Lit × Int) := [((21415,true),(1 : Int)),((21420,true),(1 : Int)),((21425,true),(1 : Int)),((21430,true),(1 : Int)),((21435,true),(1 : Int)),((21440,true),(1 : Int)),((21445,true),(1 : Int)),((21450,true),(1 : Int)),((21455,true),(1 : Int)),((21459,true),(1 : Int)),((21464,true),(1 : Int)),((21469,true),(1 : Int)),((21474,true),(1 : Int)),((21478,true),(1 : Int)),((21483,true),(1 : Int)),((21488,true),(1 : Int)),((21492,true),(1 : Int)),((21497,true),(1 : Int)),((21501,true),(1 : Int)),((21505,true),(1 : Int))]
theorem sourceCrossingsShape : (nodeAt sourceNodes 23564).op =
    .pbGe sourceCrossingsTerms (8) := by native_decide
theorem sourceCrossingsEncoding : encoding sourceNodes 23564 = (18596,false) := by native_decide
theorem sourceCrossingsSubst : substWeights (encoding sourceNodes) sourceCrossingsTerms =
    PBGlobalCrossings.terms := by native_decide

theorem sourceCrossings_model (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ (encoding sourceNodes 23564) = (nodeAt sourceNodes 23564).op.eval σ
      (fun j => val σ (encoding sourceNodes j)) := by
  rw [sourceCrossingsShape,sourceCrossingsEncoding]
  have h := PBGlobalCrossings.source_equivalence σ hzero models
  rw [← sourceCrossingsSubst,weighted_subst] at h
  have hi : val σ (18596,false) = true ↔
      NodeOp.eval σ (fun j => val σ (encoding sourceNodes j))
        (.pbGe sourceCrossingsTerms (8)) = true := by
    simpa only [NodeOp.eval,decide_eq_true_eq] using h
  cases hl : val σ (18596,false) <;>
    cases hr : NodeOp.eval σ (fun j => val σ (encoding sourceNodes j))
      (.pbGe sourceCrossingsTerms (8)) <;> simp_all

theorem circuit_source_model (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    Models sourceNodes σ (fun j => val σ (encoding sourceNodes j)) := by
  intro i
  by_cases hi : i.val < 23563
  · exact core_nodes_model σ hzero models ⟨i.val,hi⟩
  · have hn := i.isLt
    have hcount := sourceNodeCount
    have hs : i.val=23563 ∨ i.val=23564 := by omega
    rcases hs with hs | hs
    · simpa only [hs] using sourceA2_model σ hzero models
    · simpa only [hs] using sourceCrossings_model σ hzero models

theorem run_source_model (ρ : Nat → Bool) (hzero : ρ 0=true) :
    Models sourceNodes ρ (fun j => val (run ρ roofGates) (encoding sourceNodes j)) := by
  let σ := run ρ roofGates
  have hz : σ 0=true := by
    dsimp [σ]
    rw [run_preserves ρ roofGates 1 0 gatesAboveZero (by decide),hzero]
  have hm := gate_values_of_sat σ roofGates (run_satisfies ρ roofGates 0 roofGates_ordered)
  have hs := circuit_source_model σ hz hm
  intro i
  refine (hs i).trans ?_
  cases hop : (nodeAt sourceNodes i.val).op with
  | input v =>
    change σ v=ρ v
    apply circuit_preserves_unused
    have hu := sourceInputsUnused i
    simpa only [hop,InputUnused] using hu
  | boolean op => rfl
  | pbEq ts k => rfl
  | pbGe ts k => rfl

theorem source_formula_unsat (ρ values : Nat → Bool) (hzero : ρ 0=true)
    (hm : Models sourceNodes ρ values)
    (hr : ∀ i ∈ sourceRootIndices, values i=true) : False := by
  have he := models_unique sourceNodes sourceOrdered ρ values
    (fun j => val (run ρ roofGates) (encoding sourceNodes j)) hm (run_source_model ρ hzero)
  apply circuit_roots_impossible ρ
  intro a ha
  rw [sourceRoots_encoding] at ha
  rcases List.mem_cons.mp ha with ha | ha
  · subst a
    simp [val,run_preserves ρ roofGates 1 0 gatesAboveZero (by decide),hzero]
  · obtain ⟨i,hi,rfl⟩ := List.mem_map.mp ha
    exact (he ⟨i,sourceRoots_inBounds i hi⟩).symm.trans (hr i hi)

#print axioms source_formula_unsat
end Stick81
