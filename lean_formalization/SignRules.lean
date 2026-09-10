import Mathlib

namespace Stick81.SignRules

noncomputable def positive (x : ℝ) : Bool := by
  classical
  exact decide (0<x)

theorem negation (x : ℝ) (hx : x≠0) : positive (-x)=!positive x := by
  rcases lt_or_gt_of_ne hx with hn | hp
  · simp [positive,not_lt_of_ge hn.le,neg_pos.mpr hn]
  · simp [positive,hp,not_lt_of_ge (neg_nonpos.mpr hp.le)]

theorem multiplication (a b : ℝ) (ha : a≠0) (hb : b≠0) :
    positive (a*b)=(positive a == positive b) := by
  rcases lt_or_gt_of_ne ha with hna | hpa <;> rcases lt_or_gt_of_ne hb with hnb | hpb
  · simp [positive,not_lt_of_ge hna.le,not_lt_of_ge hnb.le,mul_pos_of_neg_of_neg hna hnb]
  · simp [positive,not_lt_of_ge hna.le,hpb,not_lt_of_ge (mul_neg_of_neg_of_pos hna hpb).le]
  · simp [positive,hpa,not_lt_of_ge hnb.le,not_lt_of_ge (mul_neg_of_pos_of_neg hpa hnb).le]
  · simp [positive,hpa,hpb,mul_pos hpa hpb]

theorem sum_nonpos (xs : List ℝ) (h : ∀ x ∈ xs, x≤0) : xs.sum≤0 := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
    have ha := h a (by simp)
    have ht := ih (fun x hx => h x (by simp [hx]))
    simp only [List.sum_cons]
    linarith

theorem zero_terms_of_nonpos (xs : List ℝ) (h : ∀ x ∈ xs, x≤0) (hs : xs.sum=0) :
    ∀ x ∈ xs, x=0 := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
    have ha := h a (by simp)
    have ht : ∀ x ∈ xs, x≤0 := fun x hx => h x (by simp [hx])
    have hts := sum_nonpos xs ht
    simp only [List.sum_cons] at hs
    have haz : a=0 := by linarith
    have htz : xs.sum=0 := by linarith
    intro x hx
    rcases List.mem_cons.mp hx with rfl | hx
    · exact haz
    · exact ih ht htz x hx

theorem zero_terms_of_nonneg (xs : List ℝ) (h : ∀ x ∈ xs, 0≤x) (hs : xs.sum=0) :
    ∀ x ∈ xs, x=0 := by
  have hn : ∀ x ∈ xs.map (fun a => -a), x≤0 := by
    intro x hx
    obtain ⟨a,ha,rfl⟩ := List.mem_map.mp hx
    exact neg_nonpos.mpr (h a ha)
  have hneg : (xs.map (fun a => -a)).sum = -xs.sum := by
    clear h hs hn
    induction xs with
    | nil => simp
    | cons a xs ih => simp only [List.map_cons,List.sum_cons,ih]; ring
  have hsn : (xs.map (fun a => -a)).sum=0 := by rw [hneg,hs]; simp
  have he := zero_terms_of_nonpos _ hn hsn
  intro x hx
  have hh := he (-x) (List.mem_map.mpr ⟨x,hx,rfl⟩)
  linarith

theorem mixed_sum (xs : List ℝ) (hs : xs.sum=0) (hn : ∃ x ∈ xs, x≠0) :
    (∃ x ∈ xs, 0<x) ∧ (∃ x ∈ xs, x<0) := by
  classical
  obtain ⟨a,ha,haz⟩ := hn
  constructor
  · by_contra h
    push_neg at h
    exact haz (zero_terms_of_nonpos xs h hs a ha)
  · by_contra h
    push_neg at h
    exact haz (zero_terms_of_nonneg xs h hs a ha)

theorem mixed_sum_boolean (xs : List ℝ) (hs : xs.sum=0) (hn : ∃ x ∈ xs, x≠0) :
    (xs.any positive && xs.any (fun x => !positive x))=true := by
  obtain ⟨⟨a,ha,hpa⟩,⟨b,hb,hnb⟩⟩ := mixed_sum xs hs hn
  simp only [Bool.and_eq_true,List.any_eq_true]
  constructor
  · exact ⟨a,ha,by simp [positive,hpa]⟩
  · exact ⟨b,hb,by simp [positive,not_lt_of_ge hnb.le]⟩

end Stick81.SignRules
