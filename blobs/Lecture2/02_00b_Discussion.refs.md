# References: Lecture2/02_00b_Discussion

**Coverage:** fully_covered

Ideal extension/contraction under localization; b = b^{ce} for localizations.


## Mathlib Declarations

- `#check Ideal.map`
  - Extension of an ideal under a ring homomorphism
  - Import: `import Mathlib.RingTheory.Ideal.Operations`
- `#check Ideal.comap`
  - Contraction of an ideal under a ring homomorphism
  - Import: `import Mathlib.Order.GaloisConnection`
- `#check IsLocalization.map_comap`
  - b^{ce} = b for localizations (extension-contraction identity)
  - Import: `import Mathlib.RingTheory.Localization.Ideal`

## External Sources

- **Atiyah & MacDonald, Introduction to Commutative Algebra** (textbook)
  - Standard reference for commutative algebra. The lecture cites [1, Prop. 11.19] for contraction/extension properties and [1, Cor. 11.20] for the prime ideal correspondence (Theorem 2.1). These results 
- **Artin, Algebra (2nd ed.)** (textbook)
  - The lecture cites [2, Prop. 3.5] for the tensor-localization equivalence S⁻¹M ≅ M ⊗_A S⁻¹A, and [2, Prop. 3.11] for contraction/extension and prime ideal correspondence. These are in Mathlib but the t

## Suggested Imports

```lean
import Mathlib.Order.GaloisConnection
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Localization.Ideal
```
