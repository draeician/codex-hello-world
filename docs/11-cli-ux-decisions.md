# CLI UX Decisions from the Discripper Effort

Codex operators relied on a deliberately small CLI surface area during the discripper workstream. Deterministic inputs and predictable output formatting made it easy to hand changes between humans and automation while preserving traceability.

## Option set and rationale

| Option | Why it mattered | Typical value |
| ------ | --------------- | -------------- |
| `--branch <name>` | Guarantees every run starts from a fresh, descriptive branch so CI filters (`codex/*`) and dashboards stay accurate. | `codex/docs-cli-ux` |
| `--title <text>` | Forces Draft PRs and issues to ship with reviewer-ready summaries instead of generic placeholders, eliminating manual retitling. | `docs: capture CLI naming rationale` |
| `--issue <url or id>` | Keeps the CLI aligned with the source task, letting follow-up runs rehydrate context in one hop. | `#P4-T6` |

See the `codex task run` walkthrough in the [workflow case study](docs/09-discripper-workflow-case-study.md#example-codex-request-for-a-draft-pr--mirrored-issue) for a full command example readers can experiment with locally.

## Before/after: enforcing `--title`

Adding `--title` kept Codex output deterministic and searchable. Compare the CLI report when the option is omitted versus provided:

```diff
- Draft PR ready: codex/docs-cli-ux
- Title: (auto-generated)
+ Draft PR ready: codex/docs-cli-ux
+ Title: docs: capture CLI naming rationale
```

The explicit title eliminated follow-up cleanups—reviewers could filter for "docs:" prefixed work, and automation mirrored the same label in the GitHub issue without further prompting.

## Deterministic names unlock fast follow-ups

Branch names such as `codex/docs-cli-ux` encoded the task scope (`docs`) and topic (`cli-ux`). When feedback required a follow-up, the team appended a suffix (`codex/docs-cli-ux-follow-up`) so Draft PR history read chronologically. Search results for `codex/docs-` surfaced the entire thread, making it trivial to audit CLI-affecting work.

## Linking CLI output back to reference material

Every CLI run linked back to the originating issue and to the [task template](docs/02-task-template.md) so humans could audit the prompts Codex consumed. Keeping those references tight reinforced the documentation discipline that defined the discripper experiment.
