# agent-config

Global, portable instructions and subagents shared across harnesses and projects.

- `CLAUDE.md` — global instructions (Claude Code, reads from `~/.claude/CLAUDE.md`).
- `AGENTS.md` — identical content, cross-harness standard read by Codex and other agent harnesses (`~/AGENTS.md`).
- `agents/*.md` — omp subagent definitions (`skm-*`), symlinked into `~/.omp/agent/agents/`.
- `setup.sh` — symlinks the above into each harness's expected location. Idempotent; honors `FORCE=1` to overwrite existing files.

## Use on a new machine

```sh
git clone <this-repo> ~/agent-config
~/agent-config/setup.sh
```

## Project-local rules

Project `CLAUDE.md` files (a repo root, loaded per-project) stack on top of these global rules — keep them for project-specific stacks and workflows, not for global preferences.
