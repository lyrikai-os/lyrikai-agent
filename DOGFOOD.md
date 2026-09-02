# DOGFOOD — Lyrikai Agent v1.1 smoke tests

Copy-paste these prompts in a **fresh Cursor chat** with Lyrikai Agent installed (`./agent/install/install.sh` + `verify.sh` exit 0).

## 1. Unknown ask → one companion + WAIT

**Prompt:** `/lyrikai-agent` — I want to explore what this install can do for a side project.

**Expect:** Agent reads `WORK-HOME.md` / `ROUTING.md`, recommends **one** bundled `lk_*_v1` skill (not a pile), and **WAIT**s before writes or irreversible steps.

---

## 2. Reverse engineer → work/ paths

**Prompt:** `/lyrikai-agent` reverse engineer `~/my-game`

**Expect:** Routes to `/lk_re-app_v1`; proposes writes under:

- `$LK_AGENT_WORK_ROOT/archives/extractions/<slug>/`
- `work/products/<slug>/`

Not under `lk-bloom_design-systems/` by default.

---

## 3. Plan build → BPS under work product

**Prompt:** `/lyrikai-agent` plan this build for product slug `my-game-1`

**Expect:** `/lk_build-plan-suite_v1` (or equivalent routing); plan suite path under:

- `work/products/my-game-1/.admin/docs/plan-suites/`

---

## 4. Prep next phase → bundled handoff

**Prompt:** `/lyrikai-agent` prep next phase

**Expect:** Prefer `/lk_handoff_v1 prep` (not tip-only `handoff`); cites bundled `skills/lk_handoff_v1/modes/prep.md` when applicable.

---

## Acceptance checklist (maintainer)

- [ ] `./agent/install/verify.sh` → exit 0 (14 bundled skills)
- [ ] `./scripts/bundle_skills.sh --check` → exit 0 without `LK_BLOOM`
- [ ] No `/Users/` paths in `skills/lk_*_v1/`
- [ ] `lk_re-app_v1` does not use `lk-bloom_design-systems` as default write target
- [ ] Manual: tests 1–4 behave as described above
