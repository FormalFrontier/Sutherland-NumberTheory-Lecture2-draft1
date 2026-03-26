import Mathlib

/-!
# Remark 2.2: Noetherian and PID localizations

**Remark 2.2.** An immediate consequence of (2) is that if a₁, …, aₙ ∈ A generate 𝔞
as an A-ideal, then they also generate 𝔞ᵉ = 𝔞B as a B-ideal. As noted above, when
B = S⁻¹A we have 𝔟 = 𝔟^{ce}, so every B-ideal is of the form 𝔞ᵉ (take 𝔞 = 𝔟^c).
It follows that if A is noetherian then so are all its localizations, and if A is a PID
then so are all of its localizations.

## Proof strategy (from the book)

Four claims:
1. Generators of 𝔞 as A-ideal also generate 𝔞ᵉ as B-ideal → `Ideal.map_span`
2. Every B-ideal is of the form 𝔞ᵉ → `IsLocalization.map_comap`
3. A noetherian ⟹ S⁻¹A noetherian → `IsLocalization.isNoetherianRing`
4. A PID ⟹ S⁻¹A PID → custom theorem using (1) + (2)

See `blobs/Lecture2/02_02_Remark.md` for the source text.
-/

section Remark_2_2

/-! ### Claim 1: Generators of 𝔞 generate 𝔞ᵉ

If {a₁, …, aₙ} generate 𝔞 as an A-ideal, then their images under algebraMap
generate 𝔞ᵉ = Ideal.map (algebraMap R S) 𝔞 as an S-ideal.

This follows from `Ideal.map_span`: the extension of Ideal.span s is
Ideal.span (f '' s). -/

-- Extension of span equals span of image
recall Ideal.map_span

/-! ### Claim 2: Every B-ideal is of the form 𝔞ᵉ

When B = S⁻¹A, we have 𝔟 = 𝔟^{ce} for every B-ideal 𝔟. So every B-ideal
is an extension: take 𝔞 = 𝔟^c = comap (algebraMap R S) 𝔟. -/

-- b = b^{ce}: map (comap J) = J for any ideal J of the localization
recall IsLocalization.map_comap

/-! ### Claim 3: A noetherian ⟹ all localizations noetherian

This is a standard Mathlib result. -/

-- Localization of a noetherian ring is noetherian
recall IsLocalization.isNoetherianRing

-- The instance for the concrete `Localization` type:
example (R : Type*) [CommRing R] [IsNoetherianRing R] (S : Submonoid R) :
    IsNoetherianRing (Localization S) := inferInstance

/-! ### Claim 4: A PID ⟹ all localizations PID

Every ideal of S⁻¹A is of the form 𝔞ᵉ (Claim 2). If A is a PID, then 𝔞 = (a)
for some a, so 𝔞ᵉ = (a/1). Hence S⁻¹A is a PID.

For localization at a prime, Mathlib gives this via:
PID → Dedekind domain → localization at prime is PID. -/

-- PID → Dedekind domain (standard Mathlib instance)
recall IsPrincipalIdealRing.isDedekindDomain

-- Dedekind domain localized at prime → PID
recall IsDedekindDomain.isPrincipalIdealRing_localization_over_prime

-- General localization of a PID is a PID
-- (The book's argument: every ideal of S⁻¹A equals 𝔞ᵉ for some A-ideal 𝔞;
-- since A is a PID, 𝔞 = (a), so 𝔞ᵉ = (a/1) is principal.)
theorem isPrincipalIdealRing_localization_of_isPrincipalIdealRing
    (R : Type*) [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
    (M : Submonoid R) (S : Type*) [CommRing S] [Algebra R S] [IsLocalization M S] :
    IsPrincipalIdealRing S := by
  constructor
  intro J
  -- Every ideal of S⁻¹R is an extension: J = (J^c)^e
  rw [← IsLocalization.map_comap M S J]
  -- J^c is principal since R is a PID
  obtain ⟨⟨a, ha⟩⟩ := IsPrincipalIdealRing.principal (J.comap (algebraMap R S))
  rw [ha]
  exact ⟨⟨algebraMap R S a, by simp [Ideal.map_span, Set.image_singleton]⟩⟩

end Remark_2_2
