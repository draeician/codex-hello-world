# Codex Web Architecture Overview

1. **Codex Web sandbox** runs tasks in a secure cloud workspace so changes stay isolated until pushed via Git.
2. **GitHub connector** links the sandbox to your repository using HTTPS, enabling branch pushes and PR updates without SSH keys.
3. **Pull requests** act as review gates: Draft PRs capture WIP context, while reviewers merge once tests and feedback are resolved.
4. **Local verification** happens on your machine by cloning the PR branch over HTTPS, running tests, and pushing fixes back through the same remote.
