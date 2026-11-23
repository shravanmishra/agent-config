# agent-config

Global, portable instructions and subagents shared across harnesses and projects.

## Mirror layout

Agent definitions are per-harness because the format differs; only `CLAUDE.md` and `AGENTS.md` are shared.

- `agents/skm-*.md` — omp-format agent definitions (shared, symlink target).
- `omp/agents/skm-*.md` — relative symlinks → `../../agents/skm-*.md`.
- `codex/agents/skm-*.md` — real codex-format files, same prose and name/description, no `tools:` block.
- `claude/agents/skm-*.md` — real Claude Code-format files (PascalCase inline tools).
- `claude/CLAUDE.md` — relative symlink → `../CLAUDE.md`.
- `claude/AGENTS.md` — relative symlink → `../AGENTS.md`.

`setup.sh` — replaces each harness target with a symlink to the repo folder/file:

- `~/.omp/agent/agents` → `~/agent-config/omp/agents`
- `~/.codex/agents` → `~/agent-config/codex/agents`
- `~/.claude/agents` → `~/agent-config/claude/agents` (existing real dir is backed up to `~/.claude/agents.bak.<timestamp>` first)
- `~/.claude/CLAUDE.md` → `~/agent-config/claude/CLAUDE.md`
- `~/AGENTS.md` → `~/agent-config/claude/AGENTS.md`

## Use on a new machine

```sh
git clone <this-repo> ~/agent-config
~/agent-config/setup.sh
```

## Swap or restore a harness wholesale

Replace a harness target with the repo mirror:

```sh
rm -rf ~/.codex/agents && ln -s ~/agent-config/codex/agents ~/.codex/agents
```

Restore a real local folder (dereference the mirror):

```sh
rm -rf ~/.codex/agents && cp -rL ~/agent-config/codex/agents ~/.codex/agents
```

## Project-local rules

Project `CLAUDE.md` files (a repo root, loaded per-project) stack on top of these global rules — keep them for project-specific stacks and workflows, not for global preferences.
