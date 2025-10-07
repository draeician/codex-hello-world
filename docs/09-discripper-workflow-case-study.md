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

## Key lessons for learners

1. **Start with the PRD.** Let the PRD define scope while TASKS.md captures the actionable slice Codex should ship.
2. **Prime Codex with acceptance criteria.** Concrete checklists, command gates, and artifact expectations reduce retries.
3. **Use Draft PRs as living briefs.** Combine summary, evidence, and next steps so reviewers can approve quickly.
4. **Queue follow-on work deliberately.** Every merged chapter spawned a tracked task, preventing scope creep inside a single run.

By mirroring this cadence—PRD → TASKS → Codex run → Draft PR—you create a predictable feedback loop that scales across complex documentation efforts.
