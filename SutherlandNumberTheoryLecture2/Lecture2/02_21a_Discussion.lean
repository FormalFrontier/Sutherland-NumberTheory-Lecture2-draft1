import Mathlib

/-!
# Discussion: Section 2.6 — Invertible fractional ideals and the ideal class group

In this section A is a noetherian domain and K is its fraction field.
The set of nonzero fractional ideals forms an abelian monoid under
multiplication (with A = (1) as the identity), and the subset of
invertible fractional ideals forms an abelian group.

## Claims formalized

1. I invertible iff I(A÷I) = A → back-reference to Lemma 2.20
   (`FractionalIdeal.mul_inv_cancel_iff`)
2. Nonzero fractional ideals form abelian monoid →
   `FractionalIdeal.instCommMonoidWithZero` (recall)
3. Invertible fractional ideals form abelian group →
   units of `FractionalIdeal` have group structure (recall)

See `blobs/Lecture2/02_21a_Discussion.md` for the source text.
-/

section Discussion_02_21a

variable {A : Type*} [CommRing A] [IsDomain A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

open FractionalIdeal

/-! ### Claim 1: I invertible iff I(A÷I) = A

This is a back-reference to Lemma 2.20. -/

-- I * I⁻¹ = 1 ↔ ∃ J, I * J = 1
recall FractionalIdeal.mul_inv_cancel_iff

/-! ### Claim 2: Nonzero fractional ideals form an abelian monoid

Ideal multiplication is commutative and associative, with A = (1) as
identity. In Mathlib, `FractionalIdeal` carries a `CommMonoidWithZero`
instance (the zero ideal is absorbing, and nonzero ideals form a
commutative monoid). -/

-- FractionalIdeal carries a CommSemiring (hence CommMonoidWithZero) structure
example : CommSemiring (FractionalIdeal (nonZeroDivisors A) K) := inferInstance

/-! ### Claim 3: Invertible fractional ideals form an abelian group

The units of any commutative monoid form an abelian group. In Lean 4,
`(FractionalIdeal (nonZeroDivisors A) K)ˣ` is the type of invertible
fractional ideals, which inherits a `CommGroup` structure. -/

-- Units of a CommMonoid form a CommGroup
example : CommGroup (FractionalIdeal (nonZeroDivisors A) K)ˣ := inferInstance

end Discussion_02_21a
