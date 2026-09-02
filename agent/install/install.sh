#!/usr/bin/env bash
# install.sh — Lyrikai Agent v1 (Cursor only)
# Symlinks bundled skills → ~/.cursor/skills/; copies Cursor agent shell.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LYRIKAI_AGENT_ROOT="${LYRIKAI_AGENT_ROOT:-$(cd "$SCRIPT_DIR/../../" && pwd)}"
LK_AGENT_WORK_ROOT="${LK_AGENT_WORK_ROOT:-$LYRIKAI_AGENT_ROOT/work}"
CURSOR_SKILLS="${CURSOR_SKILLS:-$HOME/.cursor/skills}"
CURSOR_AGENTS="${CURSOR_AGENTS:-$HOME/.cursor/agents}"
LYRIKAI_CONFIG="${LYRIKAI_CONFIG:-$HOME/.lyrikai/config}"
LK_BLOOM="${LK_BLOOM:-$(cd "$LYRIKAI_AGENT_ROOT/.." && pwd)}"
TIP_SKILLS="${HIVE_TIP_SKILLS:-$LK_BLOOM/hive-vip-1/hive-vip-1_main/factory/skills}"

DRY_RUN=false
REMOVE_LEGACY_AGENT=false
WITH_TIP_EXTRAS=false

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

TIP_EXTRAS=(
  hive-adversary-agents
  qabal-tree
  research-update
  super-build
)

usage() {
  cat <<EOF
Lyrikai Agent install (Cursor only)

Usage: $0 [--dry-run] [--remove-legacy-agent] [--with-tip-extras]

Flags:
  --dry-run               Print actions only
  --remove-legacy-agent   Remove ~/.cursor/agents/lyrikai-super.md if present
  --with-tip-extras       Symlink tip originals (adversary, qabal-tree, research-update, super-build) when LK_BLOOM tip skills exist
  -h, --help              Show this help

Env:
  LYRIKAI_AGENT_ROOT  Product root (default: script-relative)
  LK_AGENT_WORK_ROOT  Work umbrella (default: \$LYRIKAI_AGENT_ROOT/work)
  CURSOR_SKILLS       Cursor skills dir (default: ~/.cursor/skills)
  CURSOR_AGENTS       Cursor agents dir (default: ~/.cursor/agents)
  LYRIKAI_CONFIG      Config file (default: ~/.lyrikai/config)
  LK_BLOOM            Monorepo root for --with-tip-extras (default: parent of product)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --remove-legacy-agent) REMOVE_LEGACY_AGENT=true; shift ;;
    --with-tip-extras) WITH_TIP_EXTRAS=true; shift ;;
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
  local name="$1"
  local src="$LYRIKAI_AGENT_ROOT/skills/$name"
  local dst="$CURSOR_SKILLS/$name"

  if [[ ! -d "$src" ]]; then
    echo "ERROR: bundled skill missing: $src" >&2
    return 1
  fi

  run mkdir -p "$CURSOR_SKILLS"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "WARN: $dst exists and is not a symlink — skipping" >&2
    return 1
  fi
  run ln -sf "$src" "$dst"
  echo "skill: $name → $dst"
}

write_config() {
  run mkdir -p "$(dirname "$LYRIKAI_CONFIG")"
  if $DRY_RUN; then
    echo "[dry-run] LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"
    echo "[dry-run] LK_AGENT_WORK_ROOT=$LK_AGENT_WORK_ROOT → $LYRIKAI_CONFIG"
  else
    cat > "$LYRIKAI_CONFIG" <<EOF
# Lyrikai Agent config — written by install.sh
LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT
LK_AGENT_WORK_ROOT=$LK_AGENT_WORK_ROOT
EOF
    echo "config: $LYRIKAI_CONFIG"
  fi
}

scaffold_work_home() {
  local root="$LK_AGENT_WORK_ROOT"
  run mkdir -p \
    "$root/archives/extractions" \
    "$root/products" \
    "$root/templates/_donors"
  echo "work scaffold: $root"
}

install_cursor_agent() {
  local src="$LYRIKAI_AGENT_ROOT/agent/agents/lyrikai-agent.md"
  local dst="$CURSOR_AGENTS/lyrikai-agent.md"

  if [[ ! -f "$src" ]]; then
    echo "ERROR: agent shell missing: $src" >&2
    return 1
  fi

  run mkdir -p "$CURSOR_AGENTS"
  run cp "$src" "$dst"
  echo "agent: $src → $dst"
}

remove_legacy_agent() {
  local legacy="$CURSOR_AGENTS/lyrikai-super.md"
  if [[ -f "$legacy" ]]; then
    echo "Removing legacy agent: $legacy"
    run rm -f "$legacy"
  else
    echo "No legacy agent at $legacy — nothing to remove"
  fi
}

symlink_tip_extras() {
  if [[ ! -d "$TIP_SKILLS" ]]; then
    echo "WARN: tip skills dir missing ($TIP_SKILLS) — skipping --with-tip-extras" >&2
    return 0
  fi

  run mkdir -p "$CURSOR_SKILLS"
  for name in "${TIP_EXTRAS[@]}"; do
    local src="$TIP_SKILLS/$name"
    local dst="$CURSOR_SKILLS/$name"
    local bundled="lk_${name}_v1"

    if [[ -e "$CURSOR_SKILLS/$bundled" ]]; then
      echo "skip tip extra (bundled name exists): $bundled"
    fi
    if [[ ! -d "$src" ]]; then
      echo "WARN: tip extra missing: $src" >&2
      continue
    fi
    if [[ -e "$dst" && ! -L "$dst" ]]; then
      echo "WARN: $dst exists and is not a symlink — skipping" >&2
      continue
    fi
    run ln -sf "$src" "$dst"
    echo "tip extra: $name → $dst"
  done
}

migration_note() {
  if [[ -f "$CURSOR_AGENTS/lyrikai-super.md" ]]; then
    echo ""
    echo "MIGRATION: ~/.cursor/agents/lyrikai-super.md still present."
    echo "  Use Cursor picker → Lyrikai Agent (lyrikai-agent.md) for v1."
    echo "  Re-run with --remove-legacy-agent to remove the old file."
  fi
}

echo "Lyrikai Agent install"
echo "  LYRIKAI_AGENT_ROOT=$LYRIKAI_AGENT_ROOT"
echo "  LK_AGENT_WORK_ROOT=$LK_AGENT_WORK_ROOT"
echo "  CURSOR_SKILLS=$CURSOR_SKILLS"
if $DRY_RUN; then echo "  mode: dry-run"; fi
echo ""

write_config
scaffold_work_home

missing=0
for name in "${BUNDLED_SKILLS[@]}"; do
  if ! symlink_skill "$name"; then
    ((missing++)) || true
  fi
done

install_cursor_agent

if $WITH_TIP_EXTRAS; then
  symlink_tip_extras
fi

if $REMOVE_LEGACY_AGENT; then
  remove_legacy_agent
else
  migration_note
fi

echo ""
if [[ $missing -gt 0 ]]; then
  echo "Done with $missing warning(s). Run: $SCRIPT_DIR/verify.sh"
else
  echo "Done. Run: $SCRIPT_DIR/verify.sh"
fi
if $DRY_RUN; then
  echo "(dry-run — no changes made)"
fi
