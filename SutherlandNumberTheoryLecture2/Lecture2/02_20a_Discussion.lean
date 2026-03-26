import Mathlib

/-!
# Discussion: invertibility in Dedekind domains

In the next lecture we will prove that in a Dedekind domain every nonzero
fractional ideal is invertible, but this is not true in general.

## Claims formalized

1. In a Dedekind domain, every nonzero fractional ideal is invertible
   → forward reference, proved via `FractionalIdeal.mul_inv_cancel₀`
2. This is not true in general → counterexample (non-invertible ideal
   in a non-Dedekind domain)

See `blobs/Lecture2/02_20a_Discussion.md` for the source text.
-/

section Discussion_02_20a

/-! ### Claim 1: Dedekind domains have all nonzero fractional ideals invertible

This is a forward reference to a result proved in the next lecture.
In Mathlib, this is available as `FractionalIdeal.mul_inv_cancel₀`. -/

variable {A : Type*} [CommRing A] [IsDomain A] [IsDedekindDomain A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

open FractionalIdeal

/-- In a Dedekind domain, every nonzero fractional ideal satisfies I · I⁻¹ = 1. -/
example (I : FractionalIdeal (nonZeroDivisors A) K) (hI : I ≠ 0) :
    I * I⁻¹ = 1 :=
  mul_inv_cancel₀ hI

/-! ### Claim 2: Not true in general

The book states this is not true in general. We exhibit a concrete
counterexample: in k[x,y], the ideal (x,y) is not invertible.
This is witnessed by the fact that k[x,y] is not a Dedekind domain
(it has Krull dimension 2). We state the existence of non-invertible
fractional ideals in non-Dedekind domains as a sorry'd theorem. -/

/-- There exist domains with non-invertible nonzero fractional ideals.

We use Polynomial ℤ, which is not a Dedekind domain (it has Krull dimension 2), so by
`isDedekindDomain_iff_isDedekindDomainInv` there must exist a non-invertible
nonzero fractional ideal. -/
theorem exists_noninvertible_fractionalIdeal :
    ∃ (A : Type) (_ : CommRing A) (_ : IsDomain A) (K : Type) (_ : Field K)
      (_ : Algebra A K) (_ : IsFractionRing A K)
      (I : FractionalIdeal (nonZeroDivisors A) K),
      I ≠ 0 ∧ ¬IsUnit I := by
  refine ⟨Polynomial ℤ, inferInstance, inferInstance, FractionRing (Polynomial ℤ),
    inferInstance, inferInstance, inferInstance, ?_⟩
  -- Polynomial ℤ is not a Dedekind domain: (X) is prime but not maximal
  have hNotDedekind : ¬ IsDedekindDomain (Polynomial ℤ) := by
    intro h
    -- (X) is prime and nonzero
    have hXprime : (Ideal.span {(Polynomial.X : Polynomial ℤ)}).IsPrime := by
      rw [Ideal.span_singleton_prime Polynomial.X_ne_zero]
      exact Polynomial.prime_X
    have hXbot : Ideal.span {(Polynomial.X : Polynomial ℤ)} ≠ ⊥ := by
      rw [Ne, Ideal.span_singleton_eq_bot]
      exact Polynomial.X_ne_zero
    -- DimensionLEOne says (X) is maximal
    have hXmax : (Ideal.span {(Polynomial.X : Polynomial ℤ)}).IsMaximal :=
      hXprime.isMaximal hXbot
    -- But Polynomial ℤ/(X) ≅ ℤ, and ℤ is not a field
    rw [Ideal.Quotient.maximal_ideal_iff_isField_quotient] at hXmax
    have : Ideal.span {Polynomial.X - Polynomial.C (0 : ℤ)} =
           Ideal.span {(Polynomial.X : Polynomial ℤ)} := by simp
    rw [← this] at hXmax
    exact Int.not_isField
      ((Polynomial.quotientSpanXSubCAlgEquiv (R := ℤ) 0).symm.toMulEquiv.isField hXmax)
  -- From ¬ IsDedekindDomain, get ¬ IsDedekindDomainInv via the iff
  have hNotInv : ¬ IsDedekindDomainInv (Polynomial ℤ) :=
    mt isDedekindDomain_iff_isDedekindDomainInv.mpr hNotDedekind
  -- Extract the non-invertible fractional ideal
  unfold IsDedekindDomainInv at hNotInv
  push_neg at hNotInv
  obtain ⟨I, hI_ne, hI_not_inv⟩ := hNotInv
  exact ⟨I, hI_ne, fun h =>
    hI_not_inv ((FractionalIdeal.mul_inv_cancel_iff_isUnit
      (K := FractionRing (Polynomial ℤ))).mpr h)⟩

end Discussion_02_20a
