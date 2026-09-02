---
name: lk_hive_v1
description: "Trigger immediately when the user types /lk_hive_v1, or asks to follow Hive, master-build, agent-team-pools, or the hive-vip tip cold-start protocol."
metadata:
  disable-model-invocation: "true"
---
> Bundled from: `other/skills/claude-skills/hive` · original: `/hive` · do not edit original


# Hive

When `/lk_hive_v1` (or an equivalent ask) is used, treat this path as the canonical SoR for Lyrikai multiagent / master-build protocol:

`VIP tip at workspace (directory containing ORCHESTRATION.md; see yard HIVE-TIP.md when present)`

That checkout is the **VIP tip** (current operational SoR). Pin may rotate to another `hive-vip-1_*` tip — yard [`HIVE-TIP.md`](hive-vip-yard/HIVE-TIP.md) (when workspace includes the yard) is the pointer of record when the workspace includes the yard.

`the public scrubbed hive tip (publish mirror — not operational cold-start)` is the **public scrubbed tip** (publish mirror). Do **not** cold-start from it for operational Hive work.

## Cold start (every time)

1. **Immediately** read `ORCHESTRATION.md` in the VIP tip tree.
2. If the instance / ask is **`factory`** or **`deploy-gated`** mode: then read `AGENT-CARD.md` **(L0)** → `HIVE-BOOT.md` **(L1)**. Respect `factory/READ-BUDGET.md` — do **not** read all of `factory/` first. Stewarded default stays on ORCHESTRATION + MBP / pools only.
3. Then read only what the current ask needs — typically `README.md`, plus relevant slices of `master-build/`, `agent-team-pools/`, `doctrine/`, `distill/`, `GLOSSARY.md`, `proposals/`, `registry/`, and (when mode warrants) thin slices of `factory/`, `precision/`, or `design/`.
4. Follow Hive gates, walls, and role rules. Do not invent process outside this tree.

## Scope

Look at, study, and/or follow Hive as required by the user’s message. If the message is only `/lk_hive_v1`, acknowledge once that Hive is in force, confirm you will cold-start from VIP tip `ORCHESTRATION.md`, then wait — or proceed if they already asked something in the same message.

For seating **this** session agent as Hive Queen (program admin overview + Admin only when human conductor delegates), use `lk_hive-queen_v1`. For a pasteable Queen-seat brief for a **fresh** agent, use `hive-queen-admin-prep-prompt` (not in v1 bundle) — both distinct from this cold-start skill.