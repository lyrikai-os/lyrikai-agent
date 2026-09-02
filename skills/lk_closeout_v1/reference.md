# CLOSEOUT skill reference (phased finalize + v0.4.1 Reflect)

Canonical doctrine: `lk-bloom/master-build/MASTER-BUILD-PATTERN.md` §7 and the active
instance’s `04-agent-ops/CLOSEOUT.md` (and `PUBLISHER.md` when present).

This skill is a **single agent entrypoint** with Phase A (Check/Update), Phase B
(Publisher open-PR), and Phase C (post-merge Reflect). Instance docs may still split
Publisher vs CLOSEOUT; agents following `/lk_closeout_v1` must obey the phase walls below.

## Required inputs

### All phases

- Active instance and unit
- Declared primary checkout and remote
- `workLogsRoot` and `historyRoot` (v0.4.1)
- CP-0 mode and next pointer policy

### Phase A / B (pre-merge)

- Unit worktree + feature branch
- Ability to spawn `build-auditor` (not in v1 bundle) (independent subagent)
- Audit report path after PASS / PASS-WITH-NOTES
- Admin sandbox preview approval (date + who) **or** docs-only waiver before open PR
- No secrets in the diff

### Phase C only (post-merge Reflect)

- Free CLOSEOUT ownership slot + atomic build-master lease
- Verified `MERGED` state + unit-start, PR base/head, and **real merge SHA**
- Agent contribution handoffs/claims for every same-branch contributor

## Phase A checklist (no Reflect lease)

- [ ] Mode resolved: not MERGED → Phase A; MERGED → jump to Phase C
- [ ] Unit / worktree / branch identified
- [ ] Independent `build-auditor` (not in v1 bundle) spawned (not builder-only self-audit)
- [ ] FAIL / fix-needed → fixes committed in worktree → independent re-audit
- [ ] Max 3 audit cycles; else `audit-blocked` + Admin escalate
- [ ] PASS / PASS-WITH-NOTES tip SHA recorded
- [ ] Preview-approved (date+who) or docs-only waiver on record
- [ ] Missing preview → `awaiting-preview`; **do not** open PR; **do not** take lease

## Phase B checklist (no Reflect lease)

- [ ] Phase A gates satisfied (audit + preview/waiver)
- [ ] Tip SHA == last PASS|PASS-WITH-NOTES audit tip; else re-enter Phase A
- [ ] If rebased / conflict-resolved / tip changed since audit or preview →
      independent re-audit; re-preview (or fresh waiver) if tip changed after
      prior preview approval
- [ ] Push `-u` if needed
- [ ] Open PR (or report existing); body has unit link, acceptance, audit path,
      preview-approved / waiver line
- [ ] Ledger `pr-opened` when instance has a ledger
- [ ] No merge unless Admin explicitly requests
- [ ] Status `pr-opened-waiting-merge`; exit without Reflect lease / SoR / prune /
      next-unit start

## Phase C Reflect checklist (lease required)

- [ ] PR MERGED; merge SHA is ancestor of current `origin/main`
- [ ] Atomic `.closeout.lock` acquired; durable COORDINATION owner row confirmed after
      re-read (**merge SHA present**)
- [ ] Shared WORKSTREAMS/ledger/history/maps/remote state re-read after claim
- [ ] **Skill sprawl Reflect:** new skill vs extend existing? (one line; prefer extend)
- [ ] WORKSTREAMS closed/parked state
- [ ] COORDINATION ownership/worktree state
- [ ] Ledger `merged` + `reflect`
- [ ] PREP/READY/HANDOFF/phase banners
- [ ] Audit and tip-SHA trail
- [ ] Landed codeframe/modules + diff evidence
- [ ] PR/branch/landed/worktree diff reconciliation + contribution ownership
- [ ] Ordered unit-start..head commit ledger: exactly one named owner per commit; path
      overlaps need sequence/lk_handoff_v1 evidence
- [ ] Named handoff-row evidence for every commit/path; unit scope alone is insufficient
      on multi-agent branches
- [ ] Squash remapping by PR path/patch content, not original-OID presence on `main`
- [ ] Evidence links for explained differences and exact unresolved branch gaps
- [ ] Plan vs landed: divergence, deferral, anomaly
- [ ] Product-local doctrine/ADR/architecture/admin impact, or `no doctrine change`
- [ ] Shared-doctrine residual, when applicable

## Durable artifacts (Phase C)

Compose, do not duplicate:

- `work-log` → `YYYY-MM-DD-<product>-<unit>-overview.md`
- `work-log-tech` → `YYYY-MM-DD-<product>-<unit>-tech.md`

Index both under `workLogsRoot`.

Under `historyRoot`, write `YYYY-MM-DD-<product>-<unit>.md` and prepend one README row
containing:

- Unit, PR, unit-start / PR-base / PR-head / merge SHAs
- Landed zones/modules
- Same-branch contribution manifest, reconciled views, and branch gaps
- Plan divergence and anomalies
- Doctrine/architecture impact
- Links to worklogs, audit, handoff/CLOSEOUT, findings/reports/build log
- Primary-main synchronization outcome
- Parked next pointer

## Synchronization (Phase C only)

1. Fetch the declared remote.
2. Prove the unit merge SHA is an ancestor of current `origin/main`.
3. Reconcile PR base…head diff, unit-start..PR-head commit/diff interval, landed
   first-parent delta, current feature-branch HEAD/dirt, and agent contribution
   handoffs.
4. Record unexplained dropped/piggybacked/duplicated/unowned changes as branch gaps.
5. Inspect primary branch and dirt.
6. Remove only the claimed unit’s feature worktree when clean, SHA-matched, not advanced
   past PR head, and gap-free.
7. In the primary checkout, safely check out `main`.
8. Pull `--ff-only origin main`.
9. Compare local `HEAD` with `origin/main`.
10. Record unit merge SHA and final synchronized main tip separately.
11. Release the durable owner row and atomic lease last.

Record primary-main synchronization separately:

- `complete` when primary main is equal
- `partial-blocked` when dirt or divergence prevents safe synchronization
- `invalid-precondition` when no remote/merged land can be verified or the merge SHA is
  not an ancestor of current `origin/main`

Overall CLOSEOUT status is separate: unresolved branch gaps or foreign branch dirt keep
CLOSEOUT `partial-blocked` even if primary-main synchronization is `complete`.

Never reset, discard, stash, overwrite, or invent a remote to force completion.
Never clear another agent’s lease or prune another unit’s worktree. A held/ambiguous
lease requires owner or Admin resolution.
For writers on different filesystems, require the product’s Admin-designated external
lock/queue; `.closeout.lock` only coordinates a shared local checkout.
Never recover a lease for age alone. Admin must compare `CLAIM.md` with COORDINATION,
verify the owner/session is inactive, record `orphan-lease-cleared`, then remove the
ignored runtime lock.

**Never acquire the Reflect lease during Phase A or B.**

## Status vocabulary

| Phase | Status | Meaning |
|-------|--------|---------|
| A/B | `invalid-precondition` | Missing unit/instance/remote/inputs |
| A | `audit-blocked` | FAIL after max cycles |
| A | `awaiting-preview` | Audit OK; no preview/waiver |
| B | `pr-opened-waiting-merge` | PR open; Reflect not started |
| C | `complete` / `partial-blocked` / `invalid-precondition` | Overall Reflect outcome |
| C sync | same three values | Primary-main sync, recorded separately |

`pr-opened-waiting-merge` is **not** closeout-done.

## Final handoff

### After Phase A stop (`awaiting-preview` / `audit-blocked`)

Report: unit, worktree, audit verdict/path, tip SHA, exact blocker, next Admin action.

### After Phase B (`pr-opened-waiting-merge`)

Report: PR URL/number, audit path, preview-approved line, ledger note, “awaiting MERGED —
re-invoke `/lk_closeout_v1` for Phase C”.

### After Phase C

Report:

- PR + merge SHA
- Branch anchors + contribution reconciliation + gap disposition
- Updated SoR/docs
- Worklog + history paths
- Doctrine result
- Sync outcome and blocker/waiver
- Removed/preserved worktrees
- Parked next unit and exact unlock condition