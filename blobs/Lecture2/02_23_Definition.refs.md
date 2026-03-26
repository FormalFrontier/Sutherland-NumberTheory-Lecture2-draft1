# References: Lecture2/02_23_Definition

**Coverage:** fully_covered

Definition 2.23: Ideal class group cl(A) = I_A / P_A. Directly in Mathlib as ClassGroup.


## Mathlib Declarations

- `#check ClassGroup`
  - The ideal class group (quotient of invertible fractional ideals by principal ones)
  - Import: `import Mathlib.RingTheory.ClassGroup`
- `#check ClassGroup.equiv`
  - ClassGroup R ≃* (FractionalIdeal)ˣ ⧸ (toPrincipalIdeal R K).range
  - Import: `import Mathlib.RingTheory.ClassGroup`

## Suggested Imports

```lean
import Mathlib.RingTheory.ClassGroup
```
