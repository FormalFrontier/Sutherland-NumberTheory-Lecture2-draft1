import SutherlandNumberTheoryLecture2.Lecture2.«02_06_Proposition»

/-!
# Corollary 2.7: Ideal Localization Intersection

**Corollary 2.7.** Let A be an integral domain. Every ideal I of A (including I = A)
is equal to the intersection of its localizations at the maximal ideals of A, and also
to the intersection of its localizations at the prime ideals of A.

This is the ideal specialization of Proposition 2.6 (submodule version). The proof
follows directly: view I as an A-submodule of the fraction field K = Frac(A) and
apply Proposition 2.6.

## Formalization Approach

We define `Ideal.localizedAtPrime I 𝔭` as the ideal {a ∈ A | ∃ s ∉ 𝔭, s * a ∈ I},
which is the contraction (pullback) of I·A_𝔭 back to A. The corollary then states
I = ⨅_𝔭 I.localizedAtPrime 𝔭.

See `blobs/Lecture2/02_07_Corollary.md` for the source text.
-/

section Corollary_2_7

variable {A : Type*} [CommRing A] [IsDomain A]

/-! ## Localization of an ideal at a prime

For an ideal I of A and a prime 𝔭, the localization I_𝔭 ∩ A = {a ∈ A | ∃ s ∉ 𝔭, s·a ∈ I}
is again an ideal of A. This is the contraction of the extended ideal I·A_𝔭 back to A. -/

/-- The localization of an ideal I at a prime ideal 𝔭, contracted back to A.
An element a ∈ A lies in I_𝔭 ∩ A iff there exists s ∈ A \ 𝔭 with s * a ∈ I. -/
def Ideal.localizedAtPrime (I : Ideal A) (𝔭 : Ideal A) [𝔭.IsPrime] : Ideal A where
  carrier := { a : A | ∃ s : 𝔭.primeCompl, (s : A) * a ∈ I }
  add_mem' := by
    rintro x y ⟨s, hsx⟩ ⟨t, hty⟩
    exact ⟨⟨s * t, 𝔭.primeCompl.mul_mem s.2 t.2⟩, by
      change (↑s * ↑t) * (x + y) ∈ I
      rw [mul_add, show (↑s * ↑t) * x = ↑t * (↑s * x) from by ring,
          show (↑s * ↑t) * y = ↑s * (↑t * y) from by ring]
      exact I.add_mem (I.mul_mem_left ↑t hsx) (I.mul_mem_left ↑s hty)⟩
  zero_mem' := ⟨⟨1, 𝔭.primeCompl.one_mem⟩, by simp [I.zero_mem]⟩
  smul_mem' := by
    intro c a ⟨⟨s, hs⟩, hsa⟩
    exact ⟨⟨s, hs⟩, by
      change (s : A) * (c * a) ∈ I
      rw [show (s : A) * (c * a) = c * ((s : A) * a) from by ring]
      exact I.mul_mem_left c hsa⟩

omit [IsDomain A] in
/-- I is contained in each of its localizations. -/
theorem Ideal.le_localizedAtPrime (I : Ideal A) (𝔭 : Ideal A) [𝔭.IsPrime] :
    I ≤ I.localizedAtPrime 𝔭 := by
  intro x hx
  exact ⟨⟨1, 𝔭.primeCompl.one_mem⟩, by simpa using hx⟩

omit [IsDomain A] in
/-- If 𝔭 ⊆ 𝔮, then I_𝔮 ⊆ I_𝔭 (localizing at a smaller prime gives a larger ideal). -/
theorem Ideal.localizedAtPrime_anti (I : Ideal A)
    {𝔭 𝔮 : Ideal A} [𝔭.IsPrime] [𝔮.IsPrime] (h : 𝔭 ≤ 𝔮) :
    I.localizedAtPrime 𝔮 ≤ I.localizedAtPrime 𝔭 := by
  intro a ⟨⟨s, hs⟩, hsa⟩
  exact ⟨⟨s, fun hs𝔭 => hs (h hs𝔭)⟩, hsa⟩

/-! ## The main corollary

**Proof strategy** (following the book): This is a direct consequence of Proposition 2.6.
An ideal I of A can be viewed as an A-submodule of K = Frac(A) via the algebra map.
Under this identification, the localization of I at 𝔭 (as a submodule of K) corresponds
to I.localizedAtPrime 𝔭 pulled back to A. Proposition 2.6 gives
I = ⋂_𝔭 I_𝔭 = ⋂_𝔪 I_𝔪 as submodules of K, which translates to the ideal version.

Alternatively, the same conductor argument applies directly: for a ∈ ⋂_𝔪 I_𝔪, the
conductor {s ∈ A | s·a ∈ I} is not contained in any maximal ideal, hence equals A. -/

/-- **Corollary 2.7** (prime ideals version). Every ideal I of A equals the intersection
of its localizations at all prime ideals:
  I = ⋂_𝔭 I.localizedAtPrime 𝔭
where 𝔭 ranges over prime ideals of A. -/
theorem Ideal.eq_iInf_localizedAtPrime (I : Ideal A) :
    I = ⨅ (𝔭 : Ideal A) (_ : 𝔭.IsPrime), I.localizedAtPrime 𝔭 := by
  ext a
  simp only [Ideal.mem_iInf]
  constructor
  · intro ha 𝔭 _
    exact I.le_localizedAtPrime 𝔭 ha
  · intro ha
    -- The conductor J = {s ∈ A | s * a ∈ I} is not contained in any prime ideal
    -- because for each prime 𝔭, ha gives s ∉ 𝔭 with s * a ∈ I, so s ∈ J \ 𝔭.
    -- Hence J = A, so 1 ∈ J, meaning a ∈ I.
    by_contra ha_notin
    -- The conductor J = {s | s*a ∈ I}
    let J : Ideal A := {
      carrier := { s : A | s * a ∈ I }
      add_mem' := fun {x y} hx hy => by
        simp only [Set.mem_setOf_eq, add_mul] at *
        exact I.add_mem hx hy
      zero_mem' := by simp [I.zero_mem]
      smul_mem' := fun c x hx => by
        simp only [Set.mem_setOf_eq, smul_eq_mul, mul_assoc] at *
        exact I.mul_mem_left c hx }
    -- J ≠ ⊤ since 1 * a = a ∉ I
    have hJ_ne_top : J ≠ ⊤ := by
      intro h; apply ha_notin
      have : (1 : A) ∈ J := h ▸ Submodule.mem_top
      simpa [J] using this
    obtain ⟨𝔪, h𝔪max, hJ𝔪⟩ := J.exists_le_maximal hJ_ne_top
    have ha𝔪 := ha 𝔪 h𝔪max.isPrime
    obtain ⟨⟨s, hs⟩, hsa⟩ := ha𝔪
    exact hs (hJ𝔪 hsa)

/-- **Corollary 2.7** (maximal ideals version). Every ideal I of A equals the intersection
of its localizations at all maximal ideals:
  I = ⋂_𝔪 I.localizedAtPrime 𝔪
where 𝔪 ranges over maximal ideals of A. -/
theorem Ideal.eq_iInf_localizedAtPrime_maximal (I : Ideal A) :
    I = ⨅ (𝔪 : {J : Ideal A // J.IsMaximal}),
      haveI := 𝔪.2.isPrime; I.localizedAtPrime 𝔪.1 := by
  ext a
  simp only [Ideal.mem_iInf, Subtype.forall]
  constructor
  · intro ha 𝔪 h𝔪
    haveI := h𝔪.isPrime
    exact I.le_localizedAtPrime 𝔪 ha
  · intro ha
    by_contra ha_notin
    let J : Ideal A := {
      carrier := { s : A | s * a ∈ I }
      add_mem' := fun {x y} hx hy => by
        simp only [Set.mem_setOf_eq, add_mul] at *
        exact I.add_mem hx hy
      zero_mem' := by simp [I.zero_mem]
      smul_mem' := fun c x hx => by
        simp only [Set.mem_setOf_eq, smul_eq_mul, mul_assoc] at *
        exact I.mul_mem_left c hx }
    have hJ_ne_top : J ≠ ⊤ := by
      intro h; apply ha_notin
      have : (1 : A) ∈ J := h ▸ Submodule.mem_top
      simpa [J] using this
    obtain ⟨𝔪, h𝔪max, hJ𝔪⟩ := J.exists_le_maximal hJ_ne_top
    haveI := h𝔪max.isPrime
    have ha𝔪 := ha 𝔪 h𝔪max
    obtain ⟨⟨s, hs⟩, hsa⟩ := ha𝔪
    exact hs (hJ𝔪 hsa)

/-- The intersection over maximal ideals equals the intersection over prime ideals. -/
theorem Ideal.iInf_localizedAtPrime_maximal_eq_iInf_localizedAtPrime (I : Ideal A) :
    (⨅ (𝔪 : {J : Ideal A // J.IsMaximal}),
      haveI := 𝔪.2.isPrime; I.localizedAtPrime 𝔪.1) =
    (⨅ (𝔭 : Ideal A) (_ : 𝔭.IsPrime), I.localizedAtPrime 𝔭) := by
  rw [← I.eq_iInf_localizedAtPrime_maximal, ← I.eq_iInf_localizedAtPrime]

end Corollary_2_7
