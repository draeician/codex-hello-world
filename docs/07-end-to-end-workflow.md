# 07. Codex Workflow: End-to-End

Connect the dots from idea to merge with Codex and your human review loop.

## 1. Task kickoff → branch
- **Codex:** Start every run with an explicit request to create a fresh `codex/...` branch from `main`. Provide the task goal, scope, and any prior context (issues, PR links, specs).
- **Humans:** Confirm the scope is right-sized and clarify acceptance criteria before Codex writes code. Capture decisions in the task prompt so every run begins with the same shared understanding.

## 2. Draft PR creation
- **Codex:** Open a Draft PR as part of the same task so CI, reviewers, and history attach to one branch. Use the template checklist to track progress.
- **Humans:** Review the PR title/body, adjust labels, and invite stakeholders early. Draft status signals “work in progress” while still enabling feedback threads.

## 3. Automated checks (CI/CD)
- **Codex:** Run required commands (`pnpm test`, `pnpm build`, linters) when the repo allows it, and surface failures or missing coverage in the PR description.
- **Humans:** Monitor the CI dashboard, unblock flaky jobs, and add missing secrets or fixtures. Share logs back with Codex if a follow-up task must fix the failure.

## 4. Iteration loop
- **Codex:** Address review comments or new findings by launching follow-up tasks that target the same branch. Keep commits focused—docs with docs, code with code—to simplify reviews.
- **Humans:** Leave actionable PR comments (`blocker`, `nit`, `question`) and summarize unresolved items when starting each new Codex run. Merge small fixes locally if that is faster than another agent pass.

## 5. Merge and cleanup
- **Codex:** Once checks pass and feedback is resolved, request final confirmation to mark the PR “Ready for review” or merge (if policy allows). Delete the feature branch after merge to keep the namespace tidy.
- **Humans:** Perform the final review, confirm release notes, and ensure downstream tasks (deploys, docs) are queued. Archive task prompts so future contributors see the full history.

## Best practices
- Keep PRs under ~300 lines of diff so Codex and reviewers stay oriented; split large efforts into sequential chapters or stacked branches.
- Rebase or merge `main` frequently to avoid drift, especially before handing the branch back to Codex.
- Use descriptive branch names (`codex/docs-end-to-end`) and keep stale branches pruned weekly.
- Document follow-up work in issues rather than tacking on extra commits late in the review.

## Pitfalls to avoid
- **Read-only QA mode:** If Codex reports it, re-select the repo, start a new task that requests a fresh branch, or make a tiny web commit before retrying (see Chapter 06).
- **Stacked PR conflicts:** When layering multiple branches, merge the base branch first and rebase dependents immediately; share updated comparisons with Codex before it resumes work.
- **Oversized diffs:** Huge changesets exhaust context. Break work into smaller PRs and iterate feature flags where possible.

## End-to-end checklist
1. Define the task goal, scope, and acceptance criteria.
2. Start Codex with instructions to branch from `main` and open a Draft PR.
3. Review the Draft PR body, assign reviewers, and kick off CI.
4. Iterate: resolve comments, rerun Codex tasks, and keep commits focused.
5. Ensure CI passes, approvals are recorded, then merge and delete the branch.
