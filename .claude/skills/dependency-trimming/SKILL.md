---
name: dependency-trimming
description: Use when trimming dependencies for a formalized item (Stage 3.4), or when an issue title contains "dependency trimming". Covers how to analyze Lean imports and proof terms to determine actual direct dependencies.
allowed-tools: Read, Edit, Bash, Glob, Grep
---

# Dependency Trimming (Stage 3.4)

Replace conservative linear-chain dependencies with actual direct dependencies
by inspecting each item's Lean source code.

## When This Applies

An item is ready for dependency trimming when its status is `sorry_free` in
`progress/items.json`. Trimming can proceed per-item — it does not wait for
all items to be formalized.

## Methodology

For each item in the batch:

### Step 1: Check the Lean file's imports

```bash
head -5 SutherlandNumberTheoryLecture2/Lecture2/02_XX_ItemName.lean
```

Three cases:
- **`import Mathlib` only** → zero internal dependencies (`depends_on: []`)
- **`import SutherlandNumberTheoryLecture1`** → external dependency, NOT an
  internal dependency. Still `depends_on: []` for internal tracking.
- **`import SutherlandNumberTheoryLecture2.Lecture2.«02_YY_OtherItem»`** →
  actual internal dependency. Add `Lecture2/02_YY_OtherItem` to `depends_on`.

### Step 2: Verify with proof content

Even without an explicit import, check whether the proof terms reference
declarations from other items. Search for:
- `recall` statements that pull in declarations from other files
- Theorem names matching other items (e.g., `fractionalIdeal_mul_inv_le_one`)

If a declaration is used but comes from Mathlib (not another item), it's not
an internal dependency.

### Step 3: Update `dependencies/internal.json`

For each item, update:
```json
"Lecture2/02_XX_ItemName": {
  "depends_on": [],
  "notes": "Lean file only imports Mathlib; uses FractionalIdeal.inv_eq, mul_inv_cancel_iff (all Mathlib)."
}
```

Or with actual dependencies:
```json
"Lecture2/02_07_Corollary": {
  "depends_on": ["Lecture2/02_06_Proposition"],
  "notes": "Lean file imports 02_06_Proposition; proof applies Proposition 2.6 directly."
}
```

### Step 4: Update items.json status

After trimming, update the item's status from `sorry_free` to
`dependency_trimmed` in `progress/items.json`.

## Key Insight: Most Items Are Mathlib-Only

In this project, the vast majority of items have **zero internal dependencies**
because Mathlib already contains the fractional ideal, class group, and Dedekind
domain infrastructure. The book's definitions map directly to Mathlib's existing
formalizations.

This means the conservative linear chain is almost entirely unnecessary —
items are independent and can be polished in parallel.

## What Counts as a Dependency

| Source | Internal dependency? |
|--------|---------------------|
| `import Mathlib` | No |
| `import SutherlandNumberTheoryLecture1` | No (external) |
| `import ...Lecture2.«02_XX_Item»` | **Yes** |
| `recall` of a Mathlib declaration | No |
| `recall` of a project-defined declaration | **Yes** — find which file defines it |
| Theorem name from Mathlib used in proof | No |
| Theorem name from another item used in proof | **Yes** |

## Store Direct Dependencies Only

Never store transitive closure. If A depends on B and B depends on C,
only record A → B, not A → C. The graph can be traversed later.

## Verification

After updating all items in a batch:
1. Run `lake build` to confirm no regressions
2. Validate JSON: `python3 -c "import json; json.load(open('dependencies/internal.json'))"`
3. Check no item was accidentally given a dependency it doesn't actually use
