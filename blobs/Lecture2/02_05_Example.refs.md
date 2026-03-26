# References: Lecture2/02_05_Example

**Coverage:** partially_covered

Z_(p) is a DVR with p-adic valuation. Mathlib has padic valuation infrastructure but the specific localization-DVR example needs assembly.


## Mathlib Declarations

- `#check IsDiscreteValuationRing`
  - DVR typeclass
  - Import: `import Mathlib.RingTheory.DiscreteValuationRing.Basic`
- `#check padicValNat`
  - p-adic valuation on natural numbers
  - Import: `import Mathlib.NumberTheory.Padics.PadicVal`
- `#check ZMod`
  - Z/pZ (finite fields F_p)
  - Import: `import Mathlib.Data.ZMod.Basic`

## External Sources

- **Sutherland Number Theory Lecture 1 (FormalFrontier)** (lean4_library)
  - Formalization of Lecture 1 of Sutherland's 18.785 Number Theory I. Contains DVR definitions (Def 1.10), valuation rings (Def 1.11), local rings (Def 1.12), residue fields (Def 1.13), Theorem 1.16 (7-w
  - URL: https://github.com/FormalFrontier/Sutherland-NumberTheory-Lecture1-draft2
  - Lake require: `Sutherland-NumberTheory-Lecture1` (scope: `FormalFrontier`)
  - Note: Pinned to commit 33c1d4d (last commit on lean4 v4.28.0 / mathlib v4.28.0, matching this project's toolchain). Later commits upgraded to v4.29.0-rc8 and are incompatible.

## Gap Analysis

- **Gap:** Specific example: Z_(p) is a DVR with p-adic valuation. Mathlib has padic infrastructure but assembly needed.
- **External help:** Lecture 1 DVR definitions. Mathlib padic valuation.

## Suggested Imports

```lean
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.Padics.PadicVal
import Mathlib.RingTheory.DiscreteValuationRing.Basic
```
