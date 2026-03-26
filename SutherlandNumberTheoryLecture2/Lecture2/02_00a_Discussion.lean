import Mathlib

/-!
# Discussion: §2.1 Localization of Rings

The book introduces localization S⁻¹A for a commutative ring A and multiplicative
subset S ⊆ A. Key points:

1. **Universal property**: If φ : A → B maps S into B×, there is a unique
   ring homomorphism S⁻¹A → B factoring φ through ι.
2. **Construction**: S⁻¹A is the quotient of A × S by the equivalence
   (a, s) ~ (b, t) ⟺ ∃ u ∈ S, u(ta − sb) = 0.
3. **ι(S) ⊆ (S⁻¹A)×**: The localization map sends S to units.
4. **Uniqueness**: The factoring map is unique.
5. **Integral domain simplification**: When A is a domain, (a,s) ~ (b,t) iff at − bs = 0.
6. **Embedding in fraction field**: S⁻¹A embeds in Frac(A).
7. **Containment**: S ⊆ T implies S⁻¹A ⊆ T⁻¹A (as subalgebras of Frac(A)).
8. **Injectivity of ι**: When A is a domain, ι is injective.
9. **Chain**: A ⊆ S⁻¹A ⊆ Frac(A).

All results are in Mathlib's `IsLocalization` and `IsFractionRing` API.

See `blobs/Lecture2/02_00a_Discussion.md` for the source text.
-/

section Localization_2_1

/-! ## Claim 1: Universal property of localization

If g : R →+* P maps M to units, there is a ring homomorphism S →+* P
extending g through the localization map. -/

-- Universal property: lift a map that sends M to units
recall IsLocalization.lift

/-! ## Claim 2: Equivalence relation construction

Elements of the localization are represented as fractions a/s, with
(a, s) ~ (b, t) ⟺ ∃ c ∈ M, c * (t * a) = c * (s * b). -/

-- The `mk'` constructor produces the equivalence class a/s
recall IsLocalization.mk'

-- The equivalence relation on mk' elements
recall IsLocalization.eq

/-! ## Claim 3: ι(S) ⊆ (S⁻¹A)×

The localization map sends every element of M to a unit in S. -/

recall IsLocalization.map_units

/-! ## Claim 4: Uniqueness of the factoring map

Any ring homomorphism S →+* P that agrees with g on the image of R
must equal the lift. -/

recall IsLocalization.lift_unique

/-! ## Claim 5: Simplified equivalence for integral domains

When R is a domain, the equivalence relation simplifies: (a,s) ~ (b,t)
iff at − bs = 0 (the existential witness u can always be taken as 1).

In Mathlib, `IsLocalization.mk'_eq_iff_eq` combined with domain
cancellation gives this directly. -/

-- mk'_eq_iff_eq: mk' S a s = mk' S b t ↔ algebraMap R S t * algebraMap R S a = ...
recall IsLocalization.mk'_eq_iff_eq

/-! ## Claim 6: S⁻¹A embeds in Frac(A)

The fraction field Frac(A) is the localization at the nonzero divisors.
For a domain, S⁻¹A naturally embeds in Frac(A). -/

-- The fraction field as a localization at nonZeroDivisors
recall IsFractionRing

-- The concrete fraction field type
recall FractionRing

/-! ## Claim 7: S ⊆ T implies S⁻¹A ⊆ T⁻¹A

When M ≤ N as submonoids, S (a localization at M) is also a localization
at N, provided every element of N maps to a unit. -/

recall IsLocalization.of_le

/-! ## Claim 8: ι is injective when A is a domain

When M consists of non-zero-divisors (in particular when A is a domain
and 0 ∉ S), the localization map is injective. -/

recall IsLocalization.injective

/-! ## Claim 9: A ⊆ S⁻¹A ⊆ Frac(A)

For a domain, the chain of embeddings A ↪ S⁻¹A ↪ Frac(A).
The first embedding is ι (algebraMap), injective by Claim 8.
The second is the lift of the fraction field map. -/

-- Injectivity of algebraMap : R → K for fraction rings
recall IsFractionRing.injective

end Localization_2_1
