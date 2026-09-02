# lyrikai-agent

**Lyrikai Agent** — Cursor master skill suite. Point at a product or ask → `/lyrikai-agent` → one bundled companion (`/lk_*_v1`) → walk toward done → **WAIT** before irreversible steps.

MIT product for routing bundled skill copies in Cursor. Skill **bodies** are vendored under `skills/lk_*_v1/` — not symlinked from tip.

## What it is

| Surface | Role |
|---------|------|
| **`/lyrikai-agent`** | Master router — reads `WORK-HOME.md` + `ROUTING.md`, opens one bundled skill |
| **`/lk_*_v1`** | Bundled copies of tip companions (rename-only vendoring) |
| **`work/`** | LK Agent write umbrella — extractions, products, templates |
| **Cursor picker** | **Lyrikai Agent** (`~/.cursor/agents/lyrikai-agent.md`) |

Not harness v0 (scene router / MANIFEST). Not tip `/lyrikai` meta-seat. Not Claude Desktop in v1.

---

## LK Agent system boundary

LK Agent is **its own system**. All generated artifacts default under **`work/`**:

```text
work/
├── archives/extractions/<slug>/   # re-app Way 2
├── products/<slug>/               # wiki, plan suites, gears
└── templates/                     # optional raw donors
```

Config in `~/.lyrikai/config`:

```bash
LYRIKAI_AGENT_ROOT=/path/to/lyrikai-agent
LK_AGENT_WORK_ROOT=$LYRIKAI_AGENT_ROOT/work   # override allowed
```

**Contrast:** tip `/lyrikai` is the Hive meta-seat; `lk-bloom_design-systems` is an optional **read-only donor** — not the default write target for LK Agent.

Path law: [`WORK-HOME.md`](WORK-HOME.md).

---

## Prerequisites

- **Cursor IDE** with skills + agents support
- Optional **external agents** for full loops:
  - `~/.cursor/agents/build-auditor.md` (closeout audit gate)
  - `trinity-grunt`, `trinity-watcher`, `trinity-wizard`, `trinity-servitor` (Trinity Task seats)
- Optional **tip extras** (not bundled) for full SBT hallway on maintainer machine:
  - `install.sh --with-tip-extras` symlinks: `hive-adversary-agents`, `qabal-tree`, `research-update`, `super-build`

See `skills/BUNDLE.md` for the full external-deps table.

---

## Bundled vs original

| Bundled invoke | Original tip slug |
|----------------|-------------------|
| `/lk_hive_v1` | `/hive` |
| `/lk_hive-queen_v1` | `/hive-queen` |
| `/lk_re-app_v1` | `/re-app` |
| `/lk_trinity_v1` | `/trinity` |
| `/lk_build-plan-suite_v1` | `/build-plan-suite` |
| `/lk_gear-set_v1` | `/gear-set` |
| `/lk_super-build-trinity_v1` | `/super-build-trinity` |
| `/lk_spin-agents_v1` | `/spin-agents` |
| `/lk_handoff_v1` | `/handoff` |
| `/lk_hive-agents_v1` | `/hive-agents` |
| `/lk_audit-prompt_v1` | `/audit-prompt` |
| `/lk_prep-prompt_v1` | `/prep-prompt` (deprecated → handoff prep) |
| `/lk_closeout_v1` | `/closeout` |

Tip originals remain available if separately installed — prefer bundled invokes when seated via this product.

---

## Install

**Standalone or monorepo:**

```bash
cd lyrikai-agent
./agent/install/install.sh
./agent/install/verify.sh
```

Optional flags:

```bash
./agent/install/install.sh --remove-legacy-agent    # remove harness v0 lyrikai-super.md
./agent/install/install.sh --with-tip-extras        # symlink SBT hallway tip skills when LK_BLOOM present
```

Install writes:

- `~/.lyrikai/config` with `LYRIKAI_AGENT_ROOT` + `LK_AGENT_WORK_ROOT`
- Scaffolds `work/` subdirs
- Symlinks 14 bundled skills + master → `~/.cursor/skills/`
- Copies `agent/agents/lyrikai-agent.md` → `~/.cursor/agents/`

Only `LYRIKAI_AGENT_ROOT` is required — no sibling `hive-vip-1` checkout needed for install.

**Migration:** if `~/.cursor/agents/lyrikai-super.md` exists from harness v0, switch picker to **Lyrikai Agent**; run `--remove-legacy-agent` when ready.

---

## Example chats

1. **Reverse-engineer a template**

   > `/lyrikai-agent reverse engineer /path/to/raw-app`

   → proposes `/lk_re-app_v1`, writes under `work/archives/extractions/<slug>/` and `work/products/<slug>/`, **WAIT** before archive writes.

2. **Paper plan for a new unit**

   > `/lyrikai-agent map a plan for the catalog stack feature`

   → opens `/lk_build-plan-suite_v1`, stops at END-GOAL under `work/products/<slug>/`.

3. **Prep next phase**

   > `/lyrikai-agent prep next phase`

   → `/lk_handoff_v1 prep` (prefer over deprecated prep-prompt wrapper).

---

## Walls

- **WAIT** before irreversible steps (build, commit, push, tip write, merge)
- **Paper ≠ build** — plan suite complete ≠ production GO
- **Route, don't replace** — Queen, Trinity, SBT, independent Audit stay delegated
- **Edit bundled copies only** — refresh from sources via `scripts/bundle_skills.sh`

---

## Not included (v1)

- Claude Desktop / `~/.claude/skills` install
- Tip or home-original skill edits
- Tip `lyrikai` / wiki-log meta unfurl
- Harness v0 docs (parked under `.admin/legacy/`)
- Bundling SBT tip extras (use `--with-tip-extras` instead)

---

## Monorepo dev

Develop from `lk-bloom/lyrikai-agent/`. Refresh bundles after tip changes:

```bash
./scripts/bundle_skills.sh          # needs LK_BLOOM
./scripts/bundle_skills.sh --check  # standalone verify, no LK_BLOOM
./agent/install/install.sh
```

Publish to standalone [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent) separately.

Paper attic (superseded): `.admin/docs/plan-suites/lyrikai-super-agent/`

Smoke tests: [`DOGFOOD.md`](DOGFOOD.md).

---

## License

MIT — see `LICENSE`.
