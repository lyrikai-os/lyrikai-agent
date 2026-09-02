# TRUST-GATES — Lyrikai Super Agent (lite)

**Audience:** Lyrikai seat — honesty ladder before irreversible beats  
**Cross-ref:** [`SCENE-ROUTER.md`](./SCENE-ROUTER.md) · [`TRUST-GATES.md`](./TRUST-GATES.md)  
**Spec:** `.admin/docs/plan-suites/lyrikai-super-agent/specs/trust-gates-lite.md`

UVRN shape borrow — **not** full UVRN stack import for v1.

---

## §1 Honesty vocabulary

| Term | Means | Must not claim |
|------|--------|----------------|
| **proposed** | Scene read + recommended route | GO, Active, verified ship |
| **paper-complete** | END-GOAL / suite on disk | Build started, CP-0 passed |
| **delegated** | Companion skill opened | Orchestrator seat, Audit PASS |
| **conductor-GO** | Human explicit unlock | Self-granted Admin |
| **insufficient-scene** | Too thin to route — ask once | Guess delegate anyway |
| **blocked** | P3 — proposal only | Silent tip/product write |
| **structurally-ok** | Stage1 paths + rings readable | Relational match |
| **route-clear** | Stage2 ask matches scene | Auto-build permission |

---

## §2 Stage1 / Stage2 ladder

Maps `@uvrn/validate` Stage1/Stage2 shape:

| Stage | When | Checks | Outcomes |
|-------|------|--------|----------|
| **Stage1 · structural** | Every `/lyrikai` seat + scene pass | Paths exist, ring known, walls readable, catalog pulled | `structurally-ok` \| `malformed-scene` |
| **Stage2 · relational** | Opt-in before P2 hard delegate or Build beat | Ask matches scene, END-GOAL present if build, HOLD surfaces clear | `route-clear` \| `insufficient-scene` \| `hold` |

**Default:** Stage2 off on P0/P1 — honest hold, not failure.

### Permission tier ↔ gate mapping

| Tier | Stage1 | Stage2 | Typical gate |
|------|--------|--------|--------------|
| P0 propose | required | off | `gate-search`, `gate-delegate` → WAIT |
| P1 soft | required | optional | `gate-paper` → stop at END-GOAL |
| P2 hard | required | required | `gate-unit`, `gate-build` |
| P3 blocked | required | required | proposal only — `gate-delegate` fail |

Cross-ref: SCENE-ROUTER permission tiers.

---

## §3 Checker port (irreversible beats only)

Maps `CheckerPort` pass/fail/abstain — v1 default = **conductor + Hive Audit**, not live AI checker.

| Beat | Checker | Verdicts |
|------|---------|----------|
| Plan (unit) → Build | Human conductor | GO / hold / narrow scope |
| Build → Ship (PR claim) | Independent **Audit** (not Watcher) | PASS / FAIL |
| Canon-like commits (tip T2 land) | Human Admin | GO / proposal-only |

**Law:** Watcher ≠ Audit ≠ UVRN verified.

Fixture/offline checker reserved for dogfood (unit 06).

---

## §4 Beat → gate id table

| Beat | Gate id | Pass → | Fail/Hold → |
|------|---------|--------|-------------|
| Search | `gate-search` | Stage1 ok → propose next | `insufficient-scene` → ask once |
| Plan (paper) | `gate-paper` | END-GOAL exists → P1 stop | missing END-GOAL → stay in BPS |
| Delegate | `gate-delegate` | P1/P2 tier matched | P0 wait / P3 proposal |
| Plan (unit) | `gate-unit` | covenant + conductor-GO | hold at paper |
| Build | `gate-build` | CP-0/Admin when required | no false GO |
| Ship | `gate-ship` | Audit PASS + preview | no PR without preview |
| Loop | `gate-loop` | wiki-log stub written | — |

Aligns with north-star loop in architecture spec.

---

## §5 Outcome stub format (v1)

One line in `wiki-log` / `wiki/research/` — no crypto hash required:

```text
gate_id=<id> verdict=<PASS|ALIGN|HOLD|FAIL> beat=<beat> paths=<comma-separated> as_of=<ISO8601>
```

Example:

```text
gate_id=gate-paper verdict=ALIGN beat=plan-paper paths=lyrikai-agent/.admin/docs/plan-suites/lyrikai-super-agent/END-GOAL.md as_of=2026-08-30
```

---

## §6 Optional UVRN bridge (outer ring — not v1 core)

For programs already on UVRN — conductor opts in per program.

| Mechanism | Role |
|-----------|------|
| `recordHiveGateOutcome` (`@suttlemedia/arcanum`) | Archive gate outcomes as `uvrn-about-hive-gate` receipts |
| MCP `user-uvrn` namespace | `delta_validate_bundle`, `delta_verify_receipt`, etc. when evidence verification is the ask |
| Cite-only specimens | `uvrn-packages-v2.1/uvrn-arcanum/README.md`, `uvrn-checker/README.md`, `SPEC/uvrn-receipt-v1.md` §5 |

**Not for routine Lyrikai routing.**

---

## Walls (repeat)

- Paper-complete ≠ ship-ready  
- Integrity-checked ≠ verified  
- Scene propose ≠ execute  
- Install verify pass ≠ production GO  
- Package fill ≠ tip T2 land  
