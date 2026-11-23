# User Memory

Instructions here apply to all projects.

## Preferences


## Subagent Flow (required for coding tasks)

All coding/dev work MUST be delegated to specialized subagents, not done inline by the orchestrating session (except trivial mechanical fixes and verification).

- Route by stack: `skm-web-developer` (Angular/TS), `skm-python-developer` (Python), `skm-csharp-developer` (C#/.NET), `skm-go-developer` (Go), `skm-sql-developer` (SQL).
- Research first with a read-only `scout` when the subsystem is unfamiliar.
- Give each agent a self-contained task (`# Target`, `# Change`, `# Acceptance`), context about shared interfaces, and one owner per file set.
- Review with `skm-*-reviewer` or `skm-pr-reviewer`; run QA with `skm-qa`; security gate with `skm-security-auditor` before merge.
- After a subagent completes, verify its work (build, tests, browser/API smoke) before reporting done.
- Do not edit files directly in the orchestrator for feature/bug work; only orchestration, verification, and trivial fixes.
