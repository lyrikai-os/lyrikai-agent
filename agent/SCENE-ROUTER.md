# SCENE-ROUTER — Lyrikai Super Agent

**Audience:** Lyrikai seat after LYRIKAI-BOOT  
**Cross-ref:** [`TRUST-GATES.md`](./TRUST-GATES.md) · [`MANIFEST.md`](./MANIFEST.md)  
**Spec:** `.admin/docs/plan-suites/lyrikai-super-agent/specs/architecture.md`

---

## Signal ladder (read in order — cheap first)

### 1 · User ask

Verbs/nouns in the message:

| Signal | Examples |
|--------|----------|
| plan suite | "mint BPS", "END-GOAL", "unit plan" |
| archive / extract | "re-app", "excavate", "DS gallery" |
| gears | ".gears refresh", "gear-set" |
| build unit | "fill unit", "implement plan", "SBT" |
| closeout | "closeout", "finalize unit" |
| audit | "audit prompt", "read-only review" |
| meta-map | "roster", "attendance", "meta-map" |
| workstreams | "Paper row", "WORKSTREAMS", ".hive board" |
| helper bees | "spawn explore", "parallel slices" |
| hive cold-start | "ORCHESTRATION", "install repair", ".hive missing" |

### 2 · Workspace

| Signal | Where |
|--------|-------|
| Open files | plan markdown, agent/*.md, suite specs |
| cwd | under `lyrikai-agent/`, product trees, `lk-bloom/` |
| `.hive/` | WORKSTREAMS, board presence |
| `meta-map/ROSTER.md` | program overlay |
| `.admin/docs/plan-suites/` | BPS attic |
| `archives/extractions/` | DS extraction lanes |

### 3 · Git / tree

| Signal | Meaning |
|--------|---------|
| Untracked plan suites | paper in progress — not ship |
| Extraction lanes churn | re-app / excavate scene |
| Catalog churn | pull `lyrikai-meta/wiki/catalog/INDEX.md` |

### 4 · Catalog pull

`lyrikai-meta/wiki/catalog/INDEX.md` — active vs retired utilities before inventing parallel skills.

### 5 · Posture

| Signal | Action |
|--------|--------|
| tip HEAD unknown | `hive` cold-start for ORCHESTRATION reads |
| HOLD surfaces | honest hold — do not auto-GO |
| Paper rows present | visibility only — Paper ≠ start |

---

## Bundle rings summary

| Ring | Always warm? | Role |
|------|--------------|------|
| Foundation | queen+trinity+wiki-log always; `hive` on demand | soul + engine + SoR |
| Hive ops | on delegate | parallel helpers, Paper register, meta-map |
| Plan / archive | on delegate | BPS, gears, re-app, excavation |
| Ship | on delegate | SBT, closeout, prep, audit |
| Outer | on demand | full ADMIN-SKILLS table |

Full table: [`MANIFEST.md`](./MANIFEST.md)

---

## Delegate map

Slug + tip path cite only — **do not paste SKILL bodies**.

| # | Scene signal | Primary delegate | Secondary | Tip path |
|---|--------------|------------------|-----------|----------|
| 1 | ORCHESTRATION / `.hive` missing / install repair | `hive` | `hive-queen` overview | `factory/skills/hive/` |
| 2 | program overview, HOLD/GO, Admin posture | `hive-queen` | `wiki-log` unfurl | `factory/skills/hive-queen/` |
| 3 | meta-map / roster / attendance | `hive-meta-map` | canvas showcase | `factory/skills/hive-meta-map/` |
| 4 | parallel non-Admin slices | `hive-agents` | `trinity` servitors | `factory/skills/hive-agents/` |
| 5 | adversary pressure / argument pools | `hive-adversary-agents` | SBT subordinate — not Watcher | `factory/skills/hive-adversary-agents/` |
| 6 | Paper row / WORKSTREAMS visibility | `hive-workstreams` | `build-plan-suite` if suite missing | `factory/skills/hive-workstreams/` |
| 7 | MVP seed from tip pattern | `hive-mvp-seed` | `hive` cold-start first | `factory/skills/hive-mvp-seed/` |
| 8 | pre-unit paper, END-GOAL, plan suite | `build-plan-suite` | `gear-set` if gears opt-in | `factory/skills/build-plan-suite/` |
| 9 | `.gears/` refresh | `gear-set` | `trinity` mode pick | `factory/skills/gear-set/` |
| 10 | raw app / DS archive / re-app | `re-app` | `excavate-design-index` if gallery opt | `factory/skills/re-app/` |
| 11 | active unit / ship / closeout | `super-build-trinity` | `closeout`, Audit | `factory/skills/super-build-trinity/` |
| 12 | scoped build/research, no closeout | `trinity` | servitors / `hive-agents` | `factory/skills/trinity/` |
| 13 | mid-session fan-out | `spin-agents` | Trinity/Queen spin protocol | `factory/skills/spin-agents/` |
| 14 | phase kickoff after paper | `prep-prompt` | — | `factory/skills/prep-prompt/` |
| 15 | ecosystem note / seat memory | `wiki-log` | `research-update` if brain query | `factory/skills/wiki-log/` |
| 16 | read-only finished-phase audit | `audit-prompt` | independent Audit seat | `factory/skills/audit-prompt/` |
| 17 | co-pilot step execution | `instruction-manual` | — | `factory/skills/instruction-manual/` |
| 18 | DS gallery master after re-app | `excavate-design-index` | `re-app` context | `factory/skills/excavate-design-index/` |
| 19 | alternate ship without Trinity engine | `super-build` | `closeout` | `factory/skills/super-build/` |
| 20 | brain / research ingest query | `research-update` | `wiki-log` stub | `factory/skills/research-update/` |

Tip root: `hive-vip-1/hive-vip-1_main/`

---

## Permission tiers

| Tier | When | Behavior |
|------|------|----------|
| **P0 propose** | Bare `/lyrikai` or ambiguous scene | Queen overview + recommended delegate + **WAIT** |
| **P1 soft delegate** | Clear scene, low-risk read/plan | Open companion skill; confirm once if HOLD surfaces |
| **P2 hard delegate** | Explicit ask in message | Route immediately; Queen notes walls |
| **P3 blocked** | Tip write, merge, CP-0, false GO | Proposal to `wiki/proposals/` only |

Cross-ref TRUST-GATES Stage2: P0/P1 default Stage2 off; P2/P3 require relational check.

---

## North-star beat → delegate hint

| Beat | Primary delegates | Default tier |
|------|-------------------|--------------|
| Search | Scene router, `hive`, `wiki-log`, `research-update` | P0 |
| Plan (paper) | `build-plan-suite`, `re-app`, `gear-set` | P1 — stop at END-GOAL |
| Delegate | Scene router + permission tier | P0–P2 |
| Plan (unit) | `prep-prompt`, Trinity covenant, `instruction-manual` | P2 — conductor-GO |
| Build | `trinity` or `super-build-trinity` | P2 — CP-0/Admin when gated |
| Ship | SBT + **Audit** + Admin preview | P3 block false GO |
| Loop | `wiki-log` + catalog refresh | P1 |

Gate ids: [`TRUST-GATES.md`](./TRUST-GATES.md) §4

---

## Routing law

1. Propose delegate — do not auto-execute irreversible beats  
2. One companion SKILL open per routing pass  
3. Watcher ≠ Audit ≠ adversary guide  
4. Paper ≠ GO · scene sense ≠ build permission  
