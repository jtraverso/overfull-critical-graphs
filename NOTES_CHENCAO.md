# Chen–Cao, *Short brooms in edge-chromatic critical graphs* (arXiv:2512.07252v2)

**Status (2026-11-04): formalized with the constant −6** (`Overfull/ChenCao.lean`):
`overfull_of_critical_cc` (`2n + 5δ ≤ 3Δ + 6` ⇒ overfull) and the corollary
`overfull_of_critical_ccjs` (CCJS Theorem 1.2 with its original constant −17 when `n + δ ≥ 27`).
Components: `broomProp` (Lemma 3.1, `Broom*`), `kite0Prop` (Lemma 4.2, robust form, `Kite0*`,
with the closing argument `z_close`), `exists_good_common₃` (`CCCount`), frame `CCa`–`CCd`
(copy of `Theorem12a`–`d`). Not needed: Chetwynd–Hilton, Lemma 4.5 (ii), the fork lemma with
three colours only. The constant −6 comes from the coarse three-centre count
(`Σd ≥ 2n + 3k − 4`); the paper's −12 needs its refined count and Lemma 4.5 (ii), and Lemma 4.2
with four common colours (our normalisation needs five).

## Original plan

Target: **Theorem 1.3.** A `Δ`-critical graph with `3Δ ≥ 2n + 5δ − 12` is overfull. It implies CCJS
Theorem 1.2 (`(3n + 7k − 10)/4 ≥ (2n + 5k − 12)/3 ⇔ n + k + 18 ≥ 0`), hence also our variant.

## Structure of the proof (§4) and what we already have

Setting as in CCJS (`a = x` of minimum degree `k`, `b = y` a `Δ`-neighbour, `φ ∈ C^Δ(G − xy)`).
Small: `d(v) ≤ n − Δ + 2k − 6` (same as our `Small`).

| Step | Content | Status |
|---|---|---|
| Δ ≤ n − 4 | Chetwynd–Hilton 1989 for `Δ ≥ n − 3`; gives `n ≥ 5k`, `n ≥ 10` | **not in hand** (backlog F) |
| Lemma 4.5 | dichotomy `d(v) ≥ Δ − k + 1` or small, under `k ≤ (2Δ − n + 5)/3`; (ii) two small vertices of degree exactly `n − Δ + 2k − 6` are adjacent | new (counting, like our `Lemma25`) |
| Case 1 | two small `t₁, t₂`: **three** centres `y, s₁, s₂` (count (1): `3Δ − 2k − 2n + 7 ≥ 3(k−2) + 1`) | count new; uses `exists_good_common`-type lemma |
| Case 1, equal colours | **Lemma 4.2**: `K = (x,y,z,s₁,t₁)`, `K* = (x,y,z,s₂,t₂)`, `φ(s₁t₁) = φ(s₂t₂)` ⇒ `|Γ| ≤ 3` | **new**: no vertex `c`; only 4 common colours (`3Δ − 2n − 5k + 16 ≥ 4`), so our robust kite proof does not apply |
| Case 1, fork | Lemma 4.3 (fork) with only `≥ 3` common colours for all colourings | ours (`no_fork`) also needs `≥ 5` colours of `A` at each `tᵢ`: here `≥ (n + k)/3`, fails for `n + k < 15` |
| Case 2 | one small vertex: `u, v` from CCJS p. 2265, **three** centres `y, u, v` with `d(u), d(v) ≥ Δ − k + 1` | count closes under Chen–Cao (unlike CCJS's four centres) |
| Case 2, closing | **Lemma 3.1**: `(x,y,z,u)`, `(x,y,z,v)` Kierstead, `u, v` each missing a colour of `A` ⇒ impossible | **new**: Theorem 1.1 for a broom with two leaves at `z` |

## Lemma 3.1 = Theorem 1.1 for two leaves (Case A only)

`d(y) < Δ` or `d(z) < Δ`: our `IsK4.not_common_of_degree_b / _u` already give it. Otherwise
`φ̄(y) = {1}`, `φ(yz) = ζ ∈ φ̄(x)`, `φ(zv) = α₀`, `φ(zu) = β₀` in `A`, `v` misses `α ∈ A`, `u` misses
`β ∈ A`: only Case A of the paper is needed (`t = s = 1`), with Claims 1–2 and Subcases A.1
(`α = β`) and A.2 (`α ≠ β`).

## Risks (to settle before formalizing the frame)
1. Chetwynd–Hilton for `Δ ≥ n − 3` (or a variant constant that avoids it, as for CCJS).
2. The fork lemma with `≥ 3` common colours only (Cao–Chen, Remark 5.1) — re-check Claim 5.8.
3. Lemma 4.2 without `c`: the paper's normalisation (p. 12–13) and its new closing argument
   (uncolour `zs₁`, swap `P_[s₁,y](β, η)`, colour `xy` by `η`) must be reconstructed and checked.
