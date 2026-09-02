# Install guide — Lyrikai Super Agent

**Suite:** `lyrikai-super-agent`  
**Emit target:** unit 04 — `agent/install/install.sh`, `agent/install/verify.sh`  
**Audience:** humans + agents executing fill

---

## Product home

| Surface | Role |
|---------|------|
| **[github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent)** | Canonical MIT public repo — clone, install, releases |
| **`lk-bloom/lyrikai-agent/`** | Monorepo dev checkout (optional); changes publish to standalone repo |
| **lk-bloom PR #5** | Historical monorepo PR — not the long-term public home |

---

## Prerequisites

| Requirement | Notes |
|-------------|-------|
| `lyrikai-agent` checkout | Clone from [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent) |
| Tip skills path | `hive-vip-1/hive-vip-1_main/factory/skills/` — set `HIVE_TIP_SKILLS` if not sibling to `lk-bloom` |
| Cursor | For agent picker install |
| Claude Code / Cursor skills dir | `~/.claude/skills/` writable |
| No Admin GO needed | Install is local harness — not tip land |

---

## Quick start (after unit 04 fill)

**Canonical (public repo):**

```bash
git clone https://github.com/lyrikai-os/lyrikai-agent.git
cd lyrikai-agent
./agent/install/install.sh
./agent/install/verify.sh
```

**Monorepo dev (optional):** `cd lk-bloom/lyrikai-agent` then same install commands.

Expected: `verify.sh` exit `0`.

---

## What install does

1. **Symlinks tip skills** from `hive-vip-1/hive-vip-1_main/factory/skills/<slug>` → `~/.claude/skills/<slug>`
   - Slugs from MANIFEST rings (see [`../specs/manifest-rings.md`](../specs/manifest-rings.md))
2. **Copies Cursor agent** `agent/agents/lyrikai-super.md` → `~/.cursor/agents/lyrikai-super.md`
3. **Records tip pin** — `git rev-parse HEAD` on tip checkout into MANIFEST `tip_pin`

Does **not**:

- Vendor skill bodies into `lyrikai-agent/`
- Write tip `factory/skills/`
- Auto-commit or push to GitHub
- Grant Admin or false GO

---

## Environment variables

| Var | Default | Purpose |
|-----|---------|---------|
| `LK_BLOOM` | parent of `lyrikai-agent` | Resolve monorepo root |
| `HIVE_TIP_SKILLS` | `$LK_BLOOM/hive-vip-1/hive-vip-1_main/factory/skills` | Tip skills root |
| `LYRIKAI_AGENT_ROOT` | script-relative `../..` | Product root |

---

## Install flags (planned — unit 04)

| Flag | Behavior |
|------|----------|
| `--dry-run` | Print symlinks/copy actions only |
| `--cursor-only` | Skip `~/.claude/skills` symlinks |
| `--skills-only` | Skip Cursor agent copy |
| `--full-outer` | Include outer_ring slugs from ADMIN-SKILLS |

---

## Verify checks

`verify.sh` confirms:

- MANIFEST ring slugs present under `~/.claude/skills/`
- `~/.cursor/agents/lyrikai-super.md` exists
- Core `agent/*.md` files present in product tree
- `tip_pin` matches or warns on drift (`--strict` → exit 1 on drift)

---

## Using the agent

1. Open Cursor → agent picker → **Lyrikai Super Agent**
2. Or type `/lyrikai` in chat (when Lyrikai skill symlinked)
3. Default posture: Queen overview + scene pass — **P0 WAIT** until ask is clear
4. Read `agent/SCENE-ROUTER.md` + `agent/TRUST-GATES.md` for routing law

---

## Uninstall

```bash
# Remove symlinks (manual — install records list in future .install-manifest)
rm ~/.cursor/agents/lyrikai-super.md
# Per-slug: rm ~/.claude/skills/<slug>  # only if symlink points to lyrikai install
```

Full uninstall script — optional future unit; not v1.

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| verify.sh exit 1 | Re-run install; check HIVE_TIP_SKILLS path |
| tip drift warning | Re-run install to refresh tip_pin; or `git pull` tip |
| Agent not in picker | Restart Cursor; confirm file in `~/.cursor/agents/` |
| Wrong delegate | Read SCENE-ROUTER; check permission tier |

---

## Walls

- Install ≠ ship
- Install ≠ tip T2 land
- `verify.sh` pass ≠ production GO
- Paper-complete suite + working install = END-GOAL for fill phase only

---

## Cites

- Unit plan: [`../plans/04-agent-shell-and-install.md`](../plans/04-agent-shell-and-install.md)
- MANIFEST rings: [`../specs/manifest-rings.md`](../specs/manifest-rings.md)
- Tip cite law: [`tip-cite-law.md`](tip-cite-law.md)
