---
description: "Review the current PR or branch diff for bugs, style, and security"
argument-hint: "[base-branch]"
---

Review the code changes in this PR. Use `git diff main...HEAD` (or the specified base branch) to see all changes.

Check for:
1. **Correctness** -- Does the code do what the PR title/description claims?
2. **Bugs** -- Edge cases, null checks, off-by-one errors, race conditions
3. **Security** -- Injection, auth bypass, hardcoded secrets, path traversal
4. **Style** -- Consistent with the rest of the codebase
5. **Tests** -- Are new code paths tested? Any gaps?

Output a structured review:
- CRITICAL: Must fix (with file:line)
- WARNING: Should fix (with file:line)
- SUGGESTION: Nice to have
- APPROVED: If no critical or warning issues found
