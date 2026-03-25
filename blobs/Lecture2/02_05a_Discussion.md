## 2.3 Localization of modules

The concept of localization generalizes immediately to modules. As above, let $A$ be a commutative ring, let $S$ be a multiplicative subset of $A$, and let $M$ be an $A$-module. The localization $S^{-1}M$ of $M$ with respect to $S$ is an $S^{-1}A$-module equipped with an $A$-module homomorphism $\iota\colon M \to S^{-1}M$ with the universal property that if $N$ is an $S^{-1}A$-module and $\varphi\colon M \to N$ is an $A$-module homomorphism, then $\varphi$ factors uniquely through $S^{-1}M$ (via $\iota$). Note that in this definition we are viewing $S^{-1}A$-modules as $A$-modules via the canonical homomorphism $A \to S^{-1}A$ that is part of the definition of $S^{-1}A$. Our definition of $S^{-1}M$ reduces to the definition of $S^{-1}A$ in the case $M = A$.

The explicit construction of $S^{-1}M$ is exactly the same as $S^{-1}A$, one takes the quotient of $M \times S$ modulo the same equivalence relation as in (1):

$$(a, s) \sim (b, t) \Leftrightarrow \exists u \in S \text{ such that } u(ta - sb) = 0,$$

where $a$ and $b$ now denote elements of $M$, and $\iota(a) := a/1$ as before. Alternatively, one can define $S^{-1}M := M \otimes_A S^{-1}A$ (see [2, Prop. 3.5] for a proof that this is equivalent). In other words, $S^{-1}M$ is the *base change* of $M$ from $A$ to $S^{-1}A$; we will discuss base change more generally in later lectures.

The map $\iota\colon M \to S^{-1}M$ is injective if and only if the map $M \xrightarrow{\times s} M$ is injective for every $s \in S$. This is a strong condition that does not hold in general, even when $A$ is an integral domain (the annihilator of $M$ may be non-trivial), but it applies to all the cases we care about. In particular, if $A$ is a subring of a field $K$ (in which case $A$ must be an integral domain whose fraction field lies in $K$) and $M$ is an $A$-module that is contained in a $K$-vector space. In this setting multiplication by any nonzero $s \in A$ is injective and we can view $M$ as an $A$-submodule of any of its localizations $S^{-1}M$.

We will mostly be interested in the case $S = A - \mathfrak{p}$, where $\mathfrak{p}$ is a prime ideal of $A$, in which case we write $M_{\mathfrak{p}}$ for $S^{-1}M$, just as we write $A_{\mathfrak{p}}$ for $S^{-1}A$.

