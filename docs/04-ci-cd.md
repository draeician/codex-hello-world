# Chapter 04: Continuous Integration

## 1. Understand GitHub Actions
- GitHub Actions runs automation ("workflows") directly from GitHub.
- This repository triggers the CI workflow on two events (see `.github/workflows/ci.yml`):
  - `push` to the `codex/bootstrap-codex-playbook-repository` branch.
  - `pull_request` targeting `main`, which includes Draft PR branches such as `codex/docs-issue-tasks`.

## 2. Walk through `.github/workflows/ci.yml`
1. The workflow is named **CI** and defines a single `test` job that runs on `ubuntu-latest`.
2. `actions/checkout@v4` pulls the branch so the runner sees your latest commits.
3. `actions/setup-python@v5` provisions Python 3.x on the runner.
4. `python -m pip install --upgrade pip` keeps the default toolchain up to date.
5. `bash scripts/test.sh` executes our project tests.

### Inside `scripts/test.sh`
- `PYTHONPATH="$PWD"` makes `src/` importable from the tests.
- `python -m unittest discover -s tests -p "test_*.py" -v` explicitly discovers every `tests/test_*.py` file.

## 3. Why the first CI runs failed (and the fix)
- Early commits relied on the default `python -m unittest`, which in GitHub Actions ran from the repository root and found **0 tests**.
- The fix added two changes inside `scripts/test.sh`:
  1. Export `PYTHONPATH=$PWD` so imports like `from src.hello import hello` succeed.
  2. Call `python -m unittest discover -s tests -p "test_*.py" -v` to point discovery at the `tests/` folder.
- After pushing that update, CI started reporting real test results.

## 4. Read CI logs quickly
1. Open the PR in GitHub and click the **Checks** tab (or the red/green check icon next to the latest commit).
2. Choose the **CI / test** job.
3. Expand the **Run tests** step to see the output from `scripts/test.sh`.
4. Common failures:
   - `Ran 0 tests` → mis-named tests or missing discovery.
   - Import errors → forgotten `PYTHONPATH` or missing files.
   - Assertion failures → unit tests caught a regression.
5. Use the **Re-run jobs** button (top-right) if you need to retry after fixing CI configuration issues.

## 5. Required vs informational checks
- Repository settings mark checks like **CI / test**, **lint**, and **security** as *required* before merging to `main`.
- Informational checks appear in the Checks tab but do not block merges.
- Draft PRs (such as this branch) always run the workflow, but GitHub hides the **Merge** button until you click **Ready for review**.

## 6. Try it yourself
1. Edit `tests/test_hello.py` (for example, change the expected string).
2. Commit and push the change to your Draft PR branch.
3. Refresh the PR: the **CI / test** job should show "Queued" and then rerun automatically.
4. Open the **Run tests** log to confirm the failing assertion, then revert the edit and push again to watch CI turn green.
