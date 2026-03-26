# References: Lecture2/02_04_Example

**Coverage:** partially_covered

k[x] localized at (x-2) is a DVR. Mathlib has DVR definition and polynomial rings. The specific example would need to be constructed.


## Mathlib Declarations

- `#check IsDiscreteValuationRing`
  - DVR typeclass
  - Import: `import Mathlib.RingTheory.DiscreteValuationRing.Basic`
- `#check Polynomial`
  - Polynomial ring k[x]
  - Import: `import Mathlib.Algebra.Polynomial.Basic`
- `#check Localization.AtPrime`
  - Localization at prime for building k[x]_(x-2)
  - Import: `import Mathlib.RingTheory.Localization.AtPrime`

## External Sources

- **Sutherland Number Theory Lecture 1 (FormalFrontier)** (lean4_library)
  - Formalization of Lecture 1 of Sutherland's 18.785 Number Theory I. Contains DVR definitions (Def 1.10), valuation rings (Def 1.11), local rings (Def 1.12), residue fields (Def 1.13), Theorem 1.16 (7-w
  - URL: https://github.com/FormalFrontier/Sutherland-NumberTheory-Lecture1-draft2
  - Lake require: `Sutherland-NumberTheory-Lecture1` (scope: `FormalFrontier`)
  - Note: Pinned to commit 33c1d4d (last commit on lean4 v4.28.0 / mathlib v4.28.0, matching this project's toolchain). Later commits upgraded to v4.29.0-rc8 and are incompatible.

## Gap Analysis

- **Gap:** Specific example: k[x] localized at (x-2) is a DVR. Needs assembly from Mathlib polynomial ring + localization + DVR infrastructure.
- **External help:** Lecture 1 provides DVR definition and Theorem 1.16 characterization. Proof strategy from the blob file.

## Suggested Imports

```lean
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Localization.AtPrime
```
