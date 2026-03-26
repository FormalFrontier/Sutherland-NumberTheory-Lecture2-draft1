import Mathlib

/-!
# Discussion: Principal fractional ideals form a subgroup

See `blobs/Lecture2/02_22a_Discussion.md` for the source text.

This discussion paragraph (between Definition 2.22 and Definition 2.23) establishes
three facts about principal fractional ideals:

1. Every nonzero principal fractional ideal (x) is invertible, since (x)⁻¹ = (x⁻¹)
2. A product of principal fractional ideals is principal: (x)(y) = (xy)
3. Therefore 𝒫_A (nonzero principal fractional ideals) is a subgroup of ℐ_A

In Mathlib, these are captured by the monoid homomorphism
`toPrincipalIdeal : Kˣ →* (FractionalIdeal R⁰ K)ˣ`, whose image is
exactly the subgroup 𝒫_A.
-/

section PrincipalFractionalIdeals

variable {A : Type*} [CommRing A] [IsDomain A] [IsNoetherianRing A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

open FractionalIdeal

/-! ### Claim 1: Every nonzero principal fractional ideal (x) is invertible

The book says: "(x)⁻¹ = (x⁻¹)". In Mathlib, `toPrincipalIdeal` maps x ∈ Kˣ
to a *unit* fractional ideal — so by construction, the image is invertible.
The inverse of `toPrincipalIdeal x` is `toPrincipalIdeal x⁻¹`. -/

-- toPrincipalIdeal maps Kˣ into the invertible fractional ideals
#check toPrincipalIdeal (R := A) (K := K)

-- It is a group homomorphism, so toPrincipalIdeal(x⁻¹) = (toPrincipalIdeal x)⁻¹
#check MonoidHom.map_inv (toPrincipalIdeal (R := A) (K := K))

/-! ### Claim 2: Product of principal fractional ideals is principal

The book says: "(x)(y) = (xy)". This is exactly the statement that
`toPrincipalIdeal` is a (monoid) homomorphism. -/

-- toPrincipalIdeal(xy) = toPrincipalIdeal(x) * toPrincipalIdeal(y)
#check MonoidHom.map_mul (toPrincipalIdeal (R := A) (K := K))

/-! ### Claim 3: 𝒫_A is a subgroup of ℐ_A

The book concludes that the set of nonzero principal fractional ideals 𝒫_A
is a subgroup of ℐ_A. In Mathlib, this is the range (image) of
`toPrincipalIdeal`, which is a subgroup of `(FractionalIdeal A⁰ K)ˣ`. -/

-- The range of toPrincipalIdeal is the subgroup 𝒫_A
#check (toPrincipalIdeal (R := A) (K := K)).range

-- 𝒫_A is a normal subgroup (ℐ_A is abelian, so every subgroup is normal)
#check PrincipalIdeals.normal (R := A) (K := K)

-- The unit ideal (1) is principal: it is toPrincipalIdeal(1)
#check MonoidHom.map_one (toPrincipalIdeal (R := A) (K := K))

end PrincipalFractionalIdeals
