import Mathlib

/-!
# Corollary 2.11: Every PID is a Dedekind Domain

**Corollary 2.11.** Every PID is a Dedekind domain. In particular, ℤ is a Dedekind domain,
as is k[x] for any field k.

## Mathlib Coverage

This is fully covered by the instance `IsPrincipalIdealRing.isDedekindDomain`.
The chain is: Euclidean domain → PID → Dedekind domain. Both ℤ and k[x] are Euclidean
domains in Mathlib, so they automatically inherit PID and Dedekind domain instances.

See `blobs/Lecture2/02_11_Corollary.md` for the source text.
-/

section Corollary_2_11

/-! ## The main result: PID → Dedekind domain

Mathlib provides this as an instance (priority 100), so any PID is automatically
a Dedekind domain. -/

#check @IsPrincipalIdealRing.isDedekindDomain
  -- ∀ {A : Type u_1} [inst : CommRing A] [inst_1 : IsDomain A]
  --   [inst_2 : IsPrincipalIdealRing A], IsDedekindDomain A

/-! The proof uses three facts:
- A PID is noetherian (`PrincipalIdealRing.isNoetherianRing`)
- A PID has dimension ≤ 1 (`Ring.DimensionLEOne.principal_ideal_ring`)
- A PID (as a UFD) is integrally closed -/

#check @PrincipalIdealRing.isNoetherianRing
#check @Ring.DimensionLEOne.principal_ideal_ring

/-! The chain: Euclidean domain → PID → UFD → integrally closed -/

#check @EuclideanDomain.to_principal_ideal_domain

/-! ## Example: ℤ is a Dedekind domain

ℤ is a Euclidean domain, hence a PID, hence a Dedekind domain. -/

example : IsDedekindDomain ℤ := inferInstance

-- The intermediate steps are also available:
example : IsPrincipalIdealRing ℤ := inferInstance

/-! ## Example: k[x] is a Dedekind domain for any field k

Polynomial rings over fields are Euclidean domains, hence PIDs,
hence Dedekind domains. -/

open Polynomial in
variable (k : Type*) [Field k] in
example : IsDedekindDomain k[X] := inferInstance

open Polynomial in
variable (k : Type*) [Field k] in
-- The intermediate step:
example : IsPrincipalIdealRing k[X] := inferInstance

end Corollary_2_11
