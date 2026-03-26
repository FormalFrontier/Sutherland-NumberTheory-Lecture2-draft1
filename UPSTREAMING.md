# Upstreaming Analysis — Stage 3.6

## Phase 1: Lightweight Triage

### Candidates (substantive proofs potentially absent from Mathlib)

| Item | Declaration | File | Verdict | Reason |
|------|-----------|------|---------|--------|
| 02_00b_Discussion | `ideal_ext_eq_top_of_meets_submonoid` | `02_00b_Discussion.lean:61` | **Rejected** | Phase 2 verdict: trivial contrapositive. See Phase 2 notes below. |
| 02_02_Remark | `isPrincipalIdealRing_localization_of_isPrincipalIdealRing` | `02_02_Remark.lean:72` | **Include** | Phase 2 confirmed: Mathlib has PID-at-prime via `IsDedekindDomain.isPrincipalIdealRing_localization_over_prime` (Dedekind detour) but **no** result for general submonoids. This 3-line elementary proof fills that gap. Ideal upstream target: `Mathlib/RingTheory/PrincipalIdealDomain.lean` or `Mathlib/RingTheory/Localization/Ideal.lean`. |
| 02_05a_Discussion | `localizedModule_mkLinearMap_injective_iff` | `02_05a_Discussion.lean:66` | **Reject — Mathlib covered** | `IsLocalizedModule.injective_iff_isRegular` (Basic.lean:539) is the same statement: `Injective f ↔ ∀ c : S, IsSMulRegular M c`. `IsSMulRegular M c` is definitionally `Injective (HSMul.hSMul c)`. Mathlib's version is more general (any `IsLocalizedModule` map, not just `mkLinearMap`). |
| 02_05a_Discussion | `localizedModule_mkLinearMap_injective_of_noZeroSMulDivisors` | `02_05a_Discussion.lean:86` | **Reject — Mathlib covered** | Follows from chaining: `NoZeroSMulDivisors R M` → `Module.IsTorsionFree R M` (instance at `NoZeroSMulDivisors/Defs.lean:56`) → `IsTorsionFree.isSMulRegular` → `injective_iff_isRegular`. No new content. |
| 02_06_Proposition | `Submodule.localizedAtPrime` | `02_06_Proposition.lean:51` | **Include** | Phase 2 confirmed: submodule generalization genuinely absent from Mathlib. See Phase 2 notes below. |
| 02_07_Corollary | `Ideal.localizedAtPrime`, `Ideal.eq_iInf_localizedAtPrime` | `02_07_Corollary.lean:34` | **Include** | Phase 2 confirmed: Mathlib has `ideal_eq_iInf_comap_map_away` (finite generating set, localization-away version) and `PrimeSpectrum.iInf_localization_eq_bot` (ring version A = ⋂ A_𝔭), but **no** result stating I = ⋂_𝔭 I_𝔭 for arbitrary ideals at all primes/maximal ideals. The conductor-based proof is self-contained and works for arbitrary CommRing (no IsDomain needed). If 02_06 is also included, this should be refactored as a corollary; if 02_06 is excluded, the standalone proof is clean and correct. Ideal upstream target: `Mathlib/RingTheory/Localization/Ideal.lean` alongside `ideal_eq_iInf_comap_map_away`. |
| 02_12_Remark | `not_isDedekindDomain_polynomial_polynomial` | `02_12_Remark.lean:54` | **Include** | Phase 2 confirmed: no equivalent in Mathlib. See Phase 2 notes below. |
| 02_12_Remark | `not_uniqueFactorizationMonoid_Zsqrtd_neg13` | `02_12_Remark.lean:79` | **Include** | Phase 2 confirmed: no equivalent in Mathlib. See Phase 2 notes below. |
| 02_20a_Discussion | `exists_noninvertible_fractionalIdeal` | `02_20a_Discussion.lean:49` | **Candidate** | Exhibits a domain (ℤ[X]) with a non-invertible nonzero fractional ideal, using the ¬IsDedekindDomain → ¬IsDedekindDomainInv characterization. |
| 02_21_Example | `SubringA`, `idealI_of_A`, various | `02_21_Example.lean` | **Candidate** | Full worked example: ℤ + 2iℤ ⊂ ℤ[i], I = 2ℤ[i] is non-invertible over A. ~120 lines of substantive constructions and proofs. Specific to the textbook, but the constructions are original. |

### Rejected — Trivial (recall / #check / inferInstance only)

| Item | Reason |
|------|--------|
| 02_00a_Discussion | All `recall` statements for Mathlib's `IsLocalization` API |
| 02_01_Theorem | All `recall` statements for `IsLocalization.orderIsoOfPrime` |
| 02_02a_Discussion | All `recall` + one `inferInstance` example |
| 02_06a_Discussion | One `recall` + one `inferInstance` example |
| 02_08_Example | Two specializations of `PrimeSpectrum.iInf_localization_eq_bot` to ℤ/ℚ (trivial glue) |
| 02_09_Proposition | All `#check` and `inferInstance` examples demonstrating `IsDedekindDomainDvr` ↔ `IsDedekindDomain` |
| 02_10_Definition | All `#check` and `inferInstance` examples for `IsDedekindDomain` |
| 02_11_Corollary | All `#check` and `inferInstance` examples for PID → Dedekind |
| 02_12a_Discussion | All `#check` and `inferInstance` examples for integral closure |
| 02_13_Definition | All `#check` and `inferInstance` examples for `FractionalIdeal` |
| 02_13a_Discussion | All `#check`, `recall`, and `inferInstance` examples |
| 02_14_Lemma | All `#check` statements + 2-line theorem that just applies existing API |
| 02_15_Remark | All `#check` + 1-line theorem delegating to `fg_of_isNoetherianRing` |
| 02_17_Definition | All `#check` statements for `FractionalIdeal.spanSingleton` |
| 02_17a_Discussion | All `recall` statements for fractional ideal operations |
| 02_18_Lemma | All `#check` + 1-line theorem delegating to `fg_of_isNoetherianRing` |
| 02_19_Definition | All `#check` and `recall` statements for invertible fractional ideals |
| 02_21a_Discussion | All `recall` + `inferInstance` examples |
| 02_22_Definition | All `#check` and `inferInstance` examples for ideal group |
| 02_22a_Discussion | All `#check` statements for principal fractional ideals |
| 02_23_Definition | All `#check` and `inferInstance` examples for class group |
| 02_24_Example | All `#check` and `inferInstance` examples for DVR class group |
| 02_25_Remark | All `#check` statements for Dedekind UFD / Picard group |

### Rejected — Trivial original proofs (one-liners or minimal glue)

| Item | Declaration | Reason |
|------|-----------|--------|
| 02_03_Remark | `warning_2_3_counterexample` etc. | Concrete ℤ computation (norm_num), pedagogical — too specific for Mathlib |
| 02_04_Example | `kx_loc_x_sub_2_isDVR` etc. | Instance chain glue (PID → Dedekind → DVR at prime), plus residue field isomorphism via existing equiv |
| 02_05_Example | `Z_loc_p_isDVR` etc. | Same pattern as 02_04 but for ℤ_(p) — instance chain + residue field via existing equivs |
| 02_16_Corollary | `fractionalIdeal_eq_inv_den_mul_num` | 4-line proof rearranging existing `den_mul_self_eq_num'` |
| 02_20_Lemma | `fractionalIdeal_mul_inv_le_one` | 2-line proof using `mul_one_div_le_one` |

### Non-formalizable items (no Lean file)

| Item | Reason |
|------|--------|
| 02_00_Introduction | Narrative overview, no mathematical claims |
| 02_08a_Discussion | Section heading + vague heuristic |
| 02_12b_Discussion | Section heading + scoping statement |
| Backmatter/Bibliography | Reference list only |

## Phase 2: Deep Mathlib Research

### 02_00b_Discussion — `ideal_ext_eq_top_of_meets_submonoid`

**Verdict: Rejected — insufficient interest**

**Research findings:**
- Mathlib has `IsLocalization.map_algebraMap_ne_top_iff_disjoint` at `Mathlib/RingTheory/Localization/Ideal.lean:95`
- This is the `≠ ⊤ ↔ Disjoint` iff form
- Our declaration is the contrapositive: `¬Disjoint → = ⊤`, proved by `of_not_not` on the `.not.mpr`
- Only 1 usage of the existing iff in all of Mathlib (`RamificationInertia/Basic.lean:272`), which manually does `rw [← not_ne_iff, ...]`
- The contrapositive would clean up that one usage, but doesn't justify an upstream PR on its own

**Rationale:** One-liner proof, one potential use site in Mathlib. If this were part of a larger API cleanup PR for `Localization.Ideal`, it could be included as a bonus, but it's too thin to stand alone. The existing `ne_top_iff_disjoint` form is the natural one for localization theory (the positive direction "ideal stays proper iff disjoint from submonoid" is the standard statement).

### 02_05a_Discussion — Reject (Mathlib covered)

**Declarations reviewed:**
- `localizedModule_mkLinearMap_injective_iff` (line 66)
- `localizedModule_mkLinearMap_injective_of_noZeroSMulDivisors` (line 86)

**Mathlib equivalents found:**

1. **`IsLocalizedModule.injective_iff_isRegular`** (`Mathlib/Algebra/Module/LocalizedModule/Basic.lean:539`):
   ```
   Function.Injective f ↔ ∀ c : S, IsSMulRegular M c
   ```
   This is the same as our `localizedModule_mkLinearMap_injective_iff`. The RHS `IsSMulRegular M c` unfolds to `Function.Injective (HSMul.hSMul c : M → M)`, which is exactly what our theorem states. Mathlib's version is strictly more general — it works for any `IsLocalizedModule S f`, not just the concrete `mkLinearMap`.

2. **Corollary chain for `_of_noZeroSMulDivisors`:**
   - `NoZeroSMulDivisors R M` → `Module.IsTorsionFree R M` (instance at `Mathlib/Algebra/NoZeroSMulDivisors/Defs.lean:56`)
   - `Module.IsTorsionFree` provides `isSMulRegular : IsRegular r → IsSMulRegular M r` (class at `Mathlib/Algebra/Module/Torsion/Free.lean:45`)
   - In `IsDomain A` with `s ≠ 0`, `IsRegular s` holds (by `isRegular_iff_ne_zero`)
   - Then `injective_iff_isRegular` closes the goal

3. **Supporting infrastructure:**
   - `mem_ker_mkLinearMap_iff` (Basic.lean:1328): kernel characterization `m ∈ ker ↔ ∃ r ∈ S, r • m = 0` — also used in our proof
   - `LocalizedModule.map_injective` (Module.lean:315): localization preserves injective maps
   - `IsLocalizedModule.isTorsionFree` (Basic.lean:1370): when `IsDomain R` and `IsTorsionFree R M`, the localized module is torsion-free

**Verdict:** Both declarations are already in Mathlib in equivalent or more general form. Our proofs are essentially re-deriving existing results. No upstreaming value. Could optionally refactor `02_05a_Discussion.lean` to use `recall` for these Mathlib results, but this is low priority.

### 02_06_Proposition — `Submodule.localizedAtPrime`, `eq_iInf_localizedAtPrime`

**Verdict: Include — genuinely absent from Mathlib**

**Research findings:**
- Mathlib has `MaximalSpectrum.iInf_localization_eq_bot` (at `Spectrum/Maximal/Localization.lean:35`) — proves R = ⋂_𝔪 R_𝔪 as subalgebras of K, for integral domains
- Mathlib has `PrimeSpectrum.iInf_localization_eq_bot` (at `Spectrum/Maximal/Localization.lean:60`) — proves R = ⋂_𝔭 R_𝔭 as subalgebras of K
- Mathlib has `HeightOneSpectrum.iInf_localization_eq_bot` (at `DedekindDomain/Ideal/Lemmas.lean:506`) — Dedekind domain version
- **No submodule generalization exists anywhere in Mathlib** — searched for `Submodule.*iInf.*locali`, `Submodule.*localizedAtPrime`, `conductor.*submodule`, all negative

**What our project provides:**
1. `Submodule.localizedAtPrime` — definition of M_𝔭 = {x ∈ V | ∃ s ∉ 𝔭, s·x ∈ M} as a submodule of V
2. `Submodule.conductor` — the conductor ideal {a ∈ A | a·x ∈ M}
3. `Submodule.eq_iInf_localizedAtPrime` — M = ⋂_𝔭 M_𝔭 (prime version)
4. `Submodule.eq_iInf_localizedAtPrime_maximal` — M = ⋂_𝔪 M_𝔪 (maximal version)
5. Helper lemmas: `le_localizedAtPrime`, `localizedAtPrime_anti`, `conductor_not_le_of_mem_localizedAtPrime`

**Why this is not a corollary of the ring version:** The ring version proves R = ⋂ R_𝔭 as subalgebras. The submodule version proves M = ⋂ M_𝔭 for an arbitrary A-submodule M of a K-vector space V. The proof uses the same conductor strategy but applied to the submodule setting — it's structurally parallel but not derivable from the ring result.

**Upstream potential:** ~40 lines of substantive proof. Self-contained. Natural generalization of an existing Mathlib result. Would fit in `Mathlib/RingTheory/Localization/Submodule.lean` or alongside the existing `Spectrum/Maximal/Localization.lean`.

### 02_12_Remark — `not_isDedekindDomain_polynomial_polynomial`, `not_uniqueFactorizationMonoid_Zsqrtd_neg13`

**Verdict: Include — both counterexamples absent from Mathlib**

**Research findings:**

**Declaration 1: `not_isDedekindDomain_polynomial_polynomial`**
- Searched Mathlib for `not_isDedekindDomain`, `¬.*IsDedekindDomain`, `Polynomial.*Dedekind` — no results
- Searched `Counterexamples/` for `Dedekind` — no results
- Mathlib has `Polynomial.not_isField` (the key helper used in our proof) but not the Dedekind non-example
- ~12 lines. Proof: (X) is prime but not maximal in k[x,y]; in a Dedekind domain every nonzero prime is maximal, contradiction. Uses `quotientSpanXSubCAlgEquiv` to show k[x,y]/(Y) ≅ k[x] is not a field.

**Declaration 2: `not_uniqueFactorizationMonoid_Zsqrtd_neg13`**
- Searched Mathlib for `Zsqrtd.*UniqueFactorizationMonoid`, `Zsqrtd.*Irreducible`, `not_uniqueFactorization` — no results
- Searched `Counterexamples/` for `Zsqrtd` — no results
- ~50 lines. Proof: 2 is irreducible in ℤ[√-13] (norm argument: no elements of norm 2 or 3) but not prime (2 | (1+√-13)(1-√-13) but 2 ∤ either factor).

**Upstream potential:** Both would fit in `Counterexamples/` or `Mathlib/RingTheory/DedekindDomain/`. The ℤ[√-13] result is the more substantial contribution (~50 lines of original norm-based proof). The k[x,y] result is shorter but equally absent. Together they complete the standard textbook picture: PID ⊊ UFD, PID ⊊ Dedekind, UFD ∩ Dedekind = PID.
