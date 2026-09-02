#!/usr/bin/env bash
# install.sh — Lyrikai Super Agent harness install
# Canonical public repo: https://github.com/lyrikai-os/lyrikai-agent
# (lk-bloom/lyrikai-agent/ is optional monorepo dev path — not the primary clone target)
# Symlinks tip skills → ~/.claude/skills/; copies Cursor agent shell.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LYRIKAI_AGENT_ROOT="${LYRIKAI_AGENT_ROOT:-$(cd "$SCRIPT_DIR/../../" && pwd)}"
LK_BLOOM="${LK_BLOOM:-$(cd "$LYRIKAI_AGENT_ROOT/.." && pwd)}"
HIVE_TIP_SKILLS="${HIVE_TIP_SKILLS:-$LK_BLOOM/hive-vip-1/hive-vip-1_main/factory/skills}"
HIVE_TIP_ROOT="${HIVE_TIP_ROOT:-$(dirname "$(dirname "$HIVE_TIP_SKILLS")")}"
CLAUDE_SKILLS="${CLAUDE_SKILLS:-$HOME/.claude/skills}"
CURSOR_AGENTS="${CURSOR_AGENTS:-$HOME/.cursor/agents}"
TIP_PIN_FILE="$SCRIPT_DIR/tip_pin.txt"

DRY_RUN=false
CURSOR_ONLY=false
SKILLS_ONLY=false
FULL_OUTER=false

# Slugs from MANIFEST.md rings
FOUNDATION_RING=(hive-queen trinity wiki-log hive)
HIVE_OPS_RING=(hive-agents hive-adversary-agents hive-workstreams hive-meta-map hive-mvp-seed)
PLAN_ARCHIVE_RING=(build-plan-suite gear-set re-app excavate-design-index)
SHIP_RING=(super-build-trinity super-build closeout prep-prompt audit-prompt instruction-manual)
OUTER_RING_SAMPLE=(spin-agents qabal-tree research-update session-summary lyrikai)

usage() {
  cat <<EOF
Lyrikai Super Agent install

Usage: $0 [flags]

Flags:
  --dry-run       Print actions only
  --cursor-only   Skip ~/.claude/skills symlinks
  --skills-only   Skip Cursor agent copy
  --full-outer    Include outer_ring sample slugs
  -h, --help      Show this help

Env:
  LYRIKAI_AGENT_ROOT  Product root (default: script-relative)
  LK_BLOOM            Monorepo root
  HIVE_TIP_SKILLS     Tip skills directory
  CLAUDE_SKILLS       Claude/Cursor skills target (~/.claude/skills)
  CURSOR_AGENTS       Cursor agents dir (~/.cursor/agents)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --cursor-only) CURSOR_ONLY=true; shift ;;
    --skills-only) SKILLS_ONLY=true; shift ;;
    --full-outer) FULL_OUTER=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

run() {
  if $DRY_RUN; then
    echo "[dry-run] $*"
  else
    "$@"
  fi
}

symlink_skill() {
  local slug="$1"
  local src="$HIVE_TIP_SKILLS/$slug"
  local dst="$CLAUDE_SKILLS/$slug"

  if [[ ! -d "$src" ]]; then
    echo "WARN: tip skill missing: $src" >&2
    return 1
  fi

  run mkdir -p "$CLAUDE_SKILLS"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "WARN: $dst exists and is not a symlink — skipping" >&2
    return 1
  fi
  run ln -sf "$src" "$dst"
  echo "skill: $slug → $dst"
}

install_skills() {
  local slugs=()
  slugs+=("${FOUNDATION_RING[@]}")
  slugs+=("${HIVE_OPS_RING[@]}")
  slugs+=("${PLAN_ARCHIVE_RING[@]}")
  slugs+=("${SHIP_RING[@]}")
  if $FULL_OUTER; then
    slugs+=("${OUTER_RING_SAMPLE[@]}")
  fi

  local missing=0
  for slug in "${slugs[@]}"; do
    if ! symlink_skill "$slug"; then
      ((missing++)) || true
    fi
  done
  return "$missing"
}

install_cursor_agent() {
  local src="$LYRIKAI_AGENT_ROOT/agent/agents/lyrikai-super.md"
  local dst="$CURSOR_AGENTS/lyrikai-super.md"

  if [[ ! -f "$src" ]]; then
    echo "ERROR: agent shell missing: $src" >&2
    return 1
  fi

  run mkdir -p "$CURSOR_AGENTS"
  run cp "$src" "$dst"
  echo "agent: $src → $dst"
}

record_tip_pin() {
  if [[ ! -d "$HIVE_TIP_ROOT/.git" ]]; then
    echo "WARN: tip root not a git repo — skipping tip_pin" >&2
    return 0
  fi

  local sha
  sha="$(git -C "$HIVE_TIP_ROOT" rev-parse HEAD)"
  if $DRY_RUN; then
    echo "[dry-run] tip_pin=$sha → $TIP_PIN_FILE"
  else
    echo "$sha" > "$TIP_PIN_FILE"
    echo "tip_pin recorded: $sha"
  fi
}

echo "Lyrikai Super Agent install"
echo "  LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"
echo "  HIVE_TIP_SKILLS=$HIVE_TIP_SKILLS"
if $DRY_RUN; then echo "  mode: dry-run"; fi

if ! $CURSOR_ONLY; then
  install_skills || true
fi

if ! $SKILLS_ONLY; then
  install_cursor_agent
fi

record_tip_pin

echo ""
echo "Done. Run: $SCRIPT_DIR/verify.sh"
if $DRY_RUN; then
  echo "(dry-run — no changes made)"
fi
