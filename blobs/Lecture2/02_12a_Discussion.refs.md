# References: Lecture2/02_12a_Discussion

**Coverage:** fully_covered

Integral closure of Dedekind domain in finite separable extension is Dedekind. Directly in Mathlib.


## Mathlib Declarations

- `#check IsIntegralClosure.isDedekindDomain`
  - Integral closure of Dedekind domain in finite separable extension is Dedekind
  - Import: `import Mathlib.RingTheory.DedekindDomain.IntegralClosure`
- `#check integralClosure`
  - Integral closure of R in A
  - Import: `import Mathlib.RingTheory.IntegralClosure.Algebra.Basic`

## External Sources

- **Sutherland Number Theory Lecture 1 (FormalFrontier)** (lean4_library)
  - Formalization of Lecture 1 of Sutherland's 18.785 Number Theory I. Contains DVR definitions (Def 1.10), valuation rings (Def 1.11), local rings (Def 1.12), residue fields (Def 1.13), Theorem 1.16 (7-w
  - URL: https://github.com/FormalFrontier/Sutherland-NumberTheory-Lecture1-draft2
  - Lake require: `Sutherland-NumberTheory-Lecture1` (scope: `FormalFrontier`)
  - Note: Pinned to commit 33c1d4d (last commit on lean4 v4.28.0 / mathlib v4.28.0, matching this project's toolchain). Later commits upgraded to v4.29.0-rc8 and are incompatible.

## Suggested Imports

```lean
import Mathlib.RingTheory.DedekindDomain.IntegralClosure
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
```
