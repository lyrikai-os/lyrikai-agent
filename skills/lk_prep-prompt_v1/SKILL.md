---
name: lk_prep-prompt_v1
description: >-
  DEPRECATED wrapper — prefer `/lk_handoff_v1 prep`. Generates a copy-ready next-phase kickoff prompt in a fenced text code block. Use when the user asks for a prep prompt, kickoff prompt, "codeblock prompt to kick off next phase", phase handoff prompt, or wants a pasteable orchestrator brief for the next blueprint/workstream agent after a phase closed.
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/prep-prompt` · original: `/prep-prompt` · do not edit original


# prep-prompt (deprecated → `/lk_handoff_v1 prep`)

**Deprecated.** Prefer **`/lk_handoff_v1 prep`**. This wrapper exists so old slash/`/lk_prep-prompt_v1` invocations keep working with **no silent behavior change**.

## Instructions

1. Treat this invocation as **`/lk_handoff_v1 prep`**.
2. **Read and follow** bundled `skills/lk_handoff_v1/SKILL.md` (or installed `lk_handoff_v1`), then the mode body `skills/lk_handoff_v1/modes/prep.md`.
3. Do **not** invent a shorter substitute for the mode body.
4. Do **not** delete this wrapper unless Admin explicitly accepts wrapper deletion after PO-6.

Admin accept required before removing this file from tip vendors or home installs.