# Contributing Tour

1. **Understand the mission.** Review the goals in `CONTRIBUTING.md` to align your Codex-assisted work with stability, inclusivity, and shipping value quickly.
2. **Set up your toolbox.** Install Node.js (LTS) and pnpm, configure git with your name/email (plus GPG if needed), and skim `README.md` along with existing docs so Codex has the right context.
3. **Prime your local clone.** Fork the repo or confirm push access, add the upstream remote, then sync before prompting Codex to act:
   ```bash
   git checkout main
   git pull upstream main
   ```
4. **Branch with the `codex/` prefix.** Create focused feature branches using the naming pattern (for example, `codex/my-improvement`) so automation recognizes your work:
   ```bash
   git checkout -b codex/<short-topic>
   ```
5. **Plan a small, testable task.** Define acceptance criteria, expected tests, related links, and call out risks so reviewers and Codex can understand the change quickly.
6. **Develop iteratively.** Keep commits tight with messages following `codex: <summary>`, run setup once, and rely on lint/test commands while you iterate with Codex or locally:
   ```bash
   pnpm install
   pnpm lint
   pnpm test -w --reporter dot
   ```
7. **Share early via Draft PRs.** Push your branch to GitHub to trigger CI, open a Draft Pull Request for feedback, and flip it to "Ready for review" after checks pass so Codex summaries stay accurate.
8. **Watch the pipelines.** Monitor the `ci/test`, `lint`, and `security` checks on GitHub; fix failures locally, then push updates until everything is green before merge.
9. **Stay conflict-free.** Regularly sync `main`, coordinate on high-churn files, and prefer short-lived branches to reduce merge pain:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```
10. **Resolve conflicts methodically.** During a rebase, open each file, clear markers, re-run tests, and finish the flow so Codex sees a clean history:
    ```bash
    git mergetool   # optional helper
    pnpm test -w --reporter dot
    git rebase --continue
    ```
11. **Respect read-only windows.** If the repo is locked, keep working locally, stash or commit progress, and avoid rebases or force pushes until writes resume.
12. **Protect secrets.** Never commit credentials; rely on approved secret stores or environment variables and report vulnerabilities privately.
