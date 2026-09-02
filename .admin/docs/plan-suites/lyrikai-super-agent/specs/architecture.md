# Architecture — Lyrikai Super Agent harness

**Suite:** `lyrikai-super-agent`  
**Altitude:** spec — cite in unit plans; do not fork as competing SoR

---

## Identity

**Lyrikai Super Agent** = **router + posture + scene sense + install bundle**.

It is not:

- A monolithic SKILL.md containing BPS + SBT + re-app bodies
- Admin, Audit, or Orchestrator
- A replacement for Queen (chat soul), Trinity (engine), or SBT (ship loop)
- Auto-GO from scene sense alone

---

## Single front door

| Invoke | Role |
|--------|------|
| `/lyrikai` | Primary — only required invoke |
| `/trinity`, `/build-plan-suite`, `/hive`, … | Legacy aliases — same SKILL bodies, routed through scene sense when super agent seated |

Dual visibility:

- Cursor agent picker: `lyrikai-super.md`
- Product folder: clone of [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent)

---

## Product home

| Surface | Role |
|---------|------|
| **[github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent)** | Canonical MIT public repo — clone, install, releases |
| **`lk-bloom/lyrikai-agent/`** | Monorepo dev checkout (optional); changes publish to standalone repo |
| **lk-bloom PR #5** | Historical monorepo PR — not the long-term public home |

---

## Package layers

```text
lyrikai-agent/
├── README.md, LICENSE, wiki-pointer.md     # public face (unit 01)
└── agent/
    ├── AGENT-CARD.md          # L0 ~80 lines
    ├── LYRIKAI-BOOT.md        # L1 activation
    ├── SCENE-ROUTER.md        # signal → delegate
    ├── TRUST-GATES.md         # lite gate ladder
    ├── MANIFEST.md            # rings + version + tip_pin
    ├── agents/
    │   └── lyrikai-super.md   # Cursor shell
    └── install/
        ├── install.sh
        └── verify.sh
```

Companion skill **bodies** remain in tip `factory/skills/*` — install symlinks only.

---

## Boot flow

```text
Seat (/lyrikai or picker)
  → AGENT-CARD (L0 walls + loop)
  → LYRIKAI-BOOT (L1)
      1. Auto-stack Queen + Trinity
      2. Hive SoR touch (on demand)
      3. Wiki-log unfurl
      4. Scene ladder (SCENE-ROUTER)
      5. One companion SKILL by path
      6. Queen rollup / Trinity covenant
  → Permission tier (P0–P3)
  → Trust gate (Stage1/Stage2)
  → Delegate or WAIT
```

---

## North-star loop (star system)

One repeating program arc — not fifty disconnected skills:

```text
Search → Plan (paper) → Delegate → Plan (unit) → Build → Ship → (loop)
```

| Beat | User sees | Primary delegates | Trust gate |
|------|-----------|-------------------|------------|
| **1 · Search** | What's on the desk? | Scene router, `hive`, `wiki-log`, `research-update` | P0 propose — search ≠ build permission |
| **2 · Plan (paper)** | Suite / END-GOAL / archive map | `build-plan-suite`, `re-app`, `gear-set` prep | P1 soft — stops at END-GOAL |
| **3 · Delegate** | Routing to specialist | Scene router + permission tier | P0–P2 |
| **4 · Plan (unit)** | Unit / covenant / kickoff | `prep-prompt`, Trinity covenant, `instruction-manual` | Conductor GO to leave paper |
| **5 · Build** | Implement the unit | `trinity` or `super-build-trinity` | CP-0 / Admin when Hive-gated |
| **6 · Ship** | Audit → preview → PR → closeout | SBT + **Audit** (independent) + Admin preview | P3 block false GO |
| **7 · Loop** | What's next? | Return to Search | wiki-log + catalog refresh |

**Two plan beats on purpose:**

- **Plan (paper)** — durable map; stops without GO
- **Plan (unit)** — executable slice; unlocks Build

**Ship ≠ Build+PR.** Ship = Adversary (guide) → **Audit (independent)** → Admin preview → PR → closeout.

---

## Ring model (summary)

Full table: [`manifest-rings.md`](manifest-rings.md).

| Ring | Always warm? | Role |
|------|--------------|------|
| Foundation | Partial — queen+trinity+wiki-log always; `hive` on demand | Chat soul + engine + SoR cold-start |
| Hive ops | On delegate | Parallel helpers, Paper register, meta-map |
| Plan / archive | On delegate | BPS, gears, re-app, excavation |
| Ship | On delegate | SBT, closeout, prep, audit |
| Outer | On demand | Full ADMIN-SKILLS table |

---

## Split of concerns

| Surface | Home | License / role |
|---------|------|----------------|
| Super-agent package | [github.com/lyrikai-os/lyrikai-agent](https://github.com/lyrikai-os/lyrikai-agent) | MIT — harness, install, agent shell (`lk-bloom/lyrikai-agent/` = optional monorepo dev) |
| Ecosystem wiki | `lyrikai-meta/wiki/` | HOLD — research, debates, proposals |
| Companion skill law | VIP tip `factory/skills/*` | Read-only cite — install symlinks |
| Program product trees | Per-product checkouts | Unchanged — BPS `.admin/`, gears, builds |

---

## Walls (architecture-level)

1. Queen chat soul, Trinity engine, SBT ≠ Lyrikai, Watcher ≠ Audit
2. Paper ≠ GO; scene propose ≠ execute
3. Tip skills cited not forked
4. T2 tip land = Admin GO only
5. No vendoring full tip bodies into product (read-budget + drift)

---

## Cites

- Unified plan: `.cursor/plans/lyrikai_super_agent_68b7acfa.plan.md`
- Tip AGENT-CARD pattern: `hive-vip-1/hive-vip-1_main/AGENT-CARD.md`
- Bundling precedent: `lk-gears/admin/storehouse/trinity-gears-fork/`
- Trust gates detail: [`trust-gates-lite.md`](trust-gates-lite.md)
