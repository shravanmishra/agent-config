# agent-config

Global, portable instructions and subagents shared across harnesses and projects.

## Mirror layout

Each harness has a folder of symlinks that can be swapped wholesale:

- `agents/skm-*.md` — the real `skm-*` subagent definitions.
- `omp/agents/skm-*.md` — relative symlinks → `../../agents/skm-*.md`.
- `codex/agents/skm-*.md` — relative symlinks → `../../agents/skm-*.md`.
- `claude/CLAUDE.md` — relative symlink → `../CLAUDE.md`.
- `claude/AGENTS.md` — relative symlink → `../AGENTS.md`.

`CLAUDE.md` / `AGENTS.md` — global instructions (identical content), cross-harness standard read by Claude Code and Codex and other agent harnesses.
`setup.sh` — replaces each harness's target with the repo folder/file.

## Use on a new machine

```sh
git clone <this-repo> ~/agent-config
~/agent-config/setup.sh
```

`setup.sh` removes any existing target and symlinks the repo folder/file in its place:

- `~/.omp/agent/agents` → `~/agent-config/omp/agents`
- `~/.codex/agents` → `~/agent-config/codex/agents`
- `~/.claude/CLAUDE.md` → `~/agent-config/claude/CLAUDE.md`
- `~/AGENTS.md` → `~/agent-config/claude/AGENTS.md`

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
