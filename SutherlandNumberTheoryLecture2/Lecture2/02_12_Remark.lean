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

-- k[x,y] is NOT a Dedekind domain: (Y) is a nonzero prime that's not maximal
-- IsDedekindDomain instance synthesis on Polynomial (Polynomial k) is expensive
set_option maxHeartbeats 400000 in
theorem not_isDedekindDomain_polynomial_polynomial :
    ¬ IsDedekindDomain (Polynomial (Polynomial k)) := by
  intro h
  -- If (Y) is maximal then k[x] ≅ k[x,y]/(Y) is a field, contradiction
  haveI := h
  have hprime : (Ideal.span {(Polynomial.X : Polynomial (Polynomial k))}).IsPrime :=
    (Ideal.span_singleton_prime Polynomial.X_ne_zero).mpr Polynomial.prime_X
  have hmax := hprime.isMaximal (mt Ideal.span_singleton_eq_bot.mp Polynomial.X_ne_zero)
  have hfield := (Ideal.Quotient.maximal_ideal_iff_isField_quotient _).mp hmax
  rw [show (Polynomial.X : Polynomial (Polynomial k)) = Polynomial.X - Polynomial.C 0 from by simp]
    at hfield
  exact Polynomial.not_isField k
    ((Polynomial.quotientSpanXSubCAlgEquiv (0 : Polynomial k)).symm.toMulEquiv.isField hfield)

/-! ## Claim 4: Not every Dedekind domain is a UFD

The book's counterexample is ℤ[√-13]. This is a Dedekind domain
(it is the ring of integers of ℚ(√-13), a number field) but not a UFD
(since 14 = 2 · 7 = (1 + √-13)(1 - √-13) gives two distinct factorizations). -/

-- ℤ[√d] for d : ℤ is available in Mathlib as `Zsqrtd d`
#check Zsqrtd

-- ℤ[√-13] is not a UFD: 2 is irreducible but not prime
theorem not_uniqueFactorizationMonoid_Zsqrtd_neg13 :
    ¬ UniqueFactorizationMonoid (Zsqrtd (-13)) := by
  intro h
  -- We show 2 is irreducible but not prime in ℤ[√-13]
  have hd : (-13 : ℤ) ≤ 0 := by norm_num
  have hirr : Irreducible (2 : ℤ√(-13)) := by
    refine ⟨?_, ?_⟩
    · rw [← Zsqrtd.norm_eq_one_iff' hd]; decide
    · -- If 2 = a * b, one of a, b must be a unit
      intro a b hab
      have hn : a.norm * b.norm = 4 := by
        have := congr_arg Zsqrtd.norm hab
        rw [Zsqrtd.norm_mul, show (2 : ℤ√(-13)).norm = 4 from by decide] at this; linarith
      have hna := Zsqrtd.norm_nonneg hd a
      have hnb := Zsqrtd.norm_nonneg hd b
      rw [← Zsqrtd.norm_eq_one_iff' hd, ← Zsqrtd.norm_eq_one_iff' hd]
      -- norm(x) = re² + 13·im² ≥ 13 if im ≠ 0, so any norm ≤ 4 requires im = 0
      -- Then re² ∈ {0,1,4,...}, so norm ∈ {0,1,4,...}. Can't be 2 or 3.
      suffices ∀ x : ℤ√(-13), x.norm ≠ 2 ∧ x.norm ≠ 3 by
        have ⟨h2a, h3a⟩ := this a
        have hb_pos : 0 < b.norm := by
          rcases eq_or_lt_of_le hnb with h | h
          · exfalso; rw [← h, mul_zero] at hn; omega
          · exact h
        have ha_pos : 0 < a.norm := by
          rcases eq_or_lt_of_le hna with h | h
          · exfalso; rw [← h, zero_mul] at hn; omega
          · exact h
        have : a.norm = 1 ∨ a.norm = 4 := by
          have : a.norm ≤ 4 := by
            have : 1 ≤ b.norm := by omega
            nlinarith
          omega
        rcases this with ha | ha
        · left; exact ha
        · right; nlinarith
      intro x
      constructor <;> intro heq <;> rw [Zsqrtd.norm_def] at heq <;> {
        have him0 : x.im = 0 := by
          by_contra h0
          have : x.im ≤ -1 ∨ x.im ≥ 1 := by omega
          rcases this with hh | hh <;> nlinarith [mul_self_nonneg x.re]
        simp [him0] at heq
        have hle : x.re ≤ 1 := by nlinarith [mul_self_nonneg (x.re - 2)]
        have hge : -1 ≤ x.re := by nlinarith [mul_self_nonneg (x.re + 2)]
        interval_cases x.re <;> omega
      }
  have hprime : ¬ Prime (2 : ℤ√(-13)) := by
    intro ⟨_, _, hdvd⟩
    -- 2 | (1+√-13)(1-√-13) = 14, but 2 ∤ (1+√-13) and 2 ∤ (1-√-13)
    have h14 : (2 : ℤ√(-13)) ∣ (⟨1, 1⟩ : ℤ√(-13)) * ⟨1, -1⟩ :=
      ⟨⟨7, 0⟩, by ext <;> decide⟩
    rcases hdvd _ _ h14 with ⟨⟨c, d⟩, hcd⟩ | ⟨⟨c, d⟩, hcd⟩ <;>
      simp [Zsqrtd.ext_iff] at hcd <;> omega
  haveI := h
  exact hprime (UniqueFactorizationMonoid.irreducible_iff_prime.mp hirr)

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
