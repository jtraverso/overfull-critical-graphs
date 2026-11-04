/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import Mathlib

/-!
# Overfullness of edge-chromatic critical graphs (Cao–Chen–Jing–Shan, Theorem 1.2)

Y. Cao, G. Chen, G. Jing and S. Shan, *The overfullness of graphs with small minimum degree and
large maximum degree* (arXiv:2105.05333), Theorem 1.2: a `Δ`-critical graph `G` of order `n` with
`4Δ(G) − 7δ(G) ≥ 3n − 17` is overfull. Stated here with the constant `−10` in place of `−17`:

* `Overfull.overfull_of_critical`: if `G` is `Δ`-critical and `3n + 7δ(G) ≤ 4Δ(G) + 10`, then
  `|E(G)| > Δ(G) ⌊n/2⌋`.

`G` is `Δ`-critical when it is connected, of class two (its line graph is not
`Δ(G)`-colourable), and `G − e` is `Δ(G)`-edge-colourable for every edge `e`.
-/

@[expose] public section

namespace Overfull

open SimpleGraph Finset

variable {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V} [DecidableRel G.Adj]

/-- `G` is of class two: no proper edge colouring with `Δ(G)` colours. -/
def IsClassTwo (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ¬ G.lineGraph.Colorable G.maxDegree

/-- `G` is `Δ`-critical: connected, of class two, and every edge-deleted subgraph is
`Δ(G)`-edge-colourable. -/
def IsDeltaCritical (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  G.Connected ∧ IsClassTwo G ∧
    ∀ e ∈ G.edgeSet, (G.deleteEdges {e}).lineGraph.Colorable G.maxDegree

/-- `G` is overfull: `|E(G)| > Δ(G) ⌊|V(G)|/2⌋`. -/
def IsOverfull (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  G.maxDegree * (Fintype.card V / 2) < #G.edgeFinset

/-- **CCJS Theorem 1.2 (variant).** A `Δ`-critical graph with `3n + 7δ ≤ 4Δ + 10` is
overfull. -/
theorem overfull_of_critical (hG : IsDeltaCritical G)
    (hcond : 3 * Fintype.card V + 7 * G.minDegree ≤ 4 * G.maxDegree + 10) : IsOverfull G := by
  sorry

end Overfull
