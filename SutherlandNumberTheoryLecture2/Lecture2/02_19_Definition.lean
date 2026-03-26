import Mathlib

/-!
# Definition 2.19: Invertible Fractional Ideal

A fractional ideal I is *invertible* if IJ = A for some fractional ideal J.
Inverses are unique when they exist: if IJ = A = IJ' then J = JA = JIJ' = AJ' = J'.
We write I⁻¹ for the inverse when it exists.

## Mathlib correspondence

Mathlib defines `I⁻¹ := 1 / I` for any fractional ideal, but this is only a
true inverse when I is invertible. The key results:
- `FractionalIdeal.mul_inv_cancel_iff`: `I * I⁻¹ = 1 ↔ ∃ J, I * J = 1`
- In a Dedekind domain, every nonzero fractional ideal is invertible
  (via `FractionalIdeal.inv_mul_cancel₀` or `IsUnit` instances).
-/

section InvertibleFractionalIdeal

variable {A : Type*} [CommRing A] [IsDomain A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

open FractionalIdeal

/-! ### The definition

**Definition 2.19.** A fractional ideal I is invertible if IJ = A for some
fractional ideal J. In Mathlib, invertibility is expressed via `IsUnit I`
or equivalently `I * I⁻¹ = 1`. -/

-- I⁻¹ is defined as 1 / I
#check @FractionalIdeal.inv_eq
  -- I⁻¹ = 1 / I

-- I * I⁻¹ = 1 iff I is invertible (i.e. ∃ J, IJ = 1)
#check @FractionalIdeal.mul_inv_cancel_iff
  -- I * I⁻¹ = 1 ↔ ∃ J, I * J = 1

-- Invertibility ↔ IsUnit
#check @FractionalIdeal.mul_inv_cancel_iff_isUnit
  -- I * I⁻¹ = 1 ↔ IsUnit I

/-! ### Uniqueness of inverses

The book proves: if IJ = A = IJ' then J = JA = JIJ' = AJ' = J'.
In Mathlib, this is captured by `right_inverse_eq`. -/

-- If I * J = 1 then J = I⁻¹
#check @FractionalIdeal.right_inverse_eq
  -- I * J = 1 → J = I⁻¹

/-! ### Membership in the inverse -/

-- x ∈ I⁻¹ ↔ ∀ y ∈ I, xy ∈ A (i.e., I⁻¹ = {x ∈ K : xI ⊆ A})
#check @FractionalIdeal.mem_inv_iff
  -- I ≠ 0 → (x ∈ I⁻¹ ↔ ∀ y ∈ I, x * y ∈ 1)

/-! ### Monotonicity of inversion -/

-- I ≤ J → J⁻¹ ≤ I⁻¹ (for nonzero ideals)
#check @FractionalIdeal.inv_anti_mono
  -- I ≠ 0 → J ≠ 0 → I ≤ J → J⁻¹ ≤ I⁻¹

/-! ### In Dedekind domains, all nonzero fractional ideals are invertible

This is the key result connecting Definition 2.19 to the theory of
Dedekind domains developed later in the lecture. -/

section Dedekind

variable [IsDedekindDomain A]

-- In a Dedekind domain, every nonzero fractional ideal is a unit
example (I : FractionalIdeal (nonZeroDivisors A) K) (hI : I ≠ 0) : IsUnit I :=
  (mul_inv_cancel_iff_isUnit K).mp (mul_inv_cancel₀ hI)

end Dedekind

end InvertibleFractionalIdeal
