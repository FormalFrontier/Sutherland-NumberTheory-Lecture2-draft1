import Mathlib

/-!
# Discussion: localization at a prime ideal

An important special case of localization occurs when 𝔭 is a prime ideal in an
integral domain A, and S = A \ 𝔭. We denote S⁻¹A by A_𝔭 and call it the
*localization of A at 𝔭*.

## Claims formalized

1. A_𝔭 = S⁻¹A where S = A \ 𝔭 → `Localization.AtPrime` (recall)
2. Prime ideals of A_𝔭 biject with primes of A contained in 𝔭 →
   `IsLocalization.AtPrime.orderIsoOfPrime` (recall)
3. 𝔭A_𝔭 is the unique maximal ideal of A_𝔭 → `IsLocalRing.maximalIdeal` +
   `IsLocalization.AtPrime.map_eq_maximalIdeal` (recall)
4. A_𝔭 is a local ring → instance (example)

See `blobs/Lecture2/02_02a_Discussion.md` for the source text.
-/

section Discussion_02_02a

variable {A : Type*} [CommRing A] [IsDomain A]
  (𝔭 : Ideal A) [𝔭.IsPrime]

/-! ### Claim 1: A_𝔭 = S⁻¹A for S = A \ 𝔭

The localization of A at 𝔭 is S⁻¹A where S = 𝔭.primeCompl. Mathlib defines
this as `Localization.AtPrime`. -/

-- The type A_𝔭 = S⁻¹A for S = A \ 𝔭
recall Localization.AtPrime

-- The typeclass characterizing when S is a localization at a prime
recall IsLocalization.AtPrime

/-! ### Claim 2: Prime ideals of A_𝔭 biject with primes of A contained in 𝔭

There is an order isomorphism between prime ideals of the localization S⁻¹A
and prime ideals of A that are disjoint from S (equivalently, contained in 𝔭). -/

-- General prime ideal correspondence for localizations
recall IsLocalization.orderIsoOfPrime

-- Specialized version for localization at a prime:
-- primes of A_𝔭 ↔ primes of A contained in 𝔭
recall IsLocalization.AtPrime.orderIsoOfPrime

/-! ### Claim 3: 𝔭A_𝔭 is the unique maximal ideal of A_𝔭

Since A_𝔭 is a local ring (Claim 4), it has a unique maximal ideal.
That ideal equals the extension of 𝔭 to A_𝔭. -/

-- The unique maximal ideal of a local ring
recall IsLocalRing.maximalIdeal

-- The maximal ideal of A_𝔭 equals the map of 𝔭
recall IsLocalization.AtPrime.map_eq_maximalIdeal

/-! ### Claim 4: A_𝔭 is a local ring

The localization at a prime ideal is always a local ring. -/

-- A_𝔭 is a local ring (standard Mathlib instance)
example : IsLocalRing (Localization.AtPrime 𝔭) := inferInstance

end Discussion_02_02a
