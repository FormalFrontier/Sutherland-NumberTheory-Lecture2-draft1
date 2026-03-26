# Project Progress

**Last updated:** 2026-03-26
**Textbook:** Sutherland, Number Theory Lecture 2 (Localization, Dedekind Domains, Fractional Ideals)
**Status:** Complete — all pipeline stages finished

## Pipeline Completion

| Stage | Status | Summary |
|-------|--------|---------|
| 1.1 Page Extraction | Complete | 8 pages extracted |
| 1.2 Lean Build | Complete | Mathlib dependency configured |
| 1.3 Frontmatter Detection | Complete | 1 backmatter page (bibliography) |
| 1.4 Transcription | Complete | All pages transcribed to markdown |
| 1.5 Validation | Complete | Transcriptions validated |
| 1.6 Structure Analysis | Complete | 40 items cataloged |
| 1.7 Blob Extraction | Complete | 40 blob files |
| 2.1 Internal Dependencies | Complete | Conservative linear chain |
| 2.2 External Dependencies | Complete | 25 dependency groups |
| 2.3 Mathlib Coverage | Complete | Coverage research for all items |
| 2.4 Template Reconciliation | Complete | Templates matched to items |
| 2.5 Formalization Plan | Complete | Planning report |
| 2.6 Reference Attachment | Complete | 32 .refs.md files |
| 3.1 Scaffolding | Complete | 36/36 formalizable items scaffolded |
| 3.2 Review | Complete | 36/36 items reviewed |
| 3.3 Proof Work | Complete | All sorries resolved |
| 3.4 Dependency Trimming | Complete | Dependencies trimmed to actual |
| 3.5 Proof Polishing | Complete | All proofs polished to Mathlib quality |
| 3.6 Upstreaming Analysis | Complete | Phase 1 triage + Phase 2 deep research |

## Final Statistics

### Items

| Category | Count |
|----------|-------|
| Total items cataloged | 40 |
| Formalizable items | 36 |
| Non-formalizable items | 4 |
| Items with proof_polished status | 36 |
| Remaining sorries | 0 |

### Codebase

| Metric | Value |
|--------|-------|
| Lean source files | 37 |
| Total Lean lines | 3,051 |
| Sorry count | 0 |
| Commits on main | 111 |

### Upstreaming Verdicts (Stage 3.6)

| Verdict | Count | Items |
|---------|-------|-------|
| Include | 4 | 02_02 (PID localization), 02_06 (submodule localization), 02_07 (ideal intersection), 02_12 (counterexamples) |
| Rejected (trivial) | 29 | recall / #check / inferInstance / one-liner proofs |
| Rejected (insufficient interest) | 2 | 02_00b (contrapositive), 02_21 (pedagogical example) |
| Mathlib covered | 1 | 02_05a (localized module injectivity) |
| N/A (non-formalizable) | 4 | Introduction, section headings, bibliography |

### Upstreaming Candidates — Detail

The 4 items recommended for Mathlib contribution:

1. **02_02_Remark** — `isPrincipalIdealRing_localization_of_isPrincipalIdealRing`: PID localization at general submonoids (Mathlib only has PID-at-prime via Dedekind detour)
2. **02_06_Proposition** — `Submodule.localizedAtPrime`, `eq_iInf_localizedAtPrime`: M = ⋂ M_𝔭 for submodules (generalizes ring version already in Mathlib)
3. **02_07_Corollary** — `Ideal.eq_iInf_localizedAtPrime`: I = ⋂ I_𝔭 for ideals at all primes/maximal ideals
4. **02_12_Remark** — `not_isDedekindDomain_polynomial_polynomial` + `not_uniqueFactorizationMonoid_Zsqrtd_neg13`: counterexamples absent from Mathlib

## Timeline

- **2026-03-25**: Project initialized, Stages 1.1–2.6 completed
- **2026-03-25 to 2026-03-26**: Stages 3.1–3.5 completed (scaffolding, review, proof work, dependency trimming, polishing)
- **2026-03-26**: Stage 3.6 completed (upstreaming triage + deep Mathlib research for all 8 candidates)
