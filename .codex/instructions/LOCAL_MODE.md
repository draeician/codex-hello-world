# Local Mode: Codex Tutorial Sandbox

This repository, `codex-hello-world`, runs exclusively in a guided **tutorial / sandbox mode**. Every task inside this project is a teaching exercise that must remain self-contained.

## Sandbox Boundaries for Codex Agents
- Operate **only** within this repository. Do not import, clone, or depend on any external projects (including case studies like `discripper`).
- Treat any references to other products or services as conceptual examples—not integration targets.
- Limit changes to local markdown, documentation, configuration, or other repo-scoped teaching assets. Avoid shipping product features or cross-repo infrastructure.

## Workflow Discipline
- Follow the local gates for each run (`pip install -e .`, `ruff`, `pytest`, etc.) to reinforce clean iteration habits, even for documentation-focused tasks.
- Reference this document in future task briefs and plans to keep the sandbox boundaries top-of-mind.

Staying within these guardrails preserves the isolated training environment that Codex needs for reliable, repeatable practice runs.
