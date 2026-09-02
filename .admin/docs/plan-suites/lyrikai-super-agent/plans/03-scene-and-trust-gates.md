# 03 — Scene router + trust gates

**Suite:** `lyrikai-super-agent`  
**Depends on:** unit 02 (boot ladder)  
**Unlocks:** 04

---

## Goal

Emit the **scene brain** and **lite trust gate ladder** — signal table, delegate map, permission tiers P0–P3, and north-star beat gates — without pasting companion skill bodies.

## Stop condition

`agent/SCENE-ROUTER.md` and `agent/TRUST-GATES.md` exist; ≥15 delegate rows; P0–P3 defined; beat→gate table complete; cross-refs between files.

---

## In scope

| Path | Content |
|------|---------|
| `agent/SCENE-ROUTER.md` | Signal ladder, bundle rings summary, delegate map, permission tiers |
| `agent/TRUST-GATES.md` | Honesty vocabulary, Stage1/Stage2, checker port, beat gates, outcome stub, UVRN bridge pointer |

Spec alignment: [`../specs/architecture.md`](../specs/architecture.md), [`../specs/trust-gates-lite.md`](../specs/trust-gates-lite.md).

## Out of scope

- Pasting companion SKILL bodies
- Full UVRN stack import
- Live AI checker port (v1 = conductor + Hive Audit)
- Install / Cursor agent shell (unit 04)

---

## Prerequisites

- Units 01–02 complete.
- MANIFEST rings readable.
- Unified plan § Scene router + Trust gates read.

---

## Ordered steps

### 1. SCENE-ROUTER.md — signal ladder (read in order, cheap first)

1. **User ask** — verbs/nouns: plan suite, archive, extract, gears, build unit, closeout, audit, meta-map, workstreams, helper bees, hive cold-start
2. **Workspace** — open files, cwd under product trees, `.hive/`, `meta-map/ROSTER.md`, `.admin/docs/plan-suites/`, `archives/extractions/`
3. **Git / tree** — untracked plan suites, extraction lanes, catalog churn
4. **Catalog pull** — `lyrikai-meta/wiki/catalog/INDEX.md` for active vs retired utilities
5. **Posture** — tip HEAD via `hive` cold-start when needed, HOLD/GO, Paper rows if Hive present

### 2. SCENE-ROUTER.md — delegate map (minimum 15 rows)

| Scene signal | Primary delegate | Secondary |
|--------------|------------------|-----------|
| ORCHESTRATION / `.hive` missing / install repair | `hive` | `hive-queen` overview |
| program overview, HOLD/GO, Admin posture | `hive-queen` | `wiki-log` unfurl |
| meta-map / roster / attendance | `hive-meta-map` | canvas showcase |
| parallel non-Admin slices | `hive-agents` | `trinity` servitors |
| adversary pressure / argument pools | `hive-adversary-agents` | SBT subordinate — not Watcher |
| Paper row / WORKSTREAMS visibility | `hive-workstreams` | `build-plan-suite` if suite missing |
| MVP seed from tip pattern | `hive-mvp-seed` | `hive` cold-start first |
| pre-unit paper, END-GOAL, plan suite | `build-plan-suite` | `gear-set` if gears opt-in |
| `.gears/` refresh | `gear-set` | `trinity` mode pick |
| raw app / DS archive / re-app | `re-app` | `excavate-design-index` if gallery opt |
| active unit / ship / closeout | `super-build-trinity` | `closeout`, Audit |
| scoped build/research, no closeout | `trinity` | servitors / `hive-agents` |
| mid-session fan-out | `spin-agents` | Trinity/Queen spin protocol |
| phase kickoff after paper | `prep-prompt` | — |
| ecosystem note / seat memory | `wiki-log` | `research-update` if brain query |

Add rows as needed; do not paste SKILL bodies — slug + path cite only.

### 3. SCENE-ROUTER.md — permission tiers

| Tier | When | Behavior |
|------|------|----------|
| **P0 propose** | Bare `/lyrikai` or ambiguous scene | Queen overview + recommended delegate + **WAIT** |
| **P1 soft delegate** | Clear scene, low-risk read/plan | Open companion skill; confirm once if HOLD surfaces |
| **P2 hard delegate** | Explicit ask in message | Route immediately; Queen notes walls |
| **P3 blocked** | Tip write, merge, CP-0, false GO | Proposal to `wiki/proposals/` only |

### 4. TRUST-GATES.md — file shape

```text
§1 Honesty vocabulary (proposed, paper-complete, delegated, conductor-GO, insufficient-scene, blocked)
§2 Stage1/Stage2 ladder (structural vs relational)
§3 Checker port (irreversible beats only)
§4 Beat → gate id table
§5 Outcome stub format
§6 Optional UVRN bridge pointer
```

### 5. North-star beat gates (TRUST-GATES §4)

| Beat | Gate id | Pass → | Fail/Hold → |
|------|---------|--------|-------------|
| Search | `gate-search` | Stage1 ok → propose next | `insufficient-scene` → ask once |
| Plan (paper) | `gate-paper` | END-GOAL exists → P1 stop | missing END-GOAL → stay in BPS |
| Delegate | `gate-delegate` | P1/P2 tier matched | P0 wait / P3 proposal |
| Plan (unit) | `gate-unit` | covenant + conductor-GO | hold at paper |
| Build | `gate-build` | CP-0/Admin when required | no false GO |
| Ship | `gate-ship` | Audit PASS + preview | no PR without preview |
| Loop | `gate-loop` | wiki-log stub written | — |

### 6. Cross-refs

- SCENE-ROUTER permission tiers ↔ TRUST-GATES Stage2
- TRUST-GATES §6 → optional `@suttlemedia/arcanum` `uvrn-about-hive-gate`; MCP `user-uvrn` namespace cite-only
- Hive Audit ≠ Watcher ≠ UVRN verified

---

## Verification

| Check | Pass signal |
|-------|-------------|
| Delegate map row count | ≥15 |
| P0–P3 all defined | grep in SCENE-ROUTER |
| Beat gate table | 7 rows in TRUST-GATES |
| Honesty vocabulary | ≥6 terms in TRUST-GATES §1 |
| No SKILL body paste | largest file < reasonable budget |

---

## Evidence / handoff

| Field | Value |
|-------|-------|
| `unit` | 03-scene-and-trust-gates |
| `delegate_rows` | N |
| `permission_tiers` | P0–P3 |
| `next` | [`04-agent-shell-and-install.md`](04-agent-shell-and-install.md) |

---

## Next dependency

Unit **04** emits Cursor agent shell + install.sh + verify.sh.
