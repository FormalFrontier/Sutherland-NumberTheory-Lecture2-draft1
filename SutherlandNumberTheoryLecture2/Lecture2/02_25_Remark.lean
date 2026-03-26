import Mathlib

/-!
# Remark 2.25: Dedekind UFD iff trivial class group; Picard group

See `blobs/Lecture2/02_25_Remark.md` for the source text.

This remark makes three claims:
1. A Dedekind domain is a UFD if and only if its ideal class group is trivial
   (proof deferred to the next lecture)
2. cl(A) measures how far A is from being a UFD
3. (Footnote 3) For a noetherian domain, the Picard group is canonically
   isomorphic to the ideal class group

## Mathlib correspondence

- Claim 1 (⇒ direction): `IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid`
  shows Dedekind + UFD → PID, and PID has trivial class group.
- Claim 1 (⇐ direction): A Dedekind domain with trivial class group is a PID,
  hence a UFD.
- Claim 3: `ClassGroup.equivPic` gives ClassGroup R ≃* Pic R.
-/

section RemarkDedekindUFD

/-! ### Claim 1a: Dedekind + UFD → trivial class group

If A is a Dedekind domain and a UFD, then it is a PID. A PID has trivial
class group. -/

-- Dedekind + UFD → PID
#check @IsPrincipalIdealRing.of_isDedekindDomain_of_uniqueFactorizationMonoid

-- PID → trivial class group
#check @card_classGroup_eq_one

/-! ### Claim 1b: Dedekind + trivial class group → UFD

The converse direction: if cl(A) = 1 then every ideal is principal
(PID), and a PID is a UFD. -/

-- For Dedekind domains: |cl(A)| = 1 ↔ A is a PID
#check @card_classGroup_eq_one_iff

-- PID → UFD
#check @PrincipalIdealRing.to_uniqueFactorizationMonoid

/-! ### Claim 2: cl(A) measures distance from UFD

This is a conceptual/motivational remark — no Lean formalization needed.
The formal content is captured by Claim 1: cl(A) = 1 ↔ A is a UFD
(for Dedekind domains). -/

/-! ### Claim 3 (Footnote 3): Picard group ≅ ideal class group

For a noetherian domain, the Picard group Pic(A) (group of isomorphism
classes of invertible A-modules under tensor product) is canonically
isomorphic to the ideal class group cl(A). -/

-- The canonical isomorphism ClassGroup R ≃* Pic R
#check @ClassGroup.equivPic

end RemarkDedekindUFD
