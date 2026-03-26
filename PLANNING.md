# Formalization Planning Report

**Lecture 2: Rings of integers in number fields, localization, Dedekind domains, fractional ideals, and the ideal class group**

## Item Summary

| Category | Count |
|----------|-------|
| Fully covered by Mathlib | 22 |
| Partially covered | 8 |
| Not covered | 1 |
| Discussion only (no formalizable content) | 8 |
| Not applicable (bibliography) | 1 |
| **Total** | **40** |

Formalizable items: 31 (excluding 8 discussion-only + 1 bibliography).

---

## Suggested Formalization Order

Items are grouped into tiers. Within each tier, items can be parallelized. Tiers must be completed in order due to dependencies.

### Tier 0: Fully-covered foundations (trivial wrappers around Mathlib)

These items are direct matches to Mathlib declarations and can be formalized as thin wrappers with minimal effort. Start here to establish the project's type infrastructure.

| Item | Description | Mathlib Coverage |
|------|-------------|-----------------|
| `02_00a_Discussion` | Localization S⁻¹A | fully covered |
| `02_00b_Discussion` | Ideal extension/contraction | fully covered |
| `02_01_Theorem` | Prime ideal correspondence (Thm 2.1) | fully covered |
| `02_02_Remark` | Noetherian/PID preserved under localization | fully covered |
| `02_02a_Discussion` | Localization at prime A_p | fully covered |
| `02_05a_Discussion` | Module localization S⁻¹M | fully covered |
| `02_09_Proposition` | Dedekind domain characterization (Prop 2.9) | fully covered |
| `02_10_Definition` | Dedekind domain (Def 2.10) | fully covered |
| `02_11_Corollary` | PID → Dedekind (Cor 2.11) | fully covered |
| `02_12a_Discussion` | Integral closure of Dedekind domain | fully covered |
| `02_13_Definition` | Fractional ideal (Def 2.13) | fully covered |
| `02_14_Lemma` | f.g. A-submodule ↔ aI ⊆ A (Lem 2.14) | fully covered |
| `02_16_Corollary` | Fractional ideal = (1/a)I (Cor 2.16) | fully covered |
| `02_17_Definition` | Principal fractional ideal (Def 2.17) | fully covered |
| `02_17a_Discussion` | Fractional ideal operations | fully covered |
| `02_18_Lemma` | I ÷ J is a fractional ideal (Lem 2.18) | fully covered |
| `02_19_Definition` | Invertible fractional ideal (Def 2.19) | fully covered |
| `02_20_Lemma` | Invertibility criterion (Lem 2.20) | fully covered |
| `02_22_Definition` | Ideal group I_A (Def 2.22) | fully covered |
| `02_22a_Discussion` | Principal ideals P_A as subgroup | fully covered |
| `02_23_Definition` | Ideal class group cl(A) (Def 2.23) | fully covered |

### Tier 1: Partially-covered assembly items (moderate effort)

These items have Mathlib components available but need assembly or specific instantiation.

| Item | Description | Gap | Est. Effort |
|------|-------------|-----|------------|
| `02_04_Example` | k[x]_(x-2) is a DVR | Assemble polynomial localization + DVR | Medium |
| `02_05_Example` | Z_(p) is a DVR | Assemble Z localization + padic valuation | Medium |
| `02_06a_Discussion` | I_p = IA_p (module vs ideal localization) | Identify module/ideal localizations | Low-Medium |
| `02_08_Example` | Z = ∩ Z_(p) in Q | Concrete instance of Cor 2.7 | Medium |
| `02_12_Remark` | PID/UFD/Dedekind relationships + counterexamples | Two counterexamples need construction | Medium-High |
| `02_21a_Discussion` | Invertible ideals form abelian group | Assembly from Mathlib Units | Low |
| `02_24_Example` | DVR has trivial class group | Assembly from DVR + class group | Medium |
| `02_25_Remark` | Dedekind is UFD ↔ cl(A) trivial | Biconditional assembly | Medium |

### Tier 2: Items requiring new proofs

| Item | Description | Gap | Est. Effort |
|------|-------------|-----|------------|
| `02_06_Proposition` | M = ∩_p M_p (submodule intersection) | General integral domain version not in Mathlib | **High** |
| `02_07_Corollary` | I = ∩_p I_p for ideals | Follows from Prop 2.6; general version needed | Medium-High |
| `02_21_Example` | A = Z + 2iZ, non-invertible ideal | Only "not covered" item; custom subring construction | **High** |

### Tier 3: Discussion-only items (no formalization needed)

These items have no formalizable content. They should receive stub Lean files with docstrings referencing the blob text.

| Item | Description |
|------|-------------|
| `02_00_Introduction` | Lecture introduction |
| `02_03_Remark` | Notation ambiguity warning |
| `02_08a_Discussion` | Motivational discussion |
| `02_12b_Discussion` | §2.5 standing assumptions |
| `02_13a_Discussion` | Fractional vs integral terminology |
| `02_15_Remark` | Alternative definition for non-noetherian |
| `02_20a_Discussion` | Preview of Dedekind invertibility |
| `Backmatter/Bibliography` | Bibliography |

---

## Dependency Gaps

### Items depending on Lecture 1

Five items reference Lecture 1 material (DVR definitions, Theorem 1.16, number fields):

- `02_04_Example`, `02_05_Example` — use DVR characterization from Lecture 1
- `02_09_Proposition` — uses Theorem 1.16 (DVR equivalences)
- `02_12a_Discussion` — uses number field definitions
- `02_24_Example` — uses DVR properties

**Resolution:** A Lean 4 formalization of Lecture 1 exists at `FormalFrontier/Sutherland-NumberTheory-Lecture1-draft2` (pinned to commit `33c1d4d`, matching our Mathlib v4.28.0 toolchain). It can be added as a Lake dependency. However, most of these results are also independently in Mathlib (`IsDedekindDomainDvr`, `IsDiscreteValuationRing`, `NumberField`), so the Lecture 1 dependency is optional — Mathlib alone suffices for the mathematics.

### Items depending on textbook references

- `02_00b_Discussion`, `02_01_Theorem` — cite Atiyah-MacDonald [1] and Artin [2] for contraction/extension and prime ideal correspondence. These are in Mathlib (`IsLocalization.map_comap`, `IsLocalization.orderIsoOfPrime`).
- `02_05a_Discussion` — cites Artin [2] for tensor-localization equivalence. In Mathlib (`LocalizedModule.equivTensorProduct`).

**Resolution:** No gap. All cited textbook results are in Mathlib.

### External prerequisites not in Mathlib

| External Dep | Coverage | Items Affected | Resolution |
|-------------|----------|----------------|------------|
| `ext_gaussian_integers` (Z + 2iZ subring) | partial | `02_21_Example` | Must construct Z + 2iZ as a subring of Z[i] from scratch |
| `ext_z_sqrt_minus_13_not_ufd` | not covered | `02_12_Remark` | Must prove 14 = 2·7 = (1+√-13)(1-√-13) using `Zsqrtd` |
| `ext_k_xy_not_dedekind` | not covered | `02_12_Remark` | Must show dim k[x,y] ≥ 2 using `MvPolynomial` |
| `ext_global_fields_lecture1` (function fields) | partial | `02_12a_Discussion` | `FunctionField` exists in Mathlib but is less developed. Discussion item — may not need formalization. |

---

## Hardest Items

### 1. `02_06_Proposition` — M = ∩_p M_p (submodule intersection)

**Difficulty: High.** This is the general result that a finitely generated submodule of K^n (where K = Frac(A)) equals the intersection of its localizations at all primes. Mathlib has a version for ideals in Dedekind domains (`IsDedekindDomain.HeightOneSpectrum.iInf_localization_eq_bot`) but not the general integral domain version stated in the lecture. The proof requires:
- Module localization infrastructure
- A careful argument about denominator clearing across all primes
- Likely the most original Lean code in the project

### 2. `02_21_Example` — A = Z + 2iZ, I = 2Z[i] not invertible

**Difficulty: High.** This is the only item with "not covered" Mathlib status. Requires:
- Constructing Z + 2iZ as a subring of Z[i] (custom `def`)
- Defining the ideal I = 2Z[i] ∩ (Z + 2iZ) within this subring
- Computing the quotient ideal A ÷ I
- Proving I · (A ÷ I) ⊊ A (strict containment)
- The computation is elementary but the formalization involves many concrete ring elements

### 3. `02_12_Remark` — Counterexamples

**Difficulty: Medium-High.** Two independent counterexamples:
- **Z[√(-13)] is not a UFD:** Need to show 14 has two essentially different factorizations. Requires working with `Zsqrtd (-13)` norm, showing irreducibility of 2, 7, 1±√(-13).
- **k[x,y] is not Dedekind:** Need to exhibit a chain of prime ideals (0) ⊂ (x) ⊂ (x,y) of length 2, showing dim ≥ 2.

### 4. `02_07_Corollary` — I = ∩_p I_p

**Difficulty: Medium-High.** Depends on Proposition 2.6. If 2.6 is done, this follows. If 2.6 uses a different approach (e.g., Dedekind domain specific), then this corollary may need its own general proof.

### 5. `02_04_Example` and `02_05_Example` — Specific DVR examples

**Difficulty: Medium.** Not mathematically hard, but require assembling several Mathlib components (polynomial rings, localization, DVR characterization, p-adic valuations) and proving the assembled construction satisfies the DVR axioms.

---

## Recommended Execution Strategy

1. **Phase 3.1 (Scaffolding):** Create Lean files for all 40 items. Tier 0 items get nearly-complete scaffolds. Discussion items get stubs.

2. **Phase 3.2 (Review):** Quick pass to verify scaffolds match the mathematical content.

3. **Phase 3.3 (Proofs — Tier 0 first):** Complete the 21 fully-covered items. These should be fast (mostly `exact`, `apply`, and `simp` with Mathlib lemmas). This establishes the project's type infrastructure for harder items.

4. **Phase 3.3 (Proofs — Tier 1):** Work through assembly items. Prioritize items that are dependencies for later items (especially `02_06a_Discussion` → `02_07_Corollary`).

5. **Phase 3.3 (Proofs — Tier 2):** Tackle Proposition 2.6 first (it's the critical path). Then Example 2.21. Then the counterexamples in Remark 2.12.

6. **Parallel tracks:** Tier 0 items are all independent of each other (they only depend on Mathlib). Tier 1 items are mostly independent. Maximum parallelism in Tiers 0–1.
