# GitHub -- Complete Beginner's Guide

> GitHub is where developers store code, collaborate, and track changes. If Claude Code is your AI assistant, GitHub is where your code lives online. This guide assumes zero prior experience.

---

## Why Use GitHub?

| Reason | What It Means | Real-World Example |
|---|---|---|
| **Backup** | Your code is saved in the cloud | Laptop dies? Code survives. |
| **Version history** | Every change is tracked | Undo anything, see who changed what |
| **Collaboration** | Share code, review changes | Work with teammates or open-source contributors |
| **Portfolio** | Employers and clients can see your work | Your GitHub profile IS your coding resume |
| **CI/CD** | Auto-run tests and deploy apps | Push code, it tests and deploys automatically |
| **Claude Code integration** | Claude can create PRs, manage issues, push code | Full AI-assisted workflow without leaving terminal |

---

## 1. Setup (One Time)

### Create a GitHub Account

1. Go to [github.com](https://github.com)
2. Click **Sign up** (free tier is enough to start)
3. Choose a professional username (this becomes your public profile URL)
4. Verify your email

**Username tips:** Use your real name or a professional handle. Avoid numbers and underscores if possible. This shows up on every PR and contribution.

### Install Git

Git is the version control tool. GitHub is the website that hosts Git repos.

```powershell
winget install Git.Git
```

> Or run the included `setup-claude-code.bat` which installs everything.

Close and reopen your terminal after installing.

### Configure Git (First Time Only)

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Use the same email you used for GitHub. This tags your commits with your identity.

### Install GitHub CLI (Highly Recommended)

```powershell
winget install GitHub.cli
```

Then authenticate:
```bash
gh auth login
# Follow prompts:
#   > GitHub.com
#   > HTTPS
#   > Login with a web browser
#   > Press Enter, paste the code in your browser
```

**Why the CLI?** It lets you create repos, PRs, and issues from the terminal without opening a browser. Claude Code uses it for GitHub integration.

### HTTPS vs SSH (Don't Worry About This Yet)

| Method | When to Use |
|---|---|
| **HTTPS** (default) | Works everywhere, simpler setup. Use this. |
| **SSH** | Required by some corporate environments. Set up later if needed. |

The GitHub CLI handles authentication for you. If you followed the steps above, you're using HTTPS and you're good.

---

## 2. Core Concepts (Explained Simply)

### Repository (repo)
A project folder tracked by Git. Think of it as a folder on your computer that also lives on GitHub.

### Clone
Copying a repo from GitHub to your computer. Like downloading a folder, but with full history.

### Commit
A snapshot of your code at a point in time. Like a save point in a video game. Each commit has a message explaining what changed.

### Branch
A parallel version of your code. Work on features without affecting the main code.

```
main ────●────●────●────●────    (stable, production code)
                \
feature          ●────●────●     (your new feature, isolated)
                              \
                    merge ─────● (feature goes into main)
```

### Pull Request (PR)
A request to merge your branch into main. This is where code review happens -- teammates (or Claude) review your changes before they go live.

### Remote
The copy of your repo on GitHub (vs the copy on your computer). When you `push`, you send your local changes to the remote. When you `pull`, you download remote changes to your machine.

---

## 3. Getting Code From GitHub (Cloning)

### What you need

- Git installed (check with `git --version`)
- A terminal open
- The repo URL

### Clone a public repo

```bash
# Using GitHub CLI (easiest)
gh repo clone username/repo-name

# Using git directly
git clone https://github.com/username/repo-name.git

# Then enter the folder
cd repo-name
```

### Clone a private repo

For private repos, you need to be authenticated:

```bash
# Make sure you're logged in
gh auth status

# If not logged in:
gh auth login

# Then clone
gh repo clone username/private-repo
```

### Clone this starter kit

```bash
gh repo clone parthalon025/claude-code-starter
cd claude-code-starter
```

Or with git:
```bash
git clone https://github.com/parthalon025/claude-code-starter.git
cd claude-code-starter
```

### Download without Git (alternative)

If you don't have Git installed yet:
1. Go to the repo on GitHub
2. Click the green **Code** button
3. Click **Download ZIP**
4. Extract to a folder you'll remember
5. Open a terminal and `cd` into that folder

### What "forking" means

A **fork** is your own copy of someone else's repo on GitHub. Use it when you want to:
- Make changes to someone else's project
- Propose improvements via a PR back to the original

```bash
# Fork and clone in one step
gh repo fork username/repo-name --clone
```

---

## 4. Essential Commands

### Start a new project from scratch

```bash
# Create folder and initialize
mkdir my-project && cd my-project
git init

# Create repo on GitHub AND push
gh repo create my-project --public --source=. --push
```

### Daily workflow

```bash
# 1. Check what changed
git status

# 2. Stage changes (pick what to include in the commit)
git add file1.py file2.py        # Specific files (safer)
git add .                        # Everything (be careful)

# 3. Commit (save a snapshot with a message)
git commit -m "add user login endpoint"

# 4. Push to GitHub (upload your changes)
git push
```

### Branch workflow (for features)

```bash
# Create and switch to a new branch
git checkout -b feature/dark-mode

# ... make your changes ...

# Stage, commit, push
git add .
git commit -m "feat: add dark mode toggle"
git push -u origin feature/dark-mode

# Create a pull request
gh pr create --title "Add dark mode" --body "Adds toggle in settings page"
```

### See what changed

```bash
git status           # Which files changed
git diff             # What lines changed (before staging)
git diff --staged    # What lines changed (after staging)
git log --oneline    # Commit history (compact)
git log --oneline --graph  # Visual branch history
```

### Undo mistakes

```bash
# Undo changes to a specific file (before committing)
git checkout -- filename.py

# Undo the last commit (keep the changes in your files)
git reset --soft HEAD~1

# Undo the last commit (discard the changes) -- DESTRUCTIVE
git reset --hard HEAD~1
```

---

## 5. GitHub CLI (gh) -- The Power Tool

### Repos

```bash
gh repo create my-app --public     # Create new public repo
gh repo create my-app --private    # Create new private repo
gh repo clone user/repo            # Clone a repo
gh repo view                       # View repo info
gh repo list                       # List your repos
gh repo delete user/repo           # Delete a repo (careful!)
```

### Pull Requests

```bash
gh pr create                       # Create PR (interactive prompts)
gh pr create --title "Title" --body "Description"  # One-liner
gh pr list                         # List open PRs
gh pr view 42                      # View PR #42
gh pr checkout 42                  # Switch to PR #42's branch
gh pr merge 42                     # Merge PR #42
gh pr review 42 --approve          # Approve PR #42
gh pr diff 42                      # See the diff
```

### Issues

```bash
gh issue create                    # Create issue (interactive)
gh issue create --title "Bug" --body "Details"  # One-liner
gh issue list                      # List open issues
gh issue view 15                   # View issue #15
gh issue close 15                  # Close issue #15
```

### Actions (CI/CD)

```bash
gh run list                        # List recent workflow runs
gh run view 12345                  # View specific run details
gh run watch 12345                 # Watch run in real-time
```

---

## 6. GitHub + Claude Code

### Enable GitHub MCP Server

Add to `~/.claude/.mcp.json`:
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

### What you can tell Claude to do

```
> create a PR for this branch
> list open issues on this repo
> review PR #42 for bugs and security issues
> close issue #15 with a comment saying it's fixed
> check if CI passed on the latest push
> create an issue for the bug we just found
> what PRs are waiting for review?
```

### Example: Full bug fix workflow

```bash
cd my-project
claude

> I'm getting an error on the /users page when the list is empty.
> The error says "Cannot read property 'map' of undefined"

# Claude reads your code, finds the bug, explains it, and fixes it

> run the tests

# Claude runs your test suite, everything passes

> /commit

# Claude stages changes and writes a clear commit message

> create a PR with a summary of the fix

# Claude pushes the branch and creates a PR on GitHub with:
#   - Title describing the fix
#   - Body explaining the root cause and solution
#   - Test results
```

---

## 7. .gitignore -- What NOT to Track

Create a `.gitignore` file in your project root. This tells Git which files to ignore.

```
# Dependencies (huge folders, recreated from package.json)
node_modules/
venv/
__pycache__/

# Environment/secrets (NEVER commit these)
.env
.env.local
*.key
credentials.json
*.pem

# Build output (recreated by build command)
dist/
build/
*.pyc

# OS files (clutter)
.DS_Store
Thumbs.db
Desktop.ini

# IDE settings (personal preference)
.vscode/settings.json
.idea/
```

**Rule of thumb:** Never commit secrets, dependencies, or build output.

---

## 8. Good Commit Messages

### Format (Conventional Commits)

```
type: short description (under 72 characters)

Optional longer explanation.
Explain WHY, not WHAT (the diff shows what).
```

### Types

| Type | When to Use | Example |
|---|---|---|
| `feat:` | New feature | `feat: add dark mode toggle` |
| `fix:` | Bug fix | `fix: prevent crash on empty user list` |
| `docs:` | Documentation | `docs: add API endpoint docs` |
| `refactor:` | Code restructuring | `refactor: extract email validation` |
| `test:` | Tests | `test: add payment processing tests` |
| `chore:` | Maintenance | `chore: update React to 18.3` |
| `style:` | Formatting only | `style: fix indentation in auth.ts` |
| `perf:` | Performance | `perf: cache user queries` |

### Pro tips

- **Claude writes great commit messages** -- use `/commit` and it generates one from the diff
- Use imperative mood: "add" not "added", "fix" not "fixed"
- First line under 72 characters
- Reference issues: `fix: resolve login timeout (#42)`

---

## 9. Common Scenarios

### "I committed to the wrong branch"

```bash
git branch fix-branch          # Create branch at current commit
git reset --soft HEAD~1        # Remove commit from current branch (keep changes)
git stash                      # Stash the changes temporarily
git checkout fix-branch        # Switch to correct branch
git stash pop                  # Apply the stashed changes
git commit -m "your message"   # Commit on the right branch
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

# Option A: Fix manually -- edit the file, remove the markers
# Option B: Ask Claude!
claude "help me resolve the merge conflicts in this file"

# Then:
git add resolved-file.py
git commit -m "resolve merge conflicts"
```

### "I want to undo everything and start fresh"

```bash
# Discard all uncommitted changes (CAREFUL -- this is permanent)
git checkout .

# Or go back to a specific commit
git log --oneline             # Find the commit hash
git reset --hard abc123       # Reset to that commit
```

### "I accidentally committed a secret"

```bash
# If you haven't pushed yet:
git reset --soft HEAD~1       # Undo commit
# Remove the secret from the file
# Add file to .gitignore
git add .gitignore && git commit -m "chore: add gitignore"

# If you already pushed: the secret is compromised
# 1. Rotate the secret immediately
# 2. Use git filter-branch or BFG Repo Cleaner to remove from history
```

---

## 10. GitHub Profile Optimization (For Job Seekers)

Your GitHub profile is your coding resume. Here's how to make it stand out.

### Create a profile README

Create a repo with your exact username (e.g., `parthalon025/parthalon025`) and add a `README.md`. It appears on your profile page.

```bash
claude "create a GitHub profile README that highlights:
- My background in [your field]
- Technologies I work with
- Current projects
- How to reach me
Make it clean and professional with badges."
```

### Pin your best repos

Go to your profile > click "Customize your pins" > select 6 repos that showcase your best work.

### Green squares matter

The contribution graph shows your activity. Consistent daily commits (even small ones) look better than sporadic bursts.

### Write good READMEs

Every repo should have a README with:
1. What it does (one sentence)
2. Screenshot or demo GIF
3. How to install and run it
4. Tech stack used
5. What you learned (for portfolio projects)

---

## Quick Reference

```
SETUP:
  git config --global user.name "Name"
  git config --global user.email "email"
  gh auth login

CLONE:
  gh repo clone user/repo
  git clone https://github.com/user/repo.git

NEW PROJECT:
  git init && gh repo create name --public --source=. --push

DAILY:
  git status / git add files / git commit -m "msg" / git push

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
