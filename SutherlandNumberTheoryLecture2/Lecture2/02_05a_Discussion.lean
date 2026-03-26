import Mathlib

/-!
# Discussion: localization of modules (Section 2.3)

The concept of localization generalizes to modules. Given a commutative ring A,
a multiplicative subset S ⊆ A, and an A-module M, the localization S⁻¹M is an
S⁻¹A-module with a universal property analogous to S⁻¹A.

## Claims formalized

1. S⁻¹M exists as a type with elements m/s → `LocalizedModule` (recall)
2. Universal property characterization → `IsLocalizedModule` (recall)
3. S⁻¹M ≅ M ⊗_A S⁻¹A → `LocalizedModule.equivTensorProduct` (recall)
4. ι: M → S⁻¹M injective iff ×s injective for all s ∈ S →
   `LocalizedModule.mkLinearMap_injective_iff` or custom theorem
5. Notation M_𝔭 for localization at a prime → notation convention (no Lean decl needed)

See `blobs/Lecture2/02_05a_Discussion.md` for the source text.
-/

section Discussion_02_05a

variable {A : Type*} [CommRing A] (S : Submonoid A) (M : Type*) [AddCommGroup M] [Module A M]

/-! ### Claim 1: S⁻¹M as a type

The localized module S⁻¹M, with elements represented as m/s
for m ∈ M, s ∈ S. -/

-- The type S⁻¹M
recall LocalizedModule

-- Constructor m/s for elements of S⁻¹M
recall LocalizedModule.mk

-- The canonical map ι: M → S⁻¹M
recall LocalizedModule.mkLinearMap

/-! ### Claim 2: Universal property of S⁻¹M

S⁻¹M is characterized by the universal property: if N is an S⁻¹A-module
and φ: M → N is an A-module homomorphism, then φ factors uniquely through S⁻¹M. -/

-- Typeclass for module localization (captures the universal property)
recall IsLocalizedModule

/-! ### Claim 3: S⁻¹M ≅ M ⊗_A S⁻¹A

The localization of a module can alternatively be constructed as the
base change (tensor product) M ⊗_A S⁻¹A. -/

-- S⁻¹M ≃ₗ[S⁻¹A] (S⁻¹A) ⊗[A] M
recall LocalizedModule.equivTensorProduct

/-! ### Claim 4: ι injective iff multiplication by s injective for all s ∈ S

The canonical map ι: M → S⁻¹M is injective if and only if
for every s ∈ S, the multiplication map (×s): M → M is injective.

The book notes this is a strong condition that does not hold in general,
but holds when A is a subring of a field and M is contained in a K-vector space. -/

/-- The canonical map M → S⁻¹M is injective iff multiplication by every
s ∈ S is injective on M. -/
theorem localizedModule_mkLinearMap_injective_iff :
    Function.Injective (LocalizedModule.mkLinearMap S M) ↔
      ∀ s : S, Function.Injective (HSMul.hSMul (α := A) s.1 : M → M) := by
  sorry

/-! ### Claim 5: Embedding when A is a subring of a field

If A is a subring of a field K and M is an A-submodule of a K-vector space,
then multiplication by any nonzero s ∈ A is injective on M, so ι is injective
and M embeds into S⁻¹M. -/

/-- When A is an integral domain and M is torsion-free, the canonical map
M → S⁻¹M is injective (the book's "A subring of a field" case). -/
theorem localizedModule_mkLinearMap_injective_of_noZeroSMulDivisors
    [IsDomain A] [NoZeroSMulDivisors A M] (hS : ∀ s : S, (s : A) ≠ 0) :
    Function.Injective (LocalizedModule.mkLinearMap S M) := by
  sorry

end Discussion_02_05a
