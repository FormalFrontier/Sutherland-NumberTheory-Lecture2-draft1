**Proposition 2.6.** *Let $A$ be a subring of a field $K$, and let $M$ be an $A$-module contained in a $K$-vector space $V$ (equivalently, for which the map $M \to M \otimes_A K$ is injective).$^1$ Then*

$$M = \bigcap_{\mathfrak{m}} M_{\mathfrak{m}} = \bigcap_{\mathfrak{p}} M_{\mathfrak{p}},$$

*where $\mathfrak{m}$ ranges over the maximal ideals of $A$, $\mathfrak{p}$ ranges over the prime ideals of $A$, and the intersections take place in $V$.*

*Proof.* The fact that $M \subseteq \bigcap_{\mathfrak{m}} M_{\mathfrak{m}}$ is immediate. Now suppose $x \in \bigcap_{\mathfrak{m}} M_{\mathfrak{m}}$ and consider the $A$-ideal $\mathfrak{a} := \{a \in A : ax \in M\}$. For each maximal ideal $\mathfrak{m}$ we can write $x = m/s$ for some $m \in M$ and $s \in A - \mathfrak{m}$; we then have $sx \in M$ and $s \in \mathfrak{a}$, but $s \notin \mathfrak{m}$, so $\mathfrak{a} \nsubseteq \mathfrak{m}$. This holds for every maximal ideal $\mathfrak{m}$, so $\mathfrak{a} = (1)$. Thus $1 \in \mathfrak{a}$ and $x = 1 \cdot x \in M$; thus $\cap_{\mathfrak{m}} M_{\mathfrak{m}} \subseteq M$.

Each $\mathfrak{p}$ lies in some $\mathfrak{m}$ for which $M_{\mathfrak{m}} \subseteq M_{\mathfrak{p}}$, and every $\mathfrak{m}$ is a $\mathfrak{p}$, so $\cap_{\mathfrak{m}} M_{\mathfrak{m}} = \cap_{\mathfrak{p}} M_{\mathfrak{p}}$. $\square$

---

$^1$Here $M \otimes_A K$ is a tensor product of $A$-modules that is also a $K$-vector space. We need the natural map to be injective in order to embed $M$ in it. Note that $V$ necessarily contains a subspace isomorphic to $M \otimes_A K$.
