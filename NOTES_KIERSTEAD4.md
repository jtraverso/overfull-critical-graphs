# Kierstead paths with four vertices (CCJS Lemma 2.4) — proof without the book

Setting: `G` class two, `φ ∈ C^Δ(G − ab)`, `K = (a, b, u, v)` a Kierstead path:
`δ = φ(bu) ∈ φ̄(a)`, `γ = φ(uv) ∈ Γ := φ̄(a) ∪ φ̄(b)`. Put `S = φ̄(v) ∩ Γ`.
*Type 0*: `γ ∈ φ̄(a)`; *type 1*: `γ ∈ φ̄(b)`.

Known (multifan `(b; a, u)`): `{a, b, u}` elementary; `a, b` are `(θ, λ)`-linked for
`θ ∈ φ̄(a)`, `λ ∈ φ̄(b)`.

## Tools

- **L1.** `φ̄(v) ∩ φ̄(u) = ∅`: otherwise recolour `uv` by the common colour; then `γ` is missing at
  `u` and at `a` or `b`, while `(b; a, u)` is still a multifan.
- **L2 (type 1).** `S ∩ (φ̄(b) ∪ {δ}) = ∅`. Shift: colour `ab` by `δ`, uncolour `bu` (`ψ`). Then
  `(u; b, v)` is a multifan (`ψ(uv) = γ ∈ ψ̄(b)`), `δ ∈ ψ̄(u)`, `ψ̄(b) = φ̄(b)`, `ψ̄(v) = φ̄(v)`.
- **R (redistribution).** For `θ ∈ φ̄(a)`, `λ ∈ φ̄(b)`, swap the `a`–`b` chain `P_a(θ, λ)`.
  Then `θ ↦ b`, `λ ↦ a`, `Γ` and `φ̄(v)` are unchanged (`v` is internal to `P` or off `P`), so `S`
  is unchanged. The path stays Kierstead provided `bu` keeps a colour of `φ̄'(a)` (true when
  `δ ∉ {θ, λ}`, or when `δ = θ`, where `bu ∈ P` flips to `λ ∈ φ̄'(a)`), and `uv` keeps a colour of `Γ`.
- **Step 2 (type 0 → type 1).** If `θ ∈ S ∩ φ̄(b)`, swap the `(γ, θ)`-chain at `v`. `v` is an end,
  so the chain is not `P_a(γ, θ)` and avoids `a, b`; `bu` is untouched (`δ ∉ {γ, θ}`). Result:
  type 1 with `uv = θ`, `S' = S − θ + γ`.
- **Key lemma.** Type 0 with `φ(bu) ∈ S` and `S ∩ φ̄(b) ≠ ∅` is impossible: Step 2 gives type 1
  with `δ` still missing at `v`, contradicting L2.

## (a) `d(b) < Δ ⇒ V(K)` elementary

`d(u) < Δ` is Kierstead–Zhang (`kierstead_elementary`). For `d(b) < Δ`, take `θ ∈ S`.
- Type 1: `θ ∈ φ̄(a) \ {δ}` by L2. Pick `λ ∈ φ̄(b) \ {γ}` (`|φ̄(b)| ≥ 2`); R(θ, λ) keeps type 1
  and puts `θ ∈ S ∩ φ̄'(b)`, contradicting L2.
- Type 0: if `θ ∈ φ̄(a)`, apply R(θ, λ) for any `λ ∈ φ̄(b)` to move `θ` to `b`. Step 2 then gives
  type 1 with `γ ∈ S'`, and the type 1 case applies.

Together with L1 and the multifan, `V(K)` is elementary.

## (b) `|S| ≤ 1` (no degree hypothesis)

Suppose `θ₁ ≠ θ₂ ∈ S`.
- **A (make type 0).** In type 1, L2 gives `θ₁ ∈ φ̄(a) \ {δ}`. R(θ₁, γ): `v ∉ P`, so `uv ∉ P` and
  `uv = γ ∈ φ̄'(a)`.
- **B (make `φ(bu) ∈ S`).** If some `θ ∈ S ∩ φ̄(b)`, R(δ, θ) flips `bu` to `θ`. Otherwise
  (`S ⊆ φ̄(a)`, `δ ∉ S`), first R(θ, λ) moves some `θ ∈ S` to `b`.
- **C.** Let `δ* = φ(bu) ∈ S` and `θ' ∈ S \ {δ*}`. If `θ' ∈ φ̄(a)`, R(θ', λ) moves it to `b`
  (`bu`, `uv` untouched). Then the Key lemma gives a contradiction.

Each R and Step 2 keeps the hypotheses checked in the text above (path edges are off the
swapped chain, or flip inside `Γ` / `φ̄(a)`).
