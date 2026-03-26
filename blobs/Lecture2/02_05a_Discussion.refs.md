# References: Lecture2/02_05a_Discussion

**Coverage:** fully_covered

Module localization S⁻¹M, tensor product equivalence S⁻¹M ≅ M ⊗_A S⁻¹A.


## Mathlib Declarations

- `#check LocalizedModule`
  - S⁻¹M as a type
  - Import: `import Mathlib.RingTheory.Localization.Module`
- `#check IsLocalizedModule`
  - Typeclass for module localization
  - Import: `import Mathlib.RingTheory.Localization.Module`
- `#check LocalizedModule.mk`
  - Constructor m/s for localized module elements
  - Import: `import Mathlib.RingTheory.Localization.Module`
- `#check LocalizedModule.equivTensorProduct`
  - S⁻¹M ≃ₗ M ⊗_A S⁻¹A
  - Import: `import Mathlib.RingTheory.Localization.Module`

## External Sources

- **Artin, Algebra (2nd ed.)** (textbook)
  - The lecture cites [2, Prop. 3.5] for the tensor-localization equivalence S⁻¹M ≅ M ⊗_A S⁻¹A, and [2, Prop. 3.11] for contraction/extension and prime ideal correspondence. These are in Mathlib but the t

## Suggested Imports

```lean
import Mathlib.RingTheory.Localization.Module
```
