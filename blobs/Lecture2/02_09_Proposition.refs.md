# References: Lecture2/02_09_Proposition

**Coverage:** fully_covered

Proposition 2.9: Noetherian + integrally closed + dim ≤ 1 ↔ all localizations at nonzero primes are DVRs. This is exactly the Dedekind domain characterization in Mathlib.


## Mathlib Declarations

- `#check IsDedekindDomain`
  - Dedekind domain: noetherian, dim ≤ 1, integrally closed
  - Import: `import Mathlib.RingTheory.DedekindDomain.Basic`
- `#check IsDedekindDomainDvr`
  - DVR characterization of Dedekind domains
  - Import: `import Mathlib.RingTheory.DedekindDomain.Dvr`
- `#check IsDedekindDomain.isDedekindDomainDvr`
  - IsDedekindDomain → IsDedekindDomainDvr
  - Import: `import Mathlib.RingTheory.DedekindDomain.Dvr`
- `#check IsDedekindDomainDvr.ring_dimensionLEOne`
  - DVR localizations → dimension ≤ 1
  - Import: `import Mathlib.RingTheory.DedekindDomain.Dvr`
- `#check IsIntegrallyClosed`
  - Integrally closed typeclass
  - Import: `import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic`
- `#check Ring.DimensionLEOne`
  - Krull dimension ≤ 1 typeclass
  - Import: `import Mathlib.RingTheory.Ideal.Height`

## External Sources

- **Sutherland Number Theory Lecture 1 (FormalFrontier)** (lean4_library)
  - Formalization of Lecture 1 of Sutherland's 18.785 Number Theory I. Contains DVR definitions (Def 1.10), valuation rings (Def 1.11), local rings (Def 1.12), residue fields (Def 1.13), Theorem 1.16 (7-w
  - URL: https://github.com/FormalFrontier/Sutherland-NumberTheory-Lecture1-draft2
  - Lake require: `Sutherland-NumberTheory-Lecture1` (scope: `FormalFrontier`)
  - Note: Pinned to commit 33c1d4d (last commit on lean4 v4.28.0 / mathlib v4.28.0, matching this project's toolchain). Later commits upgraded to v4.29.0-rc8 and are incompatible.

## Suggested Imports

```lean
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.RingTheory.DedekindDomain.Dvr
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic
```
