import Mathlib

/-!
# Remark 2.12: PID, UFD, and Dedekind Domain Relationships

**Remark 2.12.** Every PID is both a UFD and a Dedekind domain. Not every UFD is a
Dedekind domain (consider k[x, y], for any field k), and not every Dedekind domain
is a UFD (consider ℤ[√-13], in which (1 + √-13)(1 - √-13) = 2 · 7 = 14). However,
every ring that is both a UFD and a Dedekind domain is a PID.

## Mathlib Coverage

- PID → UFD: instance via `IsPrincipalIdealRing` → `UniqueFactorizationMonoid`
- PID → Dedekind: `IsPrincipalIdealRing.isDedekindDomain` (Corollary 2.11)
- Dedekind + UFD → PID: `IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid`
- Counterexamples: k[x,y] not Dedekind and ℤ[√-13] not UFD require construction.

See `blobs/Lecture2/02_12_Remark.md` for the source text.
-/

section Remark_2_12

/-! ## Claim 1: Every PID is a UFD

This is a standard result in commutative algebra. Mathlib proves it via
the fact that a PID is a noetherian ring satisfying the ascending chain condition
on principal ideals, plus every irreducible is prime. -/

variable {R : Type*} [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]

-- A PID is a UFD (via the instance chain: PID → noetherian + irreducible_iff_prime → UFD)
example : UniqueFactorizationMonoid R := inferInstance

/-! ## Claim 2: Every PID is a Dedekind domain

This is Corollary 2.11, recalled here. -/

example : IsDedekindDomain R := inferInstance

/-! ## Claim 3: Not every UFD is a Dedekind domain

The book's counterexample is k[x, y] for any field k. This is a UFD
(since k[x] is a UFD and R[y] is a UFD when R is), but it has Krull
dimension 2, so it cannot be a Dedekind domain. -/

variable (k : Type*) [Field k]

-- k[x,y] ≅ (k[x])[y] is a UFD: polynomial ring over a UFD is a UFD
example : UniqueFactorizationMonoid (Polynomial (Polynomial k)) := inferInstance

-- k[x,y] is NOT a Dedekind domain because dim k[x,y] = 2 > 1
-- This requires showing the chain (0) ⊊ (x) ⊊ (x,y) of primes, so dim ≥ 2
-- sorry'd as a non-trivial construction
theorem not_isDedekindDomain_polynomial_polynomial :
    ¬ IsDedekindDomain (Polynomial (Polynomial k)) := by
  sorry

/-! ## Claim 4: Not every Dedekind domain is a UFD

The book's counterexample is ℤ[√-13]. This is a Dedekind domain
(it is the ring of integers of ℚ(√-13), a number field) but not a UFD
(since 14 = 2 · 7 = (1 + √-13)(1 - √-13) gives two distinct factorizations). -/

-- ℤ[√d] for d : ℤ is available in Mathlib as `Zsqrtd d`
#check Zsqrtd

-- ℤ[√-13] is not a UFD: 14 has two essentially different factorizations
-- This requires showing 2, 7, 1+√-13, 1-√-13 are all irreducible in ℤ[√-13]
-- sorry'd as a non-trivial construction
theorem not_uniqueFactorizationMonoid_Zsqrtd_neg13 :
    ¬ UniqueFactorizationMonoid (Zsqrtd (-13)) := by
  sorry

/-! ## Claim 5: Dedekind + UFD → PID

This is the converse direction, completing the picture:
  PID = Dedekind ∩ UFD

Mathlib has this as a theorem (not an instance, to avoid timeouts). -/

#check @IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid
  -- Dedekind domain + UFD → PID

-- Demonstrate the theorem:
example (S : Type*) [CommRing S] [IsDedekindDomain S] [UniqueFactorizationMonoid S] :
    IsPrincipalIdealRing S :=
  IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid S

/-! ## Summary of class relationships

The remark establishes:
- PID ⊆ UFD (strict: ℤ[√-13] is Dedekind, not UFD, so Dedekind ⊄ UFD ⊄ PID would need more)
- PID ⊆ Dedekind (strict: k[x,y] is UFD, not Dedekind)
- PID = UFD ∩ Dedekind
- UFD and Dedekind are incomparable classes -/

end Remark_2_12
