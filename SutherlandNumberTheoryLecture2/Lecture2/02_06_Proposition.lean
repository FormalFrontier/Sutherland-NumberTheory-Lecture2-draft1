import Mathlib

/-!
# Proposition 2.6: Submodule Localization Intersection

**Proposition 2.6.** Let A be a subring of a field K, and let M be an A-module
contained in a K-vector space V (equivalently, for which the map M → M ⊗_A K is
injective). Then

  M = ⋂_𝔪 M_𝔪 = ⋂_𝔭 M_𝔭,

where 𝔪 ranges over the maximal ideals of A, 𝔭 ranges over the prime ideals of A,
and the intersections take place in V.

See `blobs/Lecture2/02_06_Proposition.md` for the source text.

## Mathlib Coverage

Mathlib has `Submodule.iInf_localization_eq_bot` for Dedekind domains, but the book
states this for general integral domains. The general version must be proved from
scratch following the book's proof strategy.

## Formalization Approach

We work with:
- `A` an integral domain, `K = Frac(A)`
- `V` a K-vector space with compatible A-module structure (via `IsScalarTower A K V`)
- `M : Submodule A V`

The localization M_𝔭 is defined within V as
  M_𝔭 = {x ∈ V | ∃ s ∈ A \ 𝔭, s • x ∈ M}.

This is equivalent to the abstract localization M ⊗_A A_𝔭 when M embeds into V.
-/

section Proposition_2_6

variable {A : Type*} [CommRing A] [IsDomain A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]
variable {V : Type*} [AddCommGroup V] [Module K V] [Module A V] [IsScalarTower A K V]

/-! ## Localization of a submodule at a prime

Given M : Submodule A V where V is a K-vector space, the localization of M at a
prime ideal 𝔭 is {x ∈ V | ∃ s ∈ A \ 𝔭, s • x ∈ M}. Since V is a K-vector space
and K = Frac(A), this naturally lives in V. -/

/-- The localization of a submodule M at a prime ideal 𝔭, viewed as a submodule of the
ambient K-vector space V. An element x ∈ V lies in M_𝔭 iff there exists s ∈ A \ 𝔭
with s • x ∈ M. -/
def Submodule.localizedAtPrime (M : Submodule A V) (𝔭 : Ideal A) [𝔭.IsPrime] :
    Submodule A V where
  carrier := { x : V | ∃ s : 𝔭.primeCompl, (s : A) • x ∈ M }
  add_mem' := by
    rintro x y ⟨s, hsx⟩ ⟨t, hty⟩
    refine ⟨⟨s * t, 𝔭.primeCompl.mul_mem s.2 t.2⟩, ?_⟩
    have hs : (s : A) • x ∈ M := hsx
    have ht : (t : A) • y ∈ M := hty
    have key : (↑s * ↑t : A) • (x + y) = (t : A) • ((s : A) • x) + (s : A) • ((t : A) • y) := by
      simp [smul_add, mul_smul, smul_comm (↑s : A) (↑t : A), mul_comm (↑s : A) ↑t]
    rw [key]
    exact M.add_mem (M.smul_mem _ hs) (M.smul_mem _ ht)
  zero_mem' := ⟨⟨1, 𝔭.primeCompl.one_mem⟩, by simp [M.zero_mem]⟩
  smul_mem' := by
    intro a x ⟨⟨s, hs⟩, hsx⟩
    -- s • x ∈ M, so s • (a • x) = a • (s • x) ∈ M
    exact ⟨⟨s, hs⟩, by rw [smul_comm]; exact M.smul_mem a hsx⟩

omit [IsDomain A] in
/-- M is contained in each of its localizations. -/
theorem Submodule.le_localizedAtPrime (M : Submodule A V) (𝔭 : Ideal A) [𝔭.IsPrime] :
    M ≤ M.localizedAtPrime 𝔭 := by
  intro x hx
  exact ⟨⟨1, 𝔭.primeCompl.one_mem⟩, by simpa using hx⟩

omit [IsDomain A] in
/-- If 𝔭 ⊆ 𝔮, then M_𝔮 ⊆ M_𝔭 (localizing at a smaller prime gives a larger module). -/
theorem Submodule.localizedAtPrime_anti (M : Submodule A V)
    {𝔭 𝔮 : Ideal A} [𝔭.IsPrime] [𝔮.IsPrime] (h : 𝔭 ≤ 𝔮) :
    M.localizedAtPrime 𝔮 ≤ M.localizedAtPrime 𝔭 := by
  intro x ⟨⟨s, hs⟩, hsx⟩
  -- s ∉ 𝔮 and 𝔭 ⊆ 𝔮 implies s ∉ 𝔭
  exact ⟨⟨s, fun hs𝔭 => hs (h hs𝔭)⟩, hsx⟩

/-! ## The conductor ideal

The proof uses the "conductor" ideal 𝔞 = {a ∈ A | a·x ∈ M} for a fixed x ∈ V.
-/

/-- The conductor of x into M: the ideal {a ∈ A | a • x ∈ M}. -/
def Submodule.conductor (M : Submodule A V) (x : V) : Ideal A where
  carrier := { a : A | a • x ∈ M }
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_setOf_eq, add_smul] at *
    exact M.add_mem ha hb
  zero_mem' := by simp [M.zero_mem]
  smul_mem' := by
    intro c a ha
    simp only [Set.mem_setOf_eq, smul_eq_mul, mul_smul] at *
    exact M.smul_mem c ha

/-- If x ∈ M_𝔭 then the conductor of x into M is not contained in 𝔭. -/
theorem Submodule.conductor_not_le_of_mem_localizedAtPrime
    (M : Submodule A V) (x : V) (𝔭 : Ideal A) [𝔭.IsPrime]
    (hx : x ∈ M.localizedAtPrime 𝔭) :
    ¬(M.conductor x ≤ 𝔭) := by
  sorry

/-! ## The main proposition

**Proof strategy** (from the book): Suppose x ∈ ⋂_𝔪 M_𝔪. Consider the A-ideal
𝔞 := {a ∈ A | a·x ∈ M}. For each maximal ideal 𝔪, since x ∈ M_𝔪, there exists
s ∉ 𝔪 with s·x ∈ M, so s ∈ 𝔞 and s ∉ 𝔪, hence 𝔞 ⊄ 𝔪. Since 𝔞 is not contained
in any maximal ideal, 𝔞 = A, so 1 ∈ 𝔞 and x = 1·x ∈ M.

For the equality of the two intersections: every maximal ideal is prime, and every
prime is contained in some maximal ideal with M_𝔪 ⊆ M_𝔭 when 𝔭 ⊆ 𝔪. -/

/-- **Proposition 2.6** (prime ideals version). M equals the intersection of its
localizations at all prime ideals:
  M = ⋂_𝔭 M_𝔭
where 𝔭 ranges over prime ideals of A. -/
theorem Submodule.eq_iInf_localizedAtPrime (M : Submodule A V) :
    M = ⨅ (𝔭 : Ideal A) (_ : 𝔭.IsPrime), M.localizedAtPrime 𝔭 := by
  sorry

/-- **Proposition 2.6** (maximal ideals version). M equals the intersection of its
localizations at all maximal ideals:
  M = ⋂_𝔪 M_𝔪
where 𝔪 ranges over maximal ideals of A. -/
theorem Submodule.eq_iInf_localizedAtPrime_maximal (M : Submodule A V) :
    M = ⨅ (𝔪 : {I : Ideal A // I.IsMaximal}),
      haveI := 𝔪.2.isPrime; M.localizedAtPrime 𝔪.1 := by
  sorry

/-- The intersection over maximal ideals equals the intersection over prime ideals.
This follows from the two equalities above. -/
theorem Submodule.iInf_localizedAtPrime_maximal_eq_iInf_localizedAtPrime
    (M : Submodule A V) :
    (⨅ (𝔪 : {I : Ideal A // I.IsMaximal}),
      haveI := 𝔪.2.isPrime; M.localizedAtPrime 𝔪.1) =
    (⨅ (𝔭 : Ideal A) (_ : 𝔭.IsPrime), M.localizedAtPrime 𝔭) := by
  sorry

end Proposition_2_6
