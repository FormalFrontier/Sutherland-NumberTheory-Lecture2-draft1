# References: Lecture2/02_19_Definition

**Coverage:** fully_covered

Definition 2.19: Invertible fractional ideal (IJ = A). Mathlib has Inv instance and mul_inv_cancel for Dedekind domains.


## Mathlib Declarations

- `#check FractionalIdeal.mul_inv_cancel`
  - I * I⁻¹ = 1 for nonzero fractional ideals in Dedekind domains
  - Import: `import Mathlib.RingTheory.DedekindDomain.Ideal.Basic`

## Suggested Imports

```lean
import Mathlib.RingTheory.DedekindDomain.Ideal.Basic
```
