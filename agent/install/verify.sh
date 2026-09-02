#!/usr/bin/env bash
# verify.sh — Lyrikai Super Agent install verification
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LYRIKAI_AGENT_ROOT="${LYRIKAI_AGENT_ROOT:-$(cd "$SCRIPT_DIR/../../" && pwd)}"
LK_BLOOM="${LK_BLOOM:-$(cd "$LYRIKAI_AGENT_ROOT/.." && pwd)}"
HIVE_TIP_SKILLS="${HIVE_TIP_SKILLS:-$LK_BLOOM/hive-vip-1/hive-vip-1_main/factory/skills}"
HIVE_TIP_ROOT="${HIVE_TIP_ROOT:-$(dirname "$(dirname "$HIVE_TIP_SKILLS")")}"
CLAUDE_SKILLS="${CLAUDE_SKILLS:-$HOME/.claude/skills}"
CURSOR_AGENTS="${CURSOR_AGENTS:-$HOME/.cursor/agents}"
TIP_PIN_FILE="$SCRIPT_DIR/tip_pin.txt"

STRICT=false

FOUNDATION_RING=(hive-queen trinity wiki-log hive)
HIVE_OPS_RING=(hive-agents hive-adversary-agents hive-workstreams hive-meta-map hive-mvp-seed)
PLAN_ARCHIVE_RING=(build-plan-suite gear-set re-app excavate-design-index)
SHIP_RING=(super-build-trinity super-build closeout prep-prompt audit-prompt instruction-manual)

CORE_AGENT_FILES=(
  AGENT-CARD.md
  LYRIKAI-BOOT.md
  SCENE-ROUTER.md
  TRUST-GATES.md
  MANIFEST.md
)

usage() {
  cat <<EOF
Lyrikai Super Agent verify

Usage: $0 [--strict]

  --strict   Exit 1 on tip_pin drift (default: warn only, exit 2)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --strict) STRICT=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

FAILURES=()
DRIFT=false

check_skill() {
  local slug="$1"
  local path="$CLAUDE_SKILLS/$slug"
  if [[ ! -e "$path" ]]; then
    FAILURES+=("missing skill: $path")
    return 1
  fi
  if [[ -L "$path" ]]; then
    local target
    target="$(readlink "$path")"
    if [[ ! -d "$target" ]]; then
      FAILURES+=("broken symlink: $path → $target")
      return 1
    fi
  elif [[ ! -d "$path" ]]; then
    FAILURES+=("skill not a directory: $path")
    return 1
  fi
  return 0
}

check_core_files() {
  for f in "${CORE_AGENT_FILES[@]}"; do
    local p="$LYRIKAI_AGENT_ROOT/agent/$f"
    if [[ ! -f "$p" ]]; then
      FAILURES+=("missing core file: $p")
    fi
  done
}

check_agent_file() {
  local p="$CURSOR_AGENTS/lyrikai-super.md"
  if [[ ! -f "$p" ]]; then
    FAILURES+=("missing Cursor agent: $p")
  fi
}

check_tip_pin() {
  if [[ ! -f "$TIP_PIN_FILE" ]]; then
    FAILURES+=("missing tip_pin: $TIP_PIN_FILE (run install.sh)")
    return
  fi

  if [[ ! -d "$HIVE_TIP_ROOT/.git" ]]; then
    echo "WARN: tip root not git — skip tip_pin drift check"
    return
  fi

  local pinned current
  pinned="$(tr -d '[:space:]' < "$TIP_PIN_FILE")"
  current="$(git -C "$HIVE_TIP_ROOT" rev-parse HEAD)"

  if [[ "$pinned" != "$current" ]]; then
    DRIFT=true
    echo "WARN: tip_pin drift — pinned=$pinned current=$current"
    echo "      Re-run install.sh to refresh, or git pull tip"
  else
    echo "tip_pin ok: $pinned"
  fi
}

echo "Lyrikai Super Agent verify"
echo "  LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"

check_core_files
check_agent_file

ALL_SLUGS=()
ALL_SLUGS+=("${FOUNDATION_RING[@]}")
ALL_SLUGS+=("${HIVE_OPS_RING[@]}")
ALL_SLUGS+=("${PLAN_ARCHIVE_RING[@]}")
ALL_SLUGS+=("${SHIP_RING[@]}")

for slug in "${ALL_SLUGS[@]}"; do
  check_skill "$slug" || true
done

check_tip_pin

if [[ ${#FAILURES[@]} -gt 0 ]]; then
  echo ""
  echo "FAIL (${#FAILURES[@]}):"
  for f in "${FAILURES[@]}"; do
    echo "  - $f"
  done
  exit 1
fi

if $DRIFT; then
  if $STRICT; then
    echo ""
    echo "FAIL: tip_pin drift (--strict)"
    exit 1
  fi
  echo ""
  echo "PASS with tip drift warning (exit 2)"
  exit 2
fi

echo ""
echo "PASS — all checks ok"
exit 0
