# Discripper Workflow Case Study

This chapter walks through the discripper training effort from planning to merge. It focuses on how clearly scoped prompts, checklists, and Draft PR hand-offs kept the automation stable even as requirements evolved.

## 1. Planning the effort

The team began with a product requirements document (PRD) that identified the learning goals (workflow discipline, token use, CI hygiene) and described the desired learner outcomes. From the PRD we derived a TASKS.md checklist so each Codex run had a single, observable deliverable.

### Snapshot: PRD excerpt

> *"Phase 4 should surface real automation transcripts. Learners need to see how a Draft PR captures review-ready diffs while Codex still owns the typing."*

### Snapshot: Initial task entry

```
- [ ] Add “Discripper Workflow Case Study” chapter [#P4-T1]
  - Acceptance Criteria: highlight hand-off from PRD → task → Draft PR
```

Even at this stage, we resisted putting implementation hints in the task. Instead, we let the PRD and existing docs provide the context, keeping the task concise for Codex to execute.

## 2. Running Codex against the task

Once the task was ready, we opened a one-shot Codex run. The prompt grounded the agent in the PRD, task, and repo structure while giving the smallest safe change request.

### Prompt excerpt (before refinement)

```
You are in /workspace/discripper.
Implement #P4-T1.
Write the new chapter and update links.
```

This minimal prompt left Codex guessing about style, testing requirements, and Draft PR expectations. The run produced a partial chapter with no README update.

### Prompt excerpt (after refinement)

```
You are in /workspace/discripper.
Task: #P4-T1 Add "Discripper Workflow Case Study" chapter.
Follow TASKS.md acceptance criteria. Keep diff minimal. Update README chapters list. Include before/after prompt + PR diff excerpts. Run `pip install -e .`, `ruff check .`, `pytest -q --cov=src --cov-fail-under=80`.
```

The refined prompt anchors Codex on explicit acceptance criteria, required commands, and artifact expectations. Subsequent runs reliably produced the complete chapter, README updates, and command transcripts for review.

## 3. Draft PR and review loop

After Codex staged the changes, we used the Draft PR template to capture the intent and surface verification evidence before requesting human review.

### Diff summary (before review feedback)

```diff
+## Discripper Workflow Case Study
+
+The discripper initiative showcased how tight scopes and explicit prompts ...
```

Reviewers asked for more concrete artifacts demonstrating the PRD → Task → Draft PR flow. Codex amended the chapter with embedded transcript snippets that paired prompts with resulting diffs.

### Diff summary (after feedback)

```diff
+### Prompt excerpt (after refinement)
+
+```
+You are in /workspace/discripper.
+Task: #P4-T1 Add "Discripper Workflow Case Study" chapter.
+```
+
+### Draft PR clip
+
+> *"## Summary — Added case study chapter linking PRD to Draft PR hand-off"*
```

Capturing the evolution inside the Draft PR ensured reviewers saw both the narrative and the supporting evidence without leaving GitHub.

## 4. Merge and follow-up

With review sign-off, the Draft PR flipped to Ready for Review, tests re-ran, and the branch merged cleanly. Follow-up tasks were filed for adjacent documentation (token patterns, branching flow) so each improvement stayed scoped to a single Codex run.

## 5. Token patterns and configs

The discripper team kept prompts portable by replacing environment-specific strings with tokens that resolve at run time. The shift from hard-coded values to tokens made it safe to re-run Codex across sandboxes while keeping Draft PRs readable.

### Annotated diff: hard-coded vs tokenized

```diff
-export PROJECT_NAME="discripper-training"
-python scripts/bootstrap.py --entry scripts/bootstrap.py --config config/discripper.yml
+export PROJECT_NAME="{PROJECT_NAME}"
+python scripts/bootstrap.py --entry {ENTRYPOINT} --config {CONFIG_PATH}
```

Swapping the literal values for `{PROJECT_NAME}`, `{ENTRYPOINT}`, and `{CONFIG_PATH}` keeps the command sequence unchanged while signaling to Codex that the concrete strings will be injected later. We captured this pattern in TASKS.md so every run reused the same substitution map instead of repeating edits in the PR body.

### Token flow from PRD to Codex run

| Token | Source of truth | Applied during |
| --- | --- | --- |
| `{PROJECT_NAME}` | PRD environment appendix | Draft PR evidence blocks and CLI exports |
| `{ENTRYPOINT}` | TASKS.md acceptance criteria | Prompt snippets that invoke bootstrap scripts |
| `{CONFIG_PATH}` | Repository config directory | Codex command block inside Draft PR |

The PRD first established which parts of the workflow needed to be swappable. TASKS.md then restated the tokens so Codex knew which strings to expect, and the final prompt bound them to concrete values. This flow let reviewers confirm the substitutions in the Draft PR without seeing sensitive paths.

### Keep templates in sync

Whenever you introduce or rename a token, update the examples in [`docs/02-task-template.md`](02-task-template.md) so future task authors copy the latest placeholders. We also labeled the tracking issue for this work with `phase:training`, `type:docs`, and `topic:workflow` to match the rest of the phase, making it easy to discover all token-related follow-ups.

## 6. Branching and iteration flow

To keep the branch history readable, the team followed a single Codex run per branch and recorded every follow-up as its own Issue. The flow mirrors the iteration guidance in [Chapter 05](05-agent-iteration-loop.md) and the end-to-end checkpoints in [Chapter 07](07-end-to-end-workflow.md).

```text
main ──┐
       ├─ codex/docs-branching-flow ➊
       │      ↓ Draft PR opened ➋
       │      ↓ Review feedback loop ➌
       └─ codex/docs-branching-flow-follow-up ← new Issue + branch ➍
```

1. **Start from `main` with a deterministic branch name.** Prefix the branch with `codex/` so CI, automation, and reviewers know it came from a Codex task.
2. **Open a Draft PR before asking for review.** The Draft PR body carries the task summary, command transcripts, and any open questions. Updates stay confined to the same branch until the checklist is satisfied.
3. **Capture iteration feedback inside the Draft PR.** When reviewers request changes, run Codex again with instructions to continue on the existing branch. Each response references the same Issue and Draft PR so history stays linear.
4. **Create a new Issue for follow-up work.** If the feedback requires broader edits, file a fresh Issue linked from the Draft PR and start a new branch (for example, `codex/docs-branching-flow-follow-up`). This keeps future runs scoped while preserving traceability back to the conversation that spawned them.

### Example Codex request for a Draft PR + mirrored Issue

```
codex task run "#P4-T3 Document branching & iteration flow" \
  --branch codex/docs-branching-flow \
  --open-draft-pr "Document branching & iteration flow" \
  --mirror-issue "https://github.com/example/discripper/issues/123"
```

The command names the branch, opens a Draft PR with the same title, and mirrors progress to the GitHub Issue that tracks the task. Re-run Codex only when continuing work on the existing branch; otherwise, file a new Issue and branch so the Draft PR history stays focused on one objective.

## Key lessons for learners

1. **Start with the PRD.** Let the PRD define scope while TASKS.md captures the actionable slice Codex should ship.
2. **Prime Codex with acceptance criteria.** Concrete checklists, command gates, and artifact expectations reduce retries.
3. **Use Draft PRs as living briefs.** Combine summary, evidence, and next steps so reviewers can approve quickly.
4. **Queue follow-on work deliberately.** Every merged chapter spawned a tracked task, preventing scope creep inside a single run.
5. **Tokenize reusable values.** Carrying `{PROJECT_NAME}`, `{ENTRYPOINT}`, and `{CONFIG_PATH}` from PRD to Draft PR keeps reruns deterministic and avoids leaking environment details.

By mirroring this cadence—PRD → TASKS → Codex run → Draft PR—you create a predictable feedback loop that scales across complex documentation efforts.
