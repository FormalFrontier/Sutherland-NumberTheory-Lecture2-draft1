import Mathlib
import SutherlandNumberTheoryLecture1

/-!
# Definition 2.10: Dedekind Domain

A noetherian domain satisfying either of the equivalent properties of
Proposition 2.9 is called a *Dedekind domain*. Concretely, a Dedekind domain
is a noetherian, integrally closed domain of Krull dimension at most one.

## Mathlib correspondence

Mathlib defines `IsDedekindDomain` as `IsDomain A ∧ IsDedekindRing A`, where
`IsDedekindRing A` extends `IsNoetherian A A`, `Ring.DimensionLEOne A`, and
`IsIntegralClosure A A (FractionRing A)`. This matches the book's definition
exactly (noetherian + integrally closed + dim ≤ 1).
-/

section DedekindDomain

/-! ### The definition

**Definition 2.10.** A Dedekind domain is a noetherian, integrally closed domain
of Krull dimension ≤ 1. This is Mathlib's `IsDedekindDomain`. -/

#check @IsDedekindDomain  -- recall: (A : Type*) → [CommRing A] → Prop

/-! ### Component properties

The book defines a Dedekind domain as a noetherian domain satisfying the equivalent
conditions of Proposition 2.9: (i) every localization at a nonzero prime is a DVR, or
(ii) integrally closed with dim ≤ 1. Mathlib encodes condition (ii) directly as three
typeclasses. -/

-- Cross-reference: DVR definition from Lecture 1 (Definition 1.10)
recall IsDVR

-- A Dedekind domain is noetherian: every ideal is finitely generated.
#check @IsNoetherianRing

-- Krull dimension ≤ 1: every nonzero prime ideal is maximal.
#check @Ring.DimensionLEOne

-- A Dedekind domain is integrally closed in its fraction field.
#check @IsIntegrallyClosed

/-! ### Instances: a Dedekind domain has all three properties -/

variable {A : Type*} [CommRing A] [IsDomain A] [IsDedekindDomain A]

example : IsNoetherianRing A := inferInstance

example : Ring.DimensionLEOne A := inferInstance

example : IsIntegrallyClosed A := inferInstance

/-! ### Characterization theorem (Mathlib form)

The `iff` characterization shows the definition is independent of the
choice of fraction field. This is the Mathlib form of the equivalence
in Proposition 2.9 + Definition 2.10. -/

#check @isDedekindRing_iff

end DedekindDomain
