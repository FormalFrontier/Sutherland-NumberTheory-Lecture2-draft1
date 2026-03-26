# References: Lecture2/02_02_Remark

**Coverage:** fully_covered

Noetherian and PID preserved under localization, ideal generation in localizations.


## Mathlib Declarations

- `#check IsLocalization.isNoetherianRing`
  - Localization of noetherian ring is noetherian
  - Import: `import Mathlib.RingTheory.Localization.Module`
- `#check Localization.AtPrime.isPrincipalIdealRing`
  - Localization of PID at prime is PID
  - Import: `import Mathlib.RingTheory.Localization.AtPrime`

## External Sources

- **Atiyah & MacDonald, Introduction to Commutative Algebra** (textbook)
  - Standard reference for commutative algebra. The lecture cites [1, Prop. 11.19] for contraction/extension properties and [1, Cor. 11.20] for the prime ideal correspondence (Theorem 2.1). These results 

## Suggested Imports

```lean
import Mathlib.RingTheory.Localization.AtPrime
import Mathlib.RingTheory.Localization.Module
```
