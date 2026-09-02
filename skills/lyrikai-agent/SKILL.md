---
name: lyrikai-agent
description: >-
  Lyrikai Agent master router — point at a product or ask, open one bundled
  lk_*_v1 companion, walk toward done, WAIT before irreversible steps. Use when
  the user types /lyrikai-agent or picks Lyrikai Agent in the Cursor agent picker.
disable-model-invocation: true
---

# Lyrikai Agent (`/lyrikai-agent`)

Master router for the Lyrikai Agent skill suite. **Not** tip `/lyrikai` meta-seat. **Not** Admin · **not** Audit · **not** silent tip write.

## Trigger

- `/lyrikai-agent` — route to one bundled companion
- Cursor agent picker **Lyrikai Agent** — same behavior

Bare invoke → read routing, recommend one `lk_*_v1`, **WAIT**.

## Instructions

1. Read **`WORK-HOME.md`** at `$LYRIKAI_AGENT_ROOT/WORK-HOME.md` — path law for all writes.
2. Read **`ROUTING.md`** at `$LYRIKAI_AGENT_ROOT/ROUTING.md` (or repo root when developing in monorepo).
3. Match the user's signal to **one** bundled skill under `skills/lk_*_v1/`.
4. **Read and follow** that companion's `SKILL.md` — do not reimplement its body.
5. Default **WAIT** before irreversible steps (build, commit, push, tip write, merge).
6. Product research home: `work/products/<slug>/admin/wiki/research/` — no lyrikai-meta unfurl.

Resolve `LYRIKAI_AGENT_ROOT` and `LK_AGENT_WORK_ROOT` from `~/.lyrikai/config`.

## Build-shaped seat

When the ask is build-shaped, open by bundled path:

- `skills/lk_hive-queen_v1/SKILL.md` — overview + WAIT
- `skills/lk_trinity_v1/SKILL.md` — covenant engine when a build slice is named

Queen walls win chat soul when stacked; Trinity runs as engine only.

## Coexistence

| Surface | Invoke |
|---------|--------|
| **This product (bundled)** | `/lyrikai-agent`, `/lk_<slug>_v1` |
| **Tip / home originals** | `/lyrikai`, `/re-app`, `/trinity`, etc. — untouched, side by side |

Prefer bundled invokes when seated via this product install.

## Walls

- Paper ≠ build — END-GOAL ≠ production GO
- Route; do not replace Queen, Trinity, SBT, or independent Audit
- **`lk-bloom_design-systems` is not the default write target** — optional read-only donor only
- Bundled copies are vendored — edit sources via `scripts/bundle_skills.sh`, not tip originals
- External deps (`build-auditor`, trinity seat agents, SBT tip extras) — see `skills/BUNDLE.md`

## Bundled companions

See `ROUTING.md` invoke index and `skills/BUNDLE.md` for source map + optional tip extras.
