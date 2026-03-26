import Mathlib

/-!
# Proposition 2.9: Noetherian DVR Characterization of Dedekind Domains

**Proposition 2.9.** Let A be a noetherian domain. The following are equivalent:

(i) For every nonzero prime ideal 𝔭 ⊂ A, the local ring A_𝔭 is a DVR.

(ii) The ring A is integrally closed and dim A ≤ 1.

## Mathlib Coverage

This is precisely the equivalence between `IsDedekindDomainDvr` and `IsDedekindDomain`
in Mathlib, established by two instances:
- `IsDedekindDomain.isDedekindDomainDvr` : (ii) → (i)
- `IsDedekindDomainDvr.isDedekindDomain` : (i) → (ii)

See `blobs/Lecture2/02_09_Proposition.md` for the source text.
-/

section Proposition_2_9

/-! ## Condition (i): The DVR characterization

Mathlib packages condition (i) as `IsDedekindDomainDvr`: a noetherian domain
whose localizations at all nonzero prime ideals are DVRs. -/

#check @IsDedekindDomainDvr  -- (A : Type*) → [CommRing A] → [IsDomain A] → Prop

/-! The field `is_dvr_at_nonzero_prime` captures condition (i) precisely. -/

#check @IsDedekindDomainDvr.is_dvr_at_nonzero_prime
  -- ∀ P ≠ ⊥, ∀ [P.IsPrime], IsDiscreteValuationRing (Localization.AtPrime P)

/-! ## Condition (ii): Integrally closed + dim ≤ 1

Mathlib packages condition (ii) as the conjunction of three typeclasses inside
`IsDedekindDomain` (= noetherian + integrally closed + dim ≤ 1). -/

#check @IsDedekindDomain  -- recalled from 02_10_Definition

/-! ## The equivalence (i) ↔ (ii)

Mathlib establishes both directions as instances, which is stronger than an `iff`:
any context that assumes `IsDedekindDomain` automatically has `IsDedekindDomainDvr`
and vice versa. -/

/-! ### Direction (ii) → (i): Dedekind domain implies DVR localizations -/

#check @IsDedekindDomain.isDedekindDomainDvr
  -- IsDedekindDomain A → IsDedekindDomainDvr A

/-! This direction uses that localizations of a Dedekind domain at nonzero primes
are integrally closed noetherian local domains of dimension 1, hence DVRs
(by Theorem 1.16 in the book). The key Mathlib lemma: -/

#check @IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain
  -- For a Dedekind domain, the localization at a nonzero prime is a DVR

/-! ### Direction (i) → (ii): DVR localizations imply Dedekind domain -/

#check @IsDedekindDomainDvr.isDedekindDomain
  -- IsDedekindDomainDvr A → IsDedekindDomain A

/-! The proof of (i) → (ii) proceeds in two steps:

**Step 1: dim A ≤ 1.** Since each DVR has dimension 1 and fields have dimension 0,
and dim A = sup {dim A_𝔭}, we get dim A ≤ 1. -/

#check @IsDedekindDomainDvr.ring_dimensionLEOne
  -- IsDedekindDomainDvr A → Ring.DimensionLEOne A

/-! **Step 2: A is integrally closed.** Any x ∈ Frac(A) integral over A is integral
over each A_𝔭. Since DVRs are integrally closed, x ∈ A_𝔭 for all 𝔭, so
x ∈ ⋂_𝔭 A_𝔭 = A. -/

#check @IsDedekindDomainDvr.isIntegrallyClosed
  -- IsDedekindDomainDvr A → IsIntegrallyClosed A

/-! ## Demonstrating the equivalence

The two instances mean that `IsDedekindDomain A` and `IsDedekindDomainDvr A` are
interchangeable: -/

variable {A : Type*} [CommRing A] [IsDomain A]

-- (ii) → (i): A Dedekind domain has DVR localizations at nonzero primes
example [IsDedekindDomain A] : IsDedekindDomainDvr A := inferInstance

-- (i) → (ii): DVR localizations give a Dedekind domain
example [IsDedekindDomainDvr A] : IsDedekindDomain A := inferInstance

-- (i) → dim ≤ 1
example [IsDedekindDomainDvr A] : Ring.DimensionLEOne A := inferInstance

-- (i) → integrally closed
example [IsDedekindDomainDvr A] : IsIntegrallyClosed A := inferInstance

-- (i) → noetherian (inherited from IsDedekindDomainDvr's parent class)
example [IsDedekindDomainDvr A] : IsNoetherianRing A := inferInstance

end Proposition_2_9
