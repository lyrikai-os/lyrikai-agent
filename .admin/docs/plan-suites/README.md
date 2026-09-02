# Planning attic — plan suites (leaf index)

**Altitude:** product-local index · **Ops SoR (tip):** `hive-vip-1/hive-vip-1_main/factory/PLANNING-ATTIC.md` (cite by path; do not fork)

This file is a **thin shelf list**. Universal attic vs Hive rules live on tip. Copied from tip `master-build/scaffold/plan-suites/README.md.template`.

---

## 0 · Walls

- Suites here are **pre-unit paper** until human-signed AC + Admin `start`.
- **Paper ≠ start.** A WORKSTREAMS Paper pointer is visibility only — not CP-0, not GO, not Active.
- Do not invent Active/Proof `BP-*` rows from attic paper alone.
- Do not put a job ledger inside `.hive/`.

---

## 1 · Tip cite

| Concern | Cite |
|---|---|
| Attic ops law | tip `factory/PLANNING-ATTIC.md` |
| Ladder / leaf install | tip `factory/PROTOCOL-LADDER.md` |
| Board heartbeat | skill `hive-workstreams` → product `.hive/WORKSTREAMS.md` → build-master SoR |

---

## 2 · Local suite index

| Suite | Purpose | Entrypoint | Board |
|---|---|---|---|
| `lyrikai-super-agent` | MIT super-agent package — scene router, boot ladder, trust gates, install bundle | [`lyrikai-super-agent/README.md`](./lyrikai-super-agent/README.md) | **Skipped** — no `.hive/` on this leaf |

Add a row for every suite under this folder. Keep one-line purpose only.

---

## 3 · How to add a suite

1. `/build-plan-suite` (or copy layout from tip PLANNING-ATTIC §1).
2. Register the suite in the table above.
3. If this product has Hive: finish **must** Paper-register on WORKSTREAMS (see tip PLANNING-ATTIC §3).
4. Stop — do not implement product builds from the attic alone.

---

## 4 · Git (optional durability)

When this attic should be tracked in product git while keeping the rest of `.admin/` ignored, use the allowlist pattern in tip `factory/PLANNING-ATTIC.md` §6.
