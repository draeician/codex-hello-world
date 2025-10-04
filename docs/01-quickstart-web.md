# Quickstart: Codex Web + GitHub HTTPS

1. In ChatGPT, open **Settings → Linked Accounts** and select **Connect GitHub**. Approve HTTPS access for the target organization.
2. Start a new Codex task, describe the work, and wait for the sandbox to open.
3. In the sandbox terminal, create a feature branch and Draft PR:
   ```sh
   git checkout -b feature/my-task
   gh pr create --draft --title "My task" --body "WIP" --fill
   ```
4. On your local machine, authenticate GitHub CLI for HTTPS pushes:
   ```sh
   gh auth login --web --scopes "repo,workflow"
   gh auth setup-git
   ```
5. Clone the Draft PR branch over HTTPS and enter the repo:
   ```sh
   git clone https://github.com/<owner>/<repo>.git
   cd <repo>
   git fetch origin feature/my-task
   git checkout feature/my-task
   ```
6. Run project checks locally before pushing:
   ```sh
   ./scripts/test.sh
   ```
7. Commit fixes, push to the HTTPS remote, and update the Draft PR:
   ```sh
   git add .
   git commit -m "Describe change"
   git push -u origin feature/my-task
   gh pr view --web
   ```
8. When tests pass and reviews are done, convert the Draft PR to Ready for review and merge via the GitHub UI.
