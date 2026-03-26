import Mathlib

/-!
# Definition 2.22: Ideal Group

The *ideal group* ℐ_A of a noetherian domain A is the group of invertible
fractional ideals. Note that, despite the name, elements of ℐ_A need not be
ideals (they are fractional ideals, which may not be contained in A).

## Mathlib correspondence

Mathlib represents the group of invertible fractional ideals as the unit group
`(FractionalIdeal (nonZeroDivisors A) K)ˣ`, which is a `Group` (in fact a
`CommGroup` since fractional ideal multiplication is commutative).

See `blobs/Lecture2/02_22_Definition.md` for the source text.
-/

section IdealGroup

variable {A : Type*} [CommRing A] [IsDomain A] [IsNoetherianRing A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

/-! ### The definition

**Definition 2.22.** The ideal group ℐ_A is the group of invertible fractional
ideals. In Mathlib this is the unit group of `FractionalIdeal`. -/

-- ℐ_A = (FractionalIdeal A⁰ K)ˣ — the group of invertible fractional ideals
#check (FractionalIdeal (nonZeroDivisors A) K)ˣ

/-! ### Group structure

The ideal group is an abelian group under fractional ideal multiplication. -/

-- ℐ_A is a commutative group
example : CommGroup (FractionalIdeal (nonZeroDivisors A) K)ˣ := inferInstance

-- The group operation is fractional ideal multiplication
#check @Units.val_mul (FractionalIdeal (nonZeroDivisors A) K) _

-- The identity element is A itself (as a fractional ideal)
#check @Units.val_one (FractionalIdeal (nonZeroDivisors A) K) _

-- The inverse of I ∈ ℐ_A satisfies I * I⁻¹ = 1
#check @Units.mul_inv (FractionalIdeal (nonZeroDivisors A) K) _

/-! ### Elements need not be ideals

The book notes that elements of ℐ_A need not be ideals (i.e., they need not
be contained in A). This is because fractional ideals can contain elements
of K outside A. For example, (1/a)A is a fractional ideal not contained in A
when a is not a unit. -/

-- A fractional ideal is an A-submodule of K, not necessarily contained in A
#check @FractionalIdeal.coeToSubmodule

end IdealGroup
