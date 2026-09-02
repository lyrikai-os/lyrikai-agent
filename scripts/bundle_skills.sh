#!/usr/bin/env bash
# bundle_skills.sh — copy tip + monorepo skill sources into skills/lk_*_v1/
# Idempotent. Run from lyrikai-agent/ root or via scripts/.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LYRIKAI_AGENT_ROOT="${LYRIKAI_AGENT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
LK_BLOOM="${LK_BLOOM:-$(cd "$LYRIKAI_AGENT_ROOT/.." && pwd)}"
TIP_SKILLS="${HIVE_TIP_SKILLS:-$LK_BLOOM/hive-vip-1/hive-vip-1_main/factory/skills}"
SKILLS_DIR="$LYRIKAI_AGENT_ROOT/skills"
SYNC_DATE="$(date +%Y-%m-%d)"

CHECK_ONLY=false
FORCE_REFRESH=false

# slug|source_dir (relative to LK_BLOOM or absolute)|extra files comma-separated|tree_copy(1=cp -R entire dir)
BUNDLE_MAP=(
  "hive|other/skills/claude-skills/hive||0"
  "hive-queen|hive-vip-1/hive-vip-1_main/factory/skills/hive-queen||0"
  "re-app|hive-vip-1/hive-vip-1_main/factory/skills/re-app|examples.md|0"
  "trinity|hive-vip-1/hive-vip-1_main/factory/skills/trinity||0"
  "build-plan-suite|hive-vip-1/hive-vip-1_main/factory/skills/build-plan-suite||0"
  "gear-set|hive-vip-1/hive-vip-1_main/factory/skills/gear-set||0"
  "super-build-trinity|hive-vip-1/hive-vip-1_main/factory/skills/super-build-trinity||0"
  "spin-agents|hive-vip-1/hive-vip-1_main/factory/skills/spin-agents||0"
  "prep-prompt|hive-vip-1/hive-vip-1_main/factory/skills/prep-prompt||0"
  "closeout|hive-vip-1/hive-vip-1_main/factory/skills/closeout|reference.md|0"
  "handoff|hive-vip-1/hive-vip-1_main/factory/skills/handoff||1"
  "hive-agents|hive-vip-1/hive-vip-1_main/factory/skills/hive-agents||0"
  "audit-prompt|hive-vip-1/hive-vip-1_main/factory/skills/audit-prompt||0"
)

EXPECTED_BUNDLES=(
  lk_hive_v1
  lk_hive-queen_v1
  lk_re-app_v1
  lk_trinity_v1
  lk_build-plan-suite_v1
  lk_gear-set_v1
  lk_super-build-trinity_v1
  lk_spin-agents_v1
  lk_prep-prompt_v1
  lk_closeout_v1
  lk_handoff_v1
  lk_hive-agents_v1
  lk_audit-prompt_v1
)

usage() {
  cat <<EOF
Lyrikai Agent bundle_skills.sh

Usage: $0 [--check] [--force-refresh]

Modes:
  (default)       Refresh bundled copies from tip sources (needs LK_BLOOM or HIVE_TIP_SKILLS)
  --check         Verify bundled skills exist; exit 0 without needing LK_BLOOM
  --force-refresh Fail when a source is missing (default: warn and skip)

Runtime needs only the repo; refresh needs LK_BLOOM or HIVE_TIP_SKILLS.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check) CHECK_ONLY=true; shift ;;
    --force-refresh) FORCE_REFRESH=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

run_check() {
  local missing=0
  echo "bundle_skills.sh --check"
  echo "  LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"
  echo ""

  if [[ ! -f "$SKILLS_DIR/lyrikai-agent/SKILL.md" ]]; then
    echo "MISSING: skills/lyrikai-agent/SKILL.md"
    ((missing++)) || true
  fi

  for bundle in "${EXPECTED_BUNDLES[@]}"; do
    if [[ ! -f "$SKILLS_DIR/$bundle/SKILL.md" ]]; then
      echo "MISSING: skills/$bundle/SKILL.md"
      ((missing++)) || true
    fi
  done

  if [[ $missing -gt 0 ]]; then
    echo ""
    echo "FAIL — $missing bundled skill(s) missing"
    exit 1
  fi

  echo "PASS — ${#EXPECTED_BUNDLES[@]} lk_*_v1 bundles + master skill present"
  exit 0
}

if $CHECK_ONLY; then
  run_check
fi

remap_work_home() {
  local dst="$1"
  local slug="$2"
  python3 - "$dst" "$slug" <<'PY'
import re, sys
from pathlib import Path

dst, slug = sys.argv[1:3]
if slug not in ("re-app", "build-plan-suite", "gear-set"):
    sys.exit(0)

replacements = [
    (r"lk-bloom/lk-bloom_design-systems/archives/extractions/", r"$LK_AGENT_WORK_ROOT/archives/extractions/"),
    (r"lk-bloom/lk-bloom_design-systems/\.admin/docs/plan-suites/", r"work/products/<slug>/.admin/docs/plan-suites/"),
    (r"lk-bloom/lk-bloom_design-systems/raw_templates-1/", r"work/templates/"),
    (r"lk-bloom/lk-bloom_design-systems/uvrn_testing-platform_design-system_extraction-1", r"work/templates/_donors/uvrn_testing-platform_design-system_extraction-1"),
    (r"lk-bloom/lk-bloom_design-systems/design-system-masters/", r"work/templates/_donors/design-system-masters/"),
    (r"lk-bloom/lk-bloom_design-systems", r"work/products/<slug>"),
    (r"\(`lk-bloom_design-systems`\)", r"(`$LK_AGENT_WORK_ROOT` — LK Agent work home)"),
    (r"Bloom DS home \(`lk-bloom_design-systems`\)", r"LK Agent work home (`$LK_AGENT_WORK_ROOT`)"),
    (r"\*\*Bloom DS home\*\* \(`lk-bloom_design-systems`\)", r"**LK Agent work home** (`$LK_AGENT_WORK_ROOT`)"),
    (r"Bloom DS home", r"LK Agent work home"),
    (r"Default write target\*\* — `archives/extractions/", r"Default write target** — `$LK_AGENT_WORK_ROOT/archives/extractions/"),
    (r"Product checkout\*\* \| \*\*Only default write target\*\*", r"Product checkout** (`work/products/<slug>/`) | **Only default write target**"),
    (r"Resolve from workspace containing `lk-bloom_design-systems`", r"Resolve `$LK_AGENT_WORK_ROOT` from `~/.lyrikai/config` (see WORK-HOME.md)"),
    (r"Cite repo-relative under `lk-bloom/` \(resolve from workspace containing `lk-bloom_design-systems`\)\.", r"Cite under `$LK_AGENT_WORK_ROOT` (see WORK-HOME.md)."),
]

root = Path(dst)
for path in sorted(root.rglob("*.md")):
    text = path.read_text(encoding="utf-8")
    original = text
    for pattern, repl in replacements:
        text = re.sub(pattern, repl, text)
    if slug == "re-app":
        text = re.sub(
            r"\| \*\*Bloom DS home\*\* \(`lk-bloom_design-systems`\) \| \*\*Default write target\*\*",
            r"| **LK Agent work home** (`$LK_AGENT_WORK_ROOT`) | **Default write target**",
            text,
        )
        text = text.replace(
            "**No product app code** in Bloom DS home during",
            "**No product app code** outside work/ archive lanes during",
        )
        text = text.replace(
            "Product checkout** | no | Bloom DS home above",
            "Product slug** | no | derive → `work/products/<slug>/`",
        )
    if slug == "build-plan-suite":
        text = text.replace(
            "<product-checkout>/.admin/docs/plan-suites/",
            "work/products/<slug>/.admin/docs/plan-suites/",
        )
        text = text.replace(
            "**Default for pre-unit paper** (Hive or not):",
            "**Default for pre-unit paper** (resolve slug → `work/products/<slug>/`):",
        )
    if slug == "gear-set":
        text = re.sub(
            r"Product `admin/wiki/",
            r"Product `work/products/<slug>/admin/wiki/",
            text,
        )
    if text != original:
        path.write_text(text, encoding="utf-8")
PY
}

copy_bundle() {
  local slug="$1"
  local rel_src="$2"
  local extras="$3"
  local tree_copy="${4:-0}"
  local bundle_name="lk_${slug}_v1"
  local dst="$SKILLS_DIR/$bundle_name"
  local src

  if [[ "$rel_src" = /* ]]; then
    src="$rel_src"
  else
    src="$LK_BLOOM/$rel_src"
  fi

  if [[ ! -d "$src" ]]; then
    if $FORCE_REFRESH; then
      echo "ERROR: source missing: $src" >&2
      return 1
    else
      echo "WARN: source missing, skipping: $src" >&2
      return 0
    fi
  fi

  mkdir -p "$dst"

  if [[ "$tree_copy" == "1" ]]; then
    rm -rf "$dst"
    mkdir -p "$dst"
    cp -R "$src/." "$dst/"
  else
    cp "$src/SKILL.md" "$dst/SKILL.md"
    if [[ -n "$extras" ]]; then
      IFS=',' read -ra files <<< "$extras"
      for f in "${files[@]}"; do
        [[ -z "$f" ]] && continue
        if [[ -f "$src/$f" ]]; then
          cp "$src/$f" "$dst/$f"
        else
          echo "WARN: ancillary missing: $src/$f" >&2
        fi
      done
    fi
  fi

  python3 - "$dst" "$slug" "$rel_src" "$bundle_name" <<'PY'
import re, sys
from pathlib import Path

dst, slug, rel_src, bundle_name = sys.argv[1:5]
invoke = f"/{bundle_name}"

BUNDLED = {
    "hive": "lk_hive_v1",
    "hive-queen": "lk_hive-queen_v1",
    "re-app": "lk_re-app_v1",
    "trinity": "lk_trinity_v1",
    "build-plan-suite": "lk_build-plan-suite_v1",
    "gear-set": "lk_gear-set_v1",
    "super-build-trinity": "lk_super-build-trinity_v1",
    "spin-agents": "lk_spin-agents_v1",
    "prep-prompt": "lk_prep-prompt_v1",
    "closeout": "lk_closeout_v1",
    "handoff": "lk_handoff_v1",
    "hive-agents": "lk_hive-agents_v1",
    "audit-prompt": "lk_audit-prompt_v1",
}

BUNDLED_SLUGS = set(BUNDLED.values())

EXTERNAL_NOTE = " (not in v1 bundle)"

def fix_hive_paths(text: str) -> str:
    text = re.sub(
        r"/Users/[^\s`]+/lk-bloom/hive-vip-1/hive-vip-1_main",
        "VIP tip at workspace (directory containing ORCHESTRATION.md; see yard HIVE-TIP.md when present)",
        text,
    )
    text = re.sub(
        r"/Users/[^\s`]+/lk-bloom/lk_hive_v1-vip-1/lk_hive_v1-vip-1_main",
        "VIP tip at workspace (directory containing ORCHESTRATION.md; see yard HIVE-TIP.md when present)",
        text,
    )
    text = re.sub(
        r"\[`HIVE-TIP\.md`\]\(/Users/[^\)]+\)",
        "[`HIVE-TIP.md`](hive-vip-yard/HIVE-TIP.md) (when workspace includes the yard)",
        text,
    )
    text = re.sub(
        r"/Users/[^\s`]+/lk-bloom/hive\b",
        "the public scrubbed hive tip (publish mirror — not operational cold-start)",
        text,
    )
    text = re.sub(
        r"/Users/[^\s`]+/lyrikai/lk-bloom/hive-vip-1/hive-vip-1_main",
        "VIP tip at workspace (directory containing ORCHESTRATION.md; see yard HIVE-TIP.md when present)",
        text,
    )
    text = re.sub(
        r"/Users/[^\s`]+/lyrikai/lk-bloom/hive\b",
        "the public scrubbed hive tip (publish mirror — not operational cold-start)",
        text,
    )
    text = re.sub(
        r"/Users/[^\s`]+/lk-bloom/lk_hive_v1\b",
        "the public scrubbed hive tip (publish mirror — not operational cold-start)",
        text,
    )
    return text

def transform(text: str, filename: str) -> str:
    if slug in ("hive", "hive-queen", "hive-agents"):
        text = fix_hive_paths(text)

    text = re.sub(
        rf"(^---\s*\nname:\s*){re.escape(slug)}\s*$",
        rf"\g<1>{bundle_name}",
        text,
        count=1,
        flags=re.MULTILINE,
    )
    text = re.sub(rf"/{re.escape(slug)}\b", invoke, text)

    for orig, bn in sorted(BUNDLED.items(), key=lambda x: -len(x[0])):
        if orig == "hive":
            continue
        text = re.sub(rf"/{re.escape(orig)}\b", f"/{bn}", text)

    for orig, bn in sorted(BUNDLED.items(), key=lambda x: -len(x[0])):
        text = re.sub(rf"`{re.escape(orig)}`", f"`{bn}`", text)

    prose_refs = [
        ("super-build-trinity", "lk_super-build-trinity_v1"),
        ("build-plan-suite", "lk_build-plan-suite_v1"),
        ("hive-queen", "lk_hive-queen_v1"),
        ("spin-agents", "lk_spin-agents_v1"),
        ("prep-prompt", "lk_prep-prompt_v1"),
        ("gear-set", "lk_gear-set_v1"),
        ("trinity", "lk_trinity_v1"),
        ("closeout", "lk_closeout_v1"),
        ("re-app", "lk_re-app_v1"),
        ("handoff", "lk_handoff_v1"),
        ("hive-agents", "lk_hive-agents_v1"),
        ("audit-prompt", "lk_audit-prompt_v1"),
    ]
    for orig, bn in prose_refs:
        if orig == slug:
            continue
        text = re.sub(rf"\bfollow `{orig}`", f"follow `{bn}`", text)
        text = re.sub(rf"\bactivate `{orig}`", f"activate `{bn}`", text)
        text = re.sub(rf"\bRead and follow `{orig}`", f"Read and follow `{bn}`", text)

    if slug == "prep-prompt":
        text = text.replace(
            "Prefer **`/handoff prep`**",
            "Prefer **`/lk_handoff_v1 prep`**",
        )
        text = text.replace(
            "Treat this invocation as **`/handoff prep`**",
            "Treat this invocation as **`/lk_handoff_v1 prep`**",
        )
        text = re.sub(
            r"tip vendor `factory/skills/(?:handoff|lk_handoff_v1)/SKILL\.md` \(or the installed `(?:handoff|lk_handoff_v1)`",
            "bundled `skills/lk_handoff_v1/SKILL.md` (or installed `lk_handoff_v1`",
            text,
        )
        text = re.sub(
            r"factory/skills/(?:handoff|lk_handoff_v1)/modes/prep\.md",
            "skills/lk_handoff_v1/modes/prep.md",
            text,
        )

    if slug == "audit-prompt":
        text = text.replace(
            "Prefer **`/handoff audit`**",
            "Prefer **`/lk_handoff_v1 audit`**",
        )
        text = text.replace(
            "Treat this invocation as **`/handoff audit`**",
            "Treat this invocation as **`/lk_handoff_v1 audit`**",
        )
        text = re.sub(
            r"tip vendor `factory/skills/(?:handoff|lk_handoff_v1)/SKILL\.md` \(or the installed `(?:handoff|lk_handoff_v1)` skill\)",
            "bundled `skills/lk_handoff_v1/SKILL.md` (or installed `lk_handoff_v1`)",
            text,
        )
        text = re.sub(
            r"factory/skills/(?:handoff|lk_handoff_v1)/modes/audit\.md",
            "skills/lk_handoff_v1/modes/audit.md",
            text,
        )

    if slug in ("hive", "hive-queen"):
        text = fix_hive_paths(text)
        if slug == "hive":
            text = re.sub(
                r"`hive-queen-admin-prep-prompt`",
                "`hive-queen-admin-prep-prompt`" + EXTERNAL_NOTE,
                text,
            )

    externals = [
        "hive-adversary-agents", "qabal-tree",
        "research-update", "excavate-design-index", "super-build", "wiki-log",
        "build-auditor", "instruction-manual",
        "hive-queen-admin-prep-prompt", "lyrikai", "catch-up", "session-handoff",
    ]
    lines = []
    for line in text.splitlines():
        for ext in externals:
            if f"`{ext}`" in line and EXTERNAL_NOTE not in line:
                line = line.replace(f"`{ext}`", f"`{ext}`{EXTERNAL_NOTE}", 1)
        lines.append(line)
    text = "\n".join(lines)

    if filename.endswith(".md"):
        m = re.match(r"(---\n.*?\n---\n)", text, re.DOTALL)
        if m:
            header = (
                f"> Bundled from: `{rel_src}` · original: `/{slug}` · "
                f"do not edit original\n\n"
            )
            if header.strip() not in text:
                text = m.group(1) + header + text[m.end():]

    if filename == "SKILL.md" and invoke not in text[:800]:
        text = re.sub(
            r"(description:\s*>-\s*\n(?:\s+.+\n)+)",
            lambda m: m.group(0).rstrip() + f"\n  Bundled invoke: {invoke}.\n",
            text,
            count=1,
        )

    return text

root = Path(dst)
for path in sorted(root.rglob("*.md")):
    original = path.read_text(encoding="utf-8")
    path.write_text(transform(original, path.name), encoding="utf-8")

print(f"bundled: {bundle_name} ← {rel_src}")
PY

  remap_work_home "$dst" "$slug"
}

echo "Lyrikai Agent bundle_skills.sh"
echo "  LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"
echo "  TIP_SKILLS=$TIP_SKILLS"
echo "  sync_date=$SYNC_DATE"
echo ""

refreshed=0
skipped=0
for entry in "${BUNDLE_MAP[@]}"; do
  IFS='|' read -r slug rel_src extras tree_copy <<< "$entry"
  if copy_bundle "$slug" "$rel_src" "$extras" "$tree_copy"; then
    ((refreshed++)) || true
  else
    ((skipped++)) || true
  fi
done

BUNDLE_MD="$SKILLS_DIR/BUNDLE.md"
if [[ -f "$BUNDLE_MD" ]]; then
  if grep -q '^sync_date:' "$BUNDLE_MD"; then
    sed -i '' "s/^sync_date:.*/sync_date: $SYNC_DATE/" "$BUNDLE_MD"
  else
    echo "sync_date: $SYNC_DATE" >> "$BUNDLE_MD"
  fi
fi

echo ""
echo "Done. $refreshed bundles refreshed, $skipped skipped."
