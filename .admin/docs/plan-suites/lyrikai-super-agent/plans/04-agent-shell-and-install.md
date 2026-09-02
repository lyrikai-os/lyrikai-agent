# 04 — Agent shell + install

**Suite:** `lyrikai-super-agent`  
**Depends on:** units 01–03  
**Unlocks:** 05, END-GOAL verify

---

## Goal

Emit the **Cursor-visible agent shell** and **install/verify scripts** so a human can seat Lyrikai Super Agent and confirm manifest vs disk.

## Stop condition

`agent/agents/lyrikai-super.md`, `agent/install/install.sh`, `agent/install/verify.sh` exist; `verify.sh` exits 0 after install on a clean machine with tip checkout present.

---

## In scope

| Path | Content |
|------|---------|
| `agent/agents/lyrikai-super.md` | Thin Cursor custom agent — points to AGENT-CARD → LYRIKAI-BOOT |
| `agent/install/install.sh` | Symlink tip skills + copy agent to `~/.cursor/agents/` |
| `agent/install/verify.sh` | MANIFEST slugs + agent file presence check |

## Out of scope

- `lyrikai-queen-voice.md` (later — not v1)
- Vendoring skill bodies into product tree
- Git commit / push
- Tip SKILL.md patch (T2 Admin GO)
- Auto-running install during BPS

---

## Prerequisites

- Units 01–03 complete.
- MANIFEST.md lists all ring slugs and agent_files.
- Tip checkout path resolvable: `lk-bloom/hive-vip-1/hive-vip-1_main/factory/skills/`
- Guide: [`../guides/install.md`](../guides/install.md)

---

## Ordered steps

### 1. lyrikai-super.md (Cursor agent shell)

Thin body requirements:

- Points to `lyrikai-agent/agent/AGENT-CARD.md` → `LYRIKAI-BOOT.md`
- Sticky behavior: on session start, behave as `/lyrikai` seated
- Names bundled seats: references `trinity-grunt|watcher|wizard|servitor` paths (install copies or symlinks alongside)
- **Must-not block:** same walls as Lyrikai skill (not Admin, not Audit, not silent tip write)
- Install target: `~/.cursor/agents/lyrikai-super.md`

Pattern: existing `~/.cursor/agents/trinity-*.md` thin shells — cite, do not duplicate law.

### 2. install.sh

Behavior:

1. Resolve `LYRIKAI_AGENT_ROOT` (script-relative or env override)
2. Resolve tip skills root: `$LK_BLOOM/hive-vip-1/hive-vip-1_main/factory/skills/` (or env `HIVE_TIP_SKILLS`)
3. For each slug in MANIFEST rings (foundation, hive_ops, plan_archive, ship, outer where path exists):
   - `ln -sf <tip-skill-dir> ~/.claude/skills/<slug>`
4. Copy `agent/agents/lyrikai-super.md` → `~/.cursor/agents/lyrikai-super.md`
5. Record tip `git rev-parse HEAD` into MANIFEST `tip_pin` field (append or sidecar `tip_pin.txt` — document choice)
6. Print summary + suggest `verify.sh`

Flags:

- `--dry-run` — print actions only
- `--cursor-only` — skip claude skills symlinks
- `--skills-only` — skip cursor agent copy

### 3. verify.sh

Checks:

1. Every MANIFEST ring slug has `~/.claude/skills/<slug>` present (symlink or dir)
2. `~/.cursor/agents/lyrikai-super.md` exists
3. `tip_pin` recorded and tip HEAD matches OR warns on drift
4. Core agent files exist under `LYRIKAI_AGENT_ROOT/agent/`: AGENT-CARD, LYRIKAI-BOOT, SCENE-ROUTER, TRUST-GATES, MANIFEST

Exit codes:

- `0` — all checks pass
- `1` — missing required artifact (print list)
- `2` — tip drift warning only (optional strict mode `--strict`)

### 4. Update README install section (from unit 01)

Point to `agent/install/install.sh` with one-liner quick start.

---

## Verification

```bash
cd lyrikai-agent
./agent/install/install.sh --dry-run    # prints planned symlinks
./agent/install/install.sh              # actual install (conductor machine)
./agent/install/verify.sh               # exit 0
echo $?                                 # 0
```

| Check | Pass signal |
|-------|-------------|
| verify.sh exit 0 | after install |
| Agent visible in Cursor | picker shows Lyrikai Super Agent |
| No skill bodies in product | only symlinks via install |

---

## Evidence / handoff

| Field | Value |
|-------|-------|
| `unit` | 04-agent-shell-and-install |
| `verify_exit` | 0 |
| `tip_pin` | git sha |
| `next` | [`05-meta-crosslinks.md`](05-meta-crosslinks.md) |

---

## Next dependency

Unit **05** wires `lyrikai-meta` proposals, catalog row, and README cross-links.
