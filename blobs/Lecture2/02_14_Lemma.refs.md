# References: Lecture2/02_14_Lemma

**Coverage:** fully_covered

Lemma 2.14: I is f.g. A-submodule of K iff aI ⊆ A for some nonzero a. This is built into Mathlib's FractionalIdeal definition.


## Mathlib Declarations

- `#check FractionalIdeal`
  - Uses the aI ⊆ A characterization as its definition
  - Import: `import Mathlib.RingTheory.FractionalIdeal.Basic`
- `#check FractionalIdeal.isFractional`
  - Every fractional ideal satisfies the aI ⊆ A property
  - Import: `import Mathlib.RingTheory.FractionalIdeal.Basic`

## Suggested Imports

```lean
import Mathlib.RingTheory.FractionalIdeal.Basic
```
