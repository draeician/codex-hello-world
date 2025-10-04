# Read-Only QA Mode & Recovery

> **Symptom**  
> Codex replies: *“I’m operating in read-only QA mode … I can’t create branches, edit files, or open PRs.”*

## What it means
Codex spun up a sandbox that has **read** access to this repo, but not **write** access for the current task. This most often happens right after merges or branch deletions, or when the repo wasn’t re-selected in Codex Web.

## Common causes
1. **Repo not re-selected** after a merge/branch delete — the previous sandbox expired.  
2. **Connector auth drift** — GitHub connection needs a quick refresh in ChatGPT → Settings → Connectors → GitHub.  
3. **Branch mismatch** — asking Codex to commit to a branch that no longer exists or was renamed.  
4. **Stale session** — long idle time; the sandbox is closed.  
5. **Policy guardrail** — task phrasing implies an action the current mode disallows (rare).

## Quick fixes (order matters)
1. **Re-select the repo in Codex Web**  
   - In Codex → “Change repository” → pick this repo again (even if it looks selected).  
2. **Start a fresh task that creates a new branch + Draft PR**  
   - Use wording like: “Create a new branch starting with `codex/docs-…` and open a Draft PR.”  
3. **If still stuck, make a tiny web commit on the target branch**  
   - e.g., add `docs/TMP.md` with one line → commit → try the Codex task again.  
4. **Avoid deleting active PR branches** until after you merge.  
5. **Refresh the GitHub connector**  
   - ChatGPT → Settings → **Connectors** → GitHub → ensure this repo is authorized.

## Reliable task phrasings
- ✅ “Create a **new branch** named `codex/docs-…` and open a **Draft PR**.”  
- ✅ “Add file `docs/...md`, update `README.md` links. **Commit to the new branch**.”  
- ⚠️ “Continue work on branch …” often fails; prefer “Create a new branch …”.

## Troubleshooting checklist
- [ ] Repo re-selected in Codex Web  
- [ ] New branch requested in the task  
- [ ] No deletion of the active PR branch  
- [ ] Connector shows repo authorized  
- [ ] (If needed) tiny web commit made to refresh visibility

## FAQ
**Why does Codex keep opening new PRs?**  
Each task is one-shot; new sessions usually create a fresh branch/PR. That’s by design for traceability.

**Can Codex push to an existing Draft PR?**  
Sometimes, but it’s unreliable. Prefer a new task → new branch/PR, or merge then start a new doc PR.

**How do I test changes before merging?**  
Keep PRs **Draft**, use CI checks, and (if needed) “Copy git apply” to try diffs locally before merging.

> **Template prompt (copy/paste)**
> ```
> Create a new branch starting with codex/docs-… and open a Draft PR to main.
> Add docs/<chapter>.md and update README “Chapters” with a link.
> Keep PR in Draft; no unrelated code changes.
> ```
