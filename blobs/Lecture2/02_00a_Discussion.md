## 2.1 Localization of rings

Let $A$ be a commutative ring (unital, as always), and let $S$ be a multiplicative subset of $A$; this means $S$ is closed under finite products (including the empty product, so $1 \in S$), and $S$ does not contain zero. The *localization* of $A$ with respect to $S$ is a ring $S^{-1}A$ equipped with a ring homomorphism $\iota\colon A \to S^{-1}A$ that maps $S$ into $(S^{-1}A)^\times$ and satisfies the following universal property: if $\varphi\colon A \to B$ is a ring homomorphism with $\varphi(S) \subseteq B^\times$ then there is a unique ring homomorphism $S^{-1}A \to B$ that makes the following diagram commute:

$$A \xrightarrow{\varphi} B$$
$$\downarrow^{\iota} \nearrow_{\exists!}$$
$$S^{-1}A$$

and one says that $\varphi$ factors uniquely through $S^{-1}A$ (via $\iota$). As usual with universal properties, this guarantees that $S^{-1}A$ is unique (hence well-defined), provided that it exists. To prove existence we construct $S^{-1}A$ as the quotient of $A \times S$ modulo the equivalence relation

$$(a, s) \sim (b, t) \Leftrightarrow \exists u \in S \text{ such that } u(ta - sb) = 0. \tag{1}$$

We then use $a/s$ to denote the equivalence class of $(a, s)$ and define $\iota(a) := a/1$; one can easily verify that $S^{-1}A$ is a ring with additive identity $0/1$ and multiplicative identity $1/1$, and that $\iota : A \to S^{-1}A$ is a ring homomorphism. If $s$ is invertible in $A$ we can view $a/s$ either as the element $as^{-1}$ of $A$ or the equivalence class of $(a, s)$ in $S^{-1}A$; we have $(a, s) \sim (as^{-1}, 1)$, since $(a \cdot 1 - as^{-1} \cdot s) \cdot 1 = 0$, so this notation should not cause any confusion. For $s \in S$ we have $\iota(s)^{-1} = 1/s$, since $(s/1)(1/s) = s/s = 1/1 = 1$, thus $\iota(S) \subseteq (S^{-1}A)^\times$.

If $\varphi\colon A \to B$ is a ring homomorphism with $\varphi(S) \subseteq B^\times$, then $\varphi = \pi \circ \iota$, where $\pi$ is defined by $\pi(a/s) := \varphi(a)\varphi(s)^{-1}$. If $\pi\colon S^{-1}A \to B$ is any ring homomorphism that satisfies $\varphi = \pi \circ \iota$, then $\varphi(a)\varphi(s)^{-1} = \pi(\iota(a))\pi(\iota(s))^{-1} = \pi(\iota(a)\iota(s)^{-1}) = \pi((a/1)(1/s)) = \pi(a/s)$, so $\pi$ is unique.

In the case of interest to us, $A$ is actually an integral domain, in which case $(a, s) \sim (b, t)$ if and only if $at - bs = 0$ (we can always take $u = 1$ in the equivalence relation (1) above), and we can then identify $S^{-1}A$ with a subring of the fraction field of $A$ (which we note is the localization of $A$ with respect to $S = A_{\neq 0}$), and if $T$ is a multiplicative subset of $A$ that contains $S$, then $S^{-1}A \subseteq T^{-1}A$.

When $A$ is an integral domain the map $\iota\colon A \to S^{-1}A$ is injective, allowing us to identify $A$ with its image $\iota(A) \subseteq S^{-1}A$ (in general, $\iota$ is injective if and only if $S$ contains no zero divisors). When $A$ is an integral domain we may thus view $S^{-1}A$ as an intermediate ring that lies between $A$ and its fraction field: $A \subseteq S^{-1}A \subseteq \operatorname{Frac} A$.

