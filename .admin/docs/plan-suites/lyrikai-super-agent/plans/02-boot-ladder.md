# 02 — Boot ladder

**Suite:** `lyrikai-super-agent`  
**Depends on:** unit 01 (product scaffold)  
**Unlocks:** 03

---

## Goal

Emit the **L0/L1 boot ladder** — AGENT-CARD, LYRIKAI-BOOT, MANIFEST — following tip `AGENT-CARD.md` shape and the ring model in [`../specs/manifest-rings.md`](../specs/manifest-rings.md).

## Stop condition

Three files under `agent/` exist; AGENT-CARD ≤80 lines; MANIFEST rings table complete; boot steps cite SCENE-ROUTER (stub ok until unit 03).

---

## In scope

| Path | Content |
|------|---------|
| `agent/AGENT-CARD.md` | L0 ~80 lines: one-line loop, top walls, spawn order at altitude |
| `agent/LYRIKAI-BOOT.md` | L1 activation: stack Queen+Trinity, Hive SoR touch, wiki unfurl, scene pass |
| `agent/MANIFEST.md` | Machine-readable + human rings table; package_id, version, tip_pin, entrypoints |

## Out of scope

- SCENE-ROUTER.md / TRUST-GATES.md bodies (unit 03) — may reference as "see unit 03"
- Install scripts (unit 04)
- Tip SKILL.md edits
- Cursor agent shell (unit 04)

---

## Prerequisites

- Unit 01 complete.
- Read tip `AGENT-CARD.md` for L0 pattern.
- Read [`../specs/manifest-rings.md`](../specs/manifest-rings.md).
- Read tip `factory/skills/lyrikai/ADMIN-SKILLS.md` for phone book.

---

## Ordered steps

### 1. AGENT-CARD.md (L0)

Target ≤80 lines. Required sections:

```text
Seat → wiki unfurl → scene pass → propose delegate → permission → companion skill → rollup
```

- **Identity line:** Lyrikai Super Agent = router + posture + scene sense + install bundle
- **One invoke:** `/lyrikai` (legacy aliases listed briefly)
- **Must-not block:** not Admin, not Audit, not silent tip write, not Orchestrator
- **Always warm:** hive-queen, trinity, wiki-log
- **Spawn order at altitude:** Card → Boot → Scene → companion SKILL by path
- Pointer to LYRIKAI-BOOT.md

### 2. LYRIKAI-BOOT.md (L1)

Ordered activation steps:

1. Auto-stack Queen + Trinity (existing law — cite tip `factory/skills/lyrikai/SKILL.md`)
2. **Hive SoR touch** — when scene has `.hive/`, `meta-map/`, WORKSTREAMS ask, or install ambiguity: activate `hive` cold-start (ORCHESTRATION → thin product reads). Do not require bare `/hive` invoke.
3. Wiki-log unfurl (cite `factory/skills/wiki-log/`)
4. Run scene ladder from `SCENE-ROUTER.md` (unit 03 — placeholder cite ok at first emit)
5. Open **one** companion SKILL from tip by path (never reimplement body)
6. Rollup in Queen template; Trinity engine when covenant needed

### 3. MANIFEST.md

Required fields (see spec for full table):

```yaml
package_id: lyrikai-super-agent
version: 0.1.0-proposal
tip_pin: recorded at install — not baked into skill bodies
entrypoints:
  - /lyrikai
  - Cursor agent lyrikai-super
always_stack: [hive-queen, trinity, wiki-log]
foundation_ring: [hive, hive-queen, trinity, wiki-log]
hive_ops_ring: [hive-agents, hive-adversary-agents, hive-workstreams, hive-meta-map, hive-mvp-seed]
plan_archive_ring: [build-plan-suite, gear-set, re-app, excavate-design-index]
ship_ring: [super-build-trinity, super-build, closeout, prep-prompt, audit-prompt, instruction-manual]
outer_ring: pointer to ADMIN-SKILLS full table
agent_files: [agents/lyrikai-super.md]
install: agent/install/install.sh
```

Pattern cite: `lk-gears/admin/storehouse/trinity-gears-fork/v1/CARD.md` (runtime packaging, not sealed law cut).

---

## Verification

| Check | Pass signal |
|-------|-------------|
| `wc -l agent/AGENT-CARD.md` | ≤80 lines |
| MANIFEST has all five ring keys | grep foundation_ring, hive_ops_ring, plan_archive_ring, ship_ring, outer_ring |
| Boot cites Queen+Trinity auto-stack | grep hive-queen + trinity |
| No skill body paste | file sizes reasonable; paths cite tip |

---

## Evidence / handoff

| Field | Value |
|-------|-------|
| `unit` | 02-boot-ladder |
| `agent_card_lines` | N |
| `manifest_version` | 0.1.0-proposal |
| `next` | [`03-scene-and-trust-gates.md`](03-scene-and-trust-gates.md) |

---

## Next dependency

Unit **03** emits SCENE-ROUTER + TRUST-GATES with signal ladder, delegate map, P0–P3, north-star beat gates.
