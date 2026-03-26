# References: Lecture2/02_06a_Discussion

**Coverage:** partially_covered

Localization of an ideal as module = extension of ideal. Mathlib has both concepts but the explicit identification I_p = IA_p may need assembly.


## Mathlib Declarations

- `#check Ideal.map`
  - Ideal extension IA_p
  - Import: `import Mathlib.RingTheory.Ideal.Operations`
- `#check LocalizedModule`
  - Module localization I_p
  - Import: `import Mathlib.RingTheory.Localization.Module`

## Suggested Imports

```lean
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Localization.Module
```
