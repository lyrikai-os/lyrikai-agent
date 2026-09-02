---
name: lk_re-app_v1
description: >-
  Reverse-engineers a raw app or design prototype into LK Agent work-home
  inventory — Way 2 archive required, Way 1 adopt optional. Use when the user
  types /lk_re-app_v1, /lk_re-app_v1 build-through, says reverse engineer app, or re-app
  with a source path.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/re-app` · original: `/re-app` · do not edit original


# Reverse Engineer App (`/lk_re-app_v1`)

Orchestrate Trinity inventory → **Way 2 archive** (required) → optional **Way 1 adopt** via `lk_build-plan-suite_v1`. Way 2 alone is a valid complete run. **Never** implement product app code inside this skill.

## Trigger

- `/lk_re-app_v1` — default **archive** mode (Way 2)
- `/lk_re-app_v1 build-through` — Way 1 only; requires existing extraction folder
- "reverse engineer this app" + source path
- "re-app" + raw template path

Bare invoke → ask once for required inputs (mode-specific below), then stop until answered.

## Hard walls

- **No product app code** in LK Agent work home during `/lk_re-app_v1` (archives + paper only).
- **Way 1 only after Way 2 verify pass** + explicit build-through opt-in.
- **testplat-1 untouched** — pattern donor at repo root; never extend in place.
- **Paper ≠ Build** — BPS suite / gears ≠ GO; `lk_prep-prompt_v1` / SBT is a separate conductor GO.
- Do not invoke `excavate-design-index` (not in v1 bundle) unless conductor opts Way 2b after Way 2 lands.
- Do not re-implement BPS, Trinity, or gear-set bodies — point and activate companions.

## Runtime topology

| Layer | Role |
|-------|------|
| **LK Agent work home** (`$LK_AGENT_WORK_ROOT`) | **Default write target** — `$LK_AGENT_WORK_ROOT/archives/extractions/<slug>/`, `work/products/<slug>/`, optional BPS suite |
| Tip `hive-vip-1_main` | **Read-only law** — PLANNING-ATTIC, design pack, BPS shape; do not write tip from `/lk_re-app_v1` |
| `lk-gears` | Workshop specimen — cite only for wiki stub shape |

## Path constants

Cite under `$LK_AGENT_WORK_ROOT` (see WORK-HOME.md).

| Role | Tip cite (relative) |
|---|---|
| LK Agent work home | `work/products/<slug>` |
| New extraction lane | `$LK_AGENT_WORK_ROOT/archives/extractions/<slug>/` |
| Pattern donor (read-only) | `work/templates/_donors/uvrn_testing-platform_design-system_extraction-1` |
| Raw templates | `work/templates/` |
| BPS suite (Way 1) | `work/products/<slug>/.admin/docs/plan-suites/<suite-slug>/` |
| Gallery master (Way 2b opt) | `work/templates/_donors/design-system-masters/` |

**Slug rule:** `<brand-or-app>-<short-name>-<n>` e.g. `uvrn-verification-wiki-1`.

## Required inputs — archive mode (default)

| Input | Required | Default / rule |
|---|---|---|
| **Source path** | yes | Absolute or workspace path to raw app / prototype |
| **Product slug** | no | derive → `work/products/<slug>/` |
| **Build-through** | no | **no** — Way 1 deferred unless conductor opts in after Way 2 |

If source path missing → ask **once**, then stop.

## Required inputs — build-through mode

| Input | Required | Default / rule |
|---|---|---|
| **Extraction slug or path** | yes | Under `archives/extractions/<slug>/` |
| **Verify pass** | yes | Re-run `npm run verify` if unsure |
| **Drift check** | no | Raw source path only when raw app changed since Visit 1 |
| **Build-through** | implicit | **yes** — this mode is Way 1 only |

Do **not** re-mint extraction unless drift or conductor orders Way 2 refresh.

## Modes

| Mode | Trigger | Phases run |
|---|---|---|
| **archive** (default) | `/lk_re-app_v1` + raw source | Trinity R1 → Way 2 → ask build-through → stop |
| **build-through** | `/lk_re-app_v1 build-through` + slug/path | Re-entry checks → Way 1 (BPS + optional wiki/gears) → stop |

## Trinity entry covenant

Mint before Round 1; embed in all seats. **Round 1:** full triad. Servitors: `scout` (raw tree), `scribe` (overlap matrix).

1. **Inventory** — surfaces, tabs, modals, data, motion, mock vs live — DoD: chat table + `guides/source-inventory.md` path (Way 1) or archive research note (Way 2)
2. **Overlap map** — surface → element / master / **GAP** — DoD: `specs/overlap-matrix.md` (Way 1) or `admin/wiki/research/` (Way 2)
3. **Way 2 route** — new `archives/extractions/<slug>/` (never extend testplat-1) — DoD: slug + path locked before writes
4. **Art-direction honesty** — raw chrome audit; **Avoid** list; never copy into REGISTRY — DoD: Avoid recorded (purple-indigo glow, Inter hero, glass stacks)
5. **Way 2 stop** — kit id + verify exit 0 — DoD: named in covenant
6. **Build-through opt-in** — explicit yes/no — DoD: recorded; default **no**
7. **Way 1 scope** (if opted) — suite slug + END-GOAL — DoD: bullets only until Way 1 phase
8. **Gears** (if Way 1) — `gears_emit_mode: A`; Parent names before gear-set
9. **Walls** — no product app code in BPS; no false GO; rendered-not-verified

| Output | archive mode | build-through mode |
|---|---|---|
| Inventory | chat + Way 2 research note | skip unless drift |
| Overlap matrix | research note or MAP | `specs/overlap-matrix.md` in BPS |
| Extraction | mint + fill | read existing |
| RE-APP.md | mint on Way 2 done | read + update `build_through` |
| BPS suite | if opted after Way 2 | primary deliverable |
| admin/wiki | Way 2 research | Mode A if Way 1 + gears |

## Phase map workflow

1. **Trinity Round 1** — inventory + overlap matrix pressure (covenant above).
2. **Way 2 Archive** — mint `archives/extractions/<slug>/`, scaffold, extract, verify.
3. **Verify gate** — `npm run verify` exit 0; mint `RE-APP.md`.
4. **Ask build-through** — default no; valid stop = parts on shelf.
5. **Way 1 Adopt** (optional) — invoke `lk_build-plan-suite_v1` + optional `lk_gear-set_v1`; paper only.
6. **Build** — **not** `/lk_re-app_v1`; separate `lk_prep-prompt_v1` / SBT GO.

## Way 2 — Archive (required)

### Folder tree

```
archives/extractions/<slug>/
├── README.md
├── REGISTRY.md
├── MAP.md
├── STRUCTURE.md
├── RE-APP.md           # mint on Way 2 done gate
├── package.json        # npm run verify
├── scripts/            # check-* cloned from testplat pattern
└── libraries/
    ├── <slug>-core/
    ├── <slug>-surfaces/
    └── <slug>-kits/
```

- **Clone law** from pattern donor README/REGISTRY/MAP/verify script *shape* — **do not** extend testplat-1 in place.
- Scaffold: copy `scripts/` from testplat (token-replace paths); generate empty libraries + REGISTRY/MAP stubs.
- Register **MASTER-ARCHIVE-INDEX** (`kind: extraction`) + **LIBRARY-INDEX** when new lane.

**Routing:** **2a** library extraction (default, this skill) → `@lk-bloom/ds-*` in `libraries/` · **2b** optional `excavate-design-index` (not in v1 bundle) → gallery master · **2c** both.

**Extraction law:** logic never emits style; one component all worlds; rendered-not-verified; MAP provenance bidirectional; cite reuse from prior extractions — no silent ID forks.

### Way 2 done gate (`/lk_re-app_v1` can stop here)

- REGISTRY + MAP updated; new kit replays raw first viewport.
- `npm run verify` exit 0 in extraction lane.
- Index rows if new lane.
- **Mint `RE-APP.md`** (template below).
- **No BPS suite required.**

### Verification

Run `npm run verify` in the extraction lane. Checker table and fail conditions → pattern donor README § Verification — do not duplicate full checker list here.

## Way 1 — Adopt (optional build-through)

**Runs only** when conductor opts in after Way 2 done gate. Inputs = archived overlap matrix + REGISTRY/MAP (not raw-only guesses).

Invoke **`lk_build-plan-suite_v1`** for suite under `.admin/docs/plan-suites/<suite-slug>/`:

```
README.md, END-GOAL.md, plans/, specs/ (art-direction.md, overlap-matrix.md, …), guides/ (source-inventory.md, re-app-routing.md)
```

- **admin/wiki** — thin Mode A stub per BPS §5c when Way 1 + gears; research from Way 2 filed here.
- Optional **`lk_gear-set_v1`** tail — Way 1 only; `gears_emit_mode: A` default when wiki absent.

### Way 1 done gate

- Suite + overlap matrix + art-direction on disk.
- Every surface: reuse archived element | planned build unit | out of scope.
- `agents/.gears/` + Design walls if gears ran.
- **Explicit:** paper until `lk_prep-prompt_v1` / SBT — not `/lk_re-app_v1`.

## Split sessions

| Visit | You say | Agent does | Stop line |
|---|---|---|---|
| **1 — archive** | `/lk_re-app_v1` + raw path · build-through **no** | Inventory → mint extraction → verify pass | Parts on shelf; `RE-APP.md` minted |
| **2 — adopt** | `/lk_re-app_v1 build-through` + slug or extraction path | Re-entry checks → BPS + optional wiki/gears | Paper suite on disk |
| **3 — build** | `lk_prep-prompt_v1` / SBT | Implement app | Product code — **not** `/lk_re-app_v1` |

**Re-entry checks (Visit 2):** extraction exists; `npm run verify` pass; REGISTRY + MAP present; if raw drifted → Way 2 refresh before Way 1.

## Companion skills

| Need | Skill |
|---|---|
| Way 1 paper suite | `lk_build-plan-suite_v1` — Way 1 only; never without Way 2 + opt-in |
| Way 2b gallery master | `excavate-design-index` (not in v1 bundle) — optional after Way 2 |
| Inventory + archive pressure | `lk_trinity_v1` (`/lk_trinity_v1`) |
| Gears emit (Way 1 tail) | `lk_gear-set_v1` |
| HOLD/GO posture | `lk_hive-queen_v1` |
| Next-phase kickoff after paper | `lk_prep-prompt_v1` |

## testplat-1 posture

`uvrn_testing-platform_design-system_extraction-1` stays at **repo root** (historical Explorations lane). **Pattern donor** — clone REGISTRY/MAP/verify *shape* into new `archives/extractions/`. **Do not** extend in place, silent move, or deprecate without migration pass. Cite testplat elements in MAP provenance when concepts match.

## Package naming law

`@lk-bloom/ds-{full-slug}-{tier}` e.g. `uvrn-verification-wiki-1-core` — full slug, not abbreviated brand. **Not** `@uvrn/*`. Mirror pattern donor package table.

## Art-direction honesty

Record **Avoid** list in covenant; never land raw clichés in REGISTRY. Wiki-class minimum Avoid: purple-indigo glow, Inter hero, glass stacks. Archive structure; re-theme via registered worlds.

## Admin verify / fail if missed

- Way 1 runs before Way 2 `npm run verify` pass.
- Silent migration or merge of testplat-1 without conductor migration pass.
- Raw purple-indigo chrome in REGISTRY as canon world tokens.
- BPS or `/lk_re-app_v1` claims GO or ships app code.
- Archive elements without MAP provenance.
- `agents/.gears/` without END-GOAL + Design walls when visual Way 1 ran.
- Way 2 done without `RE-APP.md`.

## RE-APP.md template (mint on Way 2 done)

```markdown
# RE-APP marker

slug: <slug>
source_path: <absolute or workspace path to raw app>
as_of: <YYYY-MM-DD>
verify_status: pass | fail
way2_complete: true
build_through: false
```

Update `build_through: true` when Visit 2 completes. Cold-start marker for new chats.

## Done report format

Return in chat:

1. Mode (archive | build-through)
2. Extraction slug + resolved path
3. Way 2 gate (`npm run verify`, RE-APP.md)
4. Build-through decision
5. Way 1 paths (if ran)
6. Open asks for Admin

## Examples

See [examples.md](examples.md).