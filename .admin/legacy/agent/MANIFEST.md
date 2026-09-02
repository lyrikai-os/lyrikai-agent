# MANIFEST — lyrikai-super-agent

**Package:** MIT harness bundle — cite tip skills by path; install symlinks only.

---

## Package header

```yaml
package_id: lyrikai-super-agent
version: 0.1.0-proposal
public_remote: https://github.com/lyrikai-os/lyrikai-agent
monorepo_dev_path: lk-bloom/lyrikai-agent/  # optional; publish to public_remote
tip_pin: recorded at install — see agent/install/tip_pin.txt (not baked into skill bodies)
entrypoints:
  - /lyrikai
  - Cursor agent lyrikai-super
always_stack: [hive-queen, trinity, wiki-log]
install: agent/install/install.sh
verify: agent/install/verify.sh
```

**Tip skills root:** `lk-bloom/hive-vip-1/hive-vip-1_main/factory/skills/`  
**Phone book SoR:** tip `factory/skills/lyrikai/ADMIN-SKILLS.md`

---

## foundation_ring

| Slug | Warm | Role |
|------|------|------|
| `hive-queen` | always | Queen chat soul |
| `trinity` | always | Trinity engine |
| `wiki-log` | always | Seat memory |
| `hive` | on demand | VIP tip SoR cold-start |

---

## hive_ops_ring

| Slug | Scene trigger |
|------|---------------|
| `hive-agents` | parallel non-Admin slices |
| `hive-adversary-agents` | adversary pressure / argument pools |
| `hive-workstreams` | Paper row / WORKSTREAMS visibility |
| `hive-meta-map` | meta-map / roster / attendance |
| `hive-mvp-seed` | MVP seed from tip pattern |

---

## plan_archive_ring

| Slug | Scene trigger |
|------|---------------|
| `build-plan-suite` | pre-unit paper, END-GOAL |
| `gear-set` | `.gears/` refresh, gears opt-in |
| `re-app` | raw app / DS archive |
| `excavate-design-index` | gallery opt after re-app |

---

## ship_ring

| Slug | Scene trigger |
|------|---------------|
| `super-build-trinity` | active unit / full ship loop |
| `super-build` | scoped super build |
| `closeout` | finalize unit |
| `prep-prompt` | phase kickoff after paper |
| `audit-prompt` | read-only audit ask |
| `instruction-manual` | co-pilot execution |

---

## outer_ring

Pointer to tip `factory/skills/lyrikai/ADMIN-SKILLS.md` full table.

On-demand slugs (non-exhaustive — not installed by default):

| Slug | Role |
|------|------|
| `spin-agents` | mid-session fan-out |
| `qabal-tree` | Qabal tree operations |
| `research-update` | brain / research queries |
| `session-summary` | user-facing session highlight |
| `backup-git` | git mirror to drive |
| `backup-mirror` | live mirror rsync |
| `backup-refresh` | incremental drive refresh |
| `backup-snapshot` | dated snapshot |
| `fetch-backup` | browse drive backup |
| `restore-files` | restore mirror/snapshot |
| `restore-git` | clone from drive vault |
| `lyrikai` | sticky meta-seat router skill |

Install outer ring: `./agent/install/install.sh --full-outer`

---

## agent_files

| Path | Install target |
|------|----------------|
| `agent/agents/lyrikai-super.md` | `~/.cursor/agents/lyrikai-super.md` |

---

## Slug lists (for install.sh)

```yaml
foundation_ring: [hive-queen, trinity, wiki-log, hive]
hive_ops_ring: [hive-agents, hive-adversary-agents, hive-workstreams, hive-meta-map, hive-mvp-seed]
plan_archive_ring: [build-plan-suite, gear-set, re-app, excavate-design-index]
ship_ring: [super-build-trinity, super-build, closeout, prep-prompt, audit-prompt, instruction-manual]
outer_ring_sample: [spin-agents, qabal-tree, research-update, session-summary, lyrikai]
```

---

## Cites

- Ring spec: `.admin/docs/plan-suites/lyrikai-super-agent/specs/manifest-rings.md`
- Packaging precedent: `lk-gears/admin/storehouse/trinity-gears-fork/v1/CARD.md`
- Tip cite law: `.admin/docs/plan-suites/lyrikai-super-agent/guides/tip-cite-law.md`
