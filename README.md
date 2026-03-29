# Claude Code Starter Kit

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue.svg)](#requirements)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Anthropic-blueviolet.svg)](https://claude.ai/code)

> **Go from zero to AI-assisted coding in one click.** No experience required.

---

## What Is Claude Code?

Claude Code is an **AI assistant that writes, edits, and runs code for you** using plain English. It lives in your terminal, desktop app, VS Code, or browser.

```
You say:  "build me a REST API with user authentication"
Claude:    Creates files, writes code, installs dependencies, runs tests.
           You review and approve each step.
```

**Think of it as a senior developer sitting next to you 24/7** -- one that never gets tired, knows every language, and can read your entire codebase in seconds.

### Who This Is For

- **Complete beginners** who have never opened a terminal
- **Developers** who want to 10x their speed with AI
- **Career transitioners** learning to code
- **Teams** looking to standardize AI-assisted workflows
- **Anyone curious** about the future of software development

---

## What's Inside

| File / Folder | Description | Start Here If... |
|---|---|---|
| [`setup-claude-code.bat`](setup-claude-code.bat) | **One-click installer** -- installs Git, Node.js, GitHub CLI, and Claude Code | You want to get set up fast |
| [`claude-code-guide.md`](claude-code-guide.md) | **Complete guide** -- from "what's a terminal?" to agent teams, industry best practices, and social media tips | You want to learn everything |
| [`github-guide.md`](github-guide.md) | **GitHub from zero** -- setup, cloning, branches, PRs, and Claude Code integration | You're new to GitHub/Git |
| [`templates/`](templates/) | **CLAUDE.md templates** -- copy-paste configs for React, Python, Next.js, or any project | You're starting a project |
| [`examples/`](examples/) | **Ready-to-use configs** -- settings.json, MCP (integrations that give Claude extra abilities), agents, and slash commands | You want to skip manual setup |

---

## Quick Start (5 Minutes)

### 1. Get an Anthropic Account

Go to [claude.ai](https://claude.ai) and sign up. You need a paid plan:

| Plan | Price | Best For |
|---|---|---|
| **Pro** | $20/mo | Learning, casual use |
| **Max 5x** | $100/mo | Daily professional use |
| **Max 20x** | $200/mo | Power users |
| **Teams** | $30/user/mo | Organizations |

### 2. Get This Starter Kit

> **You need two accounts** for the full setup (they are separate companies):
> 1. **Anthropic account** at [claude.ai](https://claude.ai) -- this is what you pay for (the AI)
> 2. **GitHub account** at [github.com](https://github.com) -- this is where your code lives online (free)

**Option A -- Download ZIP (easiest, no tools needed):**
1. Click the green **Code** button at the top of this page
2. Click **Download ZIP**
3. Double-click the downloaded ZIP file, then click **Extract all**
4. Choose a location like your Documents folder
5. Open the extracted folder -- you should see `setup-claude-code.bat`

**Option B -- Clone with Git (if you already have Git installed):**
```bash
git clone https://github.com/parthalon025/claude-code-starter.git
cd claude-code-starter
```

**Option C -- Clone with GitHub CLI (if you already have `gh`):**
```bash
gh repo clone parthalon025/claude-code-starter
cd claude-code-starter
```

### 3. Run the Installer

1. Find `setup-claude-code.bat` in the folder you downloaded
2. Right-click it > choose **Run as administrator**
   - Windows will show a security prompt ("Do you want to allow this app to make changes?") -- click **Yes**. This gives the installer permission to install programs. It is safe.
3. Press any key when prompted
4. Wait ~2-5 minutes (requires ~1 GB of free disk space)

**What it installs:**

| Tool | Why You Need It |
|---|---|
| **Git** | Tracks code changes, used by Claude for version control |
| **Node.js** | JavaScript runtime that Claude Code is built on |
| **GitHub CLI** | Create repos and PRs from terminal, enables Claude's GitHub integration |
| **Claude Code** | The AI coding assistant -- the whole point |

Safe to run multiple times -- skips anything already installed.

### 4. Post-Install Setup

**Important:** Close the installer window and ALL other terminals. Then open a brand new one:
- Press the **Windows key** on your keyboard, type **Terminal**, press **Enter**
- This is necessary because your computer needs a fresh terminal to find the tools we just installed

Now type these commands **one at a time** (lines starting with `#` are just notes -- don't type those):

```bash
# Verify Claude Code installed correctly
claude --version
claude doctor
```

```bash
# Configure Git with YOUR name and email (replace the placeholder text)
git config --global user.name "Your Actual Name"
git config --global user.email "your-actual-email@example.com"
```

Log in to GitHub (interactive -- follow the prompts):
```bash
gh auth login
```
It will ask you several questions. Use arrow keys to pick and press Enter:
- "Where do you use GitHub?" -- select **GitHub.com**
- "Preferred protocol?" -- select **HTTPS**
- "How would you like to authenticate?" -- select **Login with a web browser**
- It shows a code. Press Enter, paste the code in the browser that opens, click **Authorize**

Finally, launch Claude Code:
```bash
claude
```
A browser window opens. Sign in with your **Anthropic** account (not GitHub -- these are different accounts).

### 5. Try It Out

```bash
mkdir my-first-project && cd my-first-project
claude
```

Then type:
```
create a webpage with a button that counts how many times you click it
```

**Congratulations -- you're now using AI-assisted coding.**

### 6. Let Claude Set Up Everything Else

Once Claude Code is running, **use it to configure itself.** Don't manually edit config files:

```
> set up the GitHub MCP server so you can create PRs for me
> enable all the official plugins
> create a CLAUDE.md for this project based on what you see
> configure your permissions to auto-approve git commands
```

Or point it at this starter kit's examples:
```
> look at the examples folder and set up settings, MCP servers, agents, and commands for me
```

See the [full guide](claude-code-guide.md#the-golden-rule-let-claude-do-it-for-you) for more.

---

## Claude Code vs Regular Claude Chat

This confuses everyone: **they are different products.** Same AI brain, very different abilities.

| | Claude Chat (claude.ai) | Claude Code |
|---|---|---|
| **What it is** | Chatbot in your browser | Coding agent on your machine |
| **Reads your files** | No (you paste code in) | Yes (reads your entire project) |
| **Edits your files** | No (gives you code to copy) | Yes (edits directly) |
| **Runs commands** | No | Yes (git, npm, python, etc.) |
| **Creates commits/PRs** | No | Yes |
| **Runs tests** | No | Yes |

**Claude Chat** = texting a smart friend about your code.
**Claude Code** = that friend sitting at your computer with your permission.

> See the [full comparison](claude-code-guide.md#05-claude-code-vs-claude-chat----whats-the-difference) in the Claude Code Guide, including how it compares to Copilot, Cursor, and Windsurf.

## All the Ways to Use Claude Code

| Platform | How to Get It | Can Edit Files | Can Run Commands | Headless/CI | Best For |
|---|---|---|---|---|---|
| **Terminal (CLI)** | `setup-claude-code.bat` | Yes | Yes | Yes | Power users, automation |
| **Desktop App** | [claude.ai/download](https://claude.ai/download) | Yes | Yes | No | Beginners, visual comfort |
| **VS Code** | Extensions > "Claude Code" | Yes | Yes | No | VS Code developers |
| **JetBrains** | Plugins > "Claude Code" | Yes | Yes | No | IntelliJ/PyCharm users |
| **Web App** | [claude.ai/code](https://claude.ai/code) | Yes (cloud) | Yes (sandbox) | No | Quick tasks, no install |

All versions use the same AI. The CLI is the most powerful and most customizable.

## AI Models

Claude Code supports multiple models. Pick based on your task:

| Model | Speed | Intelligence | Best For |
|---|---|---|---|
| **Opus 4.6** | Slower | Highest | Complex tasks, architecture, hard bugs |
| **Sonnet 4.6** | Fast | Very High | Daily coding, most tasks |
| **Haiku 4.5** | Fastest | Good | Simple edits, quick questions |

Set in `settings.json`: `"model": "opus[1m]"` -- or switch with `/fast` during a session. See the [full model guide](claude-code-guide.md#models) for details.

## Plugins and Skills

Plugins add superpowers to Claude Code. Enable in `settings.json`:

| Plugin | What It Adds | Key Skill |
|---|---|---|
| **Context7** | Live library docs (always up-to-date) | Automatic |
| **Code Review** | Code quality analysis | `/simplify` |
| **PR Review Toolkit** | Multi-dimensional PR reviews | `/review-pr` |
| **Frontend Design** | Production-grade UI generation | `/frontend-design` |
| **Playwright** | Browser automation and testing | Automatic |
| **Semgrep** | Security vulnerability scanning | `/setup-semgrep-plugin` |

See the [full plugins guide](claude-code-guide.md#8-plugins) and [skills reference](claude-code-guide.md#85-skills) for setup and examples.

---

## Guide Highlights

### From the [Claude Code Guide](claude-code-guide.md)

The complete guide covers everything in this order:

| Section | What You'll Learn |
|---|---|
| **0. Absolute Basics** | What a terminal is, how to navigate folders |
| **0.5. Claude Code vs Chat** | How Claude Code differs from regular Claude, Copilot, Cursor |
| **1. Getting Started** | Install, pricing, all platforms, cloning |
| **2. First Session** | Step-by-step walkthrough building a real app |
| **3. CLAUDE.md** | The #1 thing that makes Claude Code work well |
| **4. Settings + Models** | Permissions, allow-lists, model selection |
| **5. MCP Servers** | GitHub, web search, docs, browser automation |
| **6. Custom Agents** | Specialist AI personas for specific tasks |
| **7. Slash Commands** | Reusable prompts you can run with /name |
| **8. Plugins** | Context7, code review, security scanning, frontend design |
| **8.5. Skills** | Built-in skills, plugin skills, team skills |
| **9. Agent Teams** | Multiple AIs working in parallel |
| **10. Instincts** | Behavioral rules that shape how Claude works |
| **11. Memory** | Cross-session persistence |
| **12. Hooks** | Auto-run commands on events |
| **13. Headless/CI** | Use Claude in scripts and pipelines |
| **14. Workflow Examples** | Real bug fixes, features, and reviews |
| **15. Best Practices** | Security, collaboration, performance |
| **16. Social Media Tips** | Share your work, build your brand |

### From the [GitHub Guide](github-guide.md)

| Section | What You'll Learn |
|---|---|
| **1. Setup** | Account, Git config, GitHub CLI, auth |
| **2. Core Concepts** | Repos, commits, branches, PRs (explained simply) |
| **3. Cloning** | How to get code from GitHub to your computer |
| **4. Essential Commands** | Daily workflow, branches, undoing mistakes |
| **5. GitHub CLI** | Repos, PRs, issues, CI/CD from terminal |
| **6. GitHub + Claude Code** | MCP setup, what Claude can do with GitHub |
| **7. .gitignore** | What NOT to track (secrets, deps, builds) |
| **8. Commit Messages** | Conventional Commits format and examples |
| **9. Common Scenarios** | Wrong branch, merge conflicts, leaked secrets |
| **10. Profile Optimization** | Make your GitHub profile shine for job hunting |

---

## Power User Quick Reference

> Skip this section on your first read -- come back when you're comfortable with the basics.

`~` means your home folder. On Windows that is `C:\Users\YourName`. The pipe operator `|` sends output from one command as input to another.

```
INSTALL:    setup-claude-code.bat (or irm https://claude.ai/install.ps1 | iex)
START:      cd your-project && claude
ONE-SHOT:   claude "your task here"
PIPE:       git diff | claude "review this"
HEADLESS:   claude --print "analyze this code"

CONFIG FILES (~ = C:\Users\YourName on Windows):
  ~/.claude/settings.json    Settings, permissions, plugins
  ~/.claude/.mcp.json        MCP (Model Context Protocol) server integrations
  ~/.claude/CLAUDE.md        Global instructions (all projects)
  ./CLAUDE.md                Project instructions (this repo)
  ~/.claude/agents/          Custom specialist agents
  ~/.claude/commands/        Reusable slash commands
  ~/.claude/instincts/       Behavioral rules (YAML)

INSIDE CLAUDE CODE:
  /help          All commands
  /clear         Reset conversation
  /compact       Free up context space
  /cost          Token usage
  /commit        Create a git commit
  Shift+Tab      Cycle permission modes
  Ctrl+C         Cancel current action
```

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `claude: command not found` | Close all terminals, open a new one. Re-run installer if needed. |
| Script says "winget not found" | Install "App Installer" from Microsoft Store, re-run |
| "Not running as administrator" | Right-click .bat > Run as administrator |
| Auth fails after install | Run `claude /login` |
| Antivirus blocks install | Temporarily disable real-time protection |
| Corporate firewall | Ask IT to whitelist `claude.ai`, `registry.npmjs.org`, `github.com` |
| `gh: command not found` | Close terminal, reopen. Run `winget install GitHub.cli` |
| Cloning fails (private repo) | Run `gh auth login` first |

```bash
claude doctor    # Diagnose everything automatically
```

---

## FAQ

**Is Claude Code free?**
No. You need a paid Anthropic plan ($20/mo minimum). The tools it installs (Git, Node, GitHub CLI) are free.

**Is this safe for my work computer?**
The script installs well-known tools via Microsoft's package manager. Check with IT if you have restrictions.

**Mac or Linux?**
The .bat script is Windows-only. On Mac/Linux: `curl -fsSL https://claude.ai/install.sh | sh`

**Already have Git/Node?**
The script detects existing installs and skips them. Run it multiple times safely.

**Do I need to know how to code?**
No. Claude Code teaches you as you go. Start with "create a simple hello world in Python."

**What do I need to clone a repo?**
Git installed + the repo URL. For private repos, also GitHub CLI authenticated (`gh auth login`).

---

## Contributing

Found something missing or confusing? Open an issue or PR. This kit is meant to help beginners -- if you struggled with a step, others will too.

## License

[MIT](LICENSE) -- use this however you want.
