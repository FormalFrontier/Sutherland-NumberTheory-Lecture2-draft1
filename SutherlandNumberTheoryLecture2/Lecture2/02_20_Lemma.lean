import Mathlib

/-!
# Lemma 2.20

A fractional ideal I of A is invertible if and only if I(A ÷ I) = A
(in which case A ÷ I is its inverse).

## Key observations

- I(A ÷ I) ⊆ A always holds, since for y ∈ I and x ∈ A ÷ I we have
  xy ∈ xI ⊆ A by definition of A ÷ I.
- The lemma says this inclusion is equality precisely when I is invertible.

## Proof sketch

(⇒) If I is invertible with IJ = A, then J ⊆ A ÷ I (since jI ⊆ A for all j ∈ J),
so A = IJ ⊆ I(A ÷ I) ⊆ A.

(⇐) Immediate: if I(A ÷ I) = A then I is invertible with J = A ÷ I.

## Mathlib correspondence

In Mathlib, I⁻¹ is defined as 1 / I (= A ÷ I), and the equivalence is:
- `FractionalIdeal.mul_inv_cancel_iff`: I * I⁻¹ = 1 ↔ ∃ J, I * J = 1
- `FractionalIdeal.inv_eq`: I⁻¹ = 1 / I

## Claims formalized

1. I(A ÷ I) ⊆ A always holds → `mul_inv_le_one`
2. I invertible ↔ I · I⁻¹ = 1 → `FractionalIdeal.mul_inv_cancel_iff` (recall)
3. I⁻¹ = 1 / I → `FractionalIdeal.inv_eq` (recall)

See `blobs/Lecture2/02_20_Lemma.md` for the source text.
-/

section Lemma_02_20

variable {A : Type*} [CommRing A] [IsDomain A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

open FractionalIdeal

/-! ### Claim 1: I · I⁻¹ ⊆ 1 always holds

Before the proof, the book notes that I(A ÷ I) ⊆ A always holds.
In Mathlib, I⁻¹ = 1/I = A ÷ I, so this is I * I⁻¹ ≤ 1. -/

/-- For any fractional ideal I, we have I * I⁻¹ ≤ 1 (i.e. I(A ÷ I) ⊆ A).
This is because for x ∈ A ÷ I and y ∈ I, xy ∈ A by definition. -/
theorem fractionalIdeal_mul_inv_le_one (I : FractionalIdeal (nonZeroDivisors A) K) :
    I * I⁻¹ ≤ 1 := by
  rw [FractionalIdeal.inv_eq]
  exact FractionalIdeal.mul_one_div_le_one

/-! ### Claim 2: I invertible ↔ I · I⁻¹ = 1

This is the heart of Lemma 2.20: the inclusion I(A ÷ I) ⊆ A is an equality
precisely when I is invertible. -/

-- I * I⁻¹ = 1 ↔ ∃ J, I * J = 1
recall FractionalIdeal.mul_inv_cancel_iff

/-! ### Claim 3: I⁻¹ = 1 / I

The inverse is the ideal quotient A ÷ I. -/

-- I⁻¹ = 1 / I
recall FractionalIdeal.inv_eq

end Lemma_02_20
