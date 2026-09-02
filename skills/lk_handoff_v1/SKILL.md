---
name: lk_handoff_v1
description: >-
  Unified handoff family. Use when the user types /lk_handoff_v1 <mode>, or asks for a
  prep/kickoff prompt, audit prompt, session handoff, session issue brief,
  session pointer, session update / what-changed delta, or continuation prompt
  for a new chat. Modes: prep, audit, session, issue, pointer, update,
  continuation (aliases: prep-prompt, audit-prompt, session-handoff,
  session-issue, session-pointer, session-update, continuation-prompt).
disable-model-invocation: true
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/handoff` · original: `/handoff` · do not edit original


# Handoff (`/lk_handoff_v1 <mode>`)

**Family skill** for pasteable handoff / kickoff / audit / pointer prompts.  
Legacy slash names (`/lk_prep-prompt_v1`, `/session-handoff`, …) remain as **deprecated wrappers** that dispatch here — same behavior until Admin accepts deleting those wrappers.

## Resolve mode

| User says | Mode file |
|---|---|
| `prep` · `lk_prep-prompt_v1` · kickoff / next-phase codeblock | [`modes/prep.md`](./modes/prep.md) |
| `audit` · `lk_audit-prompt_v1` · audit prompt in codeblock | [`modes/audit.md`](./modes/audit.md) |
| `session` · `lk_handoff_v1` · `session-handoff` (not in v1 bundle) · assessor session brief | [`modes/session.md`](./modes/session.md) |
| `issue` · `session-issue` · mini issue brief | [`modes/issue.md`](./modes/issue.md) |
| `pointer` · `session-pointer` · short point-to note | [`modes/pointer.md`](./modes/pointer.md) |
| `update` · `session-update` · what this session changed / delta | [`modes/update.md`](./modes/update.md) |
| `continuation` · `continuation-prompt` · continue in new chat | [`modes/continuation.md`](./modes/continuation.md) |

1. Parse `/lk_handoff_v1 <mode>` or map a legacy slash / natural ask to the table.
2. If mode missing or ambiguous → ask once.
3. **Read and follow** the matching `modes/*.md` body exactly (do not invent a shorter substitute).

## Companions (use the other skill instead)

| Need | Skill |
|------|--------|
| Pasteable brief for a **different** agent | **this family** |
| This agent catch-up, not a pasteable transfer | `catch-up` (not in v1 bundle) |

## Walls

- Do not silently change mode behavior vs the former standalone skill.
- Do not delete legacy wrappers without Admin accept.
- Model-invocable skills outside this family stay split (not consolidated here).