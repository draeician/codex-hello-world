# CODER Task: Summarize CLI UX Decisions (#P4-T6)

> Linked checklist entry: [TASKS.md (#P4-T6)](../../TASKS.md#phase-4--advanced-workflow-case-study-lessons-from-discripper)  
> Labels: `phase:training`, `type:docs`, `topic:workflow`

## Problem
- The CLI UX rationale captured in #P4-T6 still needs full documentation treatment in `docs/11-cli-ux-decisions.md`, guiding learners through deterministic naming, `--title`, and other affordances.

## Acceptance criteria
- Walk through the CLI options highlighted in the outline with rationale for each, including a before/after output diff for `--title`.
- Explain how deterministic names and flags improve discoverability of Draft PRs and follow-up tasks.
- Link to any CLI reference material in the repo so learners can experiment further.
- Reinforce the workflow labels `phase:training`, `type:docs`, `topic:workflow` in the issue body so future tracking stays consistent.
- Apply the labels `phase:training`, `type:docs`, and `topic:workflow` to the GitHub issue when filing it.

## Constraints
- Use HTTPS remotes and GitHub CLI where possible.
- Keep CLI samples anonymized and consistent with the discripper naming patterns.
- Format before/after output using fenced code blocks for readability.

## Test plan
- No automated checks; manually verify CLI examples render clearly and linked references exist.

## Rollback
- Revert the CLI UX lesson changes if they diverge from the planned message.
