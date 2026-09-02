---
name: lk_gear-set_v1
description: >-
  Mint or refresh agents/.gears for a plan suite with an END-GOAL: follow
  product RULEBOOK apply order, pull admin/wiki catalog before invent, invoke
  Trinity for research, file finds via wiki PROTOCOL, add catalog cards after
  emit. Use with /lk_build-plan-suite_v1, /lk_gear-set_v1, or when asked to build a
  gear-set for an idea/MVP/phase. Docs/skills only; no product implementation.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/gear-set` · original: `/gear-set` · do not edit original


# Gear-set

Mint or refresh the **agent gear-set** (`agents/.gears/`) so a human plan suite can run complete. Humans keep maps; you keep teeth.

**Ops SoR (product):** `agents/.gears/RULEBOOK.md` when present — cite; do not fork this tip file into the product.

**Companion map mint:** [`../lk_build-plan-suite_v1/SKILL.md`](../lk_build-plan-suite_v1/SKILL.md) · attic law [`../../PLANNING-ATTIC.md`](../../PLANNING-ATTIC.md).

## When to use

- `/lk_gear-set_v1` or “build/refresh the gear-set”
- After `/lk_build-plan-suite_v1` created/updated a suite with `END-GOAL.md`
- Trinity parent asks Grunt to emit gears toward an end goal
- Human asked for gears on a product that has (or should have) `agents/.gears/`

Do **not** run this skill just because a plan suite exists. BPS invokes it only when the product has `agents/.gears/` **or** the human asked for gears.

## Companion skills

| Need | Skill / surface |
|------|-----------------|
| Plan suite (human map) | `lk_build-plan-suite_v1` |
| Research triad | `lk_trinity_v1` |
| Hive cold-start | `lk_hive_v1` / product `.hive` |
| Wiki filing | product `admin/wiki/PROTOCOL.md` until tip `factory/WIKI-PROTOCOL.md` is Admin-landed and the product TIP-PIN cites it |
| Utilities library | product `admin/wiki/catalog/INDEX.md` + `HIERARCHY.md` |
| Product RULEBOOK | product `agents/.gears/RULEBOOK.md` |
| Tip design pack (visual END-GOAL) | tip `design/` + `precision/DESIGN-DO-DONT.md` (cite; do not fork) |

## Hard walls

- Write only inside the **product checkout** unless Admin unlocks tip/VIP.
- **Tip** and **`lk-gears`** are **not** write targets for another product’s gear-set run (tip = read-only law; lk-gears = workshop cite-only). Do **not** force an every-run read of `lk-gears`.
- Require `END-GOAL.md` + `end_goal_ref` before gear writes. No end goal → **stop**; do not invent gears.
- **Pull** product `admin/wiki/catalog/INDEX.md` + `HIERARCHY.md` (+ archive) before inventing utilities — **except** Mode B / thin greenfield (below).
- File Trinity research via wiki PROTOCOL — do not leave material research only in chat (when wiki exists or Mode A/C stubbed).
- After invent/emit: **add/refresh** catalog card + INDEX row when a catalog exists.
- Catalog ≠ second SoR. Hierarchy L* ≠ RULEBOOK apply-order.
- Watcher ≠ Audit. Prefer HOLD over false GO.
- No absolute machine home paths in committed files (tip cite by `lk-bloom/hive-vip-1/hive-vip-1_main/…`).
- Do **not** implement feature code, seed apps, or `/lk_super-build-trinity_v1` from this skill.
- Do **not** force an `agents/.gears/` attic onto a product that did not opt in.
- Do **not** invent a second design Do/Don’t — cite tip design pack when visual.
- Honor `gears_emit_mode: B|A|C` from Trinity/BPS/Admin when present (tip `PLANNING-ATTIC` §3c).

## Workflow

### 0. Greenfield / wiki-absent (Trinity Mode B / A / C)

When the product has **no** `admin/wiki/` catalog (or no wiki tree yet) and the human asked for gears (or BPS opted in):

1. Resolve `gears_emit_mode` from Trinity covenant, BPS §5c, or Admin override. Else apply tip `PLANNING-ATTIC` §3c heuristics. Non-trivial visual gears opt-in **should** spawn `/lk_trinity_v1` for mode pick when mode is unset.
2. Still require a resolved `END-GOAL.md` + `end_goal_ref` (see step 1). No end goal → **stop**.
3. Do **not** write tip. Do **not** write `lk-gears` as a substitute home.

**Mode B** (default light lab — richer greenfield, no wiki invent):

- Emit `agents/.gears/GEARS.md` + `agents/.gears/RULEBOOK.md` under the **product checkout**.
- Also emit thin product-local teeth when useful for the END-GOAL: `agents/.gears/rules/` stubs and/or `agents/.gears/skills/` stubs keyed to `end_goal_ref`.
- **Skip** inventing a research tree, catalog cards, or utilities library.
- When END-GOAL is **visual** (or suite has `specs/art-direction.md`): RULEBOOK **must** include Design walls (§7b).
- HOLD: packaged teeth ≠ GO. Stop after verify (step 9).

**Mode A** (wiki stub first):

- Do **not** invent the wiki from this skill — BPS §5c (or Trinity→BPS) emits the thin `admin/wiki/` stub.
- If stub is missing and mode is A/C → **stop** with ask: run BPS Mode A stub (or Admin unlock) before gear-set full path.
- After stub exists → continue with the full pull → Trinity → file → catalog path below (same as wiki-present).

**Mode C** (A then full path):

- Require Mode A stub already on disk (BPS §5c).
- Then continue full path below (pull → Trinity → file → catalog → apply order).

**Thin safe default** (no Trinity, mode unset, wiki-absent):

- Emit **minimal** `GEARS.md` + `RULEBOOK.md` only (+ Design walls when visual). Same as historical §0 thin pair.
- Prefer spawning Trinity on non-trivial visual packs rather than staying thin forever.

If wiki/catalog **does** exist (or Mode A/C stubbed), continue with the full pull → Trinity → file → catalog path below.

### 1. Locate END-GOAL

Resolve **one** `END-GOAL.md` (first match wins; do not invent a third home):

1. Tracked human attic: `admin/plans/<slug>/END-GOAL.md` (see `admin/plans/MANIFEST.md` when present).
2. BPS planning attic: `.admin/docs/plan-suites/<slug>/END-GOAL.md`.

If neither exists → **stop**. Prefer promoting a durable stop line into `admin/plans/` when the product uses three-attics law; `.admin/` remains gitignored scratch unless the product un-ignores the planning attic.

### 2. Open RULEBOOK

Product `agents/.gears/RULEBOOK.md`. If missing and the human asked for gears, emit RULEBOOK + `GEARS.md` (and Mode B stubs when mode is B). On Mode B / thin default, that stack **is** the emit — stop after verify (step 9) without inventing catalog. Apply §7b Design walls when visual before stopping. On Mode A/C with stub present, continue.

### 3. Open wiki PROTOCOL

Product `work/products/<slug>/admin/wiki/PROTOCOL.md` (or pinned tip `factory/WIKI-PROTOCOL.md` after Admin land). If wiki-absent and Mode B / thin default, skip PROTOCOL / research / catalog invent (see §0). If Mode A/C, PROTOCOL must exist from BPS stub before continuing.

### 4. Pull library

Product `work/products/<slug>/admin/wiki/catalog/INDEX.md` + `HIERARCHY.md`; scan `archive/` for retired twins. When visual, prefer reuse of any `design-principles-cite` (or equivalent) tip-cite card before inventing. Skip invent until pull is done. If Mode B / thin default (no catalog), do not invent one unless Admin asks; emit the Mode B or thin stack only (see §0) **including** Design walls when visual.

### 5. Trinity (non-trivial packs)

Wizard research questions; Grunt emit scope; Watcher checklist = END-GOAL + RULEBOOK + hierarchy (when present). Trivial refresh (pointer-only) may skip the triad.

On wiki-absent gears opt-in: Trinity Parent may name `gears_emit_mode` (§0) before emit.

**Non-trivial visual packs:** Wizard slice must **file** art-direction research (cite tip `design/` + `DESIGN-DO-DONT`) into product `admin/wiki/research/` when wiki exists, **or** into suite `specs/art-direction.md` / a dated research note under the suite when Mode B / wiki-absent — recommend only; Grunt emits RULEBOOK Design walls. Wizard does not self-spawn Build.

**SBT join:** under `/lk_super-build-trinity_v1`, Wizard may suggest gears upgrades (`Routes to: gear-set`); Grunt does not silent-refresh unless covenant includes a gears-refresh slice.

### 6. Research + file

Wizard returns cites; write `admin/wiki/research/YYYY-MM-DD-gear-set-<slug>.md` when wiki exists; INDEX row; invent-utility / tip proposals if needed.

### 7. Apply order (smallest stack)

Update `GEARS.md` (`end_goal_ref` → the resolved END-GOAL) → `rules/` → `skills/` → `agents/`.

Optional: when a product brief exists under `agents/.design/`, `GEARS.md` may list that path as a pointer — still no feature Build from gear-set.

### 7b · Design walls (when END-GOAL is visual)

**Trigger:** END-GOAL implies visible UI, **or** suite already has `specs/art-direction.md` / art-direction `end_goal_ref`.

RULEBOOK **must** include a short **Design walls** section:

1. Open suite `specs/art-direction.md` (or cited tip design pack + product brief) **before** any CSS beyond reset / layout / token stubs.
2. Cite tip `lk-bloom/hive-vip-1/hive-vip-1_main/design/` + `precision/DESIGN-DO-DONT.md` — do not fork.
3. **Scaffold neutrality:** early Build units must not invent cream+serif broadsheet, purple-on-white / purple-indigo glow, or Inter/Roboto/Arial as hero display; use art-direction token stubs only until the theme unit.
4. Theme / art unit owns real palette, type, marks, motion — not “polish the scaffold cliché.”

### 8. Add catalog

Create/update utility card + `catalog/INDEX.md` row for new/changed utilities when a catalog exists.

### 9. Verify

`end_goal_ref` resolves; stubs exist; library row matches emit when catalog exists; HOLD stated; when visual, RULEBOOK contains Design walls (§7b); when Mode B/A/C was named, handoff lists `gears_emit_mode`.

### 10. Stop

Do not begin product app implementation. Do not run `/lk_closeout_v1`. List paths + `end_goal_ref` + HOLD (+ `gears_emit_mode` when set).

## Outputs

- Updated `agents/.gears/**` (Mode B may include `rules/` / `skills/` stubs)
- Wiki research and/or proposals as needed (Mode A/C or wiki-present)
- Catalog card + INDEX updates after invent/emit when catalog exists
- Short handoff: paths, end_goal_ref, HOLD, gears_emit_mode

## Non-goals

- Replacing `/lk_build-plan-suite_v1` (plans stay the human attic / planning attic; Mode A stub is BPS’s job)
- Implementing the product or claiming a working preview
- Silent VIP / tip promote
- Substituting for `/lk_super-build-trinity_v1` / `/lk_closeout_v1`
- Auto-refreshing gears mid-SBT without Orchestrator/Admin covenant

## Trigger examples

- `/lk_gear-set_v1`
- “build/refresh the gear-set”
- After `/lk_build-plan-suite_v1` with an `END-GOAL.md` on a gears-opt-in product
- “mint agent teeth for this suite”