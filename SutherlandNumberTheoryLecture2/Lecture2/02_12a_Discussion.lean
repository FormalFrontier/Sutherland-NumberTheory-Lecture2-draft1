import Mathlib

/-!
# Discussion: integral closure of Dedekind domains

One of our first goals in this course is to prove that if A is a Dedekind domain
and L is a finite separable extension of its fraction field, then the integral
closure of A in L is a Dedekind domain. This includes the two main cases of
interest: A = ℤ with L a number field, and A = 𝔽_q[t] with L a global function
field.

See `blobs/Lecture2/02_12a_Discussion.md` for the source text.

## Mathlib Coverage

The main claim is fully covered by `IsIntegralClosure.isDedekindDomain`.
The examples ℤ and k[X] are Dedekind domains via the PID instance chain
(already shown in `02_11_Corollary.lean`).
-/

section Discussion_02_12a

/-! ## Main claim: integral closure of Dedekind domain is Dedekind

If A is a Dedekind domain with fraction field K, and L/K is a finite separable
extension, then the integral closure of A in L is a Dedekind domain. -/

#check @IsIntegralClosure.isDedekindDomain
  -- (A : Type) (K : Type) ... (L : Type) ... (C : Type) ...
  -- [IsDedekindDomain A] [FiniteDimensional K L] [Algebra.IsSeparable K L]
  -- [IsIntegralClosure C A L] → IsDedekindDomain C

/-! The integral closure itself is a Mathlib construction: -/

#check @integralClosure
  -- (R : Type) (A : Type) → [CommRing R] → [CommRing A] → [Algebra R A] → Subalgebra R A

/-! ## Examples: ℤ and k[X] are Dedekind domains

These are already established in `02_11_Corollary.lean` via the PID → Dedekind
instance chain. We recall them here as the two base cases for the integral
closure theorem above. -/

example : IsDedekindDomain ℤ := inferInstance

open Polynomial in
variable (k : Type*) [Field k] in
example : IsDedekindDomain k[X] := inferInstance

end Discussion_02_12a
