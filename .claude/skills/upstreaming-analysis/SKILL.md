---
name: upstreaming-analysis
description: Use when performing Stage 3.6 upstreaming analysis, or when an issue title contains "upstreaming", "Mathlib research", or "Phase 2". Covers how to search local Mathlib sources and assign verdicts.
allowed-tools: Read, Edit, Bash, Glob, Grep
---

# Upstreaming Analysis (Stage 3.6)

Identify formalized results worth contributing to Mathlib. No actual upstreaming
happens here — the output is a verdict per candidate and updates to `UPSTREAMING.md`.

## Phase 1: Lightweight Triage

Scan all proof-polished items. For each, decide:

- **Reject immediately** if the Lean file contains only `recall`, `#check`,
  `inferInstance`, or trivial 1-2 line glue between existing Mathlib facts.
- **Keep as candidate** if the proof is substantive (3+ lines of real tactics
  or term-mode proof) and the result appears absent from Mathlib's API.

Update `progress/items.json` with `"upstreaming_status"`: `"candidate"` or `"rejected"`.

Phase 1 is a batch operation — triage all items in one pass, one issue.

## Phase 2: Deep Mathlib Research

One issue per candidate. The goal is a verdict: **Include**, **Reject**, or **Refactor**.

### Where to search

**Always search the local Mathlib source** in `.lake/packages/mathlib/`. Do NOT
rely on web searches, `exact?`, or AI knowledge of Mathlib — these may be stale.

```bash
# Search by declaration name pattern
grep -r "theorem.*localization.*injective" .lake/packages/mathlib/Mathlib/ --include="*.lean" -l

# Search by type signature keywords
grep -r "IsLocalization" .lake/packages/mathlib/Mathlib/RingTheory/Localization/ --include="*.lean" -l

# Search docstrings
grep -r "canonical map.*injective" .lake/packages/mathlib/Mathlib/ --include="*.lean" -l
```

### Search strategy

1. **Start with the declaration's key types** — search for the main type constructors
   used in the statement (e.g., `FractionalIdeal`, `IsLocalization`, `LocalizedModule`).
   List all files that mention them.

2. **Read the most relevant files** — not just grep, but actually read the file to
   understand what API already exists. Skim the theorem statements.

3. **Check for equivalent formulations** — Mathlib may have the same result under a
   different name, using different typeclasses, or stated contrapositively. Common
   patterns:
   - `Iff` vs one direction only
   - `Submonoid` vs `IsLocalization` vs `Localization` (concrete type)
   - Property on `Ideal` vs `FractionalIdeal`
   - Result for `CommRing` vs `IsDomain`

4. **Check for close relatives** — if Mathlib has a very similar result, check whether
   the candidate is a straightforward corollary (1-2 line proof from the existing
   result). If so, it may still be worth upstreaming as API convenience, but note this.

5. **Check recent Mathlib PRs** — if the topic area is active, search
   `gh pr list --repo leanprover-community/mathlib4 --search "keyword" --state merged --limit 10`
   to see if something was recently added.

### Verdicts

- **Include**: Genuinely absent from Mathlib, substantive proof, correct, and at
  appropriate generality. Record in `UPSTREAMING.md` with:
  - Item ID, declaration name, file path
  - Lean statement (copy from source)
  - What was searched in Mathlib and what was found (be specific — list the files
    and declarations you checked)
  - Suggested Mathlib module for the contribution

- **Reject — already in Mathlib**: Found equivalent or near-equivalent result.
  Create a GitHub issue to refactor the proof to use the Mathlib declaration directly.
  Set `upstreaming_status` to `mathlib_covered`.

- **Reject — insufficient interest**: Too narrow, too specific to the textbook,
  or not at Mathlib-appropriate generality.

- **Refactor**: Our proof works but could be improved based on what we learned from
  Mathlib research (e.g., generalize from `IsDomain` to `CommRing`, or use a better
  API that we discovered).

### Writing the verdict

Update `UPSTREAMING.md` with the verdict. Use the existing table format — add a row
for Include verdicts, update the candidate row for Reject/Refactor.

Update `progress/items.json` with `"upstreaming_status"`: `"candidate"` (still under
review), `"mathlib_covered"`, `"rejected"`, or `"include"`.

## Common Pitfalls

- **Don't trust grep alone** — a grep hit for "localization.*injective" might be a
  completely different statement. Read the actual theorem to confirm.
- **Don't confuse `Localization` (concrete type) with `IsLocalization` (typeclass)** —
  Mathlib may have the result for one but not the other.
- **Don't dismiss near-matches** — if Mathlib has the `Iff` and we only have one
  direction, that's `mathlib_covered`. But if Mathlib has one direction and we have
  the other, that's a genuine contribution.
- **Generality matters** — a result for `CommRing` is more valuable than one requiring
  `IsDomain`. If our proof works more generally, note that in the verdict.

## Verification

After all Phase 2 research is complete:
- Every proof-polished item has an `upstreaming_status` in `progress/items.json`
- `UPSTREAMING.md` exists and covers all items (included and excluded)
- Each Include verdict documents what Mathlib files were searched
