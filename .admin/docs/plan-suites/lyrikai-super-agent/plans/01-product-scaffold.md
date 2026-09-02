# 01 — Product scaffold

**Suite:** `lyrikai-super-agent`  
**Depends on:** suite README + END-GOAL  
**Unlocks:** 02–05

---

## Goal

Plant the **product leaf shell** — README, LICENSE, wiki pointer, and parent attic index — so `lyrikai-agent/` is a recognizable MIT public face before agent internals land.

## Stop condition

All paths in Evidence exist; README states MIT scope, walls, and north-star one-liner; no `agent/` tree yet.

---

## In scope

| Path | Content |
|------|---------|
| `lyrikai-agent/README.md` | Product home: what Lyrikai Super Agent is, install pointer, MIT walls, link to `lyrikai-meta/wiki/` |
| `lyrikai-agent/LICENSE` | MIT — match [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent) remote |
| `lyrikai-agent/wiki-pointer.md` | Thin pointer → `lk-bloom/lyrikai-meta/wiki/` (catalog, proposals, research) |
| `lyrikai-agent/.admin/docs/plan-suites/README.md` | Parent attic index (already from BPS Step A) |
| `lyrikai-agent/.gitignore` | Minimal — `.DS_Store`; no secrets paths |

## Out of scope

- `agent/` directory and install scripts (unit 04)
- Tip skill patches
- Git commit / push
- `.hive/` / WORKSTREAMS
- Vendoring skill bodies

---

## Prerequisites

- Suite README + END-GOAL read.
- Confirm greenfield leaf — remote is LICENSE-only shell.
- Unified plan § Product home read.

---

## Ordered steps

1. **LICENSE** — copy MIT text from GitHub remote or standard MIT template; year 2026; copyright Lyrikai.
2. **README.md** — sections:
   - One-line identity: *Lyrikai Super Agent = router + posture + scene sense + install bundle*
   - North-star loop one-liner: Search → Plan → Delegate → Plan → Build → Ship → loop
   - MIT scope: harness only — boot docs, scene router, trust gates, install, Cursor agent shell
   - Walls block: package ≠ Admin GO; paper ≠ ship; tip skills cited not forked; Hive Orchestrator/Audit gates unchanged
   - Install pointer (stub until unit 04): `agent/install/install.sh`
   - Wiki pointer: `wiki-pointer.md` → `lyrikai-meta/wiki/`
   - Plan suite pointer: `.admin/docs/plan-suites/lyrikai-super-agent/`
   - Remote: `github.com/lyrikai-os/lyrikai-agent`
3. **wiki-pointer.md** — relative path to `../lyrikai-meta/wiki/`; list catalog, proposals, research subpaths; status HOLD.
4. **.gitignore** — `.DS_Store`, optional `.admin/` with plan-suites allowlist comment (cite PLANNING-ATTIC §6).
5. Verify parent attic index row for `lyrikai-super-agent` is present.
6. Record evidence.

### README walls (must appear verbatim or equivalent)

- Package ≠ Admin GO
- Paper ≠ ship / false GO
- Tip skills are cited and symlinked — not forked as law
- Lyrikai routes; does not replace Queen, Trinity, SBT, Audit

---

## Verification

| Check | Pass signal |
|-------|-------------|
| `test -f lyrikai-agent/README.md` | exit 0 |
| `test -f lyrikai-agent/LICENSE` | exit 0 |
| `test -f lyrikai-agent/wiki-pointer.md` | exit 0 |
| README contains "MIT" and "Paper" | grep match |
| No `agent/` dir yet | `test ! -d lyrikai-agent/agent` OR dir empty stub only if conductor allowed |

---

## Evidence / handoff

| Field | Value |
|-------|-------|
| `unit` | 01-product-scaffold |
| `status` | complete \| blocked |
| `paths_written` | list of files |
| `walls_confirmed` | MIT, Paper≠GO, no tip write |
| `next` | [`02-boot-ladder.md`](02-boot-ladder.md) |

---

## Next dependency

Unit **02** emits `agent/AGENT-CARD.md`, `agent/LYRIKAI-BOOT.md`, `agent/MANIFEST.md`.
