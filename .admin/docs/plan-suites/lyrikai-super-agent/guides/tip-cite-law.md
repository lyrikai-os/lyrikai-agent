# Tip cite law — VIP skills symlink

**Suite:** `lyrikai-super-agent`  
**Audience:** agents filling unit 04 + humans auditing install behavior

---

## Principle

**Tip skills are law. Product install symlinks — never forks.**

| Surface | Role |
|---------|------|
| VIP tip `hive-vip-1/hive-vip-1_main/factory/skills/*` | Authoritative SKILL bodies |
| `lyrikai-agent/agent/MANIFEST.md` | Bundle manifest + tip_pin |
| `~/.claude/skills/<slug>` | Install target — symlink to tip |
| `lyrikai-agent/` product tree | Harness only — no skill body vendoring |

---

## Why not vendor?

1. **Read budget** — 50+ skills; monolith violates modular law
2. **Drift** — forked bodies diverge from tip HEAD
3. **T2 land** — tip patches (`factory/skills/lyrikai/SKILL.md`, `ADMIN-SKILLS.md`) are Admin GO; product re-copy would fight tip
4. **False GO** — vendored copy looks like "our law" when it is stale

---

## tip_pin

Recorded at install:

```bash
cd "$HIVE_TIP_ROOT" && git rev-parse HEAD
```

Stored in MANIFEST `tip_pin` field (or sidecar — document in unit 04).

**Meaning:** "This install was tested against tip SHA …" — not "product owns skill law."

`verify.sh` warns when tip HEAD ≠ tip_pin (drift).

---

## Symlink pattern

```bash
ln -sf "$HIVE_TIP_SKILLS/build-plan-suite" ~/.claude/skills/build-plan-suite
```

- Target must be tip path — not a copy under `lyrikai-agent/`
- Slug names match tip folder names exactly
- Outer ring: optional `--full-outer`; default respects read budget

---

## Cursor agent vs Claude skills

| Artifact | Install | Source |
|----------|---------|--------|
| `lyrikai-super.md` | **copy** to `~/.cursor/agents/` | `agent/agents/lyrikai-super.md` |
| Tip skills | **symlink** to `~/.claude/skills/` | tip `factory/skills/` |
| Trinity seats | cite paths in agent shell | `~/.cursor/agents/trinity-*.md` (existing) |

Agent shell is thin — points to product `AGENT-CARD.md` / `LYRIKAI-BOOT.md` by path.

---

## What T2 tip patch will add (Admin GO — not fill)

On Admin GO, tip `factory/skills/lyrikai/SKILL.md` gains:

- § Scene sense + auto-delegate
- Cite `lyrikai-agent/agent/*` paths
- Permission tiers P0–P3

`ADMIN-SKILLS.md` gains `ring` column per [`../specs/manifest-rings.md`](../specs/manifest-rings.md).

`ORCHESTRATION.md` §8 — one paragraph pointer to `lyrikai-agent/`.

**Fill phase does not write tip.** Proposal only: `lyrikai-meta/wiki/proposals/lyrikai-super-agent.md`.

---

## Must-nots

- Fork `factory/PLANNING-ATTIC.md` into product as competing SoR
- Paste SKILL bodies into `lyrikai-agent/agent/`
- Claim install = tip land or Admin GO
- Silent tip write from super agent session
- Replace `~/.claude/skills/` targets with stale product copies

---

## Cites

| Concern | Path |
|---------|------|
| Planning attic law | tip `factory/PLANNING-ATTIC.md` |
| Lyrikai skill | tip `factory/skills/lyrikai/SKILL.md` |
| Phone book | tip `factory/skills/lyrikai/ADMIN-SKILLS.md` |
| Protocol ladder | tip `factory/PROTOCOL-LADDER.md` |
| Install behavior | [`install.md`](install.md) |
