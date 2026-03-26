# References: Lecture2/02_12_Remark

**Coverage:** partially_covered

Remark 2.12 discusses PID/UFD/Dedekind relationships. The key result (Dedekind + UFD → PID) is in Mathlib. The counterexamples (k[x,y] not Dedekind, Z[√(-13)] not UFD) would need construction.


## Mathlib Declarations

- `#check IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid`
  - Dedekind domain + UFD → PID
  - Import: `import Mathlib.RingTheory.DedekindDomain.PID`
- `#check Zsqrtd`
  - Z[√d] for d : ℤ (for Z[√(-13)] example)
  - Import: `import Mathlib.NumberTheory.Zsqrtd.Basic`

## Gap Analysis

- **Gap:** Counterexamples: k[x,y] not Dedekind, Z[√(-13)] not UFD.
- **External help:** Folklore results. Must be constructed. Z[√(-13)] available via Mathlib Zsqrtd.

## Suggested Imports

```lean
import Mathlib.NumberTheory.Zsqrtd.Basic
import Mathlib.RingTheory.DedekindDomain.PID
```
