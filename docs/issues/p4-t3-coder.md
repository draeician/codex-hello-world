# CODER Task: Document Branching & Iteration Flow (#P4-T3)

> Linked checklist entry: [TASKS.md (#P4-T3)](../../TASKS.md#phase-4--advanced-workflow-case-study-lessons-from-discripper)  
> Labels: `phase:training`, `type:docs`, `topic:workflow`

## Problem
- The Phase 4 outline for branching and iteration (#P4-T3) needs to be turned into full learner-ready guidance inside `docs/09-discripper-workflow-case-study.md` (section “Branching & iteration flow”) or a dedicated follow-on doc.

## Acceptance criteria
- Provide a numbered step list or diagram that illustrates the lifecycle: branch creation, Draft PR, feedback, and follow-up issue creation as captured in the outline.
- Include an example Codex CLI command (with `--open-draft-pr`) plus guidance on when to re-run versus file new issues, matching the checklist expectations.
- Cross-link to Chapter 05 (Agent Iteration Loop) and Chapter 07 (End-to-End Workflow) from the new content.
- Highlight how deterministic branch names (`codex/...`) keep history clear for reviewers.
- Apply the labels `phase:training`, `type:docs`, and `topic:workflow` to the GitHub issue when filing it.

## Constraints
- Use HTTPS remotes and GitHub CLI where possible.
- Keep language consistent with the workflow tone established in other Phase 4 docs.
- Ensure diagrams render in Markdown (use Mermaid or ASCII as supported by the repo).

## Test plan
- No automated checks; manually verify cross-links and diagram rendering.

## Rollback
- Revert the branching lesson updates if the flow differs from the agreed outline.
