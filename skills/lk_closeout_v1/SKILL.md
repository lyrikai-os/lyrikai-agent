---
name: lk_closeout_v1
description: >
  Runs Master Build Pattern v0.4.1 unit finalize via /lk_closeout_v1: Phase A independent
  build-auditor + fixes/re-audit, Phase B auto-open PR after Admin preview (or docs-only
  waiver), Phase C post-merge Reflect (lease, SoR, dual worklogs, history, primary sync,
  park next). Use when the user types /lk_closeout_v1 or asks to close out, finalize, ship,
  reflect, or wrap a workstream, phase, wave, or PR.
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/closeout` · original: `/closeout` · do not edit original


# Closeout

Project-agnostic finalize entrypoint. Keep `/lk_closeout_v1` as one slash command with three
hard phase walls. MBP still names Publisher vs CLOSEOUT separately in instance docs;
this skill folds open-PR into the agent entrypoint without collapsing merge or Reflect.

**Does not:** silently merge; open a PR on audit PASS alone; acquire the Reflect lease
before MERGED; skip re-audit after tip-SHA-changing fixes; let the builder self-audit as
the sole Check; run Reflect before land is verified; silently CP-0 the next gated unit;
clear another agent’s lease; prune another unit’s worktree; open a new remediation
program; edit shared lk-bloom doctrine (unless lk-bloom itself is the authorized unit).

## Authority

1. Find the active product build-master and read its `COMPOSER.md`, `00-MASTER-PLAN.md`,
   `WORKSTREAMS.md`, `04-agent-ops/COORDINATION.md`, `04-agent-ops/CLOSEOUT.md`, and
   (when present) `04-agent-ops/PUBLISHER.md` / CP0-POLICY.
2. Use the instance’s pinned CLOSEOUT. For v0.4.1, require both `workLogsRoot` and
   `historyRoot`.
3. If multiple instances could apply, ask the user which unit to finalize.
4. Resolve mode:
   - If the unit PR is already **MERGED** → skip to **Phase C**.
   - Otherwise run **Phase A → B**, then stop until MERGED (Phase C later / on re-invoke).

## Hard rules (must NOT)

- Must NOT open a PR on audit PASS alone (Admin sandbox preview-approved date+who
  **or** docs-only waiver required).
- Must NOT merge unless Admin explicitly requests merge in the same turn (instance
  default: Admin merges; open PR ≠ merge).
- Must NOT acquire `.closeout.lock` / durable CLOSEOUT ownership before MERGED + a
  real merge SHA.
- Must NOT skip independent re-audit after any tip-SHA-changing fix (or after
  conflict/rebase).
- Must NOT substitute builder-only self-audit for a spawned `build-auditor` (not in v1 bundle) subagent.
- Must NOT run Reflect SoR / worklogs / history / main-sync before land is verified.
- Must NOT start the next gated unit unless CP0-POLICY + Admin unlock (or
  automation-eligible PASS).
- Must NOT clear another agent’s lease or prune another unit’s worktree.
- Must NOT edit shared lk-bloom doctrine from product closeout (residual/Admin note
  only).
- Must NOT treat `pr-opened` as closeout-done.

## Phase A — Check / Update (no Reflect lease)

1. Resolve active build-master, unit, worktree, and feature branch. Missing inputs →
   `invalid-precondition` and stop.
2. Spawn an independent **build-auditor** subagent on the unit (never builder self-audit
   alone as the sole Check).
3. On FAIL or fix-needed notes, **or after any tip-SHA-changing commit**: apply
   fixes in the unit worktree, commit, then **re-run independent build-auditor**.
   Any tip-SHA-changing commit re-enters the independent audit cycle. Cap at **3**
   audit cycles. Still FAIL → `audit-blocked`, escalate to Admin, stop.
4. On PASS or PASS-WITH-NOTES: record audit verdict, report path, and tip SHA.
   Require recorded Admin sandbox preview approval (date + who) **or** a
   documented docs-only waiver.
5. If preview/waiver is missing → status `awaiting-preview`, hand Admin preview
   instructions, **do not open a PR**, stop.

## Phase B — Auto open PR (no Reflect lease)

Preconditions: Phase A audit PASS|PASS-WITH-NOTES + preview-approved or docs-only
waiver; no secrets in the diff; branch ready to push; current tip SHA equals the
last PASS|PASS-WITH-NOTES audit tip. If the branch was rebased, conflict-resolved,
or the tip changed since that audit (or since preview approval), re-enter Phase A
for independent re-audit; if the tip changed after preview approval, obtain
re-preview or a fresh waiver before opening the PR.

1. Push with `-u` if the branch is not on the remote.
2. If no PR exists for the unit branch: open one (`gh pr create`) using instance
   title/body conventions when present. Body must include unit link, acceptance + how,
   Bloom/self-assessment as instance requires, audit report path, and a
   **preview-approved** (or docs-only waiver) line. Append ledger `pr-opened` when the
   instance has a ledger.
3. If a PR already exists: report URL/number; do not recreate.
4. **Do not merge** unless Admin explicitly asks in the same turn.
5. Stop with status `pr-opened-waiting-merge`. Do not acquire `.closeout.lock`, do not
   write Reflect SoR/worklogs/history, do not prune worktrees, do not start the next
   gated unit.

## Phase C — Post-merge Reflect (existing v0.4.1)

Run only when `gh pr view` shows **MERGED** and the merge SHA is an ancestor of current
`origin/main`. Newer merges on main may already be present.

1. Check CLOSEOUT ownership in COORDINATION. If occupied, wait/stop. Atomically acquire
   `<build-master>/04-agent-ops/.closeout.lock`, immediately write
   `.closeout.lock/CLAIM.md`, then write the matching durable ownership row (unit,
   agent/session, **merge SHA**, claimed-at) and re-read all shared surfaces. Never
   clear another agent’s lease. If writers are on different filesystems, require an
   Admin-designated external lock/queue; a local lease is insufficient.
2. Verify land and capture immutable anchors: unit start/base SHA, PR base/head SHAs,
   merge SHA, remote, and declared primary checkout. Fetch and prove the unit merge SHA
   is an ancestor of current `origin/main`. If unverifiable, report
   `invalid-precondition`, release only your own lease, and stop.
3. Reconcile same-branch multi-agent diffs: compare PR base…head commits/files/diff, the
   unit-start..PR-head commit/diff interval, landed first-parent delta, current branch
   HEAD/worktree dirt, and every agent contribution handoff. Build an ordered
   unit-start..head commit ledger: every commit has exactly one named owner, and
   overlapping path claims need explicit sequence/lk_handoff_v1 evidence. Map each path to
   both unit scope and a named contribution row—scope/branch name alone is never
   ownership. For squash merges, remap original commits by PR path/patch content instead
   of expecting their OIDs on `main`. Every explained merge-resolution / generated /
   omitted / superseded / later difference needs a commit/path/diff evidence link.
   Unresolved dropped, piggybacked, duplicated, or unowned changes are branch gaps: mark
   overall CLOSEOUT `partial-blocked` and preserve the branch/worktree.
4. Reflect SoR: update WORKSTREAMS, COORDINATION, append-only ledger, phase banners,
   handoff/audit trail, and next-action state.
5. Compare approved plan/blueprint with landed diff. Record codeframe changes,
   divergences, deferrals, anomalies, residuals, and branch-gap disposition.
6. Review product-local durable docs. Update them only when the landed unit changed a
   durable rule or system frame; otherwise record `no doctrine change`.
7. Produce overview and technical worklogs under `workLogsRoot`, composing the existing
   `work-log` and `work-log-tech` skills. Unit-specific drafts may run in parallel; final
   shared indexing remains lease-owned.
8. Write one concise unit entry and newest-first index row under `historyRoot`; link
   evidence instead of duplicating it. Record branch anchors/reconciliation, unit merge
   SHA, and final synchronized main tip separately.
9. Safely prune only the claimed unit’s clean/SHA-matched worktree. Do not prune a
   branch advanced beyond PR head, unresolved ownership gaps, or another agent’s dirt.
   Fetch, return the declared primary checkout to `main`, pull `--ff-only`, and verify
   `HEAD == origin/main`.
10. Park the next pointer per CP0-POLICY. Do not start it unless the instance policy and
    Admin authorization allow it.
11. Release the durable ownership row and atomic lease last. On any stop/failure, record
    the outcome and release only your own lease.

## Doctrine boundary

- Product closeout may update the instance MASTER-PLAN, local ADRs, product
  architecture/OOP pages, and local admin guides.
- Product closeout must not edit shared lk-bloom doctrine. Record a residual/Admin note
  instead.
- Exception: lk-bloom may be edited only when lk-bloom itself is the authorized active
  unit and doctrine is inside that unit’s approved scope.
- Do not open a new remediation program from CLOSEOUT.

## Completion

### Phase A / B statuses

- `invalid-precondition` — missing unit, instance, remote, or other required inputs.
- `audit-blocked` — FAIL after max audit cycles; escalated.
- `awaiting-preview` — audit OK; no preview approval or docs-only waiver yet.
- `pr-opened-waiting-merge` — PR open (or already open); Reflect not started.

### Phase C overall CLOSEOUT

- `complete`: merged land and branch attribution verified, required SoR/worklogs/history
  written, and local primary `main == origin/main`.
- `partial-blocked`: merged land verified, but unresolved branch gaps, foreign dirt, or
  divergence prevents safe attribution/cleanup/synchronization. Preserve it, record exact
  blocker, and do not claim full closeout-done without an explicit Admin waiver.
- `invalid-precondition`: no merged land/remote can be verified, or the merge SHA is not
  an ancestor of current `origin/main`. Stop and release only your own lease.

Primary-main synchronization is recorded separately:

- `complete`: local primary `main == origin/main`.
- `partial-blocked`: dirt/divergence prevents safe synchronization.
- `invalid-precondition`: remote/land/ancestry cannot be verified.

Use `gap` / `unknown` for missing historical evidence; never invent past detail.

See [reference.md](reference.md) for the field checklist and handoff format.