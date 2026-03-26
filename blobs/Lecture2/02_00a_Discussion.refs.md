# References: Lecture2/02_00a_Discussion

**Coverage:** fully_covered

Localization S⁻¹A: definition, universal property, construction all in Mathlib.


## Mathlib Declarations

- `#check Localization`
  - S⁻¹A as a type
  - Import: `import Mathlib.RingTheory.Localization.Basic`
- `#check IsLocalization`
  - Typeclass for localization
  - Import: `import Mathlib.RingTheory.Localization.Basic`
- `#check Localization.mk`
  - Constructor a/s for localization elements
  - Import: `import Mathlib.RingTheory.Localization.Basic`
- `#check IsLocalization.lift`
  - Universal property of localization
  - Import: `import Mathlib.RingTheory.Localization.Basic`
- `#check IsFractionRing`
  - Fraction field as localization at nonZeroDivisors
  - Import: `import Mathlib.RingTheory.Localization.FractionRing`
- `#check FractionRing`
  - Concrete fraction field construction
  - Import: `import Mathlib.RingTheory.Localization.FractionRing`

## Suggested Imports

```lean
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.Localization.FractionRing
```
