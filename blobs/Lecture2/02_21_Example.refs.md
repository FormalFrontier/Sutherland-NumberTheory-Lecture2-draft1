# References: Lecture2/02_21_Example

**Coverage:** not_covered

Example 2.21: A = Z + 2iZ, I = 2Z[i] is not invertible as A-ideal. This specific example needs custom construction. Mathlib has GaussianInt (Z[i]) but not the subring Z + 2iZ.


## Mathlib Declarations

- `#check GaussianInt`
  - Z[i] (Gaussian integers)
  - Import: `import Mathlib.NumberTheory.Zsqrtd.GaussianInt`

## External Sources

- **Mathlib GaussianInt module** (mathlib_submodule)
  - Mathlib defines GaussianInt (Z[i]) and its ring structure. Example 2.21 needs the subring A = Z + 2iZ ⊂ Z[i], which is NOT in Mathlib and must be constructed from scratch.
  - Note: Z[i] is available; the subring Z + 2iZ and the proof that I = 2Z[i] is not invertible as an A-ideal must be built custom. This is the only 'not_covered' item.

## Gap Analysis

- **Gap:** A = Z + 2iZ, I = 2Z[i] not invertible. Subring Z + 2iZ not in Mathlib.
- **External help:** GaussianInt from Mathlib provides Z[i]. The subring and non-invertibility proof must be built from scratch.

## Suggested Imports

```lean
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
```
