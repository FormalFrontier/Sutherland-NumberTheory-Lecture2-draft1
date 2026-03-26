import Mathlib

/-!
# Example 2.8: ℤ = ⋂_p ℤ_(p) in ℚ

**Example 2.8.** If A = ℤ then ℤ = ⋂_p ℤ_(p) in ℚ.

This is the concrete instance of Corollary 2.7 applied to A = ℤ with I = ℤ (the unit
ideal). Each ℤ_(p) is the localization of ℤ at the prime (p), viewed as a subring of ℚ.
Their intersection recovers ℤ.

## Mathlib Coverage

Mathlib has `PrimeSpectrum.iInf_localization_eq_bot` which states that for any integral
domain R, the intersection of all localizations R_𝔭 (as subalgebras of Frac(R)) equals
the image of R. We specialize this to R = ℤ, K = ℚ.

See `blobs/Lecture2/02_08_Example.md` for the source text.
-/

section Example_2_8

/-! ## The Mathlib result for general integral domains

The general result is that any integral domain equals the intersection of its
localizations at all prime ideals (or all maximal ideals), viewed inside its
fraction field. -/

-- General version for prime ideals
#check @PrimeSpectrum.iInf_localization_eq_bot
-- General version for maximal ideals
#check @MaximalSpectrum.iInf_localization_eq_bot

/-! ## Specialization to ℤ and ℚ

ℤ = ⋂_p ℤ_(p) inside ℚ. Each ℤ_(p) is the localization of ℤ at the complement
of the prime ideal (p), and the intersection of all these localizations (as
subalgebras of ℚ) is exactly the image of ℤ in ℚ. -/

/-- **Example 2.8.** ℤ equals the intersection of all its localizations ℤ_(p) inside ℚ,
where p ranges over the prime ideals of ℤ. This is the specialization of the general
result `PrimeSpectrum.iInf_localization_eq_bot` to ℤ and ℚ. -/
theorem Int.eq_iInf_localization_atPrime :
    ⨅ v : PrimeSpectrum ℤ,
      Localization.subalgebra.ofField ℚ _
        v.asIdeal.primeCompl_le_nonZeroDivisors = ⊥ :=
  PrimeSpectrum.iInf_localization_eq_bot ℤ ℚ

/-- Maximal ideals version: ℤ = ⋂_p ℤ_(p) where p ranges over maximal ideals only. -/
theorem Int.eq_iInf_localization_atMaximal :
    ⨅ v : MaximalSpectrum ℤ,
      Localization.subalgebra.ofField ℚ _
        v.asIdeal.primeCompl_le_nonZeroDivisors = ⊥ :=
  MaximalSpectrum.iInf_localization_eq_bot ℤ ℚ

end Example_2_8
