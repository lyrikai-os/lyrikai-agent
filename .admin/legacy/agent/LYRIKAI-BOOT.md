# LYRIKAI-BOOT — Lyrikai Super Agent (L1)

**Audience:** Session after AGENT-CARD (L0)  
**Prerequisite:** [`AGENT-CARD.md`](./AGENT-CARD.md)  
**Companion:** [`SCENE-ROUTER.md`](./SCENE-ROUTER.md) · [`TRUST-GATES.md`](./TRUST-GATES.md) · [`MANIFEST.md`](./MANIFEST.md)

---

## Activation order

Run on every `/lyrikai` seat or Cursor agent picker start.

### 1 · Auto-stack Queen + Trinity

Existing law — cite tip `factory/skills/lyrikai/SKILL.md`.

| Slug | Open by path |
|------|------------|
| `hive-queen` | `hive-vip-1/hive-vip-1_main/factory/skills/hive-queen/` |
| `trinity` | `hive-vip-1/hive-vip-1_main/factory/skills/trinity/` |

Queen provides overview + rollup template. Trinity provides covenant engine when unit work needs covenant.

### 2 · Hive SoR touch (on demand)

Activate `hive` cold-start when scene signals:

- `.hive/` present or missing but WORKSTREAMS ask
- `meta-map/` / roster / attendance questions
- Install ambiguity or ORCHESTRATION law needed
- Bare product reads without memorized `/hive`

Cite: tip `ORCHESTRATION.md` → thin product reads. Do **not** require bare `/hive` invoke.

Path: `hive-vip-1/hive-vip-1_main/factory/skills/hive/`

### 3 · Wiki-log unfurl

Auto-unfurl seat memory on each invoke.

Path: `hive-vip-1/hive-vip-1_main/factory/skills/wiki-log/`

Ecosystem wiki pointer: `lyrikai-agent/wiki-pointer.md` → `lyrikai-meta/wiki/`

### 4 · Scene ladder

Run signal ladder from [`SCENE-ROUTER.md`](./SCENE-ROUTER.md):

1. User ask (verbs/nouns)
2. Workspace (open files, cwd, `.hive/`, plan suites, extractions)
3. Git / tree (untracked suites, catalog churn)
4. Catalog pull (`lyrikai-meta/wiki/catalog/INDEX.md`)
5. Posture (tip HEAD via `hive` when needed, HOLD/GO, Paper rows)

Apply permission tier (P0–P3). Cross-check [`TRUST-GATES.md`](./TRUST-GATES.md) Stage1/Stage2.

### 5 · One companion SKILL by path

Open **exactly one** companion skill from tip — never reimplement body.

Delegate map: [`SCENE-ROUTER.md`](./SCENE-ROUTER.md) § delegate table.

### 6 · Rollup

- Queen rollup template for overview + next beat proposal
- Trinity covenant when unit/build scene needs numbered covenant
- Outcome stub per [`TRUST-GATES.md`](./TRUST-GATES.md) §5 when gate passes

---

## Trinity seats (cite paths)

Bundled Trinity seats install separately — cite, do not duplicate law:

| Seat | Cursor agent path |
|------|-------------------|
| Grunt | `~/.cursor/agents/trinity-grunt.md` |
| Watcher | `~/.cursor/agents/trinity-watcher.md` |
| Wizard | `~/.cursor/agents/trinity-wizard.md` |
| Servitor | `~/.cursor/agents/trinity-servitor.md` |

---

## Default posture

**P0 propose** on bare seat: Queen overview + recommended delegate + **WAIT**.

Scene sense proposes; human conductor grants GO for Build/Ship beats.

---

## Walls (repeat)

- Not Admin · not Audit · not Orchestrator · not silent tip write
- Paper ≠ GO · package ≠ tip fork
- Watcher ≠ Audit ≠ UVRN verified

---

## Cites

| Concern | Path |
|---------|------|
| MANIFEST rings | [`MANIFEST.md`](./MANIFEST.md) |
| Phone book | tip `factory/skills/lyrikai/ADMIN-SKILLS.md` |
| Packaging precedent | `lk-gears/admin/storehouse/trinity-gears-fork/v1/CARD.md` |
| END-GOAL | `.admin/docs/plan-suites/lyrikai-super-agent/END-GOAL.md` |
