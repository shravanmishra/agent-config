#!/bin/sh
# Mirror this repo into the harness locations it serves.
# Replaces (not merges) the target with the repo folder/file:
# any existing target is removed and a symlink to this repo is created.
set -eu

REPO="$(cd "$(dirname "$0")" && pwd)"

link() {
  src="$1"; dst="$2"
  parent="$(dirname "$dst")"
  if [ ! -e "$parent" ] && [ ! -e "$dst" ]; then
    echo "SKIP $dst (harness dir $parent does not exist)"
    return
  fi
  mkdir -p "$parent"
  rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "LINKED $dst -> $src"
}

link_claude_agents() {
  src="$REPO/claude/agents"
  dst="$HOME/.claude/agents"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    backup="$dst.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "BACKUP $dst -> $backup"
  fi
  link "$src" "$dst"
}

# omp global agent definitions
link "$REPO/omp/agents" "$HOME/.omp/agent/agents"

# Codex global agent definitions
link "$REPO/codex/agents" "$HOME/.codex/agents"

# Claude Code global agent definitions (back up any existing real dir first)
link_claude_agents

# Claude Code global instructions
link "$REPO/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

# Cross-harness instructions
link "$REPO/claude/AGENTS.md" "$HOME/AGENTS.md"

echo "Done. Commit changes in this repo to share across machines."
