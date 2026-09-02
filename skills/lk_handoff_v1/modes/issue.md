<!-- mode: issue — body from former skill; do not edit behavior without Admin -->


# Session Issue

## Instructions

When the user asks for `/session-issue` (or an issue handoff / mini-report for another agent):

1. Return **only** a fenced `text` code block unless they ask for extra explanation.
2. Scope to the **named issue(s)** — not the whole session. If the user did not name an issue, ask once which issue(s) to include.
3. Prefer facts from this conversation and cited paths. Do not invent severity, SHAs, or root causes.
4. Keep it short: enough for a fresh agent to assess, not a full build handoff.
5. Frame the receiver as an **assessor** — do not continue the build unless the user asks after assessment.

## Companion skills

| Need | Skill |
|------|--------|
| Full session/build summary for assessment | `session-handoff` (not in v1 bundle) |
| Next-phase kickoff | `lk_prep-prompt_v1` |
| Formal read-only audit of known changes | `lk_audit-prompt_v1` |
| One issue / small issue set / mini-report | **this skill** |

## Output template

Drop unused sections. No placeholders in the code block.

```text
You are assessing a handed-off issue brief. Do not implement fixes unless the user explicitly asks after your assessment.

Repo (if known):
`[absolute path or unknown]`

Issue(s):
1. [Title] — [1–2 sentence what happened / what’s wrong]
2. [Optional second issue…]

Evidence:
- [paths, symptoms, commands, error snippets actually observed]
- Repro / when it shows: [or "unknown"]

Context already tried (if any):
- [attempts + outcome, or "none noted"]

Open questions:
- [what the prior agent could not resolve]

Assess:
1. Is the issue real / correctly framed?
2. Severity and blast radius (scoped to evidence).
3. Recommended next action in one short paragraph — investigate further, fix, defer, or escalate — without starting that work unless asked.

Return:
- Verdict first: CONFIRMED / NEEDS-INFO / NOT-AN-ISSUE / OVERSTATED
- Findings ordered by severity
- What is known vs still unknown
```

## Style rules

- One issue → keep the list to one item; several related issues → short numbered list only.
- Absolute paths when known; otherwise `unknown`.
- Pasteable with no prior chat context.
- If the user wants the whole session summarized, redirect them to `/session-handoff`.

## Trigger examples

- `/session-issue`
- `/session-issue the board empty-gate flicker`
- "sum up this bug for another agent"
- "mini-report handoff on these two issues"