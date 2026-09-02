<!-- mode: prep — body from former skill; do not edit behavior without Admin -->


# Prep Prompt

## Instructions

When the user asks for a prep / kickoff / next-phase prompt:

1. Return **only** a fenced `text` code block unless they ask for extra explanation.
2. Prefer facts from the **just-closed phase** (ledger, handoff, audit report, worktree SHAs). Do not invent audited heads.
3. Resolve the **exact stack base** correctly:
   - Prior phase had a product commit + handoff → base = that audited head.
   - Prior phase was an **audited no-op** → base = the prior dependency tip named in the close (often the upstream BP tip), not a fake new SHA.
4. Name worktrees/branches that must stay intact; forbid push/PR/merge/rebase/cleanup unless the operating mode says otherwise.
5. Embed objective, scope, hard walls, required order, verification, audit path, and handoff fields from the **next** blueprint (or named workstream doc).
6. If the next blueprint is missing or the base SHA is ambiguous, ask 1 clarifying question instead of guessing.

## Gather before writing (read, don't invent)

From the closed phase and next blueprint, collect:

| Field | Sources |
|-------|---------|
| Repo + build-master / planning root | Conversation, AGENTS.md, prior kickoff |
| Prior worktrees / branches / audited heads | Handoff md, ledger `handoff-ready` / `audit-*` rows |
| No-op vs commit close | Audit report + presence/absence of handoff md |
| Exact base SHA for next worktree | Blueprint Depends + D3/no-op rule |
| `origin/main` (rebase risk only) | Last recorded ledger / `git rev-parse` |
| Next blueprint path + goal | `01-blueprints/BP-NN-*.md` or equivalent |
| Scope + hard walls | Blueprint zone / Do Not / ops flow |
| Evidence + audit paths | `03-audit/evidence/BP-NN/`, `03-audit/reports/BP-NN-audit-1.md` |
| Coordination fallback | Site AGENT-COORDINATION vs build-master COORDINATION |

## Output template

Fill every bracket from real paths/SHAs. Drop sections that do not apply; do not leave placeholders in the code block.

```text
You are the local build orchestrator for [SYSTEM] [PHASE-ID] ([short title]).

Repository:
`[absolute site/repo path]`

Build-master / planning root:
`[absolute build-master or docs path]`

Prior phases (leave intact; do not modify, push, rebase, or remove):
- [PHASE] worktree: `[../wt-…]` · branch `[name]` · audited head `[full sha]`
- Handoffs: `[paths or "none — audited no-op"]`
- Audit: `[report path]` ([verdict] · [one-line note])
- Evidence: `[evidence dir]`

Exact stack base for [NEXT-PHASE]:
`[full sha]`
[One sentence why: prior audited head / prior no-op → upstream tip]

origin/main last recorded:
`[full sha or unknown]`
Record movement only as rebase risk. Do not rebase past the audited base above.

Objective:
[1–4 sentences from next blueprint goal + stop condition]

Before acting:
1. Read repo `AGENTS.md` (and repo-level contracts if named).
2. Check site coordination doc; if absent, record that build-master/coordination fallback governs.
3. Read `[next blueprint path]` fully and `[AUDIT-PROTOCOL path]` (or equivalent Check gate).
4. Reverify base tip remains clean at `[sha]`; record current `origin/main`.
5. Create isolated worktree/branch from the exact base:
   `git worktree add [../wt-…] -b [branch] [exact-sha]`
6. Append CP-0 `started` ledger row to `[ledger path]` before any edits.

Scope:
- [allowed paths]
- Matching tests + evidence under planning root

Hard boundaries:
- [forbidden paths / no server / no chrome / no OpenRouter / no push-PR-merge…]
- Do not append publisher-owned ledger rows (if local-build mode).

Required order:
1. [Bootstrap / spawn build sub-agent / diagnose-first / …]
2. [Acceptance evidence the next agent must produce]
3. Self-check every acceptance box.
4. Verification every cycle: `[commands]` · evidence dir · hard-wall review beyond import guard if UI.
5. Spawn fresh-context read-only independent audit agent → `[audit report path]`.
   Auditor may write ONLY the audit report; must not modify builder evidence after audit begins.
6. On PASS / PASS-WITH-NOTES: append audit + handoff ledger rows (or no-op branch per blueprint); write `[HANDOFF.md]` only when required.
7. State whether [following phase] is unblocked and on which base. Stop. Do not start it.

Handoff must include:
[branch/worktree; base; audited head; commits; files; evidence; tests; audit path/verdict; coordination fallback; rebase risks; next-phase dependency]

Audit focus (must fail if missed):
- [blueprint-named biggest risks]

Escalate only after 3 failed audit cycles, or if work requires leaving declared scope.
```

## Style rules

- Address the **orchestrator** of the next phase (or build agent if the user asked for a build-only paste).
- Use full SHAs and absolute paths when known.
- Keep the prompt pasteable into a fresh agent with no needed chat context.
- Prefer the wave’s operating mode (local build → independent audit → handoff only vs push/PR) from the blueprint / COORDINATION, not a default guess.
- Mirror hard walls and ownership (“own vs reuse”) from the next blueprint verbatim where safety-critical.
- Companion skill: for a **read-only audit** of a finished phase, use `lk_audit-prompt_v1` instead.
- Companion skill: for a pasteable **Hive Queen seat** brief (program admin overview + conductor-delegated Admin), use `hive-queen-admin-prep-prompt` (not in v1 bundle) — distinct from this BP/phase kickoff.

## Trigger examples

- “ok, give me codeblock prompt to kick off next phase agent”
- “prep-prompt for BP-19”
- “kickoff prompt for the next blueprint”
- “pasteable orchestrator brief after this handoff”