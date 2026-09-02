# Skills — Lyrikai Agent v1

Bundled Cursor skills for the Lyrikai Agent product. Installed to `~/.cursor/skills/` via `agent/install/install.sh`.

## Master router

| Invoke | Folder | Role |
|--------|--------|------|
| `/lyrikai-agent` | `lyrikai-agent/` | Route to one companion + WAIT |

## Bundled companions (`lk_*_v1`)

| Invoke | Original tip slug |
|--------|-------------------|
| `/lk_hive_v1` | `/hive` |
| `/lk_hive-queen_v1` | `/hive-queen` |
| `/lk_re-app_v1` | `/re-app` |
| `/lk_trinity_v1` | `/trinity` |
| `/lk_build-plan-suite_v1` | `/build-plan-suite` |
| `/lk_gear-set_v1` | `/gear-set` |
| `/lk_super-build-trinity_v1` | `/super-build-trinity` |
| `/lk_spin-agents_v1` | `/spin-agents` |
| `/lk_prep-prompt_v1` | `/prep-prompt` |
| `/lk_closeout_v1` | `/closeout` |

Tip originals remain available side by side if separately installed — prefer bundled invokes when seated via this product.

## Docs

- **`BUNDLE.md`** — source paths, sync date, external dependencies
- **`../ROUTING.md`** — signal → companion hallway

## Dev

Re-copy from monorepo sources:

```bash
./scripts/bundle_skills.sh
```

Edits belong in bundled copies under `skills/lk_*_v1/` only during v1 — never in tip `factory/skills/` originals.
