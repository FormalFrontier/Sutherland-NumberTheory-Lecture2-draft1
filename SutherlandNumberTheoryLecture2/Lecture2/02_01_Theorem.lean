import Mathlib

/-!
# Theorem 2.1: Prime Ideal Correspondence for Localization

**Theorem 2.1.** Let S be a multiplicative subset of an integral domain A.
There is a one-to-one correspondence between the prime ideals of S⁻¹A and the
prime ideals of A that do not intersect S, given by the inverse maps
q ↦ q ∩ A and p ↦ pS⁻¹A.

See `blobs/Lecture2/02_01_Theorem.md` for the source text.

## Mathlib Coverage

The theorem is fully covered by `IsLocalization.orderIsoOfPrime`, which gives an
order isomorphism (stronger than the bijection stated in the book):

  `{ p : Ideal S // p.IsPrime } ≃o { p : Ideal R // p.IsPrime ∧ Disjoint (M : Set R) ↑p }`

The forward map is `Ideal.comap (algebraMap R S)` (contraction, i.e., q ↦ q ∩ A)
and the inverse is `Ideal.map (algebraMap R S)` (extension, i.e., p ↦ pS⁻¹A).
-/

-- **Theorem 2.1** (Prime ideal correspondence).
-- Order isomorphism between primes of S⁻¹A and primes of A disjoint from S.
-- The book states this as a bijection; Mathlib's version is stronger (order-preserving).
recall IsLocalization.orderIsoOfPrime

-- The inverse map of the correspondence: extension p ↦ pS⁻¹A.
-- Given a prime ideal of R disjoint from M, its image under `Ideal.map` is prime in S.
recall IsLocalization.isPrime_of_isPrime_disjoint

-- Contraction then extension is the identity on ideals of S⁻¹A:
-- map (comap q) = q for any ideal q of S.
recall IsLocalization.map_comap

-- Extension then contraction is the identity on primes of A disjoint from S:
-- comap (map p) = p for any prime p disjoint from M.
recall IsLocalization.comap_map_of_isPrime_disjoint
