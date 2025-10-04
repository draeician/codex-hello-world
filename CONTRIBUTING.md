# Contributing Guide

## Goals
- Empower contributors to ship valuable improvements quickly.
- Keep the project stable, secure, and easy to understand.
- Maintain a welcoming, inclusive environment for all collaborators.

## Prereqs
- Install the current LTS version of Node.js and pnpm.
- Fork the repository or ensure you have push access.
- Configure git with your name, email, and preferred GPG signing if required.
- Read the `README.md` and existing documentation to familiarize yourself with the project.

## Standard Workflow
1. Sync your local `main` with the upstream repository.
2. Create a feature branch using the `codex/` prefix (for example, `codex/my-feature`).
3. Make focused changes with clear commit messages matching the "codex: <summary>" template.
4. Run `pnpm install` once, then execute the appropriate lint and test commands.
5. Open a Draft Pull Request early to gather feedback, converting it to Ready for Review when tests pass.

## Writing Good Tasks
- Keep the scope small enough to review in under 30 minutes.
- Provide clear acceptance criteria and testing expectations.
- Link related issues, designs, or documentation.
- Highlight potential risks, migrations, or follow-up work.

## CI/CD
1. Push your branch to trigger automated CI checks.
2. Monitor the status of `ci/test`, `lint`, and `security` workflows.
3. Fix failing checks locally and push updates until the pipeline is green.
4. Only merge once all required checks succeed.

## Handling Read-Only Mode
- Communicate with maintainers if the repository enters a read-only window.
- Continue local development and stash or commit work as needed.
- Avoid force-pushing or rebasing until write access is restored.
- Re-sync with the remote once the restriction lifts.

## Avoiding Merge Conflicts
- Rebase or merge `main` frequently into your feature branch.
- Keep pull requests short-lived to minimize drift.
- Coordinate with teammates when touching high-churn files.
- Prefer small, isolated commits over large sweeping changes.

## Resolving Conflicts Quickly
1. Fetch the latest changes and rebase onto `main`.
2. Use your editor or `git mergetool` to resolve conflicts file by file.
3. Run tests after resolving to ensure nothing regressed.
4. Amend your commit or create a follow-up commit with the fixes, then continue the rebase.

## Security & Secrets
- Never hardcode credentials, API keys, or tokens in the repository.
- Store secrets in the designated secret manager or environment variables.
- Report potential vulnerabilities privately to the security contact.
- Follow the principle of least privilege when accessing infrastructure.
