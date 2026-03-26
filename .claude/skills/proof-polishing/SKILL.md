---
name: proof-polishing
description: Use when polishing a sorry-free proof to Mathlib quality (Stage 3.5), or when an issue title contains "proof polish" or "proof cleanup". Covers tactic minimization, style conventions, and when to stop polishing.
allowed-tools: Read, Edit, Bash, Glob, Grep
---

# Proof Polishing (Stage 3.5)

Polish sorry-free proofs to Mathlib quality standards. An item is ready for
polishing when its status is `dependency_trimmed` in `progress/items.json`.

## Polishing Checklist

Work through each theorem/lemma in the file:

### 1. Combine redundant tactic steps

```lean
-- Before
rw [mul_comm]
rw [mul_assoc]
rw [inv_mul_cancel₀ h]

-- After
rw [mul_comm, mul_assoc, inv_mul_cancel₀ h]
```

### 2. Replace verbose sequences with powerful tactics

```lean
-- Before: 5 lines of simp/rw
rw [map_mul]
simp [spanSingleton_mul_spanSingleton]
rw [inv_mul_cancel₀ h]

-- After: one tactic if it works
simp [spanSingleton_mul_spanSingleton, inv_mul_cancel₀ h]
```

Test each replacement: if `simp` closes the goal, remove the preceding steps.

### 3. Use `simp only` instead of bare `simp` where possible

Bare `simp` is fragile — it can break when Mathlib updates add new simp lemmas.
Replace with `simp only [specific_lemmas]` when the lemma set is small and stable.

Exception: `simp` is fine for terminal goals where fragility doesn't matter.

### 4. Prefer `exact` over `apply` + `exact` chains

```lean
-- Before
apply mul_inv_cancel₀
exact h_ne_zero

-- After
exact mul_inv_cancel₀ h_ne_zero
```

### 5. Remove unnecessary intermediate lemmas

If a `have` is used exactly once immediately after, inline it:

```lean
-- Before
have h := foo bar
exact h.symm

-- After
exact (foo bar).symm
```

### 6. Use `field_simp` + `ring` for field equations

```lean
-- Instead of manual rw chains with inv_mul_cancel₀
field_simp [h_ne_zero]
ring
```

### 7. Check `calc` for multi-step equalities

If a proof is a chain of equalities, `calc` is often clearer:

```lean
calc x = y := by rw [...]
  _ = z := by rw [...]
  _ = w := by ring
```

## When NOT to Polish

- **Recall statements**: `recall` has no proof body — nothing to polish
- **`inferInstance` examples**: Already minimal
- **Proofs that document key steps**: If the proof mirrors the book's argument
  step by step, preserving those steps has pedagogical value. Don't golf a
  5-step proof into `exact?` output if the steps correspond to the book's reasoning.
- **Already-minimal proofs**: If the proof is 1-2 lines, it's probably fine.

## When to Stop

Polishing has diminishing returns. Stop when:
- Each proof compiles and has no sorry
- No obviously redundant steps remain
- `simp` calls use `simp only` where practical
- The proof reads clearly to someone familiar with the subject

Don't spend more than 10 minutes polishing a single proof. If it resists
simplification, it may already be near-optimal or require a fundamentally
different approach (which is out of scope for polishing).

## Verification

After polishing each file:
1. Run `lake build` — the file must still compile with zero errors
2. Verify no `sorry` was accidentally introduced
3. Check that `#check` / `recall` statements still type-check

## Status Transition

After polishing: update `progress/items.json` status from `dependency_trimmed`
to `proof_polished`.

## Stage 3.5 Retrospective (completed 2026-03-26)

All 36 items polished with zero failures. Key observations for future projects:

- **Most items needed no changes** — `recall`, `#check`, and `inferInstance`
  files are already minimal by construction. Budget polishing time only for
  items with substantive proofs (3+ tactic lines).
- **Term-mode conversion sometimes fails** — instance resolution issues can
  prevent converting tactic proofs to term mode. Don't force it; a clean
  2-line tactic proof is fine.
- **Batch polishing is efficient** — grouping 3-5 items per issue works well
  for parallelization without excessive overhead per issue.
