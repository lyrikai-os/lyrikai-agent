<!-- mode: update — session-change delta brief; do not edit behavior without Admin -->


# Session Update

## Instructions

When the user asks for a session update (`/lk_handoff_v1 update`, `session-update`, "what this session changed", "delta for another agent"):

1. Return **only** a fenced `text` code block unless they ask for extra explanation.
2. Prefer facts from **this conversation** and verifiable repo state. Do not invent SHAs, paths, commits, or outcomes.
3. Frame the receiving agent as needing the **delta** — what changed vs baseline — not a full assessor ritual and not an implementer kickoff.
4. Baseline: **start of this session**, or a prior handoff / note the user names. If unclear, use session start.
5. Keep shorter than `session`: change list + artifacts + open items. Skip assessor verdict / PASS-FAIL ritual.
6. Do **not** write archive `.md` logs to disk unless the user also asked for `/work-log` / `/work-log-tech`.

## Companion skills (pick the right one)

| Need | Skill / mode |
|------|----------------|
| Full pasteable assessor brief | `session` / `session-handoff` (not in v1 bundle) |
| Short pasteable “working on” pointer | `pointer` / `session-pointer` |
| Continue same process in new chat | `continuation` / `continuation-prompt` |
| Next-phase orchestrator kickoff | `prep` / `lk_prep-prompt_v1` |
| What changed this session (delta) | **this mode** |
| Archive narrative / tech log as `.md` | `work-log` / `work-log-tech` |

## Gather before writing (read, don't invent)

| Field | Sources |
|-------|---------|
| Baseline | Session start, or prior handoff / note the user named |
| Repo + path | Conversation, AGENTS.md, cwd |
| Branch / HEAD | Session claims; `git` only when needed for accuracy |
| What changed | Edits, decisions, commits, docs produced this session |
| Artifacts on disk | Paths that exist or were produced |
| Still open | Blockers, TODOs, work not touched that still matters |
| Hard constraints | Local-only, no push, worktree rules, HOLD walls |

## Output template

Fill every bracket from real session facts. Drop sections that do not apply; do not leave placeholders in the code block.

```text
Session update for a fresh agent. Orient on what changed — do not implement unless the user asks.

Baseline:
[session start / named prior handoff]

Repo / branch / HEAD:
`[absolute path or unknown]` · `[branch or unknown]` · `[full sha or unknown]`

What this session changed:
- [concrete change]
- [concrete change]

Artifacts now on disk:
- `[path]` — [why it matters]
- `[path]` — [why it matters]

Decisions locked:
- [Decision + brief why]

Still open / unchanged that still matters:
- [blocker, leftover, or prior state the receiver must not forget]

Do not:
- [hard constraint from session, if any]
```

## Style rules

- Address the **receiving agent**, not the original builder.
- Outcomes over intentions ("wrote X", "left Y uncommitted") — not "should" or "will".
- Separate **changed**, **on disk**, **still open**, and **do not** clearly.
- Use absolute paths and full SHAs when known; otherwise `unknown`.
- If almost nothing changed, say so under **What this session changed** and keep bullets minimal.
- Do not expand into a full `session` assessor brief, `pointer`, `continuation`, or `prep` kickoff unless asked.

## Hard walls

- Chat only for the note. No archive files as part of this mode.
- Do not invent commits, SHAs, test results, or audit verdicts.
- Do not treat this as permission for the receiver to build.

## Trigger examples

- `/lk_handoff_v1 update`
- `session-update`
- "what this session changed for another agent"
- "pasteable delta of our work this session"
- "session change brief I can paste to a fresh agent"