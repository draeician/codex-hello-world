## Phase 4 – Advanced Workflow Case Study (Lessons from discripper)

- [x] Add “Discripper Workflow Case Study” chapter [#P4-T1]
  - **Purpose:** Show learners how the discripper effort flowed from PRD → TASKS → CODER → Draft PR, emphasizing why tightly scoped acceptance criteria stabilized automation.
  - **Acceptance Criteria:**
    - New doc `docs/09-discripper-workflow-case-study.md` (or similar numbering) narrates the end-to-end planning-to-merge loop with anonymized artifacts.
    - Includes a before/after Codex prompt excerpt and corresponding PR diff that highlight the hand-off from PRD to Draft PR.
    - `README.md` “Chapters” list links to the new file, keeping language focused on learning objectives rather than product details.
    - Labels `phase:training`, `type:docs`, and `topic:workflow` applied to the tracking issue for this task.

- [x] Add “Token Patterns and Configs” section [#P4-T2]
  - **Purpose:** Teach the reusable tokenization technique (`{PROJECT_NAME}`, `{ENTRYPOINT}`, `{CONFIG_PATH}`) that let discripper reuse prompts safely.
  - **Acceptance Criteria:**
    - Documentation (either a new doc or section within the case study) contrasts hard-coded values with tokenized variants using an annotated diff.
    - Explains how tokens flow from PRD → TASKS → Codex prompts, including one table that maps each token to its source of truth.
    - References how learners should update any template snippets in `docs/02-task-template.md` after adopting tokens.
    - Task issue carries labels `phase:training`, `type:docs`, `topic:workflow`.

- [ ] Document branching & iteration flow [#P4-T3]
  - **Purpose:** Demonstrate the one-shot Codex run pattern, Draft PR usage, and GitHub issue mirroring that kept the discripper branch history clean.
  - **Acceptance Criteria:**
    - Adds a flow diagram or step list illustrating branch creation, Draft PR, feedback loops, and follow-up issue creation.
    - Provides an example Codex command/request that opens a Draft PR and a mirrored GitHub issue, with notes on when to re-run vs. file new issues.
    - Cross-links to existing Chapter 05 on iteration loops and Chapter 07 on end-to-end workflow for continuity.
    - Task issue labeled `phase:training`, `type:docs`, `topic:workflow`.

- [ ] Expand read-only mode recovery playbook [#P4-T4]
  - **Purpose:** Give learners reliable phrasing, detection cues, and retry instructions drawn from discripper’s real incidents.
  - **Acceptance Criteria:**
    - Extends `docs/06-read-only-mode.md` (or adds an appendix) with a scenario-based checklist that references Draft PR recovery steps.
    - Includes a sample Codex chat snippet showing detection and the exact wording that resolved the mode.
    - Points readers to where to place this checklist in future PR task prompts.
    - Task issue labeled `phase:training`, `type:docs`, `topic:workflow`.

- [ ] Capture CI pragmatics lessons [#P4-T5]
  - **Purpose:** Teach how the team minimized CI surface area, focused on green-path checks, and reported results cleanly.
  - **Acceptance Criteria:**
    - Document outlines the minimum viable test/build commands (e.g., selective `pnpm` invocations) and how to summarize them in PR bodies.
    - Provides an example CI log excerpt before/after cleanup to show improved readability.
    - Cross-references `docs/04-ci-cd.md` so learners know when to dive deeper.
    - Task issue labeled `phase:training`, `type:docs`, `topic:workflow`.

- [ ] Summarize CLI UX decisions [#P4-T6]
  - **Purpose:** Explain how deterministic naming, `--title`, and other CLI affordances improved Codex operator experience.
  - **Acceptance Criteria:**
    - New section (or doc) walks through the CLI option set with rationale, including a before/after CLI output diff for `--title`.
    - Highlights how deterministic names simplified follow-up tasks and made Draft PRs searchable.
    - Links to any CLI reference material in the repo so readers can experiment.
    - Task issue labeled `phase:training`, `type:docs`, `topic:workflow`.

- [ ] Reinforce documentation discipline [#P4-T7]
  - **Purpose:** Show that every task concludes with documentation updates and changelog alignment, mirroring discripper’s practice.
  - **Acceptance Criteria:**
    - Adds guidance on closing each task with doc updates, release notes, and changelog entries, with a sample checklist learners can reuse.
    - Demonstrates a PR summary snippet that ties code changes back to docs and changelog updates.
    - Clarifies expectations for README/Table-of-Contents updates whenever new chapters are introduced.
    - Task issue labeled `phase:training`, `type:docs`, `topic:workflow`.

- [ ] Queue CODER doc-generation issues [#P4-T8]
  - **Purpose:** Ensure every new Phase 4 lesson spawns a dedicated CODER follow-up task once this phase merges.
  - **Acceptance Criteria:**
    - For each of #P4-T1 through #P4-T7, a GitHub issue is prepared (using the Codex task template) directing CODER to draft the actual instructional content.
    - Each issue links back to the corresponding checklist item and carries the labels `phase:training`, `type:docs`, `topic:workflow`.
    - Optional stub files (with TODO markers) added under `docs/` to reserve filenames cited in the issues.
