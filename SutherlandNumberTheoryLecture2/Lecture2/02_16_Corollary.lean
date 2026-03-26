import Mathlib

/-!
# Corollary 2.16: Fractional Ideals as Scaled Integral Ideals

**Corollary 2.16.** Every fractional ideal of A can be written in the form
(1/a)I, for some nonzero a ∈ A and ideal I.

## Mathlib correspondence

Mathlib provides `FractionalIdeal.den` and `FractionalIdeal.num` which decompose
any fractional ideal J into: den(J) ∈ A⁰ and num(J) : Ideal A, such that
`spanSingleton A⁰ (algebraMap A K den(J)) * J = num(J)`.

Equivalently, J = (1/den(J)) · num(J), which is exactly the book's statement.
-/

section Corollary_2_16

variable {A : Type*} [CommRing A] [IsDomain A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

open FractionalIdeal

/-! ### The denominator and numerator

Every fractional ideal J has a denominator `J.den ∈ A⁰` and a numerator
`J.num : Ideal A` such that `den(J) • J = num(J)`. -/

-- The denominator: a nonzero element a such that aJ ⊆ A
#check @FractionalIdeal.den

-- The numerator: the ideal aJ
#check @FractionalIdeal.num

-- The key relation: den(J) • J = num(J) as submodules
#check @FractionalIdeal.den_mul_self_eq_num

-- As fractional ideals: (den J) · J = ↑(num J)
#check @FractionalIdeal.den_mul_self_eq_num'

/-! ### Corollary 2.16: J = (1/a) · I

Rearranging den(J) · J = num(J), we get J = (1/den(J)) · num(J).
This is the book's statement: every fractional ideal has the form (1/a)I. -/

/-- **Corollary 2.16**: Every fractional ideal J can be written as
`spanSingleton A⁰ (algebraMap A K a)⁻¹ * ↑I` for some nonzero `a : A` and
ideal `I : Ideal A`. Here `a = J.den` and `I = J.num`. -/
theorem fractionalIdeal_eq_inv_den_mul_num
    (J : FractionalIdeal (nonZeroDivisors A) K) :
    ∃ (a : nonZeroDivisors A) (I : Ideal A),
      J = spanSingleton (nonZeroDivisors A) ((algebraMap A K a)⁻¹) *
          (I : FractionalIdeal (nonZeroDivisors A) K) := by
  refine ⟨J.den, J.num, ?_⟩
  have h := den_mul_self_eq_num' (nonZeroDivisors A) K J
  have hd : algebraMap A K J.den ≠ 0 :=
    IsFractionRing.to_map_ne_zero_of_mem_nonZeroDivisors J.den.prop
  rw [← h, ← mul_assoc, spanSingleton_mul_spanSingleton, inv_mul_cancel₀ hd,
    spanSingleton_one, one_mul]

end Corollary_2_16
