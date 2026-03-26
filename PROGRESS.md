# Project Progress

**Last updated:** 2026-03-26
**Textbook:** Sutherland, Number Theory Lecture 2 (Localization, Dedekind Domains, Fractional Ideals)

## Current Phase: Phase 3 — Formalization

### Completed Stages

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
| 3.1 Scaffolding (setup) | Complete | 36 Lean stubs + blob assessment |

### In Progress

| Stage | Status | Summary |
|-------|--------|---------|
| 3.1 Scaffolding (items) | **58% complete** | 21/36 formalizable items scaffolded |
| 3.2 Review | **25% complete** | 9/36 items definition_verified |

### Not Started

| Stage | Summary |
|-------|---------|
| 3.3 Proof Work | Fill in sorry'd proofs |
| 3.4 Dependency Trimming | Trim conservative deps to actual |
| 3.5 Final Audit | Quality check and cleanup |

## Item Status Summary

| Status | Count | Description |
|--------|-------|-------------|
| definition_verified | 9 | Scaffolded + reviewed, all definitions constructed |
| scaffolded | 12 | Lean file has substantive content, awaiting review |
| scaffolding_ready | 15 | Stub file only, needs scaffolding |
| non_formalizable | 4 | No mathematical claims to formalize |
| **Total** | **40** | |

## Quality Metrics

- **Lean files:** 36 formalizable items with .lean files
- **Total Lean lines:** ~1,847
- **Total sorries:** 18 (all proof-level; zero definition-level)
- **Fully proved items:** 8 (02_01, 02_08, 02_09, 02_10, 02_11, 02_13, 02_14, 02_15)

## What Remains

### Scaffolding (15 items)
- 10 discussion blobs (02_00a, 02_00b, 02_02a, 02_05a, 02_06a, 02_12a, 02_13a, 02_17a, 02_20a, 02_21a, 02_22a)
- 4 numbered items (02_18_Lemma, 02_20_Lemma, 02_24_Example, 02_25_Remark)

### Reviews (12 items)
- All 12 scaffolded-but-not-reviewed items need Stage 3.2 review

### Proofs (18 sorries)
- Residue field isomorphisms (02_04, 02_05)
- Localization intersection proofs (02_06, 02_07)
- Counterexamples (02_12)
- Fractional ideal existential (02_16)
- Z+2iZ subring properties (02_21)

## Limitations

- Discussion blobs (10 of 15 remaining items) are lower priority but represent real mathematical claims that should be formalized for completeness.
- The 18 remaining sorries include some genuinely difficult results (residue field isomorphisms, counterexamples) that may require significant proof work in Stage 3.3.
- No items have yet reached Stage 3.3 (proof work) — all proof-level sorries remain from initial scaffolding.
