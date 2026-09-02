---
name: lk_hive-agents_v1
description: >-
  Spawns secondary Hive helper subagents that each cold-start the Lyrikai Hive SoR.
  Trigger immediately when the user types /lk_hive-agents_v1, or asks to spawn Hive
  helpers / delegate bees / secondary hive agents for a build.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/hive-agents` · original: `/hive-agents` · do not edit original


# Hive Agents

When `/lk_hive-agents_v1` (or an equivalent ask) is used, the **parent** coordinates and spawns **secondary Hive helper bees** via Task/subagents. Each helper cold-starts Hive the same way `/hive` does — so helpers never miss Hive access.

Canonical Hive SoR (VIP tip):

`VIP tip at workspace (directory containing ORCHESTRATION.md; see yard HIVE-TIP.md when present)`

`the public scrubbed hive tip (publish mirror — not operational cold-start)` is the public scrubbed tip — not the operational cold-start source.

This is **not** a full parallel ship swarm (Seed → Build → Audit → Publisher). Admin stays human. Helpers are scoped delegates for the current ask.

## Parent workflow

1. **Light cold-start** — Immediately read `ORCHESTRATION.md` in the VIP tip tree. If the ask is `factory` / `deploy-gated`, also take `AGENT-CARD.md` (L0) → `HIVE-BOOT.md` (L1) per `factory/READ-BUDGET.md`. Then read product `AGENTS.md` / walls only as needed for the ask. Do not invent process outside Hive.
2. **Size to the ask** — Spawn as many helper bees as needed (often 1–3; more only when slices are clearly parallel). Do **not** default to the full bee roster or a parallel Build+Audit ship path.
3. **Spawn via Task in parallel** — One Task call per helper; launch concurrent when slices are independent. Prefer `explore` / `generalPurpose` by slice type.
4. **Synthesize** — Wait for returns, merge findings, continue the user’s build.

If the message is only `/lk_hive-agents_v1`, acknowledge Hive helpers are in force, ask what build/slice to help (unless the same message already names the work), then spawn.

## Helper bee rules

Each helper is a **secondary Hive agent** (delegate):

- Role: research / explore / draft / verify-slice — subordinate to the parent ask
- Must **not** claim Admin powers (lock, preview, promote, merge, cross-hive share)
- Must **not** self-promote into “I am the Build bee for the whole program” unless the user explicitly named that role
- On **factory / deploy-gated** slices: follow L0/L1 boot; do **not** read all of `factory/`

## Helper prompt template

Every helper Task prompt **must** embed this cold-start (fill the slice; do not drop Hive steps):

```text
You are a secondary Hive helper bee (delegate), not Admin and not a full parallel ship swarm.

Cold-start Hive now:
1. Immediately read VIP tip at workspace (directory containing ORCHESTRATION.md; see yard HIVE-TIP.md when present)/ORCHESTRATION.md
2. If this slice is factory / deploy-gated: read AGENT-CARD.md (L0) → HIVE-BOOT.md (L1); respect factory/READ-BUDGET.md — do not read all of factory/
3. Then read only what this slice needs (README, master-build/, agent-team-pools/, doctrine/, product AGENTS.md / COORDINATION as relevant; thin factory/precision/design slices only if mode warrants)
4. Follow Hive gates, walls, and role rules. Do not invent process outside Hive.
   Note: the public scrubbed hive tip (publish mirror — not operational cold-start) is the public scrubbed tip — not your cold-start SoR.

Your slice:
[concrete task + paths + return format]

Return findings/edits summary to the parent; do not grant yourself lock/preview/promote/merge.
```

## Non-goals

- Not a replacement for `/hive` (single-agent cold-start)
- Not auto-spawning full Master-Build role cards (Build + independent Audit + Publisher) — use `super-build` (not in v1 bundle) for that loop
- Not granting Admin / preview / promote / Audit verdicts / closeout
- Not writing feature process outside Hive
- Not a substitute for `hive-queen-admin-prep-prompt` (not in v1 bundle) (Queen seat / program admin overview)

When the parent is already under `/super-build`, helpers may be sized larger for unit slices, but they remain **non-Admin** delegates. This skill still does not grant Audit verdicts, closeout, or Admin.

## Companions

| Need | Skill |
|------|--------|
| Drive unit through Build → Adversary → Audit → `/lk_closeout_v1` | `super-build` (not in v1 bundle) |
| Mid-session entry dispatcher (may reach helpers via Trinity→Queen cascade) | `lk_spin-agents_v1` |
| Adversary standby / pools / findings | `hive-adversary-agents` (not in v1 bundle) |
| Single-agent Hive cold-start | `lk_hive_v1` |
| Helper bees with SoR cold-start (this skill) | **this skill** |

## Relationship to `/hive`

- `/hive` = this agent follows Hive
- `/lk_hive-agents_v1` = this agent spawns helpers that each follow Hive
- `/super-build` = Orchestrator drives a unit to `/lk_closeout_v1`; may call this skill for helper slices
- `/lk_spin-agents_v1` = mid-session entry dispatcher; may reach helpers here via Trinity→Queen cascade (or Trinity alone); helpers stay **non-Admin**
- `hive-queen-admin-prep-prompt` (not in v1 bundle) = mint pasteable Queen seat (overview + Admin only under human conductor); helpers from this skill stay **non-Admin**