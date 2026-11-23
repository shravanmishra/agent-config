#!/bin/sh
# Symlink this repo's contents into the harness locations it serves.
# Does not overwrite existing files unless FORCE=1 is set.
set -eu

REPO="$(cd "$(dirname "$0")" && pwd)"

link() {
  src="$1"; dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ] && [ "${FORCE:-0}" != 1 ]; then
    echo "SKIP $dst (exists; set FORCE=1 to overwrite)"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "LINKED $dst -> $src"
}

# Claude Code global instructions
link "$REPO/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

# omp global agent definitions
for f in "$REPO"/agents/*.md; do
  link "$f" "$HOME/.omp/agent/agents/$(basename "$f")"
done

# Codex global agent definitions
for f in "$REPO"/agents/*.md; do
  link "$f" "$HOME/.codex/agents/$(basename "$f")"
done

# Cross-harness instructions (AGENTS.md is honored by Codex and other agents)
link "$REPO/AGENTS.md" "$HOME/AGENTS.md"

echo "Done. Commit changes in this repo to share across machines."
