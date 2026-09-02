---
name: lk_build-plan-suite_v1
description: >-
  Designs and writes a suite of followable plan/spec/guide documents (a plan to
  build plans) without implementing product builds. Prefers Plan mode; uses Hive
  protocols when available. Use when the user types /lk_build-plan-suite_v1, or asks
  for a plan suite, suite of plans, plan-to-build-plans, or an agent-ready
  planning package.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/build-plan-suite` · original: `/build-plan-suite` · do not edit original


# Build Plan Suite

Meta-planner: produce a **suite of plans, specs, and guides** that any later agent can read and follow. **Never** implement product builds, open PRs, deploy, or run closeout as part of this skill.

**Ops SoR (tip):** [`factory/PLANNING-ATTIC.md`](../../PLANNING-ATTIC.md) — cite by path; do not fork.

## Runtime topology

| Layer | Role |
|-------|------|
| Tip `hive-vip-1_main` | **Read-only law** for this skill, `lk_gear-set_v1`, and PLANNING-ATTIC (skills are often symlinks from agent homes into tip). Do **not** write tip as part of a normal BPS run. |
| Product checkout | **Only default write target** — suite under `.admin/docs/plan-suites/`; optional `agents/.gears/` when gears opt-in. Product `agents/.gears/RULEBOOK.md` = local gear rules when present. |
| `lk-gears` | Workshop / specimen — **cite only**; **not** required to run BPS on other products. Do not treat it as a write target for another product’s suite. |

## Companion skills

| Need | Skill |
|------|--------|
| Design + write the planning suite | **this skill** |
| Raw app reverse-engineer (Way 1 only after archive verify + build-through opt-in) | `/lk_re-app_v1` |
| Gear-set emit (opt-in) | `lk_gear-set_v1` |
| Greenfield gears mode chooser (wiki-absent) | `lk_trinity_v1` — Parent names `gears_emit_mode: B\|A\|C` per tip `PLANNING-ATTIC` §3c |
| Hive cold-start / SoR | `lk_hive_v1` |
| Board heartbeat / Paper visibility | `hive-workstreams` |
| Pasteable next-phase kickoff after suite exists | `lk_prep-prompt_v1` |
| Step-by-step co-pilot execution of an approved plan | `instruction-manual` (not in v1 bundle) |
| User-facing session highlight | `session-summary` |
| Tip design pack (visual suites) | tip `design/` + `precision/DESIGN-DO-DONT.md` (cite; do not fork) |
| Factory art-direction brief (factory ship) | `factory/prompts/DESIGN-RESEARCH.md` (optional cite when product will enter factory) |

## Hard walls

- Write **plan / spec / guide markdown only** (plus required WORKSTREAMS **Paper** pointer when Hive present; plus Mode A/C thin `admin/wiki/` stub when §3c / §5c delegates).
- Do **not** implement feature code, seed apps, migrations, or deploys.
- Do **not** “start building BP-N” or run `/lk_closeout_v1`.
- Do **not** invent Hive tip process outside the Hive tree.
- Do **not** open **Active** or **Proof** WORKSTREAMS rows from suite creation.
- **Paper ≠ start / CP-0 / GO.**
- After writing the suite (+ Paper-register when Hive), if the product has `agents/.gears/` **or** the user asked for gears, resolve tip `PLANNING-ATTIC` §3c then invoke `/lk_gear-set_v1`, then **stop**. Gear-set ≠ Build.
- After writing the suite (+ Paper-register when Hive), **stop** with an index of paths + suggested first entrypoint. Do **not** begin implementation.
- Do **not** invent a second design Do/Don’t body in the suite — cite tip `design/` + `precision/DESIGN-DO-DONT.md`.
- Mode A stub ≠ tip `factory/WIKI-PROTOCOL.md` land.

## Workflow

### 1. Prefer Plan mode

If not already in Plan mode, switch (or ask the user to approve the switch) before designing the suite. Agree the suite shape first (CreatePlan / plan doc). Write suite files only after the user approves — or when they already gave an explicit go in Agent mode.

### 2. Resolve placement

**Default for pre-unit paper** (resolve slug → `work/products/<slug>/`):

```
work/products/<slug>/.admin/docs/plan-suites/<suite-slug>/
```

Ensure parent attic index exists (copy tip scaffold
`master-build/scaffold/plan-suites/README.md.template` →
`.admin/docs/plan-suites/README.md` if missing; fill local index row).

**Greenfield (product checkout missing):** if the named product path does not exist yet, **ask once** for the product checkout path, then create the suite tree **under that product only**. Do not write tip. Do not write `lk-gears` as a stand-in product home.

**Hive / build-master available** (product `.hive/` → WORKSTREAMS SoR, tip/yard present, or user invokes `/hive`):

1. Cold-start per `lk_hive_v1`: read VIP tip `ORCHESTRATION.md` first; then only what the ask needs.
2. Read tip `factory/PLANNING-ATTIC.md`.
3. Place suite under the attic path above (prefer attic over inventing Active `BP-*` from paper).
4. Follow Hive gates, walls, and role rules. Do not invent process outside the tip/yard trees.

**Ship-unit blueprints** (only when Admin already opened a program that uses build-master `01-blueprints/`): use instance `BP-NN-*.md` conventions — still **do not** silent-KEEP / CP-0 from this skill alone.

**No Hive SoR:**

- Default root: `work/products/<slug>/.admin/docs/plan-suites/<suite-slug>/`
- Ask once only if multiple workspace roots compete, or if the product checkout path is missing (greenfield).
- Create the folder tree as needed **under the product only**.
- Skip WORKSTREAMS Paper-register; the finish handoff **must** state clearly: no WORKSTREAMS SoR / board step skipped.

### 3. Design the suite (meta-plan)

Before writing files, lock:

- Suite slug + one-line purpose
- Ordered units/phases and dependencies
- Which docs are plans vs specs vs guides
- Hard walls and success definition for the whole suite (must become `END-GOAL.md`)
- First agent entrypoint (suite README or first BP)
- **Visual?** If END-GOAL implies a visible UI / interactive surface, mark the suite **visual** and apply §3b

### 3b · Visual UI / design intelligence (when END-GOAL is visual)

**Trigger:** END-GOAL includes a playable app, page, board, dashboard, landing, or other user-visible UI (not docs-only / protocol-only suites).

**Pull first:** tip `design/README.md` + `design/GUIDE.md` + `precision/DESIGN-DO-DONT.md`. Optional when product will later enter factory: `factory/prompts/DESIGN-RESEARCH.md`. Do not fork those bodies into the suite.

**Required emits:**

1. **`specs/art-direction.md`** — product thesis, tokens/palette direction, type, marks/motion budget, brand test, and an **Avoid** list that cites tip Precision anti-patterns (at minimum: purple-on-white / purple-indigo glow; Inter/Roboto/Arial as hero display; cream+terracotta or cream+serif broadsheet; glass card stacks / badge clutter as “design”).  
   - Alternate (explicit): cite tip design pack + place a product brief under `agents/.design/` **and** still keep a suite pointer from `specs/` or README — do not leave Build with zero art-direction path.
2. **END-GOAL theme bullet** — measurable: theme applied; not stock Vite/template chrome; not listed clichés.
3. **Early scaffold unit walls** (typically `plans/01-*`): shell CSS = reset / layout / art-direction **token stubs only** (`:root` names from art-direction with dull/neutral values OK). **Forbid** inventing a competing palette or display typeface in scaffold. Theme unit may follow logic units, but the **Avoid list is in force from unit 01**.
4. Suite README hard walls must name art-direction cite + scaffold neutrality.

**Docs-only suites:** skip §3b; keep `specs/` optional.

### 4. Write the suite package

#### Attic layout (minimum)

```
.admin/docs/plan-suites/<suite-slug>/
├── README.md
├── END-GOAL.md     # required stop line (human)
├── plans/
│   └── NN-<slug>.md
├── specs/          # required art-direction.md when visual (§3b); else as needed
└── guides/         # as needed
```

Always emit `END-GOAL.md` in the suite package (measurable stop). README success definition must match that file.

#### Every unit plan must be fresh-agent complete

Include:

- Goal and stop condition
- In-scope paths / out-of-scope
- Prerequisites and dependencies
- Ordered steps
- Verification commands + expected pass signal
- Evidence / handoff fields
- Next dependency (what unlocks after this unit)
- When visual + early scaffold: explicit scaffold-neutrality wall (token stubs / reset only; Avoid in force)

#### Suite `README.md` must include

- Purpose and audience
- How any agent should start
- Ordered index of plans (with paths)
- Hard walls for the suite
- Success definition (must match sibling `END-GOAL.md`)
- Explicit note: this suite is for planning/docs only until a later agent is asked to build
- Cite tip `factory/PLANNING-ATTIC.md` and parent attic `../README.md` when present
- When visual (§3b): path to `specs/art-direction.md` + tip design-pack cite + scaffold-neutrality wall

### 5. Finish

After suite files are written:

#### 5c · Greenfield gears ladder (before gear-set)

When gears are opt-in (`agents/.gears/` present **or** human asked for gears) **and** the product has no `admin/wiki/` tree yet:

1. Resolve `gears_emit_mode` per tip `factory/PLANNING-ATTIC.md` §3c.
2. If sticky `/lk_trinity_v1` (or non-trivial visual gears opt-in): Parent **must** name `gears_emit_mode: B|A|C` in covenant + rollup before Grunt writes. Wizard recommends; Watcher pressure-checks; Grunt emits.
3. Heuristic when no Trinity / no Admin override: no `.hive/` + no `admin/` → **B**; Admin/user asked full gears / wiki / three-attics / research durability → **A then C**.
4. **Mode A or C:** emit thin wiki stub under **product** only (before `/lk_gear-set_v1`):

```text
admin/wiki/
  PROTOCOL.md          # thin shell — cite specimen shape; HOLD; not tip WIKI-PROTOCOL
  README.md            # one-line purpose + HOLD
  catalog/
    INDEX.md           # empty master table shell
    HIERARCHY.md       # L0–L4 altitude stub (catalog ≠ RULEBOOK apply-order)
  research/            # empty + optional INDEX.md stub
  proposals/           # empty
  templates/           # empty or pointer-only
```

   Cite specimen `lk-gears` `admin/wiki/PROTOCOL.md` for shape (read-only). Do **not** write tip. Do **not** write `lk-gears`. Do **not** claim tip `factory/WIKI-PROTOCOL.md` landed.
5. **Mode B:** skip wiki invent; `/lk_gear-set_v1` richer §0 handles teeth.
6. Then invoke `/lk_gear-set_v1` with the named mode (skill `lk_gear-set_v1`).

If wiki already exists → skip §5c; invoke `/lk_gear-set_v1` full path.

#### 5a · Hive present (required)

1. Locate SoR via product `.hive/WORKSTREAMS.md` (pointer → build-master `WORKSTREAMS.md`).
2. **Event→row** a **Paper / parked** pointer:
   - WS/id + title for the suite
   - Path to suite `README.md` + tip `factory/PLANNING-ATTIC.md` cite
   - Status: **PAPER** (not started)
   - Unlock: none, or later Admin start on **own** checkout/leaf
   - Must-not: treat as CP-0, GO, Active, Proof, or fold into wrong-leaf BPs
3. Stamp heartbeat `as_of` in the **same** turn.
4. Refresh thin `.hive/WORKSTREAMS.md` mirror snapshot to match ledger Paper/Active/Proof lanes.
5. Update parent attic index table with the new suite row.
6. Confirm `END-GOAL.md` exists in the suite package.
7. **Gears opt-in:** if the product has `agents/.gears/` **or** the user asked for gears, run §5c then invoke `/lk_gear-set_v1` (skill `lk_gear-set_v1`), then continue to stop. Do not force a gears attic onto a product that did not opt in.
8. List paths + Paper row cite + first entrypoint. Optionally note `lk_prep-prompt_v1` for unit 1. If Mode A/C stubbed, list `admin/wiki/` paths. If gears ran, list `agents/.gears/` paths + `end_goal_ref` + `gears_emit_mode`.
9. **Stop.** Do not begin implementation. `/lk_gear-set_v1` ≠ Build ≠ `/lk_super-build-trinity_v1`.

#### 5b · No Hive SoR (louder finish)

There is **no** board row to invent. Finish fields are still required — say them out loud:

1. Update parent attic index if present.
2. Confirm `END-GOAL.md` exists in the suite package.
3. **Gears opt-in:** if the product has `agents/.gears/` **or** the user asked for gears, run §5c then invoke `/lk_gear-set_v1`, then continue to stop. Gear-set ≠ Build.
4. Handoff **must** include:
   - Suite paths (README + END-GOAL + unit plans)
   - First agent entrypoint
   - Explicit: **no WORKSTREAMS SoR** — board / Paper-register **skipped**
   - Explicit: **Paper ≠ start / CP-0 / GO** (even with no board)
   - If Mode A/C: `admin/wiki/` stub paths + HOLD (stub ≠ tip WIKI-PROTOCOL)
   - If gears ran: `agents/.gears/` paths + `end_goal_ref` + `gears_emit_mode`
5. **Stop.** Do not begin implementation. Do not open Active/Proof rows elsewhere to “make up” for a missing board.

## Trigger examples

- `/lk_build-plan-suite_v1`
- “build a suite of plans for this program”
- “plan to build the plans — don’t implement”
- “agent-ready planning package under .admin/docs”