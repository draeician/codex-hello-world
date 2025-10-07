# CODER Task: Author Token Patterns and Configs Lesson (#P4-T2)

> Linked checklist entry: [TASKS.md (#P4-T2)](../../TASKS.md#phase-4--advanced-workflow-case-study-lessons-from-discripper)  
> Labels: `phase:training`, `type:docs`, `topic:workflow`

## Problem
- Phase 4 outlined how tokenization kept the discripper prompts safe (#P4-T2), but we need CODER to produce the learner-facing lesson content inside `docs/09-discripper-workflow-case-study.md` (Section “Token patterns and configs”) or a dedicated companion doc.

## Acceptance criteria
- Document the reusable `{PROJECT_NAME}`, `{ENTRYPOINT}`, and `{CONFIG_PATH}` tokens with an annotated diff contrasting hard-coded values versus tokens.
- Add a table mapping each token to its source of truth and where Codex applies it during a run, matching the expectations captured in the checklist.
- Reference the updates learners must make to `docs/02-task-template.md` so the template reflects the token practice.
- Keep cross-links to related discripper lessons so the token guidance stays contextual.
- Apply the labels `phase:training`, `type:docs`, and `topic:workflow` to the GitHub issue when filing it.

## Constraints
- Use HTTPS remotes and GitHub CLI where possible.
- Preserve anonymized names for projects and configs; avoid exposing internal identifiers.
- Follow existing Markdown conventions for tables and callouts.

## Test plan
- No automated checks; verify tables render correctly in Markdown preview and links resolve.

## Rollback
- Revert the documentation updates if the token coverage deviates from the agreed outline.
