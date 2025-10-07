# CODER Task: Expand Read-Only Mode Recovery Playbook (#P4-T4)

> Linked checklist entry: [TASKS.md (#P4-T4)](../../TASKS.md#phase-4--advanced-workflow-case-study-lessons-from-discripper)  
> Labels: `phase:training`, `type:docs`, `topic:workflow`

## Problem
- We captured the outline for enhancing `docs/06-read-only-mode.md` (#P4-T4), but we still need CODER to draft the full recovery playbook content that reflects the discripper incidents.

## Acceptance criteria
- Add a scenario-based checklist that references Draft PR recovery steps and clearly tells operators what to do when Codex reports read-only mode.
- Include a sample Codex chat snippet that demonstrates the detection wording and the phrasing that resolved the mode.
- Point readers to where they should place this checklist in future PR prompts (e.g., “Before you run this task” blocks).
- Maintain cross-links to related workflow guidance so learners can dig deeper if needed.
- Apply the labels `phase:training`, `type:docs`, and `topic:workflow` to the GitHub issue when filing it.

## Constraints
- Use HTTPS remotes and GitHub CLI where possible.
- Keep anonymized transcripts (no internal URLs or private names).
- Follow the existing formatting style for checklists and callout blocks in Phase 4 docs.

## Test plan
- No automated checks; manually proofread the new sections and verify relative links.

## Rollback
- Revert the updates to `docs/06-read-only-mode.md` if the playbook diverges from the intended recovery flow.
