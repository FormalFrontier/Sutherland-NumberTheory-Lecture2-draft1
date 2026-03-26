# References: Lecture2/02_07_Corollary

**Coverage:** partially_covered

Corollary 2.7: I = ∩ I_p for ideals in an integral domain. Mathlib has the ideal version for Dedekind domains (iInf_localization_eq_bot). The general integral domain version may need proof.


## Mathlib Declarations

- `#check IsDedekindDomain.HeightOneSpectrum.iInf_localization_eq_bot`
  - Intersection of localizations of ideals in Dedekind domains
  - Import: `import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas`

## Gap Analysis

- **Gap:** I = ∩_p I_p for ideals in integral domain. General version may need proof.
- **External help:** Follows from 02_06_Proposition. Book proof strategy.

## Suggested Imports

```lean
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
```
