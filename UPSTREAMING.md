# Upstreaming Analysis — Stage 3.6

## Phase 1: Lightweight Triage

### Candidates (substantive proofs potentially absent from Mathlib)

| Item | Declaration | File | Verdict | Reason |
|------|-----------|------|---------|--------|
| 02_00b_Discussion | `ideal_ext_eq_top_of_meets_submonoid` | `02_00b_Discussion.lean:61` | **Candidate** | One-liner contrapositive of `IsLocalization.map_algebraMap_ne_top_iff_disjoint`, but packages a useful API lemma. Borderline — review in Phase 2. |
| 02_02_Remark | `isPrincipalIdealRing_localization_of_isPrincipalIdealRing` | `02_02_Remark.lean:72` | **Include** | Phase 2 confirmed: Mathlib has PID-at-prime via `IsDedekindDomain.isPrincipalIdealRing_localization_over_prime` (Dedekind detour) but **no** result for general submonoids. This 3-line elementary proof fills that gap. Ideal upstream target: `Mathlib/RingTheory/PrincipalIdealDomain.lean` or `Mathlib/RingTheory/Localization/Ideal.lean`. |
| 02_05a_Discussion | `localizedModule_mkLinearMap_injective_iff` | `02_05a_Discussion.lean:66` | **Candidate** | Characterizes injectivity of the canonical map M → S⁻¹M as: injective iff multiplication by every s ∈ S is injective on M. Substantive 8-line proof. |
| 02_05a_Discussion | `localizedModule_mkLinearMap_injective_of_noZeroSMulDivisors` | `02_05a_Discussion.lean:86` | **Candidate** | Corollary: canonical map is injective when M is torsion-free over a domain. Uses the iff above. |
| 02_06_Proposition | `Submodule.localizedAtPrime` | `02_06_Proposition.lean:51` | **Candidate** | Definition + three theorems (`eq_iInf_localizedAtPrime`, maximal version, bridge). Proves M = ⋂_𝔭 M_𝔭 for submodules of a K-vector space. Conductor argument, ~40 lines of substantive proof. Mathlib has the ring version (`PrimeSpectrum.iInf_localization_eq_bot`) but this submodule generalization may be absent. |
| 02_07_Corollary | `Ideal.localizedAtPrime`, `Ideal.eq_iInf_localizedAtPrime` | `02_07_Corollary.lean:34` | **Candidate** | Ideal version of Prop 2.6: I = ⋂_𝔭 I_𝔭 with conductor argument. Self-contained proof (~30 lines per direction). Mathlib has this for rings but the ideal version with explicit localizedAtPrime definition may be absent. |
| 02_12_Remark | `not_isDedekindDomain_polynomial_polynomial` | `02_12_Remark.lean:54` | **Candidate** | Proves k[x,y] is not a Dedekind domain (dimension argument: (X) is prime but not maximal). |
| 02_12_Remark | `not_uniqueFactorizationMonoid_Zsqrtd_neg13` | `02_12_Remark.lean:79` | **Candidate** | Proves ℤ[√-13] is not a UFD via norm argument (2 is irreducible but not prime). ~50 lines of substantive proof. |
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
