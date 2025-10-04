# Issue-Driven Codex Tasks

Use GitHub Issues to capture the work Codex should perform, then let Codex open a branch and Draft PR that stays tied to that Issue.

## Mental model
Each Issue becomes the single source of truth for a slice of work. Fill in these sections so Codex knows exactly what to do:

- **Problem** — what user-visible or technical gap are we closing?
- **Acceptance criteria** — bullet the observable outcomes Codex must deliver.
- **Constraints** — note tooling restrictions, coding standards, or non-goals.
- **Test plan** — spell out which commands or checks verify the change.
- **Rollback** — describe how to revert if things go wrong.

Codex reads every section before touching the repo.

## Create the Issue
1. In GitHub, choose **Issues → New issue**. Select the **Codex Task** template.[screenshot: new-issue.png]
2. Confirm the template is `.github/ISSUE_TEMPLATE/codex-task.md` and the **codex** label is applied automatically. If you need to add it manually, use the label picker.[screenshot: issue-label.png]
3. Replace each placeholder `-` with concrete instructions. Keep sentences short and declarative so Codex can translate them into actions.

   ```md
   ## Problem
   - Payments webhook drops failed charge alerts.

   ## Acceptance criteria
   - Failed charges trigger a Slack alert with customer email and invoice ID.

   ## Constraints
   - Reuse the existing `notify_slack` helper.

   ## Test plan
   - pnpm test payments --filter "webhook"

   ## Rollback
   - Disable the webhook by setting `PAYMENTS_WEBHOOK_ENABLED=false`.
   ```

4. Submit the Issue. Mention teammates or link context PRs as needed.[screenshot: issue-created.png]

## How Codex responds
- Start a Codex Web session from the Issue.
- Codex parses the text, drafts a work plan, and creates a branch plus Draft PR targeting `main` (for example, `codex/fix-payments-webhook`).
- The Draft PR references the Issue so reviewers can track progress without leaving GitHub.

## Iterate on the same workstream
- Need more commits on the same branch? Open a new Codex task from the Issue and specify “continue on branch `<branch-name>`”. Codex will re-open the Draft PR and keep working.
- Prefer to queue future follow-ups? File a new Codex Task Issue that links back to the original. Codex will create a fresh branch while preserving the breadcrumb trail.
- After manual review and testing, convert the Draft PR to “Ready for review” and merge through the usual GitHub flow.[screenshot: draft-pr.png]

## Tips
- Keep Issues updated as requirements shift; Codex will pull the latest text on every run.
- Reference artifacts with short descriptors such as `[screenshot: draft-pr.png]` so you can drop real images later.
- When the acceptance criteria are all satisfied, close the Issue alongside the merged PR.
