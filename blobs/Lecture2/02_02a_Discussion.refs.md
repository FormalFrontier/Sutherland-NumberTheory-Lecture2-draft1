# References: Lecture2/02_02a_Discussion

**Coverage:** fully_covered

Localization at prime A_p, local ring structure, unique maximal ideal.


## Mathlib Declarations

- `#check Localization.AtPrime`
  - Localization at a prime ideal A_p
  - Import: `import Mathlib.RingTheory.Localization.AtPrime`
- `#check IsLocalization.AtPrime`
  - Typeclass for localization at a prime
  - Import: `import Mathlib.RingTheory.Localization.AtPrime`
- `#check Localization.AtPrime.instIsLocalRing`
  - A_p is a local ring
  - Import: `import Mathlib.RingTheory.Localization.AtPrime`
- `#check IsLocalRing`
  - Local ring typeclass (unique maximal ideal)
  - Import: `import Mathlib.RingTheory.LocalRing.Basic`
- `#check IsLocalRing.maximalIdeal`
  - The unique maximal ideal of a local ring
  - Import: `import Mathlib.RingTheory.LocalRing.Basic`

## Suggested Imports

```lean
import Mathlib.RingTheory.LocalRing.Basic
import Mathlib.RingTheory.Localization.AtPrime
```
