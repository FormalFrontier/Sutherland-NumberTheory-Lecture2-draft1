import Mathlib

/-!
# Discussion: fractional ideals generalize ideals

Fractional ideals generalize the notion of an ideal: when A is noetherian the
ideals of A are precisely the finitely generated A-submodules of A, and when A
is also a domain we can extend this notion to its fraction field. Every ideal
of A is also a fractional ideal of A, but fractional ideals are typically not
ideals because they need not be contained in A.

See `blobs/Lecture2/02_13a_Discussion.md` for the source text.

## Mathlib Coverage

All three claims are covered by Mathlib:
1. Noetherian → ideals are f.g.: `IsNoetherian.noetherian`
2. Every ideal is a fractional ideal: coercion `↑I : FractionalIdeal`
3. Fractional ideals live in K, not A: by definition (`Submodule A K`)
-/

section Discussion_02_13a

variable (A : Type*) [CommRing A] [IsDomain A]
variable (K : Type*) [Field K] [Algebra A K] [IsFractionRing A K]

/-! ## Claim 1: When A is noetherian, ideals of A are finitely generated A-submodules

In a noetherian ring, every submodule (hence every ideal) is finitely generated.
This is the defining property captured by `IsNoetherianRing`. -/

example [IsNoetherianRing A] (I : Ideal A) : I.FG :=
  IsNoetherian.noetherian I

/-! ## Claim 2: Every ideal of A is a fractional ideal of A

Mathlib provides a coercion from `Ideal A` to `FractionalIdeal A⁰ K`.
This embedding is injective. -/

example (I : Ideal A) : FractionalIdeal (nonZeroDivisors A) K := ↑I

#check @FractionalIdeal.coeIdeal_injective A _ K _ _ _
  -- Function.Injective (↑· : Ideal A → FractionalIdeal A⁰ K)

/-! ## Claim 3: Fractional ideals need not be contained in A

By definition, a fractional ideal is a submodule of K (the fraction field),
not of A. The type signature makes this explicit: -/

#check @FractionalIdeal A _ (nonZeroDivisors A) K
  -- ... → Type
  -- Fractional ideals are `Submodule A K` satisfying `IsFractional`

#check @IsFractional A _ (nonZeroDivisors A) K
  -- ... → Submodule A K → Prop
  -- A submodule I of K is fractional if ∃ a ∈ A⁰, a • I ⊆ A

end Discussion_02_13a
