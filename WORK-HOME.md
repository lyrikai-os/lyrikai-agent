# LK Agent Work Home — path law

**LK Agent is its own system.** All artifacts generated while seated on `/lyrikai-agent` default under one umbrella: **`work/`**.

Read this file on seat when routing writes for re-app, BPS, gear-set, or product wiki.

---

## Env vars

| Var | Default | Role |
|-----|---------|------|
| `LYRIKAI_AGENT_ROOT` | install script resolves product root | Lyrikai Agent product checkout |
| `LK_AGENT_WORK_ROOT` | `$LYRIKAI_AGENT_ROOT/work` | Write umbrella (override in `~/.lyrikai/config`) |

Install writes both to `~/.lyrikai/config`. Resolve from config before proposing write paths.

---

## Topology

```text
$LK_AGENT_WORK_ROOT/
├── archives/
│   └── extractions/<slug>/     # re-app Way 2 output
├── products/<slug>/            # per build target ("product checkout")
│   ├── admin/wiki/research/
│   ├── .admin/docs/plan-suites/
│   └── agents/.gears/          # when gear-set runs
└── templates/                  # optional raw donors (read-only cite)
    └── _donors/                # optional external pattern donors
```

**Slug rule:** `<brand-or-app>-<short-name>-<n>` e.g. `my-game-1`.

When the user points at an external app (`~/my-game`):

- **Source (read):** user path — unchanged, read-only
- **Product slug (write):** derive from app name → `work/products/my-game-1/`
- **Extraction (re-app Way 2):** `work/archives/extractions/my-game-1/`

Router + re-app ask once for slug if ambiguous; then **WAIT**.

---

## Path remap (bundled skills)

| Old cite (tip / Bloom DS) | LK Agent cite |
|---------------------------|---------------|
| `lk-bloom/lk-bloom_design-systems/archives/extractions/<slug>/` | `$LK_AGENT_WORK_ROOT/archives/extractions/<slug>/` |
| `lk-bloom/lk-bloom_design-systems/.admin/docs/plan-suites/` | `work/products/<slug>/.admin/docs/plan-suites/` |
| `lk-bloom/lk-bloom_design-systems/raw_templates-1/` | `work/templates/` (or user-supplied source — read-only) |
| Pattern donor (uvrn_testing-platform…) | `work/templates/_donors/` or optional external read |
| Product `admin/wiki/` | `work/products/<slug>/admin/wiki/` |

---

## Walls

- **`lk-bloom_design-systems` is not the default write target** for LK Agent. Cite as external donor/archive only when the conductor explicitly points at it.
- Tip `hive-vip-1_main` — **read-only law** (ORCHESTRATION, PLANNING-ATTIC, design pack). Do not write tip from `/lyrikai-agent`.
- **Paper ≠ build** — END-GOAL ≠ production GO.
- **WAIT** before irreversible steps (build, commit, push, tip write, merge).

---

## Standalone vs monorepo

- **Standalone clone:** install scaffolds empty `work/`; no `lk-bloom_design-systems` required.
- **Monorepo dev:** `work/` lives inside `lk-bloom/lyrikai-agent/`; optional read of `lk-bloom_design-systems` as donor only.

See also: `ROUTING.md`, `skills/lyrikai-agent/SKILL.md`, `README.md`.
