# Plan — CCJS Lemma 2.6 = Cao–Chen, JCTB 145 (2020) 470–486, Proposition B (forks)

Source: the article, pp. 477–486. The proof uses only Lemma 3 (multifan: elementary and
`P_x(α,β) = P_{y_i}(α,β)`), i.e. `multifan_elementary` — not the 4-vertex Kierstead lemma.

## Definitions (p. 477)

- `G` Δ-critical, `xy ∈ E`, `φ ∈ C^Δ(G − xy)`, `α ∈ φ̄(x)`; `y_α` = neighbour of `y` with
  `φ(y y_α) = α`.
- `A(φ) = φ̄(x) ∪ φ̄(y)`, `B(φ) = [Δ] \ A(φ)`.
- `N_A(y_α) = {v ∈ N(y_α) \ {y} : φ(y_α v) ∈ A}`.
- **Fork** (Def. 1): seven vertices `{x, y, y_α, z₁, z₂, t₁, t₂}` with `zᵢ ∈ N_A(y_α)`,
  `tᵢ ∈ N(zᵢ)`, `φ(zᵢ tᵢ) ∈ A ∩ φ̄(t_{3−i})`. Ends `t₁, t₂`.
- Notation: `βᵢ = φ(y_α zᵢ)`, `γᵢ = φ(zᵢ tᵢ)`; `{α, β₁, β₂, γ₁, γ₂} ⊆ A`.
- **Prop B**: no φ-fork on `x y y_α` with `Δ ≥ d(x) + d(t₁) + d(t₂) + 1`.
- Remark 5.1: then `|A ∩ φ̄(t₁) ∩ φ̄(t₂)| ≥ 3`.
- `F`-rainbow: the five colours on the fork edges distinct. *xy-chain* `P_x(θ,η)` for `θ ∈ φ̄(x)`,
  `η ∈ φ̄(y)` (= `P_y(θ,η)` by Lemma 3); `F`-avoiding: uses no edge of `F`; swapping an
  `F`-avoiding xy-chain keeps `F` a fork and exchanges the roles (`θ ∈ φ̄'(y)`, `η ∈ φ̄'(x)`).
- delta-colour: `δ ∈ A ∩ φ̄(t₁) ∩ φ̄(t₂)`, `δ ∉ {α, β₁, β₂, γ₁, γ₂}` (exists by Remark 5.5).

## Structure of the proof (p. 480–486)

1. Claim 5.6: may assume `F`-rainbow (Cases 1/3 with items a1–a5; Cases 2/4 with b1–b7).
2. Claim 5.7: may assume `{α, β₁, β₂} ⊆ φ̄(t₁) ∩ φ̄(t₂)` (maximise `t(φ)`; Cases 1, 2).
3. Claim 5.8: may assume one of `γ₁, γ₂` missing at `y` (a1–a3).
4. Claim 5.9: colourings `φ₁, φ₂` with prescribed modifications at `e₁ = z₁t₁`.
5. Recolour `xy` by `α`, `y y_α` by `β₁`, uncolour `y_α z₁` → `ψ ∈ C^Δ(G − y_α z₁)`;
   Claim 5.10 (other end of `P_{y_α}(α, β₂, ψ)` is `t₁`); final Cases 1, 2 colour `G` with Δ
   colours — contradiction.

Operations needed: single-chain swap (`kempeSwap`), swap of "all other chains" (= global colour
transposition composed with a single-chain swap), recolouring/uncolouring single edges (moving the
uncoloured edge).

## Detailed proof (checked 2026-11-03), CCJS names

`x=a, y=b, y_α=u, z_i=s_i`. Fork colours: `α=φ(bu)∈φ̄(a)`, `β_i=φ(us_i)∈A`, `γ_i=φ(s_it_i)∈A∩φ̄(t_{3-i})`.
`D = A∩φ̄(t₁)∩φ̄(t₂)`. Hypothesis used (for every colouring of `G−ab`): `|D| ≥ 3`,
`|A∩φ̄(t_i)| ≥ 5` (Claim 5.8 needs 5; follows from `Δ ≥ d(a)+d(t₁)+d(t₂)+1` and `d(t_i) ≥ 2`).
Delta-colour: `δ∈D∖{α,β₁,β₂,γ₁,γ₂}`; exists when some of `α,β₁,β₂ ∉ D` (γ's never in D).

Operations: (S1) swap an F-avoiding a–b chain `P_a(θ,η)`, θ∈φ̄(a), η∈φ̄(b): fork kept with same
colours, θ↦b, η↦a, other vertices keep missing sets. (S2) swap the chain at a vertex `w∉{a,b}`
missing θ or η with θ,η∈A: a,b keep missing sets (linkage / isolation / internal). (S3) "switch
θ,η on all other chains" = global transposition, then swap back on `P` (`kempeSwapCompl`).
F-avoiding is typically shown by: the F-edge's colour is not θ,η, or the F-edge lies on the chain
of some `w∉{a,b}` missing θ or η (three-endpoints argument).

Claim 5.6 (rainbow), order: Case1, Case2, Case3 (→Case2 swapped), Case4 (→Case2).
- C1/3 (γ₁=α): a1 δ∈φ̄(a) [else swap P_{t₁}(δ,α): s₁t₁:=δ; t₂ isolated]; a2 η∈φ̄(b), P_a(δ,η) not
  through us₁,us₂ ⇒ S1 ⇒ δ∈φ̄(b) contra a1; a3 β₁∈φ̄(b)∩φ̄(t₁) ⇒ P_b(α,β₁)=b u s₁ t₁ ≠ a-end;
  a4 β₁∈φ̄(b)∖φ̄(t₁), P_a(δ,β₁) via us₁ ⇒ swap P_{t₁}(δ,β₁) ⇒ a3; a5 φ̄(b)={β₂}, P_a(δ,β₂) via us₂:
  S3 on (δ,β₂) ⇒ β₂∈D; then P_a(γ₂,β₂) F-avoiding (us₂,s₂t₂ on t₂'s chain) ⇒ γ₂∈φ̄(b) ⇒ a2 (C1) / a3 (C3).
- C2/4 (γ₁=β₂): b1 P_{t₁}(δ,β₂) passes us₂ [else swap it ⇒ rainbow / Case 2]; b2 β₂∈φ̄(b), α∈φ̄(t₁)∩φ̄(t₂)
  ⇒ swap P_{t₁}(α,β₂) ⇒ Case 1/3; b3 δ∈φ̄(b), α∈φ̄(t₁)∩φ̄(t₂) ⇒ β₂∈φ̄(a), S1 on P_a(β₂,δ) ⇒ b2;
  b4 δ∈φ̄(b) ⇒ S3 on (δ,α) ⇒ α∈φ̄(t₁)∩φ̄(t₂); new δ' ⇒ b3 (maybe after S1 on P_a(δ',δ));
  b5 β₂∈φ̄(b) ⇒ (δ∈φ̄(a) by b4) S1 on P_a(δ,β₂) ⇒ b4; b6 η∈φ̄(b), P_a(δ,η) not via us₁ ⇒ S1 ⇒ b4;
  b7 φ̄(b)={β₁}, P_a(δ,β₁) via us₁ ⇒ S3 (δ,β₁): Case 2 ⇒ S1 on P_a(β₂,β₁) ⇒ b5; Case 4 ⇒ s₂t₂:=δ ⇒ Case 2.
Claim 5.7 ({α,β₁,β₂}⊆D): maximise t(φ)=|{α,β₁,β₂}∩D| (F-edge colours fixed).
- Case 1 α∉T: a1 δ∈φ̄(a) [else S3 (α,δ) raises t]; a2 η∈φ̄(b) avoiding ⇒ S1 ⇒ a1; a3 φ̄(b)⊆{β₁,β₂},
  wlog β₁: S3 (δ,β₁), then S1 on P_a(γ₁,β₁) ⇒ a2 with η=γ₁.
- Case 2 β₁∉T, α∈T: b1 β₁∈φ̄(a) [else S3 (α,β₁) ⇒ Case 1]; b2 δ∈φ̄(a) [else S1 on P_a(δ,β₁)⇒b1 or
  S3 (δ,β₁) raises t]; b3 η∈φ̄(b), η≠β₂ ⇒ S1 ⇒ b2; b4 φ̄(b)={β₂}, β₂∈T (b1 for β₂) ⇒ S1 on
  P_a(γ₂,β₂) ⇒ b3.
Claim 5.8 (γ₁ or γ₂ ∈ φ̄(b)): else δ∈A∩φ̄(t₁)∖{α,β,γ}; a1 β's∈φ̄(a) [S1 P_a(γ_i,β_i)]; a2 δ∈φ̄(a)
  [S1 P_a(γ₁,δ)]; a3 η∈φ̄(b) ⇒ S1 P_a(δ,η) ⇒ a2.  Wlog γ₁∈φ̄(b).
Claim 5.9: φ₁ (s₁t₁:=α via P_{t₁}(α,γ₁); γ₂ to b; β₂ to b), φ₂ (s₁t₁:=β₂ via P_{t₁}(α,β₂); β₁ to b).
Final: ψ = (ab:=α, bu:=β₁, us₁ uncoloured). Claim 5.10: P_u(α,β₂,ψ) ends at t₁. Swap the (α,β₂)-chain
  through ab ⇒ ψ₁ (α∈ψ̄₁(a), else colour G); ψ₂ = swap P_a(α,β₁). Case 1: P_u(α,γ₂,ψ₂) not ending at
  a,b ⇒ swap, γ₂∈ψ̄(a), P_u(γ₂,β₂) ends at t₁, swap P_a(γ₂,β₂) (ab:=γ₂), switch a b u, colour us₁.
  Case 2: swap P_{t₂}(α,γ₂) (s₂t₂:=α), switch t₂ s₂ u, recolour s₁t₁:=β₁, colour us₁:=β₂.
