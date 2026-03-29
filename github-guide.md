# GitHub -- Quick Start Guide for Beginners

> GitHub is where developers store code, collaborate, and track changes. If Claude Code is your AI assistant, GitHub is where your code lives online.

---

## Why Use GitHub?

| Reason | What it means |
|---|---|
| **Backup** | Your code is saved in the cloud -- laptop dies, code survives |
| **Version history** | Every change is tracked -- undo anything, see who changed what |
| **Collaboration** | Share code, review changes, work as a team |
| **Portfolio** | Employers/clients can see your work |
| **CI/CD** | Auto-run tests, deploy apps when you push code |
| **Claude Code integration** | Claude can create PRs, manage issues, and push code directly |

---

## 1. Setup

### Create a GitHub Account

1. Go to https://github.com
2. Sign up (free tier is fine)
3. Verify your email

### Install Git

```powershell
winget install Git.Git
```

Close and reopen your terminal after installing.

### Configure Git (one time)

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

### Install GitHub CLI (recommended)

```powershell
winget install GitHub.cli
```

Then authenticate:
```bash
gh auth login
# Follow prompts -- choose GitHub.com, HTTPS, and login via browser
```

---

## 2. Core Concepts

### Repository (repo)
A project folder tracked by Git. Contains your code, history, and configuration.

### Commit
A snapshot of your code at a point in time. Like a save point in a video game.

### Branch
A parallel version of your code. Work on features without affecting the main code.

```
main ----*----*----*----*----    (stable, production code)
              \
feature        *----*----*      (your new feature, isolated)
```

### Pull Request (PR)
A request to merge your branch into main. Where code review happens.

### Remote
The copy of your repo on GitHub (as opposed to the copy on your computer).

---

## 3. Essential Commands

### Start a new project

```bash
mkdir my-project && cd my-project
git init                          # Initialize git tracking
gh repo create my-project --public --source=. --push
# Creates repo on GitHub AND pushes your local code
```

### Clone an existing project

```bash
gh repo clone username/repo-name
cd repo-name
```

### Daily workflow

```bash
# 1. Check status
git status

# 2. Stage changes (pick what to commit)
git add file1.py file2.py        # Specific files
git add .                        # Everything (be careful)

# 3. Commit (save a snapshot)
git commit -m "add user login endpoint"

# 4. Push to GitHub
git push
```

### Branch workflow (for features)

```bash
# Create and switch to new branch
git checkout -b feature/dark-mode

# ... make your changes ...

git add .
git commit -m "add dark mode toggle"
git push -u origin feature/dark-mode

# Create a pull request
gh pr create --title "Add dark mode" --body "Adds toggle in settings"
```

### See what changed

```bash
git status           # What files changed
git diff             # What lines changed (unstaged)
git diff --staged    # What lines changed (staged)
git log --oneline    # Commit history (compact)
```

### Undo mistakes

```bash
# Undo uncommitted changes to a file
git checkout -- filename.py

# Undo the last commit (keep the changes)
git reset --soft HEAD~1

# Undo the last commit (discard the changes) -- CAREFUL
git reset --hard HEAD~1
```

---

## 4. GitHub CLI (gh) -- The Power Tool

The `gh` CLI lets you do everything from the terminal instead of the GitHub website.

### Repos

```bash
gh repo create my-app --public     # Create new repo
gh repo clone user/repo            # Clone a repo
gh repo view                       # View repo info
gh repo list                       # List your repos
```

### Pull Requests

```bash
gh pr create                       # Create PR (interactive)
gh pr list                         # List open PRs
gh pr view 42                      # View PR #42
gh pr checkout 42                  # Switch to PR branch
gh pr merge 42                     # Merge PR
gh pr review 42 --approve          # Approve PR
```

### Issues

```bash
gh issue create                    # Create issue (interactive)
gh issue list                      # List open issues
gh issue view 15                   # View issue #15
gh issue close 15                  # Close issue
```

### Actions (CI/CD)

```bash
gh run list                        # List workflow runs
gh run view 12345                  # View specific run
gh run watch 12345                 # Watch run in real-time
```

---

## 5. GitHub + Claude Code

Claude Code integrates with GitHub via the MCP server. Set it up:

### Enable GitHub MCP

In `~/.claude/.mcp.json`:
```json
{
  "mcpServers": {
    "github": {
      "command": "gh",
      "args": ["mcp-server"]
    }
  }
}
```

Auto-approve GitHub tools in `~/.claude/settings.json`:
```json
{
  "permissions": {
    "allow": ["mcp__github__*"]
  }
}
```

### What Claude can do with GitHub

```
> create a PR for this branch
> list open issues on this repo
> review PR #42
> close issue #15 with a comment
> check if CI passed on the latest push
> create an issue for the bug we just found
```

### Example workflow

```bash
cd my-project
claude

> fix the login timeout bug
# Claude fixes the code

> /commit
# Claude creates a well-formatted commit

> create a PR with a summary of what we changed
# Claude pushes branch and creates PR with description
```

---

## 6. .gitignore -- What NOT to Track

Create a `.gitignore` file in your project root:

```
# Dependencies
node_modules/
venv/
__pycache__/

# Environment/secrets
.env
.env.local
*.key
credentials.json

# Build output
dist/
build/
*.pyc

# OS files
.DS_Store
Thumbs.db

# IDE
.vscode/settings.json
.idea/
```

**Rule of thumb:** Never commit secrets, dependencies, or build output.

---

## 7. Good Commit Messages

### Format

```
type: short description

Longer explanation if needed.
```

### Types

| Type | When |
|---|---|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `refactor:` | Code change that doesn't fix or add |
| `test:` | Adding or fixing tests |
| `chore:` | Maintenance (deps, config, etc.) |

### Examples

```
feat: add dark mode toggle to settings page
fix: prevent crash when user has no profile image
docs: add API endpoint documentation
refactor: extract email validation to shared utility
test: add unit tests for payment processing
chore: update React from 18.2 to 18.3
```

---

## 8. Common Scenarios

### "I committed to the wrong branch"

```bash
# Move the last commit to a new branch
git branch fix-branch          # Create branch at current commit
git reset --hard HEAD~1        # Remove commit from current branch
git checkout fix-branch        # Switch to new branch
```

### "I need to update my branch with main"

```bash
git checkout main
git pull
git checkout my-branch
git merge main                 # Or: git rebase main
```

### "I have merge conflicts"

```bash
# Git marks conflicts in files like this:
# <<<<<<< HEAD
# your code
# =======
# their code
# >>>>>>> branch-name

# Edit the file to resolve, then:
git add resolved-file.py
git commit -m "resolve merge conflicts"
```

### "I want to see what a teammate changed"

```bash
gh pr diff 42                  # See PR diff
git log --oneline --graph      # Visual branch history
git blame filename.py          # Who wrote each line
```

---

## 9. Quick Reference

```
SETUP:
  git config --global user.name "Name"
  git config --global user.email "email"
  gh auth login

NEW PROJECT:
  git init && gh repo create name --public --source=. --push

DAILY:
  git status
  git add files
  git commit -m "message"
  git push

BRANCHES:
  git checkout -b feature/name
  git push -u origin feature/name
  gh pr create

UNDO:
  git checkout -- file         (discard file changes)
  git reset --soft HEAD~1      (undo commit, keep changes)

INFO:
  git status / git diff / git log --oneline
  gh pr list / gh issue list / gh run list
```

---

Docs: https://docs.github.com
GitHub CLI: https://cli.github.com
