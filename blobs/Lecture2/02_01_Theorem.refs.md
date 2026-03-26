# References: Lecture2/02_01_Theorem

**Coverage:** fully_covered

Theorem 2.1 (prime ideal correspondence under localization) is fully in Mathlib as an order isomorphism.


## Mathlib Declarations

- `#check IsLocalization.orderIsoOfPrime`
  - Order isomorphism between primes of S⁻¹A and primes of A disjoint from S
  - Import: `import Mathlib.RingTheory.Localization.AtPrime`

## External Sources

- **Atiyah & MacDonald, Introduction to Commutative Algebra** (textbook)
  - Standard reference for commutative algebra. The lecture cites [1, Prop. 11.19] for contraction/extension properties and [1, Cor. 11.20] for the prime ideal correspondence (Theorem 2.1). These results 
- **Artin, Algebra (2nd ed.)** (textbook)
  - The lecture cites [2, Prop. 3.5] for the tensor-localization equivalence S⁻¹M ≅ M ⊗_A S⁻¹A, and [2, Prop. 3.11] for contraction/extension and prime ideal correspondence. These are in Mathlib but the t

## Suggested Imports

```lean
import Mathlib.RingTheory.Localization.AtPrime
```
