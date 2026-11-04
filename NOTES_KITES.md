# Short kites (CCJS Lemma 2.7) and kites (Lemma 2.8) — reconstructed proofs

Status (2026-11-04): CCJS Theorem 1.2 (variant `3n + 7δ ≤ 4Δ + 10`) is formalized without
hypotheses (`Overfull/Theorem12.lean`, `overfull_of_critical`); `shortKiteProp` and `kiteProp`
are proved.

## Gap found in CCJS §3 (arXiv 2105.05333v1, the only version)
Case 2 (and the fork branch of Case 1) find `u ∈ N(b)∩N(c)∩N(x)∩N(y)` "by exactly the same
argument as in (1)", but (1) needs `d(sᵢ) ≥ Δ−k+2` while Case 2 only has `d(x), d(y) ≥ Δ−k+1`;
with `4Δ−7δ ≥ 3n−17` the count is short by 2 (plus `a` may lie in the set). With `3n+7δ ≤ 4Δ+10`
every count closes (4-centre count: `Σd ≥ 3n+4k−6`). CDR uses the theorem with slack
`(y−2)(y−27)/3 ≥ 62`, so the variant suffices there. No `n ≥ 13` (hence no Chetwynd–Hilton) needed.

## Short kite `a b c u x y` (general form: `x`, `y` each miss some colour of `A`)
Hyp: `bu ∈ φ̄(a)`, `ux, cu, uy ∈ A`, `ac ∈ φ̄(b)`, `d(x), d(y) < Δ`. Goal: False.
- S1. `d(b)=d(u)=Δ` (K4(a) on `a b u x`); `d(c)=Δ` (K4(a) on `a c u x` in `ψ_c`: `ab:=β, ac` unc.).
  So `φ̄(b)={β}`, `ac=β`, `φ̄(u)=φ̄(c)=∅`.
- N1 (y misses β): if `y`'s colour `τ_y ∈ φ̄(a)`, swap the `a`–`b` chain `(τ_y, β)` (redistribution);
  `ac` flips to `τ_y`, `bu` stays in `φ̄(a)`; rename `β := τ_y`.
- N2 (`uy = β`): `y` misses `β`, `uy = ω`; swap `y`'s `(β, ω)`-chain (avoids `a, b`, linked; avoids `c`).
  Now `y` misses `σ ∈ φ̄(a)` (σ = ω), `uy = β`.
- Facts: `σ ≠ δ := φ(bu)` (else `b–u–y` is a `(δ,β)`-chain ending at `y`, but `a,b` linked).
- Case 1 (`x` misses σ =: η). `γ := φ(ux) ∈ φ̄(a)`. Ops on φ:
  unset ux; unset bu; swap `y`'s `(η,δ)`-chain Q (ends at `u`: `u,y` linked via fan `(u;b,y)` in
  `ψ_b` + pendant lemma: `a` isolated in the `(η,δ)`-graph after unsetting); set `ux:=η`;
  if `b ∉` u's `(β,γ)`-chain R: swap R at `u`, set `bu:=β`, set `ab:=δ` → total colouring.
  Else use the `c`-version (`ψ_c`, roles `b↔c`, δ↔ζ=φ(cu)). Both bad ⇒ in `G₀` = (β,γ)-graph of
  φ minus `ux, ac` (a isolated), `u, b, c` are three endpoints in one component (pendant lemma).
- Case 2 (`x` misses τ ≠ σ). Make `x` miss β:
  * if `u ∉` x's `(β,τ)`-chain: swap it at `x`.
  * else: R(τ,β); swap x's `(δ,τ)` [avoids u: b's chain via bu ends at a]; R(σ,τ); R(β,σ);
    swap x's `(β,δ)` [avoids u likewise]. Result: `x` misses β, `uy=β`, `y` misses σ, `bu=δ`, `ac=β`.
  Then with `ξ := φ(ux) ∈ φ̄(a)` (σ ≠ ξ by the fan `(u;b,y,x)` in `ψ_b`):
  R(ξ,β); unset ux; recolour `bu := ξ`; `ab := δ` → ψ ∈ C(G−ux), `ψ̄(u) ∋ δ`, `ψ̄(x) ∋ β, ξ`;
  fan `(u; x, y)`. Swaps at `a`: (δ,σ), (δ,ξ), (β,δ), (δ,σ) (each avoids u and x/y by linkage).
  Finally `u –ξ– b –δ– a` with `a` missing ξ: `u`'s `(δ,ξ)`-chain ends at `a`, but `u ~~ x`.

## Kite (Lemma 2.8) — reconstructed proof (`KiteA`–`KiteG`)
Form used: `d(b) = Δ` and **Robust**: in every colouring of `G − ab`, ≥ 7 colours of `φ̄(a)` are
missing at both `t₁, t₂` (for two small vertices of Theorem 1.2: `#F ≥ Δ − d(t₁) − d(t₂) − k + 1`,
and `3n + 7k ≤ 4Δ + 10`, `Δ ≥ k + 2` give `#F ≥ 7`). All kite edges are coloured in `A`, so CCJS
Lemma 4.1 (`d(u) = d(c) = Δ`) is not needed.
- **KNF** (`KiteC`): `φ̄(b) ∋ β`, `ac = β`, `bu = α`, `cu = τ`, `us₁ = β`, `us₂ = δ`,
  `s₁t₁ = s₂t₂ = γ`, `α, τ, δ, γ ∈ φ̄(a)`; `t₁, t₂` miss `α, β, τ`; `t₂` misses `δ`.
  * `x_reach` (`KiteA`): uncolour `bu`; the `(α, γ)`-chain of `t₁` reaches `u` (else it avoids `bu`
    and then `a, b` are not `(α, β)`-linked via `b u s₁ t₁`; or it reaches `b` first and
    `s₁t₁ → β`, swap, `us₁ → α`, `bu → β`, `ab → γ` colours `G`).
  * If `u` is off the `a`–`b` `(β, δ)`-chain: swap `u`'s chain (`us₂ = β`); `x_reach` for `t₂`;
    `t₁, t₂, u` are three ends of one `(α, γ)`-chain.
  * Else, uncolouring `us₂`, `u` reaches `a` or `b` (`reach_split`; `a, b, s₂` cannot be linked).
    To `a`: `y_close` (`KiteB`: swap `t₁`'s `(α, γ)`-chain, uncolour `us₂`, swap `u`'s `(β, δ)`-chain,
    `bu → β`, `s₂t₂ → δ`, `us₂ → γ`, `ab → α`). To `b`: colour `ab` by `β`, uncolour `ac`
    (pendant lemma), then `u` reaches `a` and `y_close` applies with `c` in place of `b`.
- **KS** (`KiteD`): KNF without the conditions on `us₁, us₂`.
  * `proc_tail`: switch `(τ, β)` off the `a`–`b` chain (it contains `a c u`), `a`–`b` swaps
    `(γ, β)`, `(ζ, γ)`, switch `(τ, ζ)` off the `a`–`b` chain, `a`–`b` swaps `(ξ, ζ)`, `(γ, ξ)`,
    `(β, γ)` (`ζ, ξ` fresh): restores `β, τ` at `t₁, t₂`; `usᵢ = β` is safe because `tᵢ sᵢ u` lies
    on the `(γ, β)`-chain of `tᵢ`.
  * `proc` (`KiteE`): switch `(μ, β)` off the `a`–`b` chain (`μ = φ(us₂)`): `t₁, t₂` miss `μ`;
    `us₂` keeps `μ` or becomes `β`.
  * `ks_false` (`KiteF`): one `usᵢ = β` ⇒ `proc` on the other edge gives KNF (or its mirror);
    otherwise `proc` on `us₂`, then `a`–`b` swaps `(γ, β)`, `(μ, γ)`.
- **P0** (`KiteG`): `a`–`b` swaps `(θ₁, β₀)`, `(α₁, θ₁)`, `(θ₂, α₁)`, `(τ₁, θ₂)`, `(θ₃, τ₁)` reach KS.
