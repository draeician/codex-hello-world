# Documentation Discipline Checklist

The discripper program closed every task by updating the learner-facing record of work. This discipline kept Codex prompts, release notes, and changelog entries synchronized so follow-up automation never guessed at the source of truth. Use the following workflow to ensure each task finishes with a complete paper trail.

## Task closure routine

Adopt a repeatable end-of-task checklist so documentation, release notes, and changelog updates ship together:

- [ ] Confirm user-facing docs reflect the behavior change (chapters, quickstarts, examples).
- [ ] Add or update release notes with a one-line impact statement and links to the relevant docs.
- [ ] Record the change in the project changelog with the same scope as the code diff.
- [ ] Cross-link the task, PR, and docs so reviewers can navigate the full history.
- [ ] Apply workflow labels (`phase:training`, `type:docs`, `topic:workflow`) to the tracking issue before closing it.
- [ ] Capture any token or template updates (for example, snippets in [docs/02-task-template.md](02-task-template.md)) to keep future tasks aligned.

Consider embedding the checklist above in `TASKS.md` entries or issue templates so every run has the reminders in-context.

## Example PR summary snippet

Tie code, docs, and changelog updates together in the PR body. A short summary like the following gives reviewers confidence that the task closed cleanly:

```
## Summary
* Tightened validation for `codex run --title` to reject blank titles.
* Documented the new error path in docs/11-cli-ux-decisions.md.
* Logged the behavior change in CHANGELOG.md under "Unreleased".
```

Mentioning the docs and changelog directly in the summary is enough for release managers to trace the update without re-parsing the diff.

## README and table-of-contents updates

Whenever you add a new chapter under `/docs`, immediately update the README “Chapters” list (and any other table of contents) so learners can discover the file. Treat the README as the navigation surface: re-number chapters if necessary, keep the titles learner-focused, and link to the new file by path. Skipping this step creates drift between the published syllabus and the actual lessons, so make it part of the closure checklist before you mark a task complete.
