import Mathlib

/-!
# Warning 2.3: Elements of A_𝔭

**Warning 2.3.** The notation in (3) makes it tempting to assume that if a/b is an
element of Frac A, then a/b ∈ A_𝔭 if and only if b ∉ 𝔭. This is not necessarily true!
As an element of Frac A, the notation "a/b" represents an equivalence class; thus even
if b ∈ 𝔭, if a/b = a'/b' with b' ∉ 𝔭, then a/b ∈ A_𝔭.

As a trivial example, take A = ℤ, 𝔭 = (3), a/b = 9/3 and a'/b' = 3/1.

## Formalization approach

The key claim is the concrete counterexample in ℤ: 9/3 = 3/1 in ℚ,
and 3 ∈ (3), but 9/3 ∈ ℤ_(3) because it equals 3/1 where 1 ∉ (3).

See `blobs/Lecture2/02_03_Remark.md` for the source text.
-/

section Warning_2_3

/-! ### The prime ideal (3) in ℤ -/

/-- The prime ideal 𝔭 = (3) in ℤ. -/
noncomputable abbrev primeIdeal3 : Ideal ℤ := Ideal.span {3}

instance primeIdeal3_isPrime : primeIdeal3.IsPrime := by
  rw [Ideal.span_singleton_prime (by norm_num : (3 : ℤ) ≠ 0)]
  exact Int.prime_iff_natAbs_prime.mpr (by norm_num)

/-! ### The counterexample: 9/3 = 3/1 in ℚ

The point is that 3 ∈ (3), so naively 9/3 "shouldn't" be in ℤ_(3).
But 9/3 = 3/1, and 1 ∉ (3), so it IS in ℤ_(3). -/

/-- 3 is in the ideal (3). -/
theorem three_mem_primeIdeal3 : (3 : ℤ) ∈ primeIdeal3 :=
  Ideal.mem_span_singleton_self 3

/-- 9/3 = 3/1 as rational numbers. This is the equivalence that
    shows the "denominator" 3 ∈ (3) is misleading. -/
theorem nine_div_three_eq_three : (9 : ℚ) / 3 = 3 := by norm_num

/-- The real content of Warning 2.3: the integer 3 maps to an element of ℤ_(3),
    and 9 = 3 * 3, so the "fraction" 9/3 is really just 3/1 in ℤ_(3).
    This shows that membership in A_𝔭 does not depend on a particular representation
    a/b — even if b ∈ 𝔭, the element may still be in A_𝔭 via a different representation. -/
theorem warning_2_3_nine_eq_three_times_three :
    algebraMap ℤ (Localization.AtPrime primeIdeal3) 9 =
      algebraMap ℤ (Localization.AtPrime primeIdeal3) 3 *
        algebraMap ℤ (Localization.AtPrime primeIdeal3) 3 := by
  have : (9 : ℤ) = 3 * 3 := by norm_num
  rw [this, map_mul]

/-- Warning 2.3 punchline: there exist a, b ∈ ℤ with b ∈ (3) and a/b = 3 in ℚ,
    yet a/b ∈ ℤ_(3) (because a/b = 3/1 and 1 ∉ (3)).

    Concretely: a = 9, b = 3, so b ∈ (3), and 9/3 = 3 in ℚ.
    The element 3 is in the image of ℤ → ℤ_(3), hence in ℤ_(3). -/
theorem warning_2_3_counterexample :
    ∃ (a b : ℤ), b ∈ primeIdeal3 ∧ (a : ℚ) / b = 3 ∧
      (algebraMap ℤ (Localization.AtPrime primeIdeal3) a =
        algebraMap ℤ (Localization.AtPrime primeIdeal3) b *
          algebraMap ℤ (Localization.AtPrime primeIdeal3) 3) := by
  refine ⟨9, 3, three_mem_primeIdeal3, by norm_num, ?_⟩
  have : (9 : ℤ) = 3 * 3 := by norm_num
  rw [this, map_mul]

end Warning_2_3
