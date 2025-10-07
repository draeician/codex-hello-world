# CODER Task: Capture CI Pragmatics Lessons (#P4-T5)

> Linked checklist entry: [TASKS.md (#P4-T5)](../../TASKS.md#phase-4--advanced-workflow-case-study-lessons-from-discripper)  
> Labels: `phase:training`, `type:docs`, `topic:workflow`

## Problem
- The outline for summarizing CI pragmatics (#P4-T5) needs CODER to produce full narrative coverage in `docs/10-ci-pragmatics-lessons.md` that learners can follow post-merge.

## Acceptance criteria
- Describe the minimum viable CI/test commands (e.g., selective `pnpm` runs) and explain how to summarize results cleanly in PR bodies.
- Provide a before/after CI log excerpt that shows the readability improvements achieved during discripper.
- Cross-reference `docs/04-ci-cd.md` so readers know where to dive deeper for pipeline details.
- Include reminders about labeling the tracking issue with `phase:training`, `type:docs`, `topic:workflow` for discoverability.
- Apply the labels `phase:training`, `type:docs`, and `topic:workflow` to the GitHub issue when filing it.

## Constraints
- Use HTTPS remotes and GitHub CLI where possible.
- Keep log snippets anonymized and trim to the portions that illustrate the improvement.
- Follow Markdown style guidelines for tables, code blocks, and callouts.

## Test plan
- No automated checks; manually verify the CI excerpts render and the cross-references resolve.

## Rollback
- Revert the CI lesson updates if they drift from the outlined scope.
