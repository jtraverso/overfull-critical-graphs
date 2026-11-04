# Overfullness of critical graphs with small minimum degree in Lean 4

Author and maintainer: **Juan Pablo Traverso Gianini**. Licence: Apache-2.0 (see `LICENSE`).

A Lean 4 / Mathlib formalization of Theorem 1.2 of Y. Cao, G. Chen, G. Jing and S. Shan,
*The overfullness of graphs with small minimum degree and large maximum degree*, SIAM J. Discrete
Math. 36 (2022) ([arXiv:2105.05333](https://arxiv.org/abs/2105.05333)), **with the constant `−10`
in place of `−17`**.

| Lean | Statement |
|---|---|
| `Overfull.overfull_of_critical` | If `G` is `Δ`-critical and `3n + 7δ(G) ≤ 4Δ(G) + 10` (`n = \|V(G)\|`), then `G` is overfull: `\|E(G)\| > Δ(G) ⌊n/2⌋`. |
| `Overfull.overfull_of_critical_cc` | **Chen–Cao, Theorem 1.3** ([arXiv:2512.07252](https://arxiv.org/abs/2512.07252)) with `−6` in place of `−12`: if `G` is `Δ`-critical and `2n + 5δ(G) ≤ 3Δ(G) + 6`, then `G` is overfull. |
| `Overfull.overfull_of_critical_ccjs` | CCJS Theorem 1.2 with its original constant: if `G` is `Δ`-critical, `4Δ(G) − 7δ(G) ≥ 3n − 17` and `n + δ(G) ≥ 27`, then `G` is overfull. |

`G` is `Δ`-critical when it is connected, of class two (its line graph is not
`Δ(G)`-colourable) and `G − e` is `Δ(G)`-edge-colourable for every edge `e`. The definitions use
only Mathlib (`CCJSChallenge.lean`).

## Why the constant `−10`

The article assumes `4Δ − 7δ ≥ 3n − 17`. In Case 2 of its Section 3 (and in the fork branch of
Case 1) it finds a common neighbour of four vertices "by the same argument as in (1)"; that
argument needs degrees at least `Δ − k + 2`, but only `Δ − k + 1` is available, and the count
falls short by 2. With `3n + 7δ ≤ 4Δ + 10` every count closes; the proof then needs neither
`n ≥ 13` nor the Chetwynd–Hilton theorem for `Δ ≥ n − 3`. Details in
[`NOTES_KITES.md`](NOTES_KITES.md).

## Chen–Cao (version 2)

The proof of Chen and Cao's Theorem 1.3 replaces CCJS's four-centre counts by three-centre counts.
[`Broom`](Overfull/Broom.lean) proves their Lemma 3.1 (a broom with two leaves; the short kite
without its vertex `c`), [`Kite0D`](Overfull/Kite0D.lean) their Lemma 4.2 (a kite without `c`),
and [`CCa`–`CCd`](Overfull/CCd.lean), [`ChenCao`](Overfull/ChenCao.lean) the theorem; details in
[`NOTES_CHENCAO.md`](NOTES_CHENCAO.md).

## The proof

The article's proof is followed; the lemmas it imports are proved here.

- [`Basic`](Overfull/Basic.lean), [`Multifan`](Overfull/Multifan.lean),
  [`Linkage`](Overfull/Linkage.lean), [`VAL`](Overfull/VAL.lean): colourings of `G − e` as partial
  edge colourings of the registered Vizing entry; the multifan lemma (elementary vertex set and
  linkage); Vizing's adjacency lemma.
- [`Kierstead`](Overfull/Kierstead.lean), [`Kierstead4`](Overfull/Kierstead4.lean): Kierstead's
  lemma; Kierstead paths on four vertices (CCJS Lemma 2.4), proved without the book it is cited
  from ([`NOTES_KIERSTEAD4.md`](NOTES_KIERSTEAD4.md)).
- [`Fork*`](Overfull/Fork.lean): the fork lemma (CCJS Lemma 2.6 = Cao–Chen, JCTB 145 (2020),
  Proposition B; [`NOTES_FORK.md`](NOTES_FORK.md)).
- [`ShortKite*`](Overfull/ShortKite.lean): the short-kite lemma (CCJS Lemma 2.7, Cao–Chen–Shan).
- [`Kite*`](Overfull/KiteG.lean): the kite lemma (CCJS Lemma 2.8) in the form used by
  Theorem 1.2: a normalisation by Kempe changes, then the closing recolourings.
- [`Degree`](Overfull/Degree.lean), [`Lemma25`](Overfull/Lemma25.lean),
  [`Counting`](Overfull/Counting.lean), [`Theorem12a`–`d`](Overfull/Theorem12d.lean),
  [`Theorem12`](Overfull/Theorem12.lean): the degree dichotomy (Lemma 2.5), the Parity Lemma,
  Cases 1 and 2, and the theorem.

## Checks

Lean `v4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, and the registered entry
PALOMAR-2026-10-15-000004 ([jtraverso/vizing](https://github.com/jtraverso/vizing) @ `33b2de8`)
as a pinned dependency:

```
lake exe cache get
lake build
```

No `sorry`; the theorem depends only on `propext`, `Classical.choice` and `Quot.sound`; the
elaborated statements and definitions of `CCJSChallenge` and `CCJSSolution` are identical.

The Lean development was written by Claude Opus 5.5 (Anthropic) under the author's direction (see
`formalization.yaml`). No independent human review of the formalization is claimed.
