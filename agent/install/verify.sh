#!/usr/bin/env bash
# verify.sh — Lyrikai Agent v1 install verification (Cursor only)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LYRIKAI_AGENT_ROOT="${LYRIKAI_AGENT_ROOT:-$(cd "$SCRIPT_DIR/../../" && pwd)}"
LK_AGENT_WORK_ROOT="${LK_AGENT_WORK_ROOT:-$LYRIKAI_AGENT_ROOT/work}"
CURSOR_SKILLS="${CURSOR_SKILLS:-$HOME/.cursor/skills}"
CURSOR_AGENTS="${CURSOR_AGENTS:-$HOME/.cursor/agents}"
LYRIKAI_CONFIG="${LYRIKAI_CONFIG:-$HOME/.lyrikai/config}"

BUNDLED_SKILLS=(
  lyrikai-agent
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

REPO_CHECKS=(
  WORK-HOME.md
  ROUTING.md
  skills/BUNDLE.md
  skills/lyrikai-agent/SKILL.md
  work/README.md
)

FAILURES=()

usage() {
  cat <<EOF
Lyrikai Agent verify

Usage: $0 [-h|--help]
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

check_skill_symlink() {
  local name="$1"
  local path="$CURSOR_SKILLS/$name"
  local expected="$LYRIKAI_AGENT_ROOT/skills/$name"

  if [[ ! -L "$path" ]]; then
    FAILURES+=("skill not symlink: $path")
    return 1
  fi

  local target
  target="$(readlink "$path")"
  if [[ "$target" != "$expected" ]]; then
    FAILURES+=("skill symlink target mismatch: $path → $target (expected $expected)")
    return 1
  fi

  if [[ ! -f "$target/SKILL.md" ]]; then
    FAILURES+=("missing SKILL.md in bundle: $target")
    return 1
  fi
  return 0
}

check_repo_files() {
  for rel in "${REPO_CHECKS[@]}"; do
    local p="$LYRIKAI_AGENT_ROOT/$rel"
    if [[ ! -f "$p" ]]; then
      FAILURES+=("missing repo file: $p")
    fi
  done
}

check_agent_file() {
  local p="$CURSOR_AGENTS/lyrikai-agent.md"
  if [[ ! -f "$p" ]]; then
    FAILURES+=("missing Cursor agent: $p")
  fi
}

check_config() {
  if [[ ! -f "$LYRIKAI_CONFIG" ]]; then
    FAILURES+=("missing config: $LYRIKAI_CONFIG")
    return
  fi
  local root work_root
  root="$(grep -E '^LYRIKAI_AGENT_ROOT=' "$LYRIKAI_CONFIG" | cut -d= -f2- || true)"
  work_root="$(grep -E '^LK_AGENT_WORK_ROOT=' "$LYRIKAI_CONFIG" | cut -d= -f2- || true)"
  if [[ "$root" != "$LYRIKAI_AGENT_ROOT" ]]; then
    FAILURES+=("LYRIKAI_AGENT_ROOT mismatch in $LYRIKAI_CONFIG: got '$root' expected '$LYRIKAI_AGENT_ROOT'")
  fi
  if [[ "$work_root" != "$LK_AGENT_WORK_ROOT" ]]; then
    FAILURES+=("LK_AGENT_WORK_ROOT mismatch in $LYRIKAI_CONFIG: got '$work_root' expected '$LK_AGENT_WORK_ROOT'")
  fi
}

echo "Lyrikai Agent verify"
echo "  LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"
echo "  LK_AGENT_WORK_ROOT=$LK_AGENT_WORK_ROOT"
echo ""

check_repo_files
check_config
check_agent_file

for name in "${BUNDLED_SKILLS[@]}"; do
  check_skill_symlink "$name" || true
done

if [[ ${#FAILURES[@]} -gt 0 ]]; then
  echo ""
  echo "FAIL (${#FAILURES[@]}):"
  for f in "${FAILURES[@]}"; do
    echo "  - $f"
  done
  exit 1
fi

echo ""
echo "PASS — all checks ok (${#BUNDLED_SKILLS[@]} bundled skills)"
exit 0
