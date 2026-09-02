---
name: lk_spin-agents_v1
description: >-
  Mid-session entry dispatcher: callable anytime; seats/continues Trinity + Queen
  readiness, then runs cascade via their Spin protocols (intensity-by-need).
  Short-circuits to hive-adversary-agents or super-build when that is the ask.
  Use when the user types /lk_spin-agents_v1, or asks to spin agents, delegate to
  subagents, or fan out session tasks. Not sticky; not Orchestrator; not Admin.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/spin-agents` · original: `/spin-agents` · do not edit original


# Spin Agents

Mid-session **entry dispatcher**: slice the ask, ensure Trinity + Queen capacity, follow their **Spin protocols**, fan helpers as needed. Not sticky. Not a full Master-Build swarm. Admin stays human. Parent **follows** companion skills in the same chat — does not invent Queen/Trinity as Task-subagent seats.

## Trigger

`/lk_spin-agents_v1` (or “spin agents” / “delegate this to subagents”).

- Bare `/lk_spin-agents_v1` with no work → acknowledge once and ask what to spin.
- Work named in the same message → start the cascade **now**. One short “spinning…” line is fine. Do **not** wait for approval of a roster.
- Callable mid-session (Queen / Trinity / Adversary / build already live) or at cold start.

## Workflow

1. **Stack-detect** (posture only — does not block entry).
2. **Short-circuit check** — if the ask is clearly adversary-only or explicit closeout/ship, route there and stop (table below).
3. **Readiness:** follow `lk_trinity_v1` **Spin protocol** + `lk_hive-queen_v1` **Spin protocol** (seat or continue both). Do not duplicate those skill bodies — open and follow them.
4. **Intensity:** parent picks Trinity light vs full per Trinity Spin protocol criteria (Watcher may have **recommended** only — never binds intensity). Queen stays OVERVIEW + WAIT unless conductor already delegated Admin. Do **not** add a Watcher intensity-dispatch step here.
5. Trinity runs labor; Queen may fan `lk_hive-agents_v1` / `hive-adversary-agents` (not in v1 bundle) / Task helpers when needed.
6. Await → synthesize under Queen chat soul (Trinity Parent Voice only if Queen somehow not seated — rare after readiness) → continue the build.

## Default cascade

```text
/lk_spin-agents_v1 → seat/continue Trinity + Queen → Trinity engine (intensity by need)
  → Queen fans helpers when needed
```

Hard short-circuits only (skip default cascade):

| Ask is clearly | Route |
|---|---|
| Pure MBP Adversary critique / argument pool / return findings | Follow `hive-adversary-agents` (not in v1 bundle) (guide-only; ≠ Audit; ≠ factory Adversarial) |
| Explicit drive-to-`/lk_closeout_v1` / full ship loop | Point to `super-build` (not in v1 bundle) / `lk_super-build-trinity_v1` — spin is not Orchestrator |
| Bare `/lk_spin-agents_v1` with no work | Ask once what to spin |

## Stack detect (posture)

| Sticky / seated | Behavior while spinning |
|---|---|
| Queen | Chat soul Queen; helpers non-Admin; no false GO; Admin only if conductor delegated |
| Trinity (solo) | Become/stay sticky; readiness also seats Queen so stack is Queen+engine |
| Queen + Trinity | Queen walls + Trinity engine (unchanged law) |
| Adversary seated | Critique-primary → adversary short-circuit; else Trinity labor may run; Adversary stays guide-only for pressure |
| Trinity mid-loop | No competing outer spin swarm — hand into living Trinity (servitors / selective re-spawn) |
| `/simple` / `/coffee-shop` | Density/voice only |

## Routing (cascade-first)

| Slice looks like | Route |
|---|---|
| Default session work / build / explore / verify / multi-slice fan-out | Readiness → **Trinity Spin protocol** (then Queen); parent picks intensity |
| Needs program overview, HOLD/GO, tip/`.hive` Admin posture | Already Queen-ready; Queen spine; Trinity **engine only** under her |
| Hive product / factory / tip SoR labor | Via Queen or Trinity → follow `lk_hive-agents_v1` (cold-start in helpers) |
| Adversary critique / pools / findings (primary ask) | Short-circuit → `hive-adversary-agents` (not in v1 bundle) |
| Explicit closeout / full ship | Short-circuit → `super-build` (not in v1 bundle) / `lk_super-build-trinity_v1` |
| Narrow leaf while Trinity mid-loop | Trinity servitors (`anvil`/`quench`/`scribe`/`scout`/`ward`) — not a second outer spin |

Do **not** duplicate companion skill bodies — open and follow them. Prefer Trinity labor under Queen-ready stack over bare Task. Bare Task `explore` / `generalPurpose` only as leaves under the cascade.

## Rules

- Spin ≠ sticky seat; spin ≠ Queen; spin ≠ Audit; spin ≠ factory Adversarial; spin ≠ Orchestrator.
- Helpers stay non-Admin: no lock / preview / promote / merge / wall expansion.
- Queen model A intact: seating via spin ≠ Admin fire; no false GO from spin or Trinity disposition.
- Ready + intensity-by-need: both seats in force; not full-fire triad + Admin on every spin.
- Intensity ownership: **parent** applies Spin protocol criteria; Watcher may **recommend** only; Watcher modes deepen Watcher scrutiny only — never Trinity Round-1 fire or Queen Admin.
- Do not invent Hive process when routing to generic Task.
- For Hive helpers: embed the cold-start required by `lk_hive-agents_v1`.
- For Adversary: follow `hive-adversary-agents` (not in v1 bundle); guide-only; never treat output as Audit or factory Adversarial PASS/FAIL.
- For generic Task leaves: state role, paths, constraints, and exact return format for the parent.

## Companions

| Need | Skill |
|------|--------|
| Sticky triad engine + **Spin protocol** (default labor) | `lk_trinity_v1` |
| Sticky Queen seat + **Spin protocol** (readiness / fan helpers) | `lk_hive-queen_v1` |
| Hive helper bees with SoR cold-start | `lk_hive-agents_v1` |
| Adversary standby / pools / findings | `hive-adversary-agents` (not in v1 bundle) |
| Single-agent Hive cold-start | `lk_hive_v1` |
| Drive unit to `/lk_closeout_v1` (full Orchestrator loop) | `super-build` (not in v1 bundle) |
| Drive unit to `/lk_closeout_v1` with Trinity Build | `lk_super-build-trinity_v1` |
| Unit finalize Phase A→B | `lk_closeout_v1` |
| Density / cafe voice (does not change cascade) | `simple` / `coffee-shop` |
| Sticky meta-seat / ecosystem router (escalation entry) | `lyrikai` (not in v1 bundle) |
| Mid-session entry dispatcher (this skill) | **this skill** |

## Non-goals

- Not a sticky seat; not silent Admin; not unsupervised Queen
- Not replacing `lk_trinity_v1` loop or `super-build*` / `/lk_closeout_v1`
- Not full Seed → Build → Audit → Publisher swarm
- Not Watcher-owned intensity dispatch