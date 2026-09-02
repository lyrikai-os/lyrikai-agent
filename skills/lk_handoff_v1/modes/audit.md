<!-- mode: audit — body from former skill; do not edit behavior without Admin -->


# Audit Prompt

## Instructions

When the user asks for an audit prompt:

1. Return only a fenced `text` code block unless the user asks for extra explanation.
2. Tailor the prompt to the current task, plan, or recently edited files.
3. Make the audit explicitly read-only: no edits, commits, or destructive commands.
4. Put findings first and order them by severity.
5. Include concrete files, expected behaviors, validation commands, and known risks when available.
6. Ask the auditor to report "No blocking issues found" if no issues are found.

Companion: for a pasteable **Hive Queen seat** admin overview (not an audit), use `hive-queen-admin-prep-prompt` (not in v1 bundle). For next-phase build kickoff, use `lk_prep-prompt_v1`.

## Template

```text
Audit the implementation for: [task name].

Scope:
- Do not make edits.
- Review only the changes related to [scope].
- Confirm these files were not changed unless explicitly required:
  - [protected file]

Check the following:
1. [Expected behavior or file-specific requirement]
2. [Expected behavior or file-specific requirement]
3. [Search or validation requirement]

Validation:
- Report lint, test, typecheck, or build results if available.
- Identify any new errors, regressions, or edge cases.
- Note known residual risks, but do not require out-of-scope fixes.

Return:
- Findings first, ordered by severity.
- If no issues, say "No blocking issues found."
- Include any test gaps or residual risks.
```