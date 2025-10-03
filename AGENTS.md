# AGENTS
## defaults
model: gpt-5-codex
branch_prefix: codex/
test_cmd: pnpm test -w --reporter dot
build_cmd: pnpm build
constraints:
  - No secrets in code or logs
  - Keep changes minimal; preserve public APIs
review:
  required_checks:
    - ci/test
    - lint
    - security
templates:
  commit: "codex: {summary}"
  pr_title: "Codex: {issue_title}"
  pr_body: |
    ## Plan
    {plan}

    ## Changes
    {diffstats}

    ## Tests
    {tests}

