# Local Sandbox Mode

This repository operates in a Codex tutorial sandbox. Treat every task as a contained learning exercise focused solely on the `codex-hello-world` project.

## Boundaries for Codex agents
- Do **not** import, depend on, or clone external repositories (for example, `discripper`) while working in this sandbox. Any cross-project references are conceptual illustrations only.
- Keep all changes limited to files that live inside this repository—primarily markdown, documentation, or configuration assets that support the lessons here.
- Avoid introducing new runtime dependencies or cross-repo integrations. The goal is to practice local iteration, not multi-repo orchestration.

## Workflow discipline
- Follow the local workflow gates defined for this sandbox (e.g., `pip install -e .`, `ruff`, `pytest`). Passing these checks reinforces good hygiene even when changes affect only docs or configs.
- When planning or documenting tasks, explicitly reference this file so future Codex agents remember the sandbox constraints.

Staying within these boundaries keeps the tutorial environment predictable and self-contained for every run.
