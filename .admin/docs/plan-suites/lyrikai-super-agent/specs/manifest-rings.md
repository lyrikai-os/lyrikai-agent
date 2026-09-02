# MANIFEST rings — skill bundle table

**Suite:** `lyrikai-super-agent`  
**Emit target:** `lyrikai-agent/agent/MANIFEST.md` (unit 02)  
**Source of truth for slugs:** tip `factory/skills/lyrikai/ADMIN-SKILLS.md`

---

## Package header

| Field | Value |
|-------|-------|
| `package_id` | `lyrikai-super-agent` |
| `version` | `0.1.0-proposal` |
| `tip_pin` | Recorded at install (`git rev-parse HEAD` on tip) — not baked into skill bodies |
| `entrypoints` | `/lyrikai`, Cursor agent `lyrikai-super` |
| `install` | `agent/install/install.sh` |

---

## always_stack

Invoked on every `/lyrikai` seat — no scene gate required:

| Slug | Role |
|------|------|
| `hive-queen` | Chat soul — overview, HOLD honesty, rollup template |
| `trinity` | Engine — covenant, modes, servitors |
| `wiki-log` | Seat memory unfurl |

---

## foundation_ring

| Slug | Warm | Role in super agent |
|------|------|---------------------|
| `hive-queen` | always | Queen chat soul |
| `trinity` | always | Trinity engine |
| `wiki-log` | always | Seat memory |
| `hive` | on demand | VIP tip SoR cold-start when scene needs ORCHESTRATION / `.hive` / install law |

**Note:** `hive` is foundation but **not** a separate front door — activated when scene requires SoR reads.

---

## hive_ops_ring

| Slug | Scene trigger | Role |
|------|---------------|------|
| `hive-agents` | parallel non-Admin slices | Explore/draft helper bees |
| `hive-adversary-agents` | adversary pressure | Argument pools — guide only; not Watcher |
| `hive-workstreams` | Paper row / WORKSTREAMS visibility | Paper register — Paper ≠ start |
| `hive-meta-map` | meta-map / roster / attendance | Two-machine overlay canvas |
| `hive-mvp-seed` | MVP seed from tip pattern | Scaffold from tip pattern |

---

## plan_archive_ring

| Slug | Scene trigger | Role |
|------|---------------|------|
| `build-plan-suite` | pre-unit paper, END-GOAL | Plan suite mint |
| `gear-set` | `.gears/` refresh, gears opt-in | Kit mint — Paper ≠ start |
| `re-app` | raw app / DS archive | Way 2 archive; Way 1 build-through |
| `excavate-design-index` | gallery opt after re-app | DS gallery master |

---

## ship_ring

| Slug | Scene trigger | Role |
|------|---------------|------|
| `super-build-trinity` | active unit / full ship loop | Orchestrator when unit ship is the scene |
| `super-build` | scoped super build | Alternate ship path |
| `closeout` | finalize unit | Closeout discipline |
| `prep-prompt` | phase kickoff after paper | Pasteable next-phase prompt |
| `audit-prompt` | read-only audit ask | Audit prompt mint |
| `instruction-manual` | co-pilot execution | Step-by-step guide mode |

---

## outer_ring

Pointer to tip `factory/skills/lyrikai/ADMIN-SKILLS.md` full table. On-demand slugs include (non-exhaustive):

| Slug | Role |
|------|------|
| `spin-agents` | Mid-session fan-out |
| `qabal-tree` | Qabal tree operations |
| `research-update` | Brain / research queries |
| `session-summary` | User-facing session highlight |
| `backup-*` | Backup skills family |
| voice skills | On explicit ask |

**Law:** outer ring is cite-only in MANIFEST — do not duplicate full table; link ADMIN-SKILLS.

---

## agent_files

| Path | Install target |
|------|----------------|
| `agent/agents/lyrikai-super.md` | `~/.cursor/agents/lyrikai-super.md` |

Optional later (not v1):

- `lyrikai-queen-voice.md`
- Trinity seat symlinks alongside super agent

---

## ADMIN-SKILLS ring column (T2 — not in fill)

On Admin GO, tip `ADMIN-SKILLS.md` gains `ring` column:

`foundation | hive_ops | plan_archive | ship | outer`

This spec is the draft mapping for that patch.

---

## install.sh slug resolution

Install iterates:

1. `always_stack`
2. `foundation_ring`
3. `hive_ops_ring`
4. `plan_archive_ring`
5. `ship_ring`
6. Outer: optional `--full-outer` flag for power users; default skips outer to respect read budget

Symlink: `<tip>/factory/skills/<slug>` → `~/.claude/skills/<slug>`

---

## verify.sh checks

- Every installed slug resolves (symlink target exists)
- `agent_files` present in `~/.cursor/agents/`
- `tip_pin` matches current tip HEAD or warns

---

## Cites

- Phone book: `hive-vip-1/hive-vip-1_main/factory/skills/lyrikai/ADMIN-SKILLS.md`
- Precedent: `lk-gears/admin/storehouse/trinity-gears-fork/v1/CARD.md`
- Architecture: [`architecture.md`](architecture.md)
