**Proposition 2.9.** *Let $A$ be a noetherian domain. The following are equivalent:*

*(i) For every nonzero prime ideal $\mathfrak{p} \subset A$ the local ring $A_{\mathfrak{p}}$ is a DVR.*

*(ii) The ring $A$ is integrally closed and $\dim A \leq 1$.*

*Proof.* If $A$ is a field then (i) and (ii) both hold, so let us assume that $A$ is not a field, and put $K := \operatorname{Frac} A$. We first show that (i) implies (ii). Recall that $\dim A$ is the supremum of the length of all chains of prime ideals. It follows from Theorem 2.1 that every chain of prime ideals $(0) \subsetneq \mathfrak{p}_1 \subsetneq \cdots \subsetneq \mathfrak{p}_n$ extends to a corresponding chain in $A_{\mathfrak{p}_n}$ of the same length; conversely, every chain in $A_{\mathfrak{p}}$ contracts to a chain in $A$ of the same length. Thus

$$\dim A = \sup\{\dim A_{\mathfrak{p}} : \mathfrak{p} \in \operatorname{Spec} A\} = 1,$$

since every $A_{\mathfrak{p}}$ is either a DVR ($\mathfrak{p} \neq (0)$), in which case $\dim A_{\mathfrak{p}} = 1$, or a field ($\mathfrak{p} = (0)$), in which case $\dim A_{\mathfrak{p}} = 0$. Any $x \in K$ that is integral over $A$ is integral over every $A_{\mathfrak{p}}$ (since they all contain $A$), and the $A_{\mathfrak{p}}$ are integrally closed, since they are DVRs or fields. So $x \in \bigcap_{\mathfrak{p}} A_{\mathfrak{p}} = A$, and therefore $A$ is integrally closed, which shows (ii).

To show that (ii) implies (i), we first show that the following properties are all inherited by localizations of a ring: (1) no zero divisors, (2) noetherian, (3) dimension at most one, (4) integrally closed. (1) is obvious, (2) was noted in Remark 2.2, and (3) follows from Theorem 2.1 since, as argued above, we have $\dim A_{\mathfrak{p}} \leq \dim A$. To show (4), suppose $x \in K$ is integral over $A_{\mathfrak{p}}$. Then

$$x^n + \frac{a_{n-1}}{s_{n-1}} x^{n-1} + \cdots + \frac{a_1}{s_1} x + \frac{a_0}{s_0} = 0$$
for some $a_0, \ldots, a_{n-1} \in A$ and $s_0, \ldots, s_{n-1} \in S := A - \mathfrak{p}$. Multiplying both sides by $s^n$, where $s = s_0 \cdots s_{n-1} \in S$, shows that $sx$ is integral over $A$, hence an element of $A$, since $A$ is integrally closed. But then $sx/s = x$ is an element of $A_{\mathfrak{p}}$, so $A_{\mathfrak{p}}$ is integrally closed as claimed.

Thus (ii) implies that every $A_{\mathfrak{p}}$ is an integrally closed noetherian local domain of dimension at most 1, and for $\mathfrak{p} \neq (0)$ we must have $\dim A_{\mathfrak{p}} = 1$. Thus for every nonzero prime ideal $\mathfrak{p}$, the ring $A_{\mathfrak{p}}$ is an integrally closed noetherian local domain of dimension 1, and therefore a DVR, by Theorem 1.16. $\square$

