# Claude Code -- Complete Guide: Zero to Expert

> An AI coding assistant by Anthropic that lives in your terminal. You type what you want in plain English, and it writes code, edits files, runs commands, and builds entire projects. This guide takes you from "what's a terminal?" to running multi-agent teams.

---

## 0. Absolute Basics (If You've Never Coded)

### What is a terminal?

A terminal (also called command prompt, shell, or console) is a text-based way to talk to your computer. Instead of clicking icons, you type commands.

**How to open one on Windows:**
- Press `Windows key`, type **Terminal**, press `Enter`
- Or press `Windows key + R`, type `cmd`, press `Enter`

**Basic commands you'll use:**

| Command | What It Does | Example |
|---|---|---|
| `cd folder` | Go into a folder | `cd Documents` |
| `cd ..` | Go up one folder | `cd ..` |
| `mkdir name` | Create a new folder | `mkdir my-project` |
| `dir` | List files in current folder | `dir` |
| `cls` | Clear the screen | `cls` |
| `command1 \| command2` | Send output of command1 into command2 (called "piping") | `git diff \| claude "review"` |

**Special symbols you'll see in this guide:**
- `~` means your home folder. **On Windows, that is `C:\Users\YourName`**. When the guide says `~/.claude/`, it means `C:\Users\YourName\.claude\`. You can open it in File Explorer by typing `%USERPROFILE%` in the address bar.
- `#` at the start of a line means it is a comment (a note for humans, not a command). Don't type those lines.
- Text in `[brackets]` is a placeholder -- replace it with your actual value.

**Example: Navigate to your Documents and create a project folder:**
```bash
cd C:\Users\YourName\Documents
mkdir my-first-project
cd my-first-project
```

### What is Claude Code actually doing?

When you type a request like "create a login page", Claude Code:

1. **Reads** your project files to understand context
2. **Plans** what to do (you can review the plan)
3. **Writes** new files or edits existing ones
4. **Runs** commands (like starting a server or running tests)
5. **Shows** you what it did (you approve or reject changes)

You stay in control. It asks permission before making changes.

---

## 0.5. Claude Code vs Claude Chat -- What's the Difference?

This is the #1 thing that confuses people. **Claude Code and the regular Claude chat (claude.ai) are different products** that share the same AI brain.

### The short version

| | Claude Chat (claude.ai) | Claude Code |
|---|---|---|
| **What it is** | A chatbot in your browser | A coding agent on your machine |
| **Can read your files** | No (you paste code in) | Yes (reads your entire project) |
| **Can edit your files** | No (gives you code to copy) | Yes (edits files directly) |
| **Can run commands** | No | Yes (git, npm, python, etc.) |
| **Can create commits/PRs** | No | Yes |
| **Can install packages** | No | Yes |
| **Can run your tests** | No | Yes |
| **Can search the web** | Yes (built-in) | Yes (via MCP servers) |
| **Can make images** | No | No |
| **Available on** | Browser, iOS, Android, Desktop | Terminal, Desktop, VS Code, JetBrains, Web |

### Think of it this way

**Claude Chat** = texting a smart friend. You describe your code, they suggest solutions, you copy-paste back and forth.

**Claude Code** = that same friend sitting at your computer, hands on keyboard, with your permission. They read the code, make changes, run tests, and show you what they did.

### The five ways to use Claude Code

Claude Code comes in multiple forms. They all use the same AI and have the same core abilities. The difference is the interface.

#### 1. Terminal / CLI (what this kit installs)

```
C:\Users\you\project> claude
> fix the login bug on line 42 of auth.ts
```

**What it can do:**
- Read and edit any file in your project
- Run any shell command (git, npm, python, docker, etc.)
- Create commits, branches, and pull requests
- Search the web and fetch documentation (via MCP)
- Coordinate multiple AI agents in parallel (agent teams)
- Run headless in CI/CD pipelines
- Pipe input/output with other tools
- Use custom agents, slash commands, memory, hooks, instincts

**Pros:**
- Most powerful -- full access to every feature
- Fastest workflow (no mouse needed)
- Works in CI/CD and automation scripts
- Pipe context in: `git diff | claude "review"`
- One-shot mode: `claude "add tests to auth.ts"`
- Customizable: agents, hooks, instincts, memory

**Cons:**
- Requires comfort with a terminal
- No visual file tree (you navigate by typing)
- Steeper learning curve for non-developers

**Best for:** Developers, power users, automation, CI/CD pipelines

#### 2. Desktop App (Windows and Mac)

Download from [claude.ai/download](https://claude.ai/download)

**What it can do:**
Everything the CLI does, plus:
- Visual interface with a file sidebar
- Click to open files instead of typing paths
- Drag and drop files into the conversation
- System tray integration

**Pros:**
- Same power as CLI with a friendlier interface
- Visual file browser
- Easier for beginners to get started
- No terminal knowledge required

**Cons:**
- Can't pipe input/output
- Can't run headless or in CI/CD
- Slightly slower than typing commands

**Best for:** Beginners, visual learners, people who prefer GUIs

#### 3. VS Code Extension

Install from VS Code Extensions: search "Claude Code"

**What it can do:**
Everything the CLI does, plus:
- Lives in your editor sidebar
- Sees your open files and active editor
- Inline code suggestions
- Works alongside your existing extensions

**Pros:**
- No context switching -- Claude is right in your editor
- Sees what file you're editing
- Integrates with VS Code's built-in terminal
- Familiar interface for VS Code users

**Cons:**
- Tied to VS Code (can't use from raw terminal)
- Extension updates may lag behind CLI
- Slightly less flexibility than standalone CLI

**Best for:** Developers who live in VS Code

#### 4. JetBrains Plugin

Install from JetBrains Plugins: search "Claude Code"

**What it can do:**
Same as VS Code extension, but for JetBrains IDEs:
- IntelliJ IDEA, PyCharm, WebStorm, GoLand, Rider, etc.

**Pros:**
- Same integration benefits as VS Code version
- Works in the IDE you already use
- Access to JetBrains' code analysis alongside Claude

**Cons:**
- Same limitations as VS Code extension

**Best for:** JetBrains IDE users

#### 5. Web App (claude.ai/code)

Go to [claude.ai/code](https://claude.ai/code) -- no install needed

**What it can do:**
- Connect to GitHub repos
- Read and edit code in the browser
- Run commands in a cloud sandbox
- Create commits and PRs

**Pros:**
- Zero install -- works from any browser
- Good for quick tasks on other people's machines
- Can work with GitHub repos directly

**Cons:**
- Limited to cloud sandbox (can't access local files)
- Can't use MCP servers
- Can't use custom agents/hooks/instincts
- Slower than local CLI for large projects
- Requires internet connection

**Best for:** Quick tasks, shared computers, trying Claude Code before installing

### How is Claude Code different from Cursor, Copilot, and Windsurf?

| Feature | Claude Code | GitHub Copilot | Cursor | Windsurf |
|---|---|---|---|---|
| **AI Model** | Claude (Anthropic) | GPT-4 / Claude / Gemini | GPT-4 / Claude | GPT-4 / Claude |
| **Form factor** | CLI + IDE + Desktop + Web | IDE plugin | Full IDE (fork of VS Code) | Full IDE (fork of VS Code) |
| **Runs shell commands** | Yes | Limited | Yes | Yes |
| **Agent teams** | Yes (multiple AIs in parallel) | No | No | No |
| **Custom agents** | Yes (markdown files) | No | No | No |
| **Headless / CI mode** | Yes | No | No | No |
| **Memory across sessions** | Yes | No | No | Limited |
| **Hooks and instincts** | Yes | No | No | No |
| **MCP integrations** | Yes | No | Limited | Limited |
| **Open pricing** | Anthropic plan ($20-200/mo) | $10-39/mo | $20/mo + API | Free + $10-40/mo |

**Key differentiator:** Claude Code is the only tool that works as a standalone CLI, supports multi-agent teams, and can run fully headless in CI/CD pipelines. It's also the only one with a deep customization system (agents, instincts, hooks, memory).

### Which should I start with?

```
Never used a terminal?          → Desktop App or VS Code Extension
Already use VS Code?            → VS Code Extension
Already use JetBrains?          → JetBrains Plugin
Want maximum power?             → Terminal CLI (this kit)
Just want to try it quickly?    → Web App (claude.ai/code)
Want to automate workflows?     → Terminal CLI (only option)
```

Most power users end up on the CLI eventually, but there's no wrong starting point. The AI is identical across all versions.

---

## 1. Getting Started

### Prerequisites

| Requirement | How to Get It | Why You Need It |
|---|---|---|
| Windows 10+ or 11 | You probably have this | Claude Code runs on Windows |
| Git for Windows | `winget install Git.Git` | Tracks code changes |
| Node.js LTS | `winget install OpenJS.NodeJS.LTS` | Claude Code runs on Node |
| GitHub CLI | `winget install GitHub.cli` | Create repos/PRs from terminal |
| Anthropic Account | Sign up at claude.ai | Required to use Claude Code |

> **Easiest path:** Run the included `setup-claude-code.bat` to install everything automatically.

### Pricing

| Plan | Price | Usage Limits | Best For |
|---|---|---|---|
| Pro | $20/mo | Moderate | Learning, side projects |
| Max 5x | $100/mo | 5x Pro limits | Daily professional use |
| Max 20x | $200/mo | 20x Pro limits | Power users, heavy coding |
| Teams | $30/user/mo | Team features | Organizations |
| Enterprise | Custom | Custom | Large companies |

### Install Options

**Option A -- One-click script (recommended for Windows):**
Run the included `setup-claude-code.bat` as administrator.

**Option B -- Official installer:**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**Option C -- Winget:**
```powershell
winget install Anthropic.ClaudeCode
```

**Option D -- Mac/Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | sh
```

### Other Platforms (Same AI, Different Interface)

| Platform | Install | Notes |
|---|---|---|
| Desktop App | [claude.ai/download](https://claude.ai/download) | Visual interface, great for beginners |
| VS Code | Extensions > Search "Claude Code" | Integrates into your editor sidebar |
| JetBrains | Plugins > Search "Claude Code" | IntelliJ, PyCharm, WebStorm, etc. |
| Web App | [claude.ai/code](https://claude.ai/code) | No install needed, works in browser |

### Verify and Log In

```bash
claude --version       # Check install
claude doctor          # Health check -- diagnoses problems
claude                 # Start -- browser opens for login
```

### Cloning This Starter Kit (If You Haven't Already)

If someone shared this repo with you, here's how to get it on your computer:

**Option A -- With Git (recommended):**
```bash
git clone https://github.com/parthalon025/claude-code-starter.git
cd claude-code-starter
```

**Option B -- Download ZIP:**
1. Go to the repo on GitHub
2. Click the green **Code** button
3. Click **Download ZIP**
4. Extract the ZIP to a folder you'll remember (like `C:\Users\YourName\Documents`)
5. Open a terminal and `cd` into that folder

**What you need to clone a repo:**
- Git installed (`winget install Git.Git` or run the setup script)
- A terminal open
- The repo URL (looks like `https://github.com/username/repo-name.git`)

For private repos, you also need GitHub CLI authenticated:
```bash
gh auth login
# Then clone with: gh repo clone username/repo-name
```

---

## 2. First Session -- A Complete Walkthrough

```bash
mkdir my-project && cd my-project
claude
```

### Step-by-step first conversation

Try these in order. Each builds on the last:

```
> create a Python Flask app with /hello and /health endpoints
```
*Claude creates the file, explains what it did, and waits for you.*

```
> explain what you just wrote
```
*Claude walks you through the code line by line.*

```
> add error handling and logging
```
*Claude edits the file in place. You see the diff before it's applied.*

```
> add a /users endpoint that returns a list of sample users as JSON
```
*Claude adds to the existing file.*

```
> run the server and test the endpoints with curl
```
*Claude starts the Flask server and tests it.*

```
> /commit
```
*Claude creates a git commit with a well-written message.*

### What you just did

In ~5 minutes with zero code knowledge, you:
- Created a working REST API
- Added error handling
- Tested it
- Committed it to version control

### Key commands inside Claude Code

| Command | What It Does | When to Use It |
|---|---|---|
| `/help` | List all available commands | When you're lost |
| `/clear` | Reset conversation | When context gets confused |
| `/compact` | Compress conversation to save space | When responses slow down |
| `/cost` | Show token usage this session | To track spending |
| `/commit` | Create a git commit | After finishing a piece of work |
| `Shift+Tab` | Cycle permission modes | To speed up or lock down |
| `Ctrl+C` | Cancel current action | When it's going wrong |
| `Escape` | Clear current input | When you want to retype |
| `exit` | Quit Claude Code | When you're done |

### One-shot mode (no interactive session)

Run a single task and exit:

```bash
# Direct task
claude "add type hints to main.py"

# Pipe input (incredibly powerful)
cat error.log | claude "explain this error and suggest a fix"
git diff | claude "review this code for bugs"
git log --oneline -20 | claude "summarize recent changes"

# Chain with other tools
claude "list all TODO comments in this project" > todos.txt
```

### The golden rule: Let Claude do it for you

Once Claude Code is installed and running, **use it to do everything else.** Don't manually edit JSON config files or create folders by hand. Just tell Claude what you want:

```
> set up the GitHub MCP server so you can create PRs for me
> add Context7 and Playwright to your MCP servers
> create a CLAUDE.md for this project based on what you see
> set up a code-reviewer agent that checks for security issues
> add a /review-pr slash command
> enable all the official plugins
> configure your permissions so you don't ask me about git commands
```

Claude knows its own config system. It will:
1. Create or edit `~/.claude/settings.json` for you
2. Set up `~/.claude/.mcp.json` with the right servers
3. Create agent files in `~/.claude/agents/`
4. Create slash commands in `~/.claude/commands/`
5. Write a CLAUDE.md tailored to your project

**This starter kit includes ready-to-use examples** in the `examples/` and `templates/` folders (see below), but you can also just ask Claude to set everything up from scratch.

### Included templates and examples

This repo includes copy-paste-ready files to get you started fast:

**CLAUDE.md templates** (copy one into your project and customize):
```
templates/
  CLAUDE-general.md     # Blank template for any project
  CLAUDE-react.md       # React + TypeScript + Tailwind
  CLAUDE-python.md      # Python + Flask + SQLAlchemy
  CLAUDE-nextjs.md      # Next.js 14 + Prisma + Tailwind
```

**Example config files** (copy to `~/.claude/` and customize):
```
examples/
  settings-example.json   # Recommended settings.json
  mcp-example.json        # Recommended .mcp.json (GitHub, Context7, Filesystem)
```

**Example agents** (copy to `~/.claude/agents/`):
```
examples/agents/
  code-reviewer.md      # Reviews code for bugs, style, security
  explain-code.md       # Explains code for beginners/non-devs
  doc-writer.md         # Writes READMEs and documentation
```

**Example slash commands** (copy to `~/.claude/commands/`):
```
examples/commands/
  review-pr.md          # Review a PR for bugs and security
  daily-summary.md      # Git log summary for standups
  explain-this.md       # Explain a project or file
```

**Or just tell Claude to do it:**
```
> look at the examples folder in this starter kit and set up
> the settings, MCP servers, agents, and commands for me
```

---

## 3. CLAUDE.md -- Project Instructions

**The single most impactful thing you can set up.** This file tells Claude how to work in your project -- what tech you use, what rules to follow, what to avoid.

**Easiest way to create one:** Open Claude Code in your project and say:
```
> create a CLAUDE.md for this project based on what you see in the codebase
```

Claude will analyze your files, detect the tech stack, and generate a tailored CLAUDE.md. You can then refine it.

### How it works

| Location | Scope | Example Use |
|---|---|---|
| `~/.claude/CLAUDE.md` | All your projects | Your coding style, global rules |
| `./CLAUDE.md` | This repo only | Project tech stack, commands |
| `./src/CLAUDE.md` | This directory | Module-specific rules |
| `./.claude/CLAUDE.md` | This repo (hidden) | Same as above, stays out of sight |

Claude reads all applicable files and follows their instructions.

### Why it matters

Without CLAUDE.md, Claude:
- Guesses your tech stack
- Uses generic patterns
- Doesn't know your testing commands
- Might edit files it shouldn't

With CLAUDE.md, Claude:
- Knows exactly what framework/language you use
- Follows your team's conventions
- Runs the right build/test commands
- Avoids files and patterns you've flagged

### Beginner Example

```markdown
# My Todo App

## Tech Stack
- React 18 + TypeScript
- Express.js backend
- PostgreSQL database

## Commands
- npm run dev -- start dev server
- npm test -- run tests
- npm run build -- production build

## Rules
- Use functional components, not class components
- API routes go in src/routes/
- Never modify anything in src/legacy/
- Never commit .env files
```

### Intermediate Example

```markdown
# E-Commerce Platform (Turborepo monorepo)

## Packages
- packages/api -- Express REST API (port 3001)
- packages/web -- Next.js 14 storefront (port 3000)
- packages/shared -- Shared TypeScript types
- packages/email -- Email templates (React Email)

## Code Style
- Strict TypeScript everywhere, never use `any`
- Zod for all input validation
- Drizzle ORM for database queries
- All API responses use { data, error, meta } envelope

## Testing
- pnpm test -- runs all tests
- pnpm test:api -- API tests only
- Tests must pass before committing

## PR Checklist
1. pnpm test passes
2. pnpm typecheck clean
3. New endpoints have OpenAPI docs
4. Database changes have migrations
```

### Advanced Example (real-world)

```markdown
# AI Tools Hub

## Active Projects
- TerminalAI -- video upscaler (Python, CUDA)
- MCP Memory Service -- ChromaDB vector store

## Critical Rules
- ~DO NOT DELETE/ has persistent shared resources
- GPU operations need CUDA 12.x -- verify with nvidia-smi
- Python projects use uv, not pip
- All Docker services must have health checks
- .env files are per-service, never global

## Architecture
- Each service is self-contained in its own directory
- Shared config lives in config/
- Docker Compose for local dev, Kubernetes for prod
```

### Pro tips for CLAUDE.md

1. **Be specific**: "use pytest" beats "write tests"
2. **Include commands**: Claude can run them if it knows them
3. **List what NOT to do**: Prevents expensive mistakes
4. **Update regularly**: As your project evolves, so should this file
5. **Keep it under 500 lines**: Claude reads the whole thing every session

---

## 4. Settings

**Quick setup:** Tell Claude `"configure your settings to auto-approve git commands, npm scripts, and GitHub operations"` and it will edit settings.json for you. Or copy `examples/settings-example.json` from this starter kit to `~/.claude/settings.json`.

Manual edit -- `~/.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "mcp__github__*",
      "mcp__filesystem__*",
      "WebSearch",
      "Bash(git *)",
      "Bash(npm test)",
      "Bash(npm run *)",
      "Bash(python *)"
    ],
    "defaultMode": "default"
  },
  "model": "opus[1m]",
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "code-review@claude-plugins-official": true,
    "playwright@claude-plugins-official": true
  },
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

### Permission modes explained

| Mode | What Claude Does | When to Use |
|---|---|---|
| `default` | Asks before edits and commands | Learning, unfamiliar projects |
| `acceptEdits` | Auto-approves file edits, asks for commands | Trusted projects, faster flow |
| `bypassPermissions` | Auto-approves everything | Solo dev, trusted code only |
| `plan` | Shows detailed plan, asks before executing | Complex tasks, reviewing approach |

Cycle modes with `Shift+Tab` during a session.

### Permission allow-lists

Instead of approving every action, whitelist safe patterns:

```json
{
  "permissions": {
    "allow": [
      "Bash(git *)",           "// All git commands",
      "Bash(npm test)",        "// Run tests",
      "Bash(npm run *)",       "// Any npm script",
      "Bash(python *.py)",     "// Run Python files",
      "mcp__github__*",        "// All GitHub operations",
      "Read(*)",               "// Read any file",
      "Glob(*)",               "// Search for files",
      "Grep(*)"                "// Search file contents"
    ]
  }
}
```

### Models

Claude Code can use different AI models. The model affects intelligence, speed, and cost.

| Model | ID in Settings | Speed | Intelligence | Best For |
|---|---|---|---|---|
| **Claude Opus 4.6** | `opus[1m]` | Slower | Highest | Complex architecture, multi-file refactors, hard bugs |
| **Claude Sonnet 4.6** | `sonnet` | Fast | Very High | Daily coding, most tasks, good balance |
| **Claude Haiku 4.5** | `haiku` | Fastest | Good | Simple tasks, quick questions, cost-sensitive |

**Set your default model in settings.json:**
```json
{
  "model": "opus[1m]"
}
```

**Switch models on the fly:**
- Toggle fast mode: type `/fast` during a session (uses same model with faster output)
- Or set per-session: `claude --model sonnet`

**Which model should I use?**

| Scenario | Recommended Model | Why |
|---|---|---|
| Learning / exploring a codebase | Sonnet | Fast answers, good enough for explanations |
| Writing new features | Opus | Better planning, fewer mistakes |
| Bug fixing | Opus | Better at reasoning through complex logic |
| Code review | Sonnet or Opus | Sonnet for quick scans, Opus for deep review |
| Simple edits (rename, formatting) | Haiku | Fast and cheap for trivial tasks |
| CI/CD pipeline automation | Sonnet | Good balance of speed and quality |
| Agent teams | Mix | Lead agent on Opus, workers on Sonnet |

**Cost awareness:**
- Opus uses more tokens (costs more per task) but gets it right more often
- Sonnet is the sweet spot for most daily work
- Use `/cost` during a session to see token usage
- Haiku is great for high-volume, low-complexity tasks

**The `[1m]` suffix** means 1 million token context window. This lets Claude read very large codebases. Use it for projects with many files.

---

## 5. MCP Servers -- External Integrations

**Quick setup:** Tell Claude `"set up the GitHub and Context7 MCP servers"` and it will create the config for you. Or copy `examples/mcp-example.json` from this starter kit to `~/.claude/.mcp.json`.

MCP (Model Context Protocol) servers give Claude access to external tools. Configure in `~/.claude/.mcp.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "gh",
      "args": ["mcp-server"]
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    },
    "tavily": {
      "command": "npx",
      "args": ["-y", "tavily-mcp@latest"],
      "env": { "TAVILY_API_KEY": "your-key" }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-filesystem"],
      "env": {
        "ALLOWED_DIRS": "C:\\Users\\YourName\\Documents,D:\\Projects"
      }
    }
  }
}
```

### What each server does

| Server | What It Does | Why You Want It |
|---|---|---|
| **GitHub** | PRs, issues, repos, code search | Manage GitHub without leaving Claude |
| **Context7** | Live library docs (React, Django, etc.) | Always up-to-date API references |
| **Tavily** | Web search and deep research | Find solutions, research topics |
| **Filesystem** | Access folders outside your project | Work across multiple projects |
| **Puppeteer** | Browser automation | Test web apps, scrape data |
| **Playwright** | Advanced browser automation | E2E testing, form filling |

### Setting up the GitHub MCP (most important)

1. Install GitHub CLI: `winget install GitHub.cli`
2. Authenticate: `gh auth login`
3. Add to `~/.claude/.mcp.json` (see config above)
4. Add to permissions: `"mcp__github__*"` in allow list
5. Restart Claude Code

Now you can say: "create a PR for this branch" or "list open issues"

---

## 6. Custom Agents

Specialist AI personas in `~/.claude/agents/`. Instead of Claude being a generalist, you route tasks to experts.

### Your first agent

Create `~/.claude/agents/python-reviewer.md`:

```markdown
---
name: python-reviewer
description: Reviews Python code for bugs, style, and security
tools: Read, Grep, Glob, Bash
---

You are a senior Python code reviewer. For every file reviewed, check:

1. **Bugs**: Off-by-one errors, null references, race conditions, unhandled exceptions
2. **Style**: PEP 8, consistent naming, docstrings on public functions
3. **Security**: SQL injection, path traversal, unsafe deserialization, hardcoded secrets
4. **Performance**: Unnecessary loops, missing generators, N+1 queries

Output format:
- CRITICAL: Must fix before merge (with file:line reference)
- WARNING: Should fix (with file:line reference)
- SUGGESTION: Nice to have
```

### More useful agents

**Frontend reviewer:**
```markdown
---
name: frontend-reviewer
description: Reviews React/TypeScript frontend code
tools: Read, Grep, Glob, Bash
---

Review React components for:
1. Accessibility (ARIA, keyboard nav, color contrast)
2. Performance (unnecessary re-renders, missing memo/useMemo)
3. TypeScript strictness (no `any`, proper generics)
4. Hook rules (dependencies, cleanup)
```

**Documentation writer:**
```markdown
---
name: doc-writer
description: Writes clear technical documentation
tools: Read, Grep, Glob, Write, Edit
---

Write documentation that is:
- Scannable (headers, tables, code blocks)
- Example-first (show before you tell)
- Accurate (read the code, don't guess)
- Concise (no filler words)
```

### Organize at scale

```
agents/
  00-router/intelligent-router.md    # Routes to specialists
  01-core-development/               # Backend, frontend, fullstack
  02-language-specialists/           # Python, TS, Rust, Go, etc.
  03-infrastructure/                 # DevOps, K8s, Terraform
  04-quality-security/               # Review, audit, pen-test
```

**Key insight:** 70% of tasks need one agent. Start simple, add complexity only when you feel the pain.

---

## 7. Slash Commands

Reusable prompts saved as files in `~/.claude/commands/`:

### Create a command

Create `~/.claude/commands/review-pr.md`:

```markdown
---
description: "Review current PR for bugs, style, and security"
argument-hint: "[branch]"
---

Review the current PR. Check for:
1. Correctness -- does it do what it claims?
2. Style -- consistent with the codebase?
3. Security -- any vulnerabilities?
4. Tests -- adequate coverage?

Use git diff main...HEAD to see changes.
Output a structured review with severity levels.
```

Usage: `/review-pr` or `/review-pr feature/auth`

### More useful commands

**Quick test:**
```markdown
---
description: "Run tests and explain any failures"
---
Run the project's test suite. If any tests fail, explain why and suggest fixes.
```

**Daily standup prep:**
```markdown
---
description: "Summarize what changed since yesterday"
---
Show git log since yesterday. Summarize: what was done, what's in progress, any blockers.
Format as bullet points for a standup message.
```

---

## 8. Plugins

Plugins extend Claude Code with pre-built capabilities. They're maintained by Anthropic and the community.

### How to enable plugins

Add to `~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "code-review@claude-plugins-official": true,
    "pr-review-toolkit@claude-plugins-official": true,
    "frontend-design@claude-plugins-official": true,
    "playwright@claude-plugins-official": true,
    "semgrep@claude-plugins-official": true
  }
}
```

### Available plugins (detailed)

#### Context7 -- Live Documentation

```json
"context7@claude-plugins-official": true
```

**What it does:** Fetches the latest official docs for any library, framework, or SDK in real-time. When you ask Claude about React, Django, Express, Tailwind, etc., it pulls the current documentation instead of relying on training data.

**Why you want it:** Claude's training data has a cutoff. Libraries release new versions constantly. Context7 means Claude always knows the latest API.

**Example:**
```
> how do I use the new React 19 useFormStatus hook?
# Without Context7: Claude might give outdated or incorrect info
# With Context7: Claude fetches React 19 docs and gives accurate, current info
```

#### Code Review -- Automated Reviews

```json
"code-review@claude-plugins-official": true
```

**What it does:** Adds the `/simplify` skill that reviews recently changed code for reuse, quality, and efficiency, then fixes issues found.

**Example:**
```
> /simplify
# Claude reviews your recent changes and suggests/applies improvements
```

#### PR Review Toolkit -- Multi-Dimensional PR Reviews

```json
"pr-review-toolkit@claude-plugins-official": true
```

**What it does:** Comprehensive pull request review system with specialized reviewers:
- **Code reviewer** -- style, patterns, best practices
- **Code simplifier** -- clarity and maintainability
- **Comment analyzer** -- documentation accuracy
- **Test analyzer** -- test coverage gaps
- **Silent failure hunter** -- inadequate error handling
- **Type design analyzer** -- type safety and invariants

**Example:**
```
> /review-pr
# Launches multiple specialized reviewers in parallel
# Each checks a different dimension of quality
```

#### Frontend Design -- Beautiful UI Generation

```json
"frontend-design@claude-plugins-official": true
```

**What it does:** Creates high-quality, production-grade frontend interfaces. Generates creative, polished code that avoids the generic "AI-generated" look.

**Example:**
```
> /frontend-design create a pricing page with 3 tiers, dark theme, glassmorphism cards
# Claude creates a visually distinct, production-ready component
```

#### Playwright -- Browser Automation

```json
"playwright@claude-plugins-official": true
```

**What it does:** Lets Claude control a real browser -- navigate pages, click buttons, fill forms, take screenshots, run E2E tests.

**Example:**
```
> test the signup flow on localhost:3000 -- fill in the form, submit, and verify the success page
# Claude opens a browser, performs the actions, takes screenshots, reports results
```

#### Semgrep -- Security Scanning

```json
"semgrep@claude-plugins-official": true
```

**What it does:** Runs Semgrep security analysis on your code to find vulnerabilities, misconfigurations, and code quality issues.

**Example:**
```
> /setup-semgrep-plugin
> scan this project for security vulnerabilities
# Claude runs Semgrep and explains every finding with fix suggestions
```

### Recommended plugin combos

| Use Case | Plugins to Enable |
|---|---|
| **General development** | Context7, Code Review |
| **Team/enterprise** | Context7, PR Review Toolkit, Semgrep |
| **Frontend work** | Context7, Frontend Design, Playwright |
| **Full power** | All of them |

---

## 8.5. Skills

Skills are built-in slash commands that come with Claude Code or are added by plugins. They're different from custom commands (Section 7) because they have specialized logic, not just prompt templates.

### Built-in skills

| Skill | Command | What It Does |
|---|---|---|
| **Commit** | `/commit` | Creates a well-formatted git commit from your changes |
| **Help** | `/help` | Shows all available commands |
| **Clear** | `/clear` | Resets the conversation |
| **Compact** | `/compact` | Compresses context to free up space |
| **Cost** | `/cost` | Shows token usage for this session |
| **Fast** | `/fast` | Toggles fast output mode |
| **Login** | `/login` | Re-authenticate with Anthropic |

### Skills from plugins

When you enable plugins, they add new skills:

| Plugin | Skill | What It Does |
|---|---|---|
| Code Review | `/simplify` | Review and simplify recently changed code |
| PR Review Toolkit | `/review-pr` | Multi-dimensional PR review with specialized agents |
| Frontend Design | `/frontend-design` | Create production-grade UI components |
| Semgrep | `/setup-semgrep-plugin` | Install and configure Semgrep security scanner |

### Team skills (with agent teams enabled)

| Skill | What It Does |
|---|---|
| `/team-spawn` | Create a team of specialized agents |
| `/team-status` | Check progress of all agents |
| `/team-shutdown` | Gracefully stop all agents |
| `/team-debug` | Debug with competing hypotheses |
| `/team-feature` | Parallel feature development |
| `/team-review` | Multi-reviewer code review |
| `/team-delegate` | Task delegation dashboard |

### Using skills vs typing instructions

```
# These are roughly equivalent:
> /commit
> create a git commit with a well-formatted message for the current changes

# But /commit is:
# - Faster to type
# - More consistent output
# - Follows established conventions
# - Uses optimized prompts
```

**Pro tip:** Type `/` and press Tab to see all available skills in your current session. The list depends on which plugins you have enabled.

---

## 9. Agent Teams

Multiple agents working in parallel on the same problem. Enable with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in settings env.

```
/team-spawn review      # 3 reviewers: security, performance, architecture
/team-spawn debug       # 3 debuggers: competing hypotheses
/team-spawn feature     # 1 lead + 2 implementers
/team-spawn security    # 4-person security audit
/team-spawn fullstack   # Frontend + backend + tests in parallel
/team-status            # Check progress of all agents
/team-shutdown          # Clean up all agents
```

### When to use teams vs solo

| Scenario | Use |
|---|---|
| Simple bug fix | Solo |
| Code review | `/team-spawn review` |
| Complex bug with unclear cause | `/team-spawn debug` |
| New feature across multiple files | `/team-spawn feature` |
| Security audit before launch | `/team-spawn security` |

---

## 10. Instincts

Behavioral rules in `~/.claude/instincts/` (YAML). They shape HOW Claude works, not WHAT it builds.

```yaml
---
id: risk-aware-autonomy
trigger: "when deciding how much to do autonomously"
---
Low risk (read, search, edit): Act freely.
Medium risk (installs, config changes): Proceed, mention it.
High risk (push, deploy, delete): Confirm first.
Critical (production, database, deletion): Stop. Full risk assessment.
```

```yaml
---
id: code-quality
trigger: "when writing or editing code"
---
- Write tests for new functions
- Use TypeScript strict mode
- No console.log in production code
- Prefer composition over inheritance
```

---

## 11. Memory

Claude remembers things across sessions. Stored at `~/.claude/projects/<project>/memory/`.

| Type | What It Stores | Example |
|---|---|---|
| **user** | Who you are, your preferences | "Senior Python dev, prefers terse responses" |
| **feedback** | How you want Claude to work | "Don't mock DB in integration tests" |
| **project** | Project context not in code | "Merge freeze starts March 5" |
| **reference** | Where to find external info | "Bugs tracked in Linear project INGEST" |

### Using memory

```
> remember that we use Conventional Commits in this project
> remember I prefer TypeScript over JavaScript
> what do you remember about this project?
> forget the merge freeze -- it's been lifted
```

---

## 12. Hooks

Auto-run commands when Claude takes actions. In `~/.claude/settings.json`:

```json
{
  "hooks": {
    "afterEdit": [
      { "command": "npx eslint --fix $FILE" }
    ],
    "afterWrite": [
      { "command": "npx prettier --write $FILE" }
    ],
    "preCommit": [
      { "command": "npm test -- --related $FILE" }
    ]
  }
}
```

### Common hooks

| Hook | Command | Why |
|---|---|---|
| Auto-format after edit | `npx prettier --write $FILE` | Consistent style |
| Auto-lint after edit | `npx eslint --fix $FILE` | Catch issues immediately |
| Run tests before commit | `npm test` | Never commit broken code |
| Type-check after edit | `npx tsc --noEmit` | Catch type errors early |

---

## 13. Headless and CI Mode

Run Claude Code in scripts and CI/CD pipelines without interactive input:

```bash
# Headless mode (no prompts, prints result)
claude --print "analyze this codebase for security issues"

# In a CI pipeline (GitHub Actions example)
- name: Code Review
  run: |
    claude --print "review the diff for this PR" > review.md

# With piped input
git diff main...HEAD | claude --print "review these changes"
```

---

## 14. Real-World Workflow Examples

### Workflow 1: Bug fix (15 minutes)

```bash
cd my-project
claude

> I'm getting a "TypeError: Cannot read property 'map' of undefined"
> on the /users page when the API returns an empty response.

# Claude reads the relevant files, finds the bug, and fixes it

> run the tests to make sure nothing else broke

# Claude runs tests, all pass

> /commit
> create a PR with the fix
```

### Workflow 2: New feature (30-60 minutes)

```bash
cd my-project
claude

> I need a user settings page where users can update their
> name, email, and notification preferences. We use React
> with TypeScript and our API is Express.

# Claude plans the approach, creates components, API routes, and tests

> the notification preferences should be checkboxes for
> email, push, and SMS

# Claude updates the component

> add form validation -- name required, email must be valid

# Claude adds Zod validation

> /commit
> create a PR titled "Add user settings page"
```

### Workflow 3: Code review with AI (5 minutes)

```bash
git diff main...HEAD | claude "review this code for:
1. Bugs and edge cases
2. Security vulnerabilities
3. Performance issues
4. Test coverage gaps
Format as a markdown checklist."
```

### Workflow 4: Learning a new codebase (10 minutes)

```bash
cd unfamiliar-project
claude

> what does this project do?
> explain the folder structure
> what tech stack is this using?
> walk me through how a request flows from the frontend to the database
> what are the most important files I should read first?
```

---

## 15. Industry Best Practices

### Development workflow

1. **Always use branches**: Never commit directly to main
2. **Write a CLAUDE.md first**: Before any coding, tell Claude about your project
3. **Review every diff**: Even AI-written code needs human review
4. **Commit often**: Small, focused commits are easier to review and revert
5. **Test before pushing**: `claude "run tests and fix any failures"`
6. **Use conventional commits**: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`

### Security

1. **Never put secrets in CLAUDE.md**: Use .env files and .gitignore
2. **Don't use bypassPermissions on shared repos**: Use allow-lists instead
3. **Review file permissions**: Claude can read/write anything in your project
4. **Scan before deploying**: Use Semgrep plugin for security scanning
5. **Keep dependencies updated**: `claude "check for outdated or vulnerable dependencies"`

### Collaboration

1. **Share your CLAUDE.md**: Commit it to the repo so teammates get the same behavior
2. **Standardize slash commands**: Team-wide commands in `.claude/commands/`
3. **Document what Claude built**: AI-written code still needs documentation
4. **Use PR templates**: Consistent PR descriptions across the team

### Performance

1. **Use `/compact` regularly**: Keeps responses fast and accurate
2. **Be specific**: "fix the null check in UserService.getById()" beats "fix the bug"
3. **Pipe context**: `cat schema.sql | claude "write a migration"` is faster than having Claude search
4. **Use one-shot mode**: For simple tasks, `claude "task"` is faster than interactive

### What NOT to do

| Don't | Why | Instead |
|---|---|---|
| Say "make it better" | Too vague for good results | "Add input validation to the login form" |
| Skip reviewing diffs | AI makes mistakes | Read every change before approving |
| Put secrets in CLAUDE.md | It gets committed to Git | Use .env files |
| Use bypassPermissions on prod | No safety net | Use specific allow-lists |
| Over-engineer agents | Complexity without benefit | Start with zero agents, add when needed |
| Trust without testing | AI code can have bugs | Always run tests |

---

> **Everything below is optional** -- tips for sharing your Claude Code experience on social media and building your professional brand. Skip this if you just want to code.

## 16. Social Media Tips and Tricks

### Why share your Claude Code work?

- **Build your brand**: Show you're on the cutting edge of AI-assisted development
- **Help others**: Most people don't know these tools exist
- **Career opportunities**: Employers search for AI-literate candidates
- **Community**: Connect with other Claude Code users and builders

### What to share

| Content Type | Platform | Example |
|---|---|---|
| **Before/after comparisons** | LinkedIn, X/Twitter | "This took 4 hours manually. With Claude Code: 3 minutes. Here's how." |
| **Workflow recordings** | YouTube, LinkedIn | Screen recording of a real bug fix session |
| **Tips and tricks** | X/Twitter, Threads | "TIL you can pipe git diff into Claude Code for instant code review" |
| **CLAUDE.md templates** | GitHub, LinkedIn | Share your project config as a gist |
| **Build-in-public threads** | X/Twitter | "Building a SaaS with Claude Code -- Day 1..." |
| **Tutorial posts** | LinkedIn, Dev.to | "How I set up Claude Code for my team" |

### High-performing post formulas

**The "X in Y" formula (LinkedIn/X):**
```
I built [impressive thing] in [surprisingly short time] using Claude Code.

Here's exactly how:

1. [Step]
2. [Step]
3. [Step]

The key insight: [non-obvious lesson]

[Screenshot or GIF]
```

**The "Before/After" formula (LinkedIn):**
```
BEFORE Claude Code:
- 4 hours to review a PR
- 30 minutes to write a migration
- 2 hours to debug a production issue

AFTER:
- 2 minutes
- 45 seconds
- 3 minutes

Here's my setup: [link to your CLAUDE.md or starter kit]
```

**The "I was wrong" formula (X/Twitter, LinkedIn):**
```
I was skeptical about AI coding assistants.

Then I tried [specific task] with Claude Code.

[What happened]

I was wrong. Here's why: [insight]
```

**The "Tips thread" formula (X/Twitter):**
```
10 Claude Code tricks I wish I knew on day one:

1/ Pipe everything:
   git diff | claude "review"
   cat error.log | claude "fix this"

2/ Write CLAUDE.md first. Always.
   It's the difference between a junior and a senior AI.

3/ ...
```

### Platform-specific tips

**LinkedIn:**
- Lead with a hook (number, bold claim, question)
- Use line breaks liberally (mobile readers)
- Include a screenshot or demo GIF
- End with a question to drive comments
- Tag @Anthropic and use #ClaudeCode, #AIAssisted, #DevTools
- Post Tuesday-Thursday, 8-10 AM your timezone

**X/Twitter:**
- Keep it concise -- one tip per tweet works best
- Quote-tweet interesting Claude Code moments
- Share terminal screenshots (they stand out in feeds)
- Use threads for longer tutorials
- Tag @AnthropicAI

**YouTube:**
- Screen recordings of real sessions (not scripted)
- "Watch me build X with Claude Code in Y minutes" format
- Show mistakes too -- authenticity builds trust
- Include your CLAUDE.md setup in the description

**GitHub:**
- Star and contribute to Claude Code-related repos
- Share your CLAUDE.md files as gists
- Create template repos (like this starter kit!)
- Write detailed PR descriptions showing AI-assisted workflow

### Content ideas by experience level

**Week 1:**
- "I just set up Claude Code for the first time. Here's what happened."
- Screenshot of your first session
- Share this starter kit with your network

**Month 1:**
- "5 things I learned using Claude Code daily for a month"
- Your CLAUDE.md file (share as a GitHub gist)
- A before/after comparison of a real task

**Month 3+:**
- Tutorial: "How I set up Claude Code for [your industry]"
- Agent templates for your domain
- Workflow videos showing real productivity gains
- Comparison posts (Claude Code vs Cursor vs Copilot)

### Building a portfolio with Claude Code

For career transitioners and job seekers:

1. **Create a GitHub profile README**: `claude "create a GitHub profile README that highlights my skills"`
2. **Build projects fast**: Use Claude Code to prototype portfolio pieces
3. **Document the process**: "Built with Claude Code" in your README shows modern skills
4. **Contribute to open source**: Use Claude Code to find and fix issues in popular repos
5. **Write about it**: Technical blog posts demonstrate both coding and communication skills

---

## Quick Reference

```
INSTALL:  irm https://claude.ai/install.ps1 | iex
          or: setup-claude-code.bat (this repo)
VERIFY:   claude --version && claude doctor
START:    cd your-project && claude
ONE-SHOT: claude "your task"
PIPE:     git diff | claude "review"
HEADLESS: claude --print "analyze this code"

CONFIG:   ~/.claude/settings.json   (settings + permissions)
          ~/.claude/.mcp.json       (MCP servers)
          ~/.claude/CLAUDE.md       (global instructions)
          ./CLAUDE.md               (project instructions)
          ~/.claude/agents/         (custom agents)
          ~/.claude/commands/       (slash commands)
          ~/.claude/instincts/      (behavioral rules)

KEYBOARD:
          Shift+Tab    Cycle permission modes
          Ctrl+C       Cancel action
          Escape       Clear input
          Up/Down      Command history
```

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `claude: command not found` | Close all terminals, reopen. Run installer again if needed |
| Auth fails | `claude /login` to re-authenticate |
| MCP server won't connect | Check `~/.claude/.mcp.json` syntax, test the command standalone |
| Slow responses | Use `/compact` to reduce context size |
| Keeps asking permission | Add tools to `permissions.allow` in settings.json |
| Agent teams won't spawn | Set `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in settings env |
| Can't find project files | Check you're in the right directory with `pwd` |
| Windows PATH issues | Close ALL terminals, open a fresh one |
| Antivirus blocking | Add Claude Code to your antivirus exceptions |
| Corporate proxy | Set `HTTP_PROXY` and `HTTPS_PROXY` environment variables |

```bash
claude doctor    # Diagnose everything automatically
```

Docs: https://docs.anthropic.com/en/docs/claude-code
Issues: https://github.com/anthropics/claude-code/issues
