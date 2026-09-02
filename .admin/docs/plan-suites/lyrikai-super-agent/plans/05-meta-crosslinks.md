# 05 — Meta cross-links

**Suite:** `lyrikai-super-agent`  
**Depends on:** units 01–04  
**Unlocks:** END-GOAL success

---

## Goal

Wire **ecosystem visibility** — `lyrikai-meta` proposal, catalog row, debate note stub, and bidirectional pointers between product leaf and wiki attic.

## Stop condition

Proposal file exists; catalog INDEX has row (status: proposal); `lyrikai-agent/README.md` and `wiki-pointer.md` cite meta paths; no tip writes.

---

## In scope

| Path | Content |
|------|---------|
| `lyrikai-meta/wiki/proposals/lyrikai-super-agent.md` | T0 proposal summary → suite README |
| `lyrikai-meta/wiki/proposals/lyrikai-super-agent-debate.md` | Thin debate note stub (optional but recommended) |
| `lyrikai-meta/wiki/catalog/INDEX.md` | New row: `lyrikai-super-agent` at L0, status proposal |
| `lyrikai-agent/README.md` | Pointer to meta proposal + catalog |
| `lyrikai-agent/wiki-pointer.md` | Updated cross-links |

## Out of scope

- Tip `factory/skills/lyrikai/SKILL.md` patch (T2 Admin GO)
- `ORCHESTRATION.md` §8 pointer (T2)
- `factory/WIKI-PROTOCOL.md` invention from meta stub
- Debate resolution / Admin GO
- Git commit

---

## Prerequisites

- Units 01–04 complete (or parallel if proposal stub already from BPS).
- Read `lyrikai-meta/wiki/proposals/README.md` for proposal kinds.
- Read `lyrikai-meta/wiki/catalog/INDEX.md` for row shape.

---

## Ordered steps

### 1. Proposal stub

`lyrikai-meta/wiki/proposals/lyrikai-super-agent.md`:

- Kind: `wiki-expand` or `invent-utility`
- Status: **proposal** — Admin GO required for tip land
- Summary: one visible super agent; MIT harness; scene router + trust gates
- Pointer: `lyrikai-agent/.admin/docs/plan-suites/lyrikai-super-agent/README.md`
- END-GOAL cite: suite `END-GOAL.md` stop line
- Walls: Paper ≠ GO; package ≠ tip fork

### 2. Debate note (optional stub)

`lyrikai-meta/wiki/proposals/lyrikai-super-agent-debate.md`:

- Open questions: wiki merge vs split (`lyrikai-agent` vs `lyrikai-meta/agent/`)
- T2 tip patch scope
- UVRN bridge opt-in threshold
- Status: open / HOLD

### 3. Catalog row

Add to `lyrikai-meta/wiki/catalog/INDEX.md`:

| Field | Value |
|-------|-------|
| id | `lyrikai-super-agent` |
| altitude | L0 |
| status | proposal |
| home | `lk-bloom/lyrikai-agent/` |
| suite | `.admin/docs/plan-suites/lyrikai-super-agent/` |
| remote | github.com/lyrikai-os/lyrikai-agent |
| unlock | Admin GO for tip patch + conductor GO for git push |

### 4. Product pointers (update unit 01 files)

- README: "Ecosystem" section → meta proposal + catalog row
- wiki-pointer.md: list proposal path + catalog id

### 5. Research stub path (optional — unit 06)

Reserve `lyrikai-meta/wiki/research/lyrikai-super-agent-dogfood.md` for post-install dogfood — do not write unless unit 06 ordered.

---

## Verification

| Check | Pass signal |
|-------|-------------|
| Proposal file exists | `test -f lyrikai-meta/wiki/proposals/lyrikai-super-agent.md` |
| Catalog row grep | `grep lyrikai-super-agent lyrikai-meta/wiki/catalog/INDEX.md` |
| Bidirectional cite | README → meta; proposal → suite |
| No tip edit | `git diff hive-vip-1` empty for factory/skills |

---

## Evidence / handoff

| Field | Value |
|-------|-------|
| `unit` | 05-meta-crosslinks |
| `proposal_path` | lyrikai-meta/wiki/proposals/lyrikai-super-agent.md |
| `catalog_status` | proposal |
| `suite_complete` | true when all units 01–05 done |

---

## Next dependency

**END-GOAL** met. Optional **unit 06** dogfood — one scene through router; research note. Separate GO: git push, tip T2 patch.
