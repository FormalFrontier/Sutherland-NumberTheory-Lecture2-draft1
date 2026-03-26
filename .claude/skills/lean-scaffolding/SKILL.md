---
name: lean-scaffolding
description: Use when scaffolding a Lean file for a textbook item (Stage 3.1), reviewing scaffolding (Stage 3.2), or when an issue title contains "Scaffold". Covers recall vs def patterns, coverage completeness, and discussion blob assessment.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---

# Lean Scaffolding for FormalFrontier Items

This skill covers Stage 3.1 (scaffolding) and Stage 3.2 (scaffolding review)
of the FormalFrontier pipeline.

## Before You Start

1. Read the blob file: `blobs/<Chapter>/<ItemID>.md`
2. Read the refs file: `blobs/<Chapter>/<ItemID>.refs.md` (if it exists)
3. Check `research/mathlib-coverage.json` for the item's coverage level
4. Check `research/external-sources.json` for external references

## Key Decision: `recall` vs `def` vs `example`

| Situation | Use |
|-----------|-----|
| Definition exists in Mathlib with same meaning | `recall MathLibName` |
| Theorem exists in Mathlib | `recall MathLibTheoremName` |
| Instance synthesizable from Mathlib | `example : Class Type := inferInstance` |
| Definition NOT in Mathlib | `def` or `noncomputable def` (real body, never sorry) |
| Theorem NOT in Mathlib | `theorem ... := by sorry` |
| Book defines X differently from Mathlib's Y | `recall Y` + `theorem book_equiv_mathlib : BookX ↔ MathLibY` |

## Coverage Completeness (Critical)

Every new mathematical claim in the blob needs a corresponding Lean declaration.
Read the blob **sentence by sentence**:

- New concept introduced → `def`, `recall`, or `example`
- New fact stated → `theorem`, `lemma`, `recall`, or `example`
- Construction from one object to another → `def` + `theorem`
- Named concept not yet formalized → `def`, `abbrev`, or `recall`

A single `recall` does NOT cover a blob with multiple distinct claims.

## Discussion Blob Assessment

For discussion-type items (`_Discussion` suffix), assess whether they contain
formalizable claims:

**Formalizable claims** (need Lean declarations):
- Characterizations ("X is equivalent to Y")
- Constructions ("defining Z from W yields...")
- Named concepts introduced for the first time
- Non-trivial mathematical verifications

**Not formalizable** (skip with documented reason):
- Pure motivation ("intuitively, this means...")
- Historical context
- Notation setup already handled by imports
- Forward references to later sections

If ALL claims are non-formalizable: update `progress/items.json` with
status `non_formalizable` and a `reason` field listing each claim and why
it was excluded.

## File Structure

```
SutherlandNumberTheoryLecture2/Lecture2/02_01_Theorem.lean
```

Each file needs:
1. Module docstring (`/-! ... -/`) with the natural-language statement
2. Imports from Mathlib and earlier items
3. Lean declarations covering every claim in the blob

## Definition Integrity (Non-Negotiable)

**Never sorry the body of a `def`.** A sorry'd definition makes all
downstream theorems vacuous.

OK:
```lean
def mySubgroup : AddSubgroup ℤ where
  carrier := {n | 2 ∣ n}
  add_mem' := sorry    -- proof obligation, not data
  zero_mem' := sorry
  neg_mem' := sorry
```

NOT OK:
```lean
def mySubgroup : AddSubgroup ℤ := sorry  -- object doesn't exist!
```

## Scaffolding Review Checklist (Stage 3.2)

When reviewing another agent's scaffolding:

1. **Enumerate claims**: List every mathematical claim in the blob
2. **Map to Lean**: Match each claim to a Lean declaration
3. **Flag gaps**: Any unmapped claim = review failure
4. **Check equivalences**: Book wording ≠ Mathlib wording → need bridging theorem
5. **Check definitions**: No data is sorry'd, only proof obligations
6. **Build verification**: Run `lake build` on the file to confirm it compiles

Include the coverage audit as a checklist in the review PR body.

### Review Output Format

When updating `progress/items.json` after a review, write the `notes` field
with the full claim-by-claim audit. This format has proven effective across
20+ reviews:

```
"Stage 3.2 review passed. All N/N claims mapped: (1) <claim> — <Lean decl>,
(2) <claim> — <Lean decl>, ... No definition-level sorries. No gaps."
```

Set status to `definition_verified` when all claims are mapped and no
definition-level sorries exist. Proof-level sorries are expected and acceptable
at this stage.

### Correctly Omitted Content

Some blob content should NOT be formalized. Document these explicitly:
- Forward references to later lectures → "correctly omitted"
- Editorial remarks about terminology → "correctly omitted"
- Informal heuristics without precise statements → "correctly omitted"
- Set-theoretic descriptions already captured by type signatures → "appropriately omitted"

This prevents future reviewers from flagging intentional omissions as gaps.

## Handling items.json Merge Conflicts

When multiple agents work in parallel, `progress/items.json` is the most
common source of merge conflicts. During rebase:

1. Accept both sides — each agent's item updates are independent
2. Verify the merged JSON is valid: `python3 -c "import json; json.load(open('progress/items.json'))"`
3. Ensure no item's status was accidentally downgraded (e.g., `definition_verified` → `scaffolded`)

This is expected in parallel workflows and is not a sign of problems.

## Common Mistakes

- Using `recall` for a concept the book defines differently from Mathlib
  (need a bridging theorem)
- Writing a single `recall` for a blob with 5+ distinct claims
- Sorry'ing a `def` body instead of constructing the data
- Defining a book concept then silently using the Mathlib version in later theorems
- Skipping a discussion blob that actually contains formalizable characterizations
