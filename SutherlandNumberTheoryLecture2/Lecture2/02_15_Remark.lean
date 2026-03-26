import Mathlib

/-!
# Remark 2.15: Alternative Definition of Fractional Ideals

**Remark 2.15.** Lemma 2.14 gives an alternative definition of fractional ideals
that can be extended to domains that are not necessarily noetherian; they are
A-submodules I of K for which there exists a nonzero r ∈ A such that rI ⊆ A.
When A is noetherian this coincides with our definition above.

## Mathlib correspondence

Mathlib's `FractionalIdeal` uses exactly this alternative definition as its
*primary* definition: a fractional ideal is a submodule I with `IsFractional S I`,
which means ∃ a ∈ S, a • I ⊆ A. This works for all domains, not just noetherian
ones.

The remark's key claim — that for noetherian A the two definitions coincide —
is precisely `FractionalIdeal.fg_of_isNoetherianRing`.
-/

section Remark_2_15

/-! ### Mathlib uses the alternative definition

The book defines fractional ideals as f.g. A-submodules of K (Definition 2.13),
then observes (Remark 2.15) that the "∃ a, aI ⊆ A" characterization extends to
non-noetherian domains. Mathlib takes this alternative as the *primary* definition. -/

-- IsFractional is the ∃ a ∈ S, aI ⊆ A predicate — works for all domains
#check @IsFractional

-- FractionalIdeal is defined as submodules satisfying IsFractional
#check @FractionalIdeal

/-! ### Coincidence for noetherian rings

The remark's key claim: when A is noetherian, the "∃ a, aI ⊆ A" definition
coincides with the "finitely generated" definition. This is Lemma 2.14. -/

variable {A : Type*} [CommRing A] [IsDomain A] [IsNoetherianRing A]
variable {K : Type*} [Field K] [Algebra A K] [IsFractionRing A K]

-- For noetherian A, every Mathlib fractional ideal is finitely generated
#check @FractionalIdeal.fg_of_isNoetherianRing

/-- **Remark 2.15**: For noetherian A, the two definitions coincide.
Every Mathlib fractional ideal (which uses the IsFractional predicate) is
finitely generated over A. -/
theorem fractionalIdeal_fg_of_noetherian (I : FractionalIdeal (nonZeroDivisors A) K) :
    Submodule.FG (I : Submodule A K) :=
  FractionalIdeal.fg_of_isNoetherianRing le_rfl I

end Remark_2_15
