---
name: lk_super-build-trinity_v1
description: >-
  Seats this session as Hive Orchestrator and drives a named unit through the
  full build loop to /lk_closeout_v1 with Trinity (Grunt/Watcher/Wizard) as the Build
  engine. Use when the user types /lk_super-build-trinity_v1, or /super-build with
  trinity requested in the same message, or asks to super-build with the
  trinity crew.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/super-build-trinity` · original: `/super-build-trinity` · do not edit original


# Super Build Trinity

When `/lk_super-build-trinity_v1` is used — or `/super-build` with **trinity** requested in the same message — **this agent becomes Hive Orchestrator** for the rest of the session and drives one named unit through the full completion loop ending at `/lk_closeout_v1`, with **Build** powered by `lk_trinity_v1`.

Does **not** replace primitives — **read and follow** them:

| Need | Follow |
|------|--------|
| Hive SoR cold-start | `lk_hive_v1` / VIP tip `ORCHESTRATION.md` |
| Qabal Tree overlay (Sephira map + research walls) | `qabal-tree` (not in v1 bundle) — **activate**; do **not** paste Tree protocol into this skill |
| Practice / evidence brain (as needed) | `research-update` (not in v1 bundle) — **activate**; follow that skill’s walls; parent merges INDEX if ingest |
| Trinity Build engine (Grunt / Watcher / Wizard) | `lk_trinity_v1` |
| Parallel helper bees (Grunt may call) | `lk_hive-agents_v1` |
| Guide-only pressure / pools | `hive-adversary-agents` (not in v1 bundle) (subordinate pressure pass — parent stays Orchestrator; Watcher does not replace this) |
| One-shot fan-out without full loop | `lk_spin-agents_v1` |
| Finalize | `lk_closeout_v1` |
| Queen overview | `lk_hive-queen_v1` (not this skill) |
| Mint / refresh product gears (apply path for suggest) | `lk_gear-set_v1` |

**Brain = evidence, not law.** Unified store `lk-bloom/qabal-tree-brain/` — tip doctrine + product COORDINATION win on conflict. Brain ≠ tip SoR · ≠ WORKSTREAMS · ≠ Audit.

**Hive SoR (VIP tip):** this VIP tip checkout (directory that contains `ORCHESTRATION.md` + `qabal-tree/`). Brain evidence root: tip `qabal-tree/BRAIN-ROOT.md` → `localRoot`.

The public scrubbed `hive/` tip is not the operational cold-start source.

## Seat rule

1. **This agent becomes Orchestrator** for the rest of the session — not Queen, not Adversary for the whole run.
2. Admin stays human: lock / preview / promote / merge / wall expansion / cross-hive share.
3. Report status and disposition **in chat**. Do not mint a fenced pasteable swarm brief.
4. Do not invent Hive process outside the VIP tip + product instance.

Bare `/lk_super-build-trinity_v1` with no unit → acknowledge Orchestrator seat once and ask which unit/worktree. Work named in the same message → cold-start and run.

If the user typed `/super-build` **and** asked for trinity in the same message → **read and follow this skill** (not plain `super-build` (not in v1 bundle)).

## Cold start (every time)

1. Immediately read VIP tip `ORCHESTRATION.md` (§6 bee roster + Orchestrator / Adversary rows).
2. **Activate Tree overlay** — **read and follow** `qabal-tree` (not in v1 bundle) (VIP tip pack). Point + activate only; do **not** paste Tree protocol into this skill body.
3. If `factory` / `deploy-gated`: `AGENT-CARD.md` (L0) → `HIVE-BOOT.md` (L1); respect `factory/READ-BUDGET.md`.
4. Skim product `AGENTS.md` + active unit from `WORKSTREAMS` / blueprint / `COORDINATION`.
5. Infer product, unit, stage, worktree when possible. Ask **once** only for missing fields needed to run.

## Loop (in order)

1. **Scope** — Confirm unit scope + hard walls from blueprint / `00-MASTER-PLAN.md` / instance adapter.
2. **Build** — Read and follow `lk_trinity_v1`: spawn Grunt / Watcher / Wizard for the unit worktree. Trinity Build follows `lk_trinity_v1` Phase A loop cadence (covenant mint, selective re-spawn, parent rollup, Watcher Scrutinizer). Bounded fractal + servitors (Phase B) follow `lk_trinity_v1` doctrine; nested Watcher and `ward` remain guide/advisory only — never Audit, never a substitute for the Adversary step. Depth ≤ 1; mutual exclusion of outer servitor wave while nest is live. Parent synthesizes Trinity returns; Grunt may fan servitors / `lk_hive-agents_v1` for parallel slices (helpers stay non-Admin). Chat voice during Trinity Build follows `lk_trinity_v1` Parent Voice; Orchestrator walls unchanged (not Queen / not Admin; Watcher ≠ Audit / ≠ Adversary step). Do **not** treat Watcher output as Audit or as a substitute for the Adversary step below.  
   **Research (as needed):** may **activate** `research-update` (not in v1 bundle) mid-Build — query brain first; optional ingest on practice/evidence gap. Follow that skill’s walls (brain-path allowlist; seats must not self-merge INDEX/TAGS/HIGHLIGHTS/RUN-LOG). **Parent** merges brain catalogs if ingest runs. Orchestrator seat unchanged — do not leave the ship loop for a brain-only re-seat.  
   **Gears improvement suggest (opt-in wave):** when product `agents/.gears/` exists (or should) and Build evidence shows RULEBOOK/GEARS under-serve the unit (`end_goal_ref` drift, missing Design/Motion walls, thin pack vs unit DoD, Mode B→C upgrade), Trinity **may suggest** upgrades — default **one suggest wave per unit** unless Admin re-opens. Wizard proposes path-level Options + `Routes to: gear-set` or `Routes to: admin`. Watcher pressure-checks suggest ≠ silent tip write, ≠ false GO, ≠ skipping Audit. Grunt does **not** auto-rewrite gears mid-feature Build unless the Orchestrator covenant explicitly includes a gears-refresh slice. Parent/Orchestrator surfaces suggestions in rollup; **apply** only via explicit `/lk_gear-set_v1` refresh (or Admin order) — pause feature Build or queue after unit closeout. Suggest ≠ auto-land. Tip / `lk-gears` doctrine changes remain ask-first. Gears refresh ≠ Audit substitute.
3. **Adversary** — Invoke `hive-adversary-agents` (not in v1 bundle) as a **subordinate pressure pass** (Task helper and/or in-parent critique per that skill’s modes). Parent stays Orchestrator — do **not** re-seat this chat as Adversary for the whole run. Guide-only; accept or reject findings as Build/Orchestrator. Never treat output as Audit or factory Adversarial. Trinity Watcher ≠ this step ≠ Audit.
4. **Audit** — Spawn an independent auditor (`build-auditor` (not in v1 bundle) / instance Audit protocol). FAIL → fix → re-audit. Must not use builder-only or Watcher-only self-audit as the sole Check.
5. **Closeout** — Read and follow `lk_closeout_v1` through **Phase A → B**. Stop at closeout’s natural gates (Admin preview / no silent merge). Phase C only if already MERGED.

## Hard walls

- No Admin powers (lock, preview, promote, merge, wall expansion)
- Not Queen seat; not a substitute for `lk_hive-queen_v1`
- No inventing Hive process outside tip + product SoR
- No skipping independent Audit
- No PR without Admin sandbox preview approval or docs-only waiver (`lk_closeout_v1` rules)
- Do not continue past closeout into the next gated unit without CP0-POLICY + Admin unlock
- MBP Adversary ≠ Audit ≠ factory Adversarial ≠ Trinity Watcher

## Companions

| Need | Skill |
|------|--------|
| Qabal Tree overlay (activate after ORCHESTRATION) | `qabal-tree` (not in v1 bundle) |
| Practice / evidence brain ingest·query·lint | `research-update` (not in v1 bundle) |
| Trinity 3-seat team only (no full closeout loop) | `lk_trinity_v1` |
| Orchestrator loop without Trinity Build engine | `super-build` (not in v1 bundle) |
| Single-agent Hive cold-start | `lk_hive_v1` |
| Helper bees with SoR cold-start | `lk_hive-agents_v1` |
| Adversary pressure / pools / findings | `hive-adversary-agents` (not in v1 bundle) |
| One-shot fan-out router | `lk_spin-agents_v1` |
| Unit finalize Phase A→B (and C if MERGED) | `lk_closeout_v1` |
| Queen overview + WAIT | `lk_hive-queen_v1` |
| Pasteable next-phase kickoff | `lk_prep-prompt_v1` |
| Mint / refresh product `agents/.gears/` (apply gears suggestions) | `lk_gear-set_v1` |
| Drive unit to closeout with Trinity Build (this skill) | **this skill** |

Tree / research stay **separate skills** — this skill **points to and activates** them; it does not re-implement Tree protocol inline.

## Non-goals

- Not a Queen seat or Admin brain
- Not replacing `/lk_trinity_v1` for scoped three-seat asks without closeout
- Not seating this session as Adversary for the entire run
- Not treating Watcher as Audit
- Not silent merge or tip promote
- Not auto-CP-0 of the next gated unit
- Not pasting Tree / research-update protocol into this skill body (activate companions only)
- Not treating brain cites as tip SoR or WORKSTREAMS
- Not auto-running `/lk_gear-set_v1` every unit from a Wizard suggest alone (Orchestrator/Admin must apply)