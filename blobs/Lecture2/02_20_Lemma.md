**Lemma 2.20.** *A fractional ideal $I$ of $A$ is invertible if and only if $I(A \div I) = A$ (in which case $A \div I$ is its inverse).*

Before proving the lemma, note that $I(A \div I) \subseteq A$ always holds, since for $y \in I$ and $x \in A \div I$ we have $xy \in xI \subseteq A$, by the definition of $A \div I$. The lemma states that this inclusion is an equality precisely when $I$ is invertible.

---

$^2$The definition still makes sense when $J$ is the zero ideal, but $I \div (0) = K$ will typically not be finitely generated as an $A$-module, hence not a fractional ideal.
*Proof.* Suppose $I$ is invertible, with $IJ = A$. Then $jI \subseteq A$ for all $j \in J$, so $J \subseteq A \div I$, and $A = IJ \subseteq I(A \div I) \subseteq A$, so $I(A \div I) = A$. The reverse implication is immediate. $\square$

