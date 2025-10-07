# CI Pragmatics Lessons

The discripper effort kept CI lean so Codex runs finished quickly while still proving the branch was safe to merge. This chapter distills the playbook into reusable steps you can apply when planning automation for new lessons.

## 1. Start with the smallest green-path checks

Full CI pipelines often run dozens of jobs that do not guard the core learning objective. Discripper trimmed the surface area to the commands that had to pass before a reviewer would consider the branch. Everything else moved to optional follow-up issues.

| Command | Why it mattered | When to run |
| --- | --- | --- |
| `pnpm lint --filter discripper` | Lints only the packages touched by the lesson instead of the whole monorepo. | Run once per Codex branch before opening the Draft PR. |
| `pnpm test --filter discripper --reporter dot` | Executes the relevant unit tests without the verbose default reporter. | Capture output for the Draft PR evidence section. |
| `pnpm build --filter discripper` | Proves the distributable still compiles without rebuilding unaffected workspaces. | Run only when the task changes build artifacts. |
| `pip install -e .` | Installs the local Python utilities that support scripting and docs tooling. | Run whenever dependencies may have changed. |
| `ruff check .` | Fast linter pass for the documentation helpers that live in this repo. | Include in every run; surfaces syntax issues early. |
| `pytest -q --cov=src --cov-fail-under=80` | Ensures the shared Python helpers keep their coverage budget. | Run before asking for review so evidence includes coverage numbers. |

When you draft the PR, summarize the commands exactly as they were executed so reviewers can replay them:

> **Tests**  
> `pnpm lint --filter discripper`  
> `pnpm test --filter discripper --reporter dot`  
> `pnpm build --filter discripper` (skipped: no build artifacts touched)  
> `pip install -e .`  
> `ruff check .`  
> `pytest -q --cov=src --cov-fail-under=80`

## 2. Show the readability win

Cleanup work is easier to justify when you pair before/after evidence. The team captured log excerpts that contrasted the noisy defaults with the trimmed outputs.

```text
# Before: raw CI log
> pnpm test
discripper: > jest --watchAll
 PASS packages/app/src/components/App.test.tsx (5.231 s)
 PASS packages/app/src/components/Header.test.tsx (4.912 s)
 ... dozens of unrelated packages ...
Test Suites: 142 passed, 0 failed, 0 skipped, 0 todo
Tests:       1 skipped, 3 todo, 1 failed, 430 passed, 0 total
Time:        318.456 s
Ran all test suites.
```

```text
# After: trimmed task-focused log
> pnpm test --filter discripper --reporter dot
discripper: > jest packages/discripper --reporters=dot
··········
7 passing (11.2s)
```

The cleaned output made it obvious that only the discripper workspace was exercised and highlighted the meaningful signal (seven passing specs) without burying reviewers in unrelated jobs.

## 3. Connect back to the CI/CD chapter

Chapter 04 dives into pipeline wiring, matrix strategies, and when to invest in full-fidelity CI. Link back to it whenever learners need deeper context: see [docs/04-ci-cd.md](04-ci-cd.md).

In Draft PR templates, add a short "CI focus" callout that reiterates the commands above and states that the tracking issue carries the labels `phase:training`, `type:docs`, and `topic:workflow`. That breadcrumb keeps Phase 4 work discoverable once the lesson merges.
