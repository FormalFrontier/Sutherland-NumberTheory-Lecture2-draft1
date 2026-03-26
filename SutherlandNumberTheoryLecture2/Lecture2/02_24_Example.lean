import Mathlib

/-!
# Example 2.24: DVR fractional ideals and trivial class group

See `blobs/Lecture2/02_24_Example.md` for the source text.

If A is a DVR with uniformizer π, then:
1. Its nonzero fractional ideals are (πⁿ) for n ∈ ℤ
2. (πᵐ)(πⁿ) = (π^(m+n)), so ℐ_A ≅ ℤ
3. 𝒫_A = ℐ_A and cl(A) is trivial

## Mathlib correspondence

A DVR is a local PID (`IsDiscreteValuationRing` extends
`IsPrincipalIdealRing`). Mathlib proves `card_classGroup_eq_one`
for any PID.
-/

section DVRExample

variable {A : Type*} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]

/-! ### Background: DVR structure

A DVR is a local PID that is not a field. -/

-- DVR is a PID
example : IsPrincipalIdealRing A := inferInstance

-- DVR is a local ring
example : IsLocalRing A := inferInstance

-- DVR is not a field
#check IsDiscreteValuationRing.not_a_field' (R := A)

-- DVR has a uniformizer (generator of the maximal ideal)
#check IsDiscreteValuationRing.exists_irreducible (R := A)

/-! ### Claim 1: Nonzero fractional ideals of a DVR are (πⁿ) for n ∈ ℤ

In a PID, every nonzero ideal is principal. Since a DVR has a unique
(up to associates) irreducible π, every nonzero ideal is (πⁿ) for
n ≥ 0. For fractional ideals, this extends to all n ∈ ℤ. -/

-- In a PID, every nonzero ideal is principal
#check IsPrincipalIdealRing.principal (R := A)

-- Every nonzero element of a DVR is a unit times a power of π
#check IsDiscreteValuationRing.eq_unit_mul_pow_irreducible (R := A)

-- Every ideal is a power of the maximal ideal
#check IsDiscreteValuationRing.ideal_eq_span_pow_irreducible (R := A)

/-! ### Claim 2: (πᵐ)(πⁿ) = (π^(m+n))

The multiplicativity of `spanSingleton`:
`spanSingleton(x) * spanSingleton(y) = spanSingleton(x * y)`. -/

-- spanSingleton is multiplicative
#check FractionalIdeal.spanSingleton_mul_spanSingleton

/-! ### Claim 3: 𝒫_A = ℐ_A and cl(A) is trivial

Since a DVR is a PID, every fractional ideal is principal, so
𝒫_A = ℐ_A. The quotient cl(A) = ℐ_A / 𝒫_A is therefore trivial. -/

-- The class group of a PID has cardinality 1
#check card_classGroup_eq_one (R := A)

end DVRExample
