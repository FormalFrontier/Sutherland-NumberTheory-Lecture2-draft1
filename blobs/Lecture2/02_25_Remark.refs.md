# References: Lecture2/02_25_Remark

**Coverage:** partially_covered

Remark 2.25: Dedekind domain is UFD iff cl(A) trivial. Mathlib has Dedekind + UFD → PID and the class group machinery, but the exact biconditional may need assembly.


## Mathlib Declarations

- `#check IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid`
  - Dedekind + UFD → PID
  - Import: `import Mathlib.RingTheory.DedekindDomain.PID`
- `#check ClassGroup.mk0_eq_one_iff`
  - Relates class group triviality to principalness of ideals
  - Import: `import Mathlib.RingTheory.ClassGroup`

## Gap Analysis

- **Gap:** Dedekind domain is UFD iff cl(A) trivial. Biconditional may need assembly.
- **External help:** Mathlib has both directions separately. Assembly needed.

## Suggested Imports

```lean
import Mathlib.RingTheory.ClassGroup
import Mathlib.RingTheory.DedekindDomain.PID
```
