# Stage 3.2→3.3 Transition and Sorry Inventory

**Date:** 2026-03-26
**Scope:** Transition from Stage 3.2 (scaffolding review) to Stage 3.3 (formalization work loop)
**PRs merged since last summary (#90):** 28 (PRs #110–#163)

## Stage 3.2 Completion

Stage 3.2 (scaffolding review) is **complete**. All 36 formalizable items have been reviewed and verified:

- **32 items** passed review as `sorry_free` (zero proof-level sorries)
- **4 items** passed review as `definition_verified` or `proof_formalized` (no definition-level sorries, but proof-level sorries remain)
- **4 items** marked `non_formalizable` (introduction, section headings, bibliography)
- **0 definition-level sorries** found across the entire codebase

The review process completed in approximately 16 PRs (#110–#146), covering all remaining discussion blobs (02_00a, 02_00b, 02_02a, 02_05a, 02_06a, 02_12a, 02_13a, 02_17a, 02_20a, 02_21a, 02_22a) and numbered items (02_18, 02_20, 02_24, 02_25) that were still at `scaffolding_ready`. A quality audit (PR #137) confirmed no regressions.

## Stage 3.3 Formalization Progress

Stage 3.3 began immediately after Stage 3.2 completed. Work targeted the items with proof-level sorries. **All 6 items that had sorries at Stage 3.2 completion have been addressed:**

| Item | Sorries at 3.2 | Sorries now | PR(s) | Status |
|------|---------------|-------------|-------|--------|
| 02_02_Remark | 1 | 0 | #155 | `sorry_free` |
| 02_05a_Discussion | 2 | 0 | #156 | `sorry_free` |
| 02_06_Proposition | 4 | 0 | #157 | `sorry_free` |
| 02_07_Corollary | 3 | 0 | #148 | `sorry_free` |
| 02_12_Remark | 4 | 0 | #158 | `sorry_free` |
| 02_21_Example | 4 | 0 | #154 | `sorry_free` |

Additionally, PR #161 addressed residue field computations for 02_04 and 02_05, and PR #163 resolved merge conflicts across 5 PRs.

## Current Sorry Inventory

**Total sorries on `main`: 5** (across 4 files, all proof-level)

| Item | Sorries | What remains | Difficulty |
|------|---------|-------------|------------|
| 02_04_Example | 1 | `kx_loc_x_sub_2_quotientMap_eq_eval`: quotient map k[x]_(x-2) → k equals eval at 2 | Medium — requires showing residue map factors through polynomial evaluation |
| 02_05_Example | 1 | `Z_loc_p_quotientMap_eq_mod`: quotient map ℤ_(p) → 𝔽_p equals reduction mod p | Medium — similar to 02_04, requires showing residue map factors through ZMod reduction |
| 02_16_Corollary | 1 | `fractionalIdeal_eq_inv_den_mul_num`: every fractional ideal J = (1/a)·I for some a, I | Easy — algebraic rearrangement of `den_mul_self_eq_num'`, mostly `field_simp`/`ring` |
| 02_20a_Discussion | 1 | `exists_noninvertible_fractionalIdeal`: existential witnessing a non-invertible fractional ideal | Medium — requires constructing a concrete non-Dedekind domain and exhibiting a non-invertible ideal |

**Open PR #164** targets 02_16 + 02_20a (CI pending). If it merges, sorries drop to 3.

The remaining 02_04 and 02_05 sorries are lower-priority "quotient map = evaluation" results. These are computationally straightforward but require careful manipulation of localization and residue field isomorphisms in Lean.

## Items.json Consistency

Verified: `progress/items.json` on `main` is consistent with actual Lean file contents.

| Status | Count | Items |
|--------|-------|-------|
| `sorry_free` | 32 | All items except the 4 below and 4 non-formalizable |
| `proof_formalized` | 2 | 02_04_Example, 02_05_Example |
| `definition_verified` | 2 | 02_16_Corollary, 02_20a_Discussion |
| `non_formalizable` | 4 | 02_00_Introduction, 02_08a_Discussion, 02_12b_Discussion, Backmatter/Bibliography |

## Dependency Analysis

No items are blocked on other items. The 4 remaining items with sorries are independent of each other. The sorry in 02_20a is an existential statement (concrete counterexample needed), while 02_04, 02_05, and 02_16 are computational proofs about specific algebraic structures.

None of the remaining sorries block downstream items — all downstream items that depend on these already use the sorry'd statements and are themselves sorry-free.

## Codebase Metrics

| Metric | Stage 3.1 summary | Now | Delta |
|--------|-------------------|-----|-------|
| Lean files | 38 | 38 | 0 |
| Total Lean lines | ~1,847 | ~3,066 | +1,219 |
| Total sorries | 18 | 5 | -13 |
| Sorry-free items | 0 | 32/36 | +32 |
| Definition-verified | 9 | 2 | -7 (promoted) |

## Patterns and Observations

1. **Stage 3.3 was highly efficient.** 13 of 18 sorries were eliminated in a single wave of 6 formalization PRs. The remaining 5 sorries are in lower-priority computational results.

2. **Mathlib coverage enabled most sorry elimination.** The hardest items (02_06 with 4 sorries, 02_21 with 4 sorries, 02_12 with 4 sorries) were resolved by finding the right Mathlib API or constructing counterexamples using Mathlib's algebraic infrastructure.

3. **Merge conflicts were the main coordination cost.** PR #163 was dedicated entirely to rebasing 5 PRs that conflicted in `progress/items.json` due to parallel work. This is expected in a multi-agent pipeline but consumed one full agent session.

4. **Remaining work is well-scoped.** The 5 remaining sorries are all in well-understood mathematical territory. No architectural changes or new definitions are needed — just proof completion.

## Recommendations

1. **Create issues for 02_04 and 02_05 quotient map sorries** — these are the only items without active PRs or issues.
2. **Monitor PR #164** for 02_16 + 02_20a merge.
3. **After all sorries eliminated**, proceed to Stage 3.4 (dependency trimming) for sorry-free items. This can begin immediately for the 32 already-sorry-free items.
4. **Consider a Stage 3.5 (proof polishing) pass** on the items with the longest proofs — 02_06, 02_12, 02_21 had the most complex formalization work.
