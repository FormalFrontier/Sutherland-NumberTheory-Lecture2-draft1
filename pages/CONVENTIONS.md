# Transcription Conventions

## Book metadata

- **Course**: 18.785 Number Theory I
- **Lecture**: Lecture #2 — Localization and Dedekind domains
- **Term**: Fall 2025
- **Date**: 9/09/2025
- **Author**: Andrew V. Sutherland (MIT OCW)
- **Subject area**: algebraic number theory (localization of rings and modules, Dedekind domains, fractional ideals, ideal class group)

## Page inventory

8 pages total: pages 1–7 (content) + backmatter-1 (references).

## Notation conventions

Transcription agents should use the following conventions when converting PDF content to Markdown/LaTeX.

### Rings, fields, and modules

| Symbol | Meaning |
|--------|---------|
| $A$ | A commutative (unital) ring |
| $S$ | A multiplicative subset of $A$ (closed under finite products, $1 \in S$, $0 \notin S$) |
| $S^{-1}A$ | Localization of $A$ with respect to $S$ |
| $\iota\colon A \to S^{-1}A$ | Canonical ring homomorphism into the localization |
| $K$ | Fraction field of an integral domain $A$ |
| $M$ | An $A$-module |
| $S^{-1}M$ | Localization of module $M$ with respect to $S$ |

### Ideals and localization at a prime

| Symbol | Meaning |
|--------|---------|
| $\mathfrak{a}, \mathfrak{b}$ | Ideals of $A$ (or fractional ideals, from context) |
| $\mathfrak{p}, \mathfrak{q}$ | Prime ideals |
| $\mathfrak{m}$ | Maximal ideal |
| $\mathfrak{a}^e = \mathfrak{a}B$ | Extension of $\mathfrak{a}$ to $B$ |
| $\mathfrak{b}^c = \mathfrak{b} \cap A$ | Contraction of $\mathfrak{b}$ to $A$ |
| $A_{\mathfrak{p}}$ | Localization of $A$ at prime $\mathfrak{p}$ (i.e.\ $S^{-1}A$ with $S = A - \mathfrak{p}$) |
| $M_{\mathfrak{p}}$ | Localization of module $M$ at $\mathfrak{p}$ |

### Fractional ideals and class group

| Symbol | Meaning |
|--------|---------|
| $I, J$ | Fractional ideals of $A$ (finitely generated $A$-submodules of $K$) |
| $I \div J$ | Ideal quotient: $\{x \in K : xJ \subseteq I\}$ |
| $\mathcal{I}_A$ | Ideal group of $A$ (group of invertible fractional ideals) |
| $\mathcal{P}_A$ | Subgroup of nonzero principal fractional ideals |
| $\operatorname{cl}(A) = \mathcal{I}_A / \mathcal{P}_A$ | Ideal class group (Picard group) of $A$ |

### Dedekind domains

| Symbol | Meaning |
|--------|---------|
| Dedekind domain | Noetherian, integrally closed, dimension $\leq 1$ integral domain |
| DVR | Discrete valuation ring |
| PID | Principal ideal domain |
| UFD | Unique factorization domain |

### Numbered equations and results

The lecture numbers equations as (1), (2), (3), etc. Theorems, propositions, definitions, examples, remarks, and warnings are numbered within the lecture as 2.X (e.g., Theorem 2.1, Definition 2.7).

### References

The lecture cites:
- [1] M. F. Atiyah and I. G. MacDonald, *Introduction to Commutative Algebra*, Addison-Wesley, 1969.
- [2] P. Samuel, *Algebraic Theory of Numbers*, Hermann/Dover, 1970.

### Formatting notes

- Use `$...$` for inline math and `$$...$$` for display math.
- Use `\mathfrak{...}` for Fraktur letters (ideals).
- Use `\operatorname{...}` for named operators (cl, Frac, Pic, etc.).
- Preserve the lecture's equation numbering (1), (2), (3).
- Preserve the lecture's result numbering (Theorem 2.1, Definition 2.7, etc.).
- Commutative diagrams: describe in prose or use a simple text layout; do not attempt complex TikZ.
