import PBCrossings
import CounterBV
import CircuitData

namespace Stick81.PBGlobalCrossings
open Circuit Counter

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def localGates : List Gate := [
⟨18511,.eq (15785,false) (15781,false)⟩,
⟨18512,.and [(15781,true),(15785,true)]⟩,
⟨18513,.eq (15793,false) (15789,false)⟩,
⟨18514,.and [(15789,true),(15793,true)]⟩,
⟨18515,.eq (15801,false) (15796,false)⟩,
⟨18516,.and [(15796,true),(15801,true)]⟩,
⟨18517,.eq (15811,false) (15806,false)⟩,
⟨18518,.and [(15806,true),(15811,true)]⟩,
⟨18519,.eq (15819,false) (15815,false)⟩,
⟨18520,.and [(15815,true),(15819,true)]⟩,
⟨18521,.eq (15829,false) (15824,false)⟩,
⟨18522,.and [(15824,true),(15829,true)]⟩,
⟨18523,.eq (15837,false) (15833,false)⟩,
⟨18524,.and [(15833,true),(15837,true)]⟩,
⟨18525,.eq (15846,false) (15842,false)⟩,
⟨18526,.and [(15842,true),(15846,true)]⟩,
⟨18527,.eq (15854,false) (15850,false)⟩,
⟨18528,.and [(15850,true),(15854,true)]⟩,
⟨18529,.eq (15861,false) (15857,false)⟩,
⟨18530,.and [(15857,true),(15861,true)]⟩,
⟨18531,.eq (18513,false) (18511,false)⟩,
⟨18532,.and [(18513,false),(18511,false)]⟩,
⟨18533,.eq (18514,false) (18512,false)⟩,
⟨18534,.eq (18533,false) (18532,true)⟩,
⟨18535,.majority (18512,true) (18514,true) (18532,true)⟩,
⟨18536,.eq (18517,false) (18515,false)⟩,
⟨18537,.and [(18517,false),(18515,false)]⟩,
⟨18538,.eq (18518,false) (18516,false)⟩,
⟨18539,.eq (18538,false) (18537,true)⟩,
⟨18540,.majority (18516,true) (18518,true) (18537,true)⟩,
⟨18541,.eq (18521,false) (18519,false)⟩,
⟨18542,.and [(18521,false),(18519,false)]⟩,
⟨18543,.eq (18522,false) (18520,false)⟩,
⟨18544,.eq (18543,false) (18542,true)⟩,
⟨18545,.majority (18520,true) (18522,true) (18542,true)⟩,
⟨18546,.eq (18525,false) (18523,false)⟩,
⟨18547,.and [(18525,false),(18523,false)]⟩,
⟨18548,.eq (18526,false) (18524,false)⟩,
⟨18549,.eq (18548,false) (18547,true)⟩,
⟨18550,.majority (18524,true) (18526,true) (18547,true)⟩,
⟨18551,.eq (18529,false) (18527,false)⟩,
⟨18552,.and [(18529,false),(18527,false)]⟩,
⟨18553,.eq (18530,false) (18528,false)⟩,
⟨18554,.eq (18553,false) (18552,true)⟩,
⟨18555,.majority (18528,true) (18530,true) (18552,true)⟩,
⟨18556,.eq (18536,false) (18531,false)⟩,
⟨18557,.and [(18536,false),(18531,false)]⟩,
⟨18558,.eq (18539,false) (18534,false)⟩,
⟨18559,.eq (18558,false) (18557,true)⟩,
⟨18560,.majority (18539,false) (18534,false) (18557,true)⟩,
⟨18561,.eq (18540,false) (18535,false)⟩,
⟨18562,.eq (18561,false) (18560,true)⟩,
⟨18563,.majority (18535,true) (18540,true) (18560,true)⟩,
⟨18564,.eq (18546,false) (18541,false)⟩,
⟨18565,.and [(18546,false),(18541,false)]⟩,
⟨18566,.eq (18549,false) (18544,false)⟩,
⟨18567,.eq (18566,false) (18565,true)⟩,
⟨18568,.majority (18549,false) (18544,false) (18565,true)⟩,
⟨18569,.eq (18550,false) (18545,false)⟩,
⟨18570,.eq (18569,false) (18568,true)⟩,
⟨18571,.majority (18545,true) (18550,true) (18568,true)⟩,
⟨18572,.eq (18564,false) (18556,false)⟩,
⟨18573,.and [(18564,false),(18556,false)]⟩,
⟨18574,.eq (18567,false) (18559,false)⟩,
⟨18575,.eq (18574,false) (18573,true)⟩,
⟨18576,.majority (18567,false) (18559,false) (18573,true)⟩,
⟨18577,.eq (18570,false) (18562,false)⟩,
⟨18578,.eq (18577,false) (18576,true)⟩,
⟨18579,.majority (18570,false) (18562,false) (18576,true)⟩,
⟨18580,.eq (18571,false) (18563,false)⟩,
⟨18581,.eq (18580,false) (18579,true)⟩,
⟨18582,.majority (18563,true) (18571,true) (18579,true)⟩,
⟨18584,.and [(18572,false),(18551,false)]⟩,
⟨18587,.majority (18575,false) (18554,false) (18584,true)⟩,
⟨18590,.majority (18578,false) (18555,true) (18587,true)⟩,
⟨18591,.eq (18590,false) (18581,true)⟩,
⟨18592,.and [(18581,false),(18590,true)]⟩,
⟨18593,.eq (18592,false) (18582,false)⟩,
⟨18594,.and [(18582,true),(18592,true)]⟩,
⟨18595,.and [(18591,true),(18593,true)]⟩,
⟨18596,.and [(18594,false),(18595,true)]⟩
]

theorem gates_sublist : localGates.Sublist roofGates := by native_decide

def terms : List (Lit × Int) := [
((15781,true),(1 : Int)),
((15785,true),(1 : Int)),
((15789,true),(1 : Int)),
((15793,true),(1 : Int)),
((15796,true),(1 : Int)),
((15801,true),(1 : Int)),
((15806,true),(1 : Int)),
((15811,true),(1 : Int)),
((15815,true),(1 : Int)),
((15819,true),(1 : Int)),
((15824,true),(1 : Int)),
((15829,true),(1 : Int)),
((15833,true),(1 : Int)),
((15837,true),(1 : Int)),
((15842,true),(1 : Int)),
((15846,true),(1 : Int)),
((15850,true),(1 : Int)),
((15854,true),(1 : Int)),
((15857,true),(1 : Int)),
((15861,true),(1 : Int))
]

def sumTree : SumTree Lit := (.fork (.fork (.fork (.fork (.fork (.leaf (15781,true)) (.leaf (15785,true))) (.fork (.leaf (15789,true)) (.leaf (15793,true)))) (.fork (.fork (.leaf (15796,true)) (.leaf (15801,true))) (.fork (.leaf (15806,true)) (.leaf (15811,true))))) (.fork (.fork (.fork (.leaf (15815,true)) (.leaf (15819,true))) (.fork (.leaf (15824,true)) (.leaf (15829,true)))) (.fork (.fork (.leaf (15833,true)) (.leaf (15837,true))) (.fork (.leaf (15842,true)) (.leaf (15846,true)))))) (.fork (.fork (.leaf (15850,true)) (.leaf (15854,true))) (.fork (.leaf (15857,true)) (.leaf (15861,true)))))

theorem leaves_normalized : sumTree.leaves =
    (expandLiteralWeights terms).filter (fun a => a.1 != 0) := by native_decide
theorem negative_offset : literalNegativeOffset terms = 0 := by native_decide
theorem true_constants : (expandLiteralWeights terms).count (0,true) = 0 := by native_decide

theorem global_equivalence (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ (18596,false) = ((8 : BitVec 5).ule (sumTree.evalBV 5 (val σ))) := by
  have hh : ∀ g ∈ localGates, σ g.out=g.op.eval σ :=
    fun g hg => models g (gates_sublist.subset hg)
  simp only [localGates,List.forall_mem_cons] at hh
  rcases hh with ⟨h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,h20,h21,h22,h23,h24,h25,h26,h27,h28,h29,h30,h31,h32,h33,h34,h35,h36,h37,h38,h39,h40,h41,h42,h43,h44,h45,h46,h47,h48,h49,h50,h51,h52,h53,h54,h55,h56,h57,h58,h59,h60,h61,h62,h63,h64,h65,h66,h67,h68,h69,h70,h71,h72,h73,h74,h75,h76,h77,h78,h79,h80,_⟩
  have hp := PBCrossings.local_equivalence
    (σ 15781)
    (σ 15785)
    (σ 15789)
    (σ 15793)
    (σ 15796)
    (σ 15801)
    (σ 15806)
    (σ 15811)
    (σ 15815)
    (σ 15819)
    (σ 15824)
    (σ 15829)
    (σ 15833)
    (σ 15837)
    (σ 15842)
    (σ 15846)
    (σ 15850)
    (σ 15854)
    (σ 15857)
    (σ 15861)
    (σ 18511)
    (σ 18512)
    (σ 18513)
    (σ 18514)
    (σ 18515)
    (σ 18516)
    (σ 18517)
    (σ 18518)
    (σ 18519)
    (σ 18520)
    (σ 18521)
    (σ 18522)
    (σ 18523)
    (σ 18524)
    (σ 18525)
    (σ 18526)
    (σ 18527)
    (σ 18528)
    (σ 18529)
    (σ 18530)
    (σ 18531)
    (σ 18532)
    (σ 18533)
    (σ 18534)
    (σ 18535)
    (σ 18536)
    (σ 18537)
    (σ 18538)
    (σ 18539)
    (σ 18540)
    (σ 18541)
    (σ 18542)
    (σ 18543)
    (σ 18544)
    (σ 18545)
    (σ 18546)
    (σ 18547)
    (σ 18548)
    (σ 18549)
    (σ 18550)
    (σ 18551)
    (σ 18552)
    (σ 18553)
    (σ 18554)
    (σ 18555)
    (σ 18556)
    (σ 18557)
    (σ 18558)
    (σ 18559)
    (σ 18560)
    (σ 18561)
    (σ 18562)
    (σ 18563)
    (σ 18564)
    (σ 18565)
    (σ 18566)
    (σ 18567)
    (σ 18568)
    (σ 18569)
    (σ 18570)
    (σ 18571)
    (σ 18572)
    (σ 18573)
    (σ 18574)
    (σ 18575)
    (σ 18576)
    (σ 18577)
    (σ 18578)
    (σ 18579)
    (σ 18580)
    (σ 18581)
    (σ 18582)
    (σ 18584)
    (σ 18587)
    (σ 18590)
    (σ 18591)
    (σ 18592)
    (σ 18593)
    (σ 18594)
    (σ 18595)
    (σ 18596)
    (by simpa [Op.eval,val,hzero] using h0)
    (by simpa [Op.eval,val,hzero] using h1)
    (by simpa [Op.eval,val,hzero] using h2)
    (by simpa [Op.eval,val,hzero] using h3)
    (by simpa [Op.eval,val,hzero] using h4)
    (by simpa [Op.eval,val,hzero] using h5)
    (by simpa [Op.eval,val,hzero] using h6)
    (by simpa [Op.eval,val,hzero] using h7)
    (by simpa [Op.eval,val,hzero] using h8)
    (by simpa [Op.eval,val,hzero] using h9)
    (by simpa [Op.eval,val,hzero] using h10)
    (by simpa [Op.eval,val,hzero] using h11)
    (by simpa [Op.eval,val,hzero] using h12)
    (by simpa [Op.eval,val,hzero] using h13)
    (by simpa [Op.eval,val,hzero] using h14)
    (by simpa [Op.eval,val,hzero] using h15)
    (by simpa [Op.eval,val,hzero] using h16)
    (by simpa [Op.eval,val,hzero] using h17)
    (by simpa [Op.eval,val,hzero] using h18)
    (by simpa [Op.eval,val,hzero] using h19)
    (by simpa [Op.eval,val,hzero] using h20)
    (by simpa [Op.eval,val,hzero] using h21)
    (by simpa [Op.eval,val,hzero] using h22)
    (by simpa [Op.eval,val,hzero] using h23)
    (by simpa [Op.eval,val,hzero] using h24)
    (by simpa [Op.eval,val,hzero] using h25)
    (by simpa [Op.eval,val,hzero] using h26)
    (by simpa [Op.eval,val,hzero] using h27)
    (by simpa [Op.eval,val,hzero] using h28)
    (by simpa [Op.eval,val,hzero] using h29)
    (by simpa [Op.eval,val,hzero] using h30)
    (by simpa [Op.eval,val,hzero] using h31)
    (by simpa [Op.eval,val,hzero] using h32)
    (by simpa [Op.eval,val,hzero] using h33)
    (by simpa [Op.eval,val,hzero] using h34)
    (by simpa [Op.eval,val,hzero] using h35)
    (by simpa [Op.eval,val,hzero] using h36)
    (by simpa [Op.eval,val,hzero] using h37)
    (by simpa [Op.eval,val,hzero] using h38)
    (by simpa [Op.eval,val,hzero] using h39)
    (by simpa [Op.eval,val,hzero] using h40)
    (by simpa [Op.eval,val,hzero] using h41)
    (by simpa [Op.eval,val,hzero] using h42)
    (by simpa [Op.eval,val,hzero] using h43)
    (by simpa [Op.eval,val,hzero] using h44)
    (by simpa [Op.eval,val,hzero] using h45)
    (by simpa [Op.eval,val,hzero] using h46)
    (by simpa [Op.eval,val,hzero] using h47)
    (by simpa [Op.eval,val,hzero] using h48)
    (by simpa [Op.eval,val,hzero] using h49)
    (by simpa [Op.eval,val,hzero] using h50)
    (by simpa [Op.eval,val,hzero] using h51)
    (by simpa [Op.eval,val,hzero] using h52)
    (by simpa [Op.eval,val,hzero] using h53)
    (by simpa [Op.eval,val,hzero] using h54)
    (by simpa [Op.eval,val,hzero] using h55)
    (by simpa [Op.eval,val,hzero] using h56)
    (by simpa [Op.eval,val,hzero] using h57)
    (by simpa [Op.eval,val,hzero] using h58)
    (by simpa [Op.eval,val,hzero] using h59)
    (by simpa [Op.eval,val,hzero] using h60)
    (by simpa [Op.eval,val,hzero] using h61)
    (by simpa [Op.eval,val,hzero] using h62)
    (by simpa [Op.eval,val,hzero] using h63)
    (by simpa [Op.eval,val,hzero] using h64)
    (by simpa [Op.eval,val,hzero] using h65)
    (by simpa [Op.eval,val,hzero] using h66)
    (by simpa [Op.eval,val,hzero] using h67)
    (by simpa [Op.eval,val,hzero] using h68)
    (by simpa [Op.eval,val,hzero] using h69)
    (by simpa [Op.eval,val,hzero] using h70)
    (by simpa [Op.eval,val,hzero] using h71)
    (by simpa [Op.eval,val,hzero] using h72)
    (by simpa [Op.eval,val,hzero] using h73)
    (by simpa [Op.eval,val,hzero] using h74)
    (by simpa [Op.eval,val,hzero] using h75)
    (by simpa [Op.eval,val,hzero] using h76)
    (by simpa [Op.eval,val,hzero] using h77)
    (by simpa [Op.eval,val,hzero] using h78)
    (by simpa [Op.eval,val,hzero] using h79)
    (by simpa [Op.eval,val,hzero] using h80)
  simpa [sumTree,SumTree.evalBV,val,hzero] using hp

theorem source_equivalence (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ (18596,false)=true ↔ (8 : Int) ≤ literalWeightedValue σ terms := by
  rw [global_equivalence σ hzero models]
  refine (sumTree_ge_correct sumTree 5 (val σ) 8 (by decide) (by decide)).trans ?_
  have hn := literal_normalization σ hzero terms
  rw [← leaves_normalized,negative_offset,true_constants] at hn
  omega

#print axioms source_equivalence
end Stick81.PBGlobalCrossings
