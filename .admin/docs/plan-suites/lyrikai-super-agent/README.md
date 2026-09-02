# Plan suite — Lyrikai Super Agent

> **Superseded (2026-09)** — harness v0 paper. Live product: [README.md](../../../README.md) + [ROUTING.md](../../../ROUTING.md).

**Slug:** `lyrikai-super-agent`  
**Status:** PAPER (BPS Step A complete — fill pending conductor GO)  
**Placement:** Non-Hive · `lyrikai-agent` greenfield leaf  
**Root:** `lyrikai-agent/.admin/docs/plan-suites/lyrikai-super-agent/`  
**Recorded:** 2026-08-30

**Ops SoR (tip):** [`hive-vip-1/hive-vip-1_main/factory/PLANNING-ATTIC.md`](../../../../hive-vip-1/hive-vip-1_main/factory/PLANNING-ATTIC.md) — cite by path; do not fork.  
**Parent attic index:** [`../README.md`](../README.md)

---

## Purpose

Pre-unit paper for the **Lyrikai Super Agent** — one MIT-licensed harness package that presents Queen + Trinity + Hive foundation as a single Cursor-visible agent, with scene-first routing, permission tiers, and lite trust gates. Companion skill bodies stay in VIP tip; this product emits manifest, boot ladder, router, install scripts, and agent shell only.

| Audience | Deliverable |
|----------|-------------|
| **Humans** | Clone [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent), run install, pick agent in Cursor |
| **Agents** | Fresh-agent-complete unit plans describing exact emits per slice |

**Product home:** [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent) is the canonical public repo. `lk-bloom/lyrikai-agent/` is optional monorepo dev path only; lk-bloom PR #5 is historical, not the long-term public face.

This suite is a **plan-to-build-plans** package. It does **not** implement the agent package (Step B fill is separate conductor GO).

---

## How any agent should start

1. Read **this README** (walls + ordered index).
2. Read [`END-GOAL.md`](./END-GOAL.md) — measurable stop line.
3. Cite tip law only — do not edit Hive tip without Admin GO.
4. Execute **plan 01** first unless conductor names a later unit.
5. Optional: `/prep-prompt` to mint a pasteable kickoff for unit 1 after suite acceptance.

**First entrypoint:** this file → then [`plans/01-product-scaffold.md`](plans/01-product-scaffold.md).

---

## SoR inputs (cite; do not invent parallel law)

| Input | Path | Role |
|-------|------|------|
| Unified plan | `.cursor/plans/lyrikai_super_agent_68b7acfa.plan.md` | Design intent + execution order |
| Lyrikai skill | tip `factory/skills/lyrikai/SKILL.md` | Current auto-stack + walls |
| Skill phone book | tip `factory/skills/lyrikai/ADMIN-SKILLS.md` | Ring membership source |
| Agent card pattern | tip `AGENT-CARD.md` | L0 shape (~80 lines) |
| Ecosystem wiki | `lyrikai-meta/wiki/` | Proposals, catalog, research attic |
| Public remote (canonical) | [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent) | MIT public repo — clone, install, releases |
| Monorepo dev path | `lk-bloom/lyrikai-agent/` | Optional; publish to public remote |
| Trinity gears precedent | `lk-gears/admin/storehouse/trinity-gears-fork/` | Bundling pattern — cite only |

---

## Ordered plan index

| # | Plan | Path | Unlocks |
|---|------|------|---------|
| 01 | Product scaffold | [`plans/01-product-scaffold.md`](plans/01-product-scaffold.md) | 02–05 |
| 02 | Boot ladder | [`plans/02-boot-ladder.md`](plans/02-boot-ladder.md) | 03 |
| 03 | Scene router + trust gates | [`plans/03-scene-and-trust-gates.md`](plans/03-scene-and-trust-gates.md) | 04 |
| 04 | Agent shell + install | [`plans/04-agent-shell-and-install.md`](plans/04-agent-shell-and-install.md) | 05, verify |
| 05 | Meta cross-links | [`plans/05-meta-crosslinks.md`](plans/05-meta-crosslinks.md) | suite success |

### Specs

| Spec | Path |
|------|------|
| Architecture (rings, north-star loop, harness identity) | [`specs/architecture.md`](specs/architecture.md) |
| MANIFEST rings table | [`specs/manifest-rings.md`](specs/manifest-rings.md) |
| Trust gates lite (UVRN shape borrow) | [`specs/trust-gates-lite.md`](specs/trust-gates-lite.md) |

### Guides

| Guide | Path |
|-------|------|
| Human + agent install path | [`guides/install.md`](guides/install.md) |
| VIP tip symlink law | [`guides/tip-cite-law.md`](guides/tip-cite-law.md) |

---

## Hard walls

1. **Docs-only suite** — no §3b visual art-direction; no UI product code.
2. **Paper ≠ GO** — suite creation does not start Build, CP-0, or Active WORKSTREAMS rows.
3. **No tip writes** — cite `factory/skills/*` by path; T2 land is Admin GO.
4. **No skill body fork** — install symlinks tip skills; does not vendor law into `lyrikai-agent`.
5. **Lyrikai routes; does not replace** Queen, Trinity, SBT, Audit, or Admin gates.
6. **No false GO from scene sense** — P0 default is Queen overview + WAIT.
7. **No `.hive/` on this leaf** — board / Paper-register skipped per PLANNING-ATTIC §5b.
8. **No gears** unless conductor opts in — skip `/gear-set` for v1.
9. **Planning suite ≠ implement** — unit plans describe future emits; Step B fill is separate GO.
10. **No git commit** in BPS or initial fill unless conductor explicitly asks.

---

## Success definition (suite)

Matches [`END-GOAL.md`](./END-GOAL.md):

- [ ] README + 5 plans + 3 specs + 2 guides exist and are fresh-agent complete.
- [ ] END-GOAL stop line is measurable and cited from unified plan.
- [ ] Architecture spec locks north-star loop + ring model.
- [ ] No product `agent/` files written as part of BPS (Step A).
- [ ] First fill entrypoint named: `plans/01-product-scaffold.md`.

---

## Explicit note

**This suite is for planning/docs only** until a later agent is asked to fill units 01–05. Do not run `/super-build-trinity` Build/Audit/closeout from this package. **Paper ≠ GO.**
