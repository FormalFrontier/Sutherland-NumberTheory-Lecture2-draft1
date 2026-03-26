# References: Lecture2/02_16_Corollary

**Coverage:** fully_covered

Corollary 2.16: Every fractional ideal = (1/a)I. Follows from Mathlib's FractionalIdeal.isFractional.


## Mathlib Declarations

- `#check FractionalIdeal.isFractional`
  - Existence of a with aI ⊆ A, equivalent to I = (1/a)(aI)
  - Import: `import Mathlib.RingTheory.FractionalIdeal.Basic`
- `#check FractionalIdeal.coeIdeal`
  - Embedding of ideals into fractional ideals
  - Import: `import Mathlib.RingTheory.FractionalIdeal.Basic`

## Suggested Imports

```lean
import Mathlib.RingTheory.FractionalIdeal.Basic
```
