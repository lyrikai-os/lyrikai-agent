<!-- mode: session — body from former skill; do not edit behavior without Admin -->


# Session Handoff

## Instructions

When the user asks for a session handoff (`/session-handoff`, "handoff this session", "brief for another agent to assess"):

1. Return **only** a fenced `text` code block unless they ask for extra explanation.
2. Prefer facts from **this conversation** and verifiable repo state. Do not invent SHAs, PR numbers, test results, or audit verdicts.
3. Frame the receiving agent as an **assessor** — they should understand what happened, what exists on disk, and what to scrutinize — not as an implementer kicking off the next phase.
4. Include enough paths, SHAs, branches, and open questions that a fresh agent needs **no prior chat context**.
5. If critical facts are missing (repo path, branch, whether work was committed), note them as `unknown` in the brief rather than guessing.
6. Do **not** write archive `.md` logs to disk unless the user also asked for `/work-log` / `/work-log-tech`.

## Companion skills (pick the right one)

| Need | Skill |
|------|--------|
| Pasteable kickoff for the **next** phase / blueprint | `lk_prep-prompt_v1` |
| Pasteable **Hive Queen seat** brief (overview + delegated Admin) | `hive-queen-admin-prep-prompt` (not in v1 bundle) |
| Pasteable **read-only audit** of finished implementation | `lk_audit-prompt_v1` |
| Archive session narrative / tech log as `.md` | `work-log` / `work-log-tech` |
| Pasteable **session/build summary for assessment** | **this skill** |

## Gather before writing (read, don't invent)

From the current session (and git/status only when needed to fill unknowns):

| Field | Sources |
|-------|---------|
| Repo + workspace path | Conversation, AGENTS.md, cwd |
| Goal of this session | User's original ask + what actually got done |
| Branch / worktree / HEAD | Session claims; `git` only if already known or user expects accuracy |
| Commits made (or "none — uncommitted / not asked") | Conversation + status |
| Files / areas touched | Edits, plans, docs referenced |
| Decisions + tradeoffs | Explicit choices in-thread |
| Verification run | Commands + outcomes actually observed |
| Open risks / unknowns | Blockers, TODOs, rebase risk, missing evidence |
| What the assessor should judge | User intent: quality? completeness? next-step readiness? |

## Output template

Fill every bracket from real session facts. Drop sections that do not apply; do not leave placeholders in the code block.

```text
You are assessing a prior agent session/build handoff. Do not continue implementation unless the user explicitly asks after your assessment.

Repository:
`[absolute path]`

Workspace / worktree:
`[path or "same as repo"]` · branch `[name or unknown]` · HEAD `[full sha or unknown]`

Session goal:
[1–3 sentences: what the user asked for and what this session set out to do]

What was done:
- [Concrete outcome 1]
- [Concrete outcome 2]
- [Concrete outcome 3]

Artifacts (paths that exist or were produced):
- Code: `[paths or "none"]`
- Docs / plans / evidence: `[paths or "none"]`
- Commits: `[shas + one-line subjects, or "none — uncommitted / not committed"]`
- PRs: `[urls/numbers or "none"]`

Decisions locked in this session:
- [Decision + brief why]
- [Decision + brief why]

Verification performed:
- [command → result, or "none run"]
- Known gaps: [tests/lint/build not run, fixture-only, etc.]

Hard constraints that applied (and still apply):
- [e.g. local fixture only / no OpenRouter; no push/PR; UI catalog required; worktree rules]

Open items / risks for assessment:
- [Unresolved question, incomplete work, rebase risk, missing evidence]
- [Anything the prior agent was unsure about]

Assess specifically:
1. [Primary question the receiving agent should answer — completeness, correctness, readiness, etc.]
2. [Secondary assessment focus]
3. [Any named risks or files to scrutinize]

Return:
- Verdict first: PASS / PASS-WITH-NOTES / FAIL / NEEDS-INFO (or equivalent clear judgment).
- Findings ordered by severity.
- What is safe to treat as done vs still open.
- Recommended next action (one short paragraph) — kickoff, audit, fix, or stop — without starting that work unless asked.
```

## Style rules

- Address the **receiving assessor**, not the original builder.
- Use full SHAs and absolute paths when known; otherwise write `unknown`.
- Keep the prompt pasteable into a fresh agent with no needed chat context.
- Prefer observed outcomes over intentions ("ran X, passed" not "should pass").
- Separate **done**, **decided**, and **still open** clearly.
- If the session produced a formal handoff md / audit report, link those paths and tell the assessor to treat them as primary evidence.
- Companion: for a **next-phase orchestrator kickoff**, use `lk_prep-prompt_v1`. For a **Hive Queen seat** brief, use `hive-queen-admin-prep-prompt` (not in v1 bundle). For a **scoped read-only audit** of known changes, use `lk_audit-prompt_v1`.

## Trigger examples

- `/session-handoff`
- "handoff this session to another agent"
- "give me a pasteable brief so another agent can assess"
- "session summary codeblock for a second agent"
- "build handoff prompt for assessment"