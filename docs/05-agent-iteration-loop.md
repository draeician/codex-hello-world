# 05. Agent Iteration Loop

Learn how to guide Codex through multiple improvement passes without losing momentum.

## Why Codex tasks are one-shot

Each Codex Web task collects a single instruction bundle and produces one set of changes. After the run finishes the agent's internal state resets, so re-running the same task will not continue where it left off. To iterate, create a fresh task, usually on a new Git branch with a Draft PR, so you can compare runs and roll back safely.

## Pattern 1: Start a new Codex Web task for the same feature

When follow-up work is small and independent, open another Codex Web task that targets the same feature area. Provide links to the existing branch or PR for context. Codex will usually open a brand-new PR, so link it back to the original effort for reviewers.

```bash
# Reuse the same feature branch locally
git checkout codex/feature-awesome
# Pull in the new changes from Codex's follow-up PR
git fetch origin codex/feature-awesome-2 && git merge FETCH_HEAD
```

## Pattern 2: Issue-driven iteration

For larger or cross-cutting refinements, file a GitHub issue using the Codex task template and apply the `codex` label. Assign the issue to yourself to keep ownership and reference the Draft PR in the issue body. Subsequent Codex runs can be launched directly from the issue so every attempt is traceable.

## Pattern 3: Review loop with PR comments

Keep the PR as Draft while reviewing. Leave actionable comments (`nit`, `question`, `blocker`) so Codex can copy the discussion into a new task prompt. Draft status prevents premature merges and signals that iteration is still in progress. Once all comments are resolved and verification passes, flip the PR to “Ready for review.”

## Pattern 4: Local verification with copyable patches

When Codex suggests alternative code in chat, use the “Copy git apply” or “Copy patch” buttons to test locally before committing. Apply the snippet, run checks, and then push.

```bash
# Example of verifying a copied patch locally
git checkout codex/feature-awesome
cat <<'PATCH' | git apply --cached -
--- a/src/example.ts
+++ b/src/example.ts
@@
 console.log('hello world')
 console.log('hello codex')
PATCH
pnpm test
```

[screenshot: copy-git-apply.png]

## When to merge vs. keep iterating

Merge when the branch has test coverage, reviewer approval, and the changes solve the original task without introducing regressions. If new bugs appear, feedback is unclear, or verification fails, keep the PR in Draft and spin up another Codex task or issue to address the gaps.

## Troubleshooting tips

- Codex opened the wrong branch: close the PR, branch locally from the correct base, and relaunch with explicit branch instructions.
- Tests are flaky: re-run them locally and capture logs to include in the next task prompt.
- Large diffs overwhelm Codex: use `git add -p` to stage smaller hunks and iterate in focused chunks.
