<!-- mode: pointer — body from former skill; do not edit behavior without Admin -->


# Session Pointer

## Instructions

When the user asks for a session pointer (`/session-pointer`, "point-to note", "brief handoff note"):

1. Return **only** a fenced `text` codeblock unless they ask for extra explanation.
2. Prefer facts from **this conversation** (or another session/transcript the user names). Do not invent SHAs, paths, or outcomes.
3. Frame the receiving agent as **orienting only** — understand what the other session is working on; do not implement unless the user asks after pasting.
4. Keep it short. Outcomes over file dumps. Absolute paths when known; otherwise `unknown`.
5. Do **not** write archive `.md` files unless the user separately asked for `/work-log` / `/work-log-tech`.

## Companion skills (pick the right one)

| Need | Skill |
|------|--------|
| Short human highlight | `session-summary` |
| Condensed technical status (ports / agents / task remainder) | `session-status` |
| Full pasteable assessor brief | `session-handoff` (not in v1 bundle) |
| Brief pasteable “working on” pointer | **this skill** |
| Continue same process in new chat | `continuation-prompt` |
| Next-phase orchestrator kickoff | `lk_prep-prompt_v1` |
| Archive narrative / tech log as `.md` | `work-log` / `work-log-tech` |

## Scope

1. **Current session** (default) — this conversation
2. **Another session** — agent transcript or the session the user names
3. **Multiple sessions** — one short block per session, or one block with labeled subsections if they ask for several

If scope is unclear, ask once.

## Output template

Fill from real session facts. Drop sections that do not apply; do not leave placeholders in the codeblock.

```text
Point-to note for prior session. Orient only — do not implement unless the user asks.

Working on:
[1–2 sentences: goal + current focus]

Repo / area:
`[absolute path or unknown]` · branch `[name or unknown]`

Done so far:
- [outcome]
- [outcome]

Still open:
- [blocker or next item]

Key paths:
- `[path]` — [why it matters]

Do not:
- [hard constraint from session, if any]
```

## Content rules

- Prefer outcomes and current focus over line-by-line diffs.
- Separate **done**, **still open**, and **do not** clearly.
- If almost nothing happened, say so under **Working on** and keep bullets minimal.
- If a hard constraint applied in-session (no push, local-only, worktree rules), include it under **Do not**.

## Hard walls

- Chat only for the note. No archive files as part of this skill.
- Do not expand into a full `session-handoff` (not in v1 bundle) assessor brief unless asked.
- Do not produce a next-phase `lk_prep-prompt_v1` kickoff unless asked.
- Do not invent commits, SHAs, test results, or verdicts.

## Trigger examples

- `/session-pointer`
- “point-to note for another agent”
- “brief handoff note I can copy paste”
- “short pointer of what this session is working on”
- “pasteable note so another agent knows what’s in flight”