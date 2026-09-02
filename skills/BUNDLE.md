# Bundled skills — source map

sync_date: 2026-09-02

Copies live under `skills/lk_*_v1/`. **Do not edit tip originals** — re-run the bundle script after upstream changes.

---

## Runtime vs refresh

| Mode | Needs LK_BLOOM? | Command |
|------|-----------------|---------|
| **Runtime** (install, verify, Cursor use) | No — repo only | `./agent/install/install.sh` |
| **Refresh** (re-copy from tip) | Yes — or set `HIVE_TIP_SKILLS` | `./scripts/bundle_skills.sh` |
| **Check** (bundles present?) | No | `./scripts/bundle_skills.sh --check` |

When refresh sources are missing, the script **warns and skips** (unless `--force-refresh`). Standalone clones can install and verify without the monorepo.

---

## Bundle map

| Original slug | Bundled folder | Invoke | Copy from |
|---------------|----------------|--------|-----------|
| `hive` | `lk_hive_v1/` | `/lk_hive_v1` | `lk-bloom/other/skills/claude-skills/hive/` |
| `hive-queen` | `lk_hive-queen_v1/` | `/lk_hive-queen_v1` | tip `factory/skills/hive-queen/` |
| `re-app` | `lk_re-app_v1/` | `/lk_re-app_v1` | tip `factory/skills/re-app/` (+ `examples.md`) |
| `trinity` | `lk_trinity_v1/` | `/lk_trinity_v1` | tip `factory/skills/trinity/` |
| `build-plan-suite` | `lk_build-plan-suite_v1/` | `/lk_build-plan-suite_v1` | tip `factory/skills/build-plan-suite/` |
| `gear-set` | `lk_gear-set_v1/` | `/lk_gear-set_v1` | tip `factory/skills/gear-set/` |
| `super-build-trinity` | `lk_super-build-trinity_v1/` | `/lk_super-build-trinity_v1` | tip `factory/skills/super-build-trinity/` |
| `spin-agents` | `lk_spin-agents_v1/` | `/lk_spin-agents_v1` | tip `factory/skills/spin-agents/` |
| `handoff` | `lk_handoff_v1/` | `/lk_handoff_v1` | tip `factory/skills/handoff/` (**entire tree** incl. `modes/*.md`) |
| `hive-agents` | `lk_hive-agents_v1/` | `/lk_hive-agents_v1` | tip `factory/skills/hive-agents/` |
| `audit-prompt` | `lk_audit-prompt_v1/` | `/lk_audit-prompt_v1` | tip `factory/skills/audit-prompt/` |
| `prep-prompt` | `lk_prep-prompt_v1/` | `/lk_prep-prompt_v1` | tip `factory/skills/prep-prompt/` (deprecated → handoff prep) |
| `closeout` | `lk_closeout_v1/` | `/lk_closeout_v1` | tip `factory/skills/closeout/` (+ `reference.md`) |
| *(master)* | `lyrikai-agent/` | `/lyrikai-agent` | authored in-repo |

Paths relative to monorepo `lk-bloom/` unless noted.

**Work home remap:** after refresh, `bundle_skills.sh` runs `remap_work_home()` on re-app, BPS, and gear-set so writes target `$LK_AGENT_WORK_ROOT` / `work/products/<slug>/` — not `lk-bloom_design-systems`.

---

## External dependencies (not bundled)

Bundled copies may **activate** these when installed separately:

| Referenced by | External slug / agent | v1 handling |
|---------------|----------------------|-------------|
| `lk_closeout_v1` | `build-auditor` Cursor agent | Prerequisite: `~/.cursor/agents/build-auditor.md` |
| `lk_trinity_v1` | `trinity-grunt`, `trinity-watcher`, `trinity-wizard`, `trinity-servitor` agents | Prerequisite seat agents on maintainer machine |
| `lk_super-build-trinity_v1` | `hive-adversary-agents`, `qabal-tree`, `research-update`, `super-build` | Install via `install.sh --with-tip-extras` when LK_BLOOM present |
| `lk_re-app_v1` | `excavate-design-index` | Optional Way 2b — tip original only |
| various | `instruction-manual`, `wiki-log`, `lyrikai`, `session-handoff` | Tip/home originals — not in v1 bundle |

---

## Optional tip extras (symlink, not bundled)

On maintainer machines with `LK_BLOOM`:

```bash
./agent/install/install.sh --with-tip-extras
```

Symlinks tip originals for: `hive-adversary-agents`, `qabal-tree`, `research-update`, `super-build`. Never overwrites bundled `lk_*_v1` names.

---

## Refresh

```bash
cd lyrikai-agent
./scripts/bundle_skills.sh
./agent/install/install.sh
./agent/install/verify.sh
```

Set `LK_BLOOM` or `HIVE_TIP_SKILLS` if sources are not sibling to the product root.

Standalone check (no monorepo):

```bash
./scripts/bundle_skills.sh --check
```
