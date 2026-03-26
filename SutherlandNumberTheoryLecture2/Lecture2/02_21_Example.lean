import Mathlib

-- `show` used functionally to unfold subtype coercions
set_option linter.style.show false

/-!
# Example 2.21

Consider the subring A := ℤ + 2iℤ of the Gaussian integers (with i² = -1).
The set I := 2ℤ[i] is a non-invertible A-ideal (even though it is an invertible
ℤ[i]-ideal); indeed, we have A ÷ I = ℤ[i] and I(A ÷ I) = 2ℤ[i] ⊊ A.

See `blobs/Lecture2/02_21_Example.md` for the source text.
-/

local notation "ℤ[i]" => GaussianInt

/-! ## The subring A = ℤ + 2iℤ

A consists of Gaussian integers whose imaginary part is even.
-/

/-- The subring A = ℤ + 2iℤ ⊂ ℤ[i], consisting of Gaussian integers with even
imaginary part. -/
def SubringA : Subring ℤ[i] where
  carrier := {z : ℤ[i] | Even z.im}
  mul_mem' := by
    intro a b ⟨m, hm⟩ ⟨n, hn⟩
    exact ⟨a.re * n + m * b.re, by rw [Zsqrtd.im_mul, hm, hn]; ring⟩
  one_mem' := ⟨0, by simp⟩
  add_mem' := fun ha hb => ha.add hb
  zero_mem' := ⟨0, by simp⟩
  neg_mem' := fun ha => ha.neg

/-! ## The set I = 2ℤ[i]

As a subset of ℤ[i], I = {2a + 2bi : a, b ∈ ℤ} = {z ∈ ℤ[i] : Even z.re ∧ Even z.im}.
-/

/-- The set I = 2ℤ[i]: all Gaussian integers with both real and imaginary parts even. -/
def idealI : Set ℤ[i] := {z : ℤ[i] | Even z.re ∧ Even z.im}

/-- I = 2ℤ[i] is contained in A = ℤ + 2iℤ (since even im part). -/
theorem idealI_subset_SubringA : idealI ⊆ (SubringA : Set ℤ[i]) :=
  fun _ ⟨_, hz_im⟩ => hz_im

/-! ## Claim (a): A = ℤ + 2iℤ is a subring of ℤ[i]

This is established by the definition `SubringA` above.
-/

/-! ## Claim (b): I = 2ℤ[i] is an ideal of A

We formalize I as an `Ideal SubringA`. Every element of I has both parts even,
so it lies in A. And I is closed under multiplication by elements of A.
-/

/-- I = 2ℤ[i] as an ideal of the subring A. -/
def idealI_of_A : Ideal SubringA where
  carrier := {z : SubringA | Even z.1.re ∧ Even z.1.im}
  add_mem' := by
    intro ⟨a, _⟩ ⟨b, _⟩ ⟨har, hai⟩ ⟨hbr, hbi⟩
    exact ⟨har.add hbr, hai.add hbi⟩
  zero_mem' := ⟨⟨0, by simp⟩, ⟨0, by simp⟩⟩
  smul_mem' := by
    intro ⟨c, hc_mem⟩ ⟨x, _⟩ ⟨hxr, hxi⟩
    obtain ⟨m, hm⟩ := hxr
    obtain ⟨n, hn⟩ := hxi
    obtain ⟨p, hp⟩ := hc_mem
    show Even (c * x).re ∧ Even (c * x).im
    exact ⟨⟨c.re * m - p * x.im, by rw [Zsqrtd.re_mul, hm, hp]; ring⟩,
           ⟨c.re * n + p * x.re, by rw [Zsqrtd.im_mul, hn, hp]; ring⟩⟩

/-! ## Claim (c): I is invertible as a ℤ[i]-ideal

As a ℤ[i]-ideal, I = (2) is principal, hence invertible.
-/

/-- I = 2ℤ[i] as an ideal of ℤ[i], i.e., the principal ideal (2). -/
def idealI_of_ZI : Ideal ℤ[i] := Ideal.span {(⟨2, 0⟩ : ℤ[i])}

/-- I = (2) is a nonzero ideal of ℤ[i]. Combined with the fact that ℤ[i] is a PID
(and hence a Dedekind domain), this implies I is invertible as a fractional ideal. -/
theorem idealI_of_ZI_ne_bot : idealI_of_ZI ≠ ⊥ := by
  rw [idealI_of_ZI, Ne, Ideal.span_singleton_eq_bot]
  simp [Zsqrtd.ext_iff]

/-- ℤ[i] is a principal ideal ring (hence every nonzero ideal is invertible). -/
instance : IsPrincipalIdealRing ℤ[i] := EuclideanDomain.to_principal_ideal_domain

/-! ## Claim (d): A ÷ I = ℤ[i]

The conductor of I in A equals all of ℤ[i]. Concretely, for every z ∈ ℤ[i],
z · I ⊆ A. This is because if w ∈ I = 2ℤ[i] then z * w = 2(z * w') ∈ 2ℤ[i] ⊆ A.
-/

/-- For all z ∈ ℤ[i] and w ∈ I, we have z * w ∈ A. This shows A ÷ I = ℤ[i]. -/
theorem conductor_eq_full :
    ∀ (z : ℤ[i]) (w : ℤ[i]), w ∈ idealI → (z * w) ∈ (SubringA : Set ℤ[i]) := by
  intro z w ⟨⟨m, hm⟩, ⟨n, hn⟩⟩
  show Even (z * w).im
  exact ⟨z.re * n + z.im * m, by rw [Zsqrtd.im_mul, hm, hn]; ring⟩

/-! ## Claim (e): I is NOT invertible as an A-ideal

I(A ÷ I) = I · ℤ[i] = 2ℤ[i] = I ⊊ A, so I fails the invertibility condition.
-/

/-- 2ℤ[i] is strictly contained in A = ℤ + 2iℤ (e.g., 1 ∈ A but 1 ∉ 2ℤ[i]). -/
theorem idealI_ssubset_SubringA : idealI ⊂ (SubringA : Set ℤ[i]) := by
  refine ⟨idealI_subset_SubringA, ?_⟩
  intro h
  have h1 : (1 : ℤ[i]) ∈ (SubringA : Set ℤ[i]) := SubringA.one_mem
  have h2 : (1 : ℤ[i]) ∈ idealI := h h1
  simp only [idealI, Set.mem_setOf_eq] at h2
  obtain ⟨⟨r, hr⟩, _⟩ := h2
  -- hr : (1 : ℤ[i]).re = r + r, i.e. 1 = 2r, impossible in ℤ
  simp at hr; omega

/-- I is not invertible as an A-ideal: the product I · (A ÷ I) = I ≠ A. -/
theorem idealI_not_invertible_over_A : idealI ≠ (SubringA : Set ℤ[i]) :=
  idealI_ssubset_SubringA.ne
