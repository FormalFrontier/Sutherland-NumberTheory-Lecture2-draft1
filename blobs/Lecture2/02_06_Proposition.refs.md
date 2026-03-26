# References: Lecture2/02_06_Proposition

**Coverage:** partially_covered

Proposition 2.6 (M = ∩ M_p over all primes). Mathlib has related results for ideals in Dedekind domains but the general submodule-of-vector-space version may need custom proof.


## Mathlib Declarations

- `#check Submodule.iInf_localization_eq_bot (Maximal)`
  - Related intersection-of-localizations results for Dedekind domains
  - Import: `import Mathlib.RingTheory.Spectrum.Maximal.Localization`

## Gap Analysis

- **Gap:** General submodule intersection: M = ∩_p M_p. Mathlib has Dedekind domain version but not general integral domain version.
- **External help:** Must be proved from scratch following the book's proof. No external Lean source found.

## Suggested Imports

```lean
import Mathlib.RingTheory.Spectrum.Maximal.Localization
```
