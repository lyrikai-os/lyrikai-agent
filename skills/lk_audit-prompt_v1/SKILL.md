---
name: lk_audit-prompt_v1
description: >-
  DEPRECATED wrapper — prefer `/lk_handoff_v1 audit`. Generates a copy-ready audit prompt in a code block. Use when the user asks for an audit prompt, says "give me audit prompt in codeblock", wants a second agent to review recent changes, or asks for a read-only verification prompt after implementation.
---
> Bundled from: `hive-vip-1/hive-vip-1_main/factory/skills/audit-prompt` · original: `/audit-prompt` · do not edit original


# audit-prompt (deprecated → `/lk_handoff_v1 audit`)

**Deprecated.** Prefer **`/lk_handoff_v1 audit`**. This wrapper exists so old slash/`/lk_audit-prompt_v1` invocations keep working with **no silent behavior change**.

## Instructions

1. Treat this invocation as **`/lk_handoff_v1 audit`**.
2. **Read and follow** bundled `skills/lk_handoff_v1/SKILL.md` (or installed `lk_handoff_v1`), then the mode body `skills/lk_handoff_v1/modes/audit.md`.
3. Do **not** invent a shorter substitute for the mode body.
4. Do **not** delete this wrapper unless Admin explicitly accepts wrapper deletion after PO-6.

Admin accept required before removing this file from tip vendors or home installs.