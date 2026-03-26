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

/-- There exist domains with non-invertible nonzero fractional ideals. -/
theorem exists_noninvertible_fractionalIdeal :
    ∃ (A : Type) (_ : CommRing A) (_ : IsDomain A) (K : Type) (_ : Field K)
      (_ : Algebra A K) (_ : IsFractionRing A K)
      (I : FractionalIdeal (nonZeroDivisors A) K),
      I ≠ 0 ∧ ¬IsUnit I := by
  sorry

end Discussion_02_20a
