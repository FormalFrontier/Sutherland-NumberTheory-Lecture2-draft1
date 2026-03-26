import Mathlib

/-!
# Definition 2.23: Ideal Class Group

Let A be a noetherian domain. The quotient cl(A) := ℐ_A / 𝒫_A is the
*ideal class group* of A; it is also called the *Picard group* of A and
denoted Pic(A).

Here ℐ_A is the ideal group (Definition 2.22) and 𝒫_A is the subgroup of
principal fractional ideals.

## Mathlib correspondence

Mathlib defines `ClassGroup R` as:
  `(FractionalIdeal R⁰ (FractionRing R))ˣ ⧸ (toPrincipalIdeal R (FractionRing R)).range`

This is exactly ℐ_A / 𝒫_A. The map `toPrincipalIdeal R K` sends x ∈ Kˣ to the
unit fractional ideal (x), and its range is the subgroup of principal ideals 𝒫_A.

See `blobs/Lecture2/02_23_Definition.md` for the source text.
-/

section IdealClassGroup

variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A]

open scoped nonZeroDivisors

/-! ### The definition

**Definition 2.23.** The ideal class group cl(A) = ℐ_A / 𝒫_A. In Mathlib
this is `ClassGroup`. -/

-- cl(A) = ClassGroup A
#check ClassGroup (R := A)

/-! ### The subgroup of principal ideals 𝒫_A

The map `toPrincipalIdeal` sends x ∈ Kˣ to the invertible fractional ideal (x).
Its range is the subgroup 𝒫_A of principal fractional ideals. -/

-- toPrincipalIdeal : Kˣ →* (FractionalIdeal A⁰ K)ˣ
#check toPrincipalIdeal (R := A) (K := FractionRing A)

-- The range of toPrincipalIdeal is a normal subgroup (which it must be, since
-- the group is abelian)
#check PrincipalIdeals.normal (R := A) (K := FractionRing A)

/-! ### The quotient structure

ClassGroup is a commutative group — the quotient of an abelian group by a subgroup. -/

-- cl(A) is a commutative group
noncomputable example : CommGroup (ClassGroup A) := inferInstance

/-! ### The equivalence with the explicit quotient

For a general fraction ring K, the class group is canonically isomorphic to
(FractionalIdeal A⁰ K)ˣ ⧸ (toPrincipalIdeal A K).range. -/

variable (K : Type*) [Field K] [Algebra A K] [IsFractionRing A K]

-- ClassGroup A ≃* (FractionalIdeal A⁰ K)ˣ ⧸ (toPrincipalIdeal A K).range
#check ClassGroup.equiv (R := A) (K := K)

/-! ### The quotient map

The canonical surjection from ℐ_A onto cl(A). -/

-- mk : (FractionalIdeal A⁰ K)ˣ →* ClassGroup A
#check ClassGroup.mk (R := A) (K := K)

/-! ### Two invertible ideals represent the same class iff they differ by a principal ideal -/

-- I and J have the same class iff ∃ x ∈ Kˣ, I * toPrincipalIdeal x = J
#check @ClassGroup.mk_eq_mk A _ _

end IdealClassGroup
