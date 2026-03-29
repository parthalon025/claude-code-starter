# Claude Code -- Complete Guide: Beginner to Advanced

> A CLI tool by Anthropic that puts an AI coding assistant in your terminal. It reads your project, edits files, runs commands, searches the web, and coordinates multi-agent teams -- all through natural language.

---

## 1. Getting Started

### Prerequisites

| Requirement | How to Get It |
|---|---|
| Windows 10+ or 11 | You probably have this |
| Git for Windows | `winget install Git.Git` |
| Node.js LTS | `winget install OpenJS.NodeJS.LTS` |
| Anthropic Account | Sign up at claude.ai (Pro, Max, Teams, or Enterprise) |

> Run the included `setup-claude-code.bat` to install everything automatically.

### Install

**Option A -- Official installer (recommended):**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**Option B -- Winget:**
```powershell
winget install Anthropic.ClaudeCode
```

### Verify and Log In

```bash
claude --version       # Check install
claude doctor          # Health check
claude                 # Start -- browser opens for login
```

---

## 2. First Session

```bash
mkdir my-project && cd my-project
claude
```

Try these in order:
```
> create a Python Flask app with /hello and /health endpoints
> explain what you just wrote
> add error handling and logging
> run the server and test with curl
> /commit
```

### Key commands

| Command | Does |
|---|---|
| `/help` | All commands |
| `/clear` | Reset conversation |
| `/compact` | Compress context |
| `/cost` | Token usage |
| `Ctrl+C` | Cancel |
| `exit` | Quit |

### One-shot mode

```bash
claude "add type hints to main.py"
cat error.log | claude "explain and fix this"
git diff | claude "review for bugs"
```

---

## 3. CLAUDE.md -- Project Instructions

**The single most impactful thing you can set up.** Tells Claude how to work in your project.

| Location | Scope |
|---|---|
| `~/.claude/CLAUDE.md` | All projects |
| `./CLAUDE.md` | This repo |
| `./src/CLAUDE.md` | This directory |

### Beginner Example

```markdown
# My Todo App
## Tech: React + Express + PostgreSQL
## Commands
- npm run dev -- dev server
- npm test -- tests
## Rules
- Functional components only
- API routes in src/routes/
- Never modify src/legacy/
- Never commit .env
```

### Intermediate Example

```markdown
# E-Commerce Platform (Turborepo monorepo)
## Packages
- packages/api -- Express REST API
- packages/web -- Next.js storefront
- packages/shared -- Shared types
## Style
- Strict TypeScript, no `any`
- Zod for validation, Drizzle ORM
- { data, error, meta } response envelope
## PR Checklist
1. pnpm test passes
2. pnpm typecheck clean
3. New endpoints have OpenAPI docs
```

### Advanced Example (real-world)

```markdown
# AI Tools Hub
## Active: TerminalAI (video upscaler), MCP Memory Service (ChromaDB)
## Critical
- ~DO NOT DELETE/ has persistent shared resources
- GPU ops need CUDA 12.x -- verify with nvidia-smi
- Python projects use uv, not pip
- All Docker services have health checks
```

---

## 4. Settings

Edit `~/.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "mcp__github__*",
      "mcp__filesystem__*",
      "WebSearch",
      "Bash(git *)",
      "Bash(npm test)"
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

### Permission modes

| Mode | Behavior |
|---|---|
| `default` | Asks before edits and commands |
| `acceptEdits` | Auto-approves edits, asks for commands |
| `bypassPermissions` | Auto-approves everything (careful) |
| `plan` | Shows plan, asks before executing |

Cycle with `Shift+Tab` in session.

---

## 5. MCP Servers -- External Integrations

Configure in `~/.claude/.mcp.json`. Plugins that give Claude access to external tools.

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
    }
  }
}
```

| Server | Does |
|---|---|
| GitHub | PRs, issues, repos via `gh` CLI |
| Context7 | Live library docs (React, Django, etc.) |
| Tavily | Web search and research |
| Filesystem | Access directories outside project |
| Puppeteer | Browser automation |

---

## 6. Custom Agents

Specialist AI personas in `~/.claude/agents/`. Route tasks to experts instead of a generalist.

```markdown
---
name: python-reviewer
description: Reviews Python code for bugs, style, and security
tools: Read, Grep, Glob, Bash
---

Senior Python reviewer. Check:
1. PEP 8 compliance
2. Common bugs (off-by-one, null refs, race conditions)
3. Security issues (injection, path traversal)

Output: Critical / Warning / Suggestion with file:line refs.
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

**Key insight:** 70% of tasks need one agent. Start simple, add complexity only when needed.

---

## 7. Slash Commands

Reusable prompts in `~/.claude/commands/`:

```markdown
---
description: "Review current PR for bugs, style, security"
argument-hint: "[branch]"
---
Review the PR. Check correctness, style, security, test coverage.
Use git diff main...HEAD. Output structured review with severity.
```

Usage: `/review-pr` or `/review-pr feature/auth`

---

## 8. Plugins

Enable in settings.json:

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

---

## 9. Agent Teams

Multiple agents working in parallel. Enable with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in settings env.

```
/team-spawn review      # 3 reviewers: security, perf, architecture
/team-spawn debug       # 3 debuggers: competing hypotheses
/team-spawn feature     # 1 lead + 2 implementers
/team-spawn security    # 4-person security audit
/team-status            # Check progress
/team-shutdown          # Clean up
```

---

## 10. Instincts

Behavioral rules in `~/.claude/instincts/` (YAML):

```yaml
---
id: risk-aware-autonomy
trigger: "when deciding how much to do autonomously"
---
Low risk (read, search, edit): Act freely.
Medium risk (installs, config): Proceed, mention it.
High risk (push, deploy): Confirm first.
Critical (production, deletion): Stop. Full risk assessment.
```

---

## 11. Memory

Persistent across sessions at `~/.claude/projects/<project>/memory/`.

| Type | Example |
|---|---|
| user | "Senior Python dev, prefers terse responses" |
| feedback | "Do not mock DB in integration tests" |
| project | "Merge freeze starts March 5" |
| reference | "Bugs tracked in Linear project INGEST" |

```
> remember we use Conventional Commits
> what do you remember about this project?
```

---

## 12. Hooks

Auto-run commands on events. In settings.json:

```json
{
  "hooks": {
    "afterEdit": [{ "command": "npx eslint --fix $FILE" }],
    "afterWrite": [{ "command": "npm test -- --related $FILE" }]
  }
}
```

---

## 13. Best Practices

**Beginner:** Write a CLAUDE.md. Be specific. One task at a time. Review diffs. Use `/compact`.

**Intermediate:** Set up MCP servers (GitHub + Context7 + Tavily). Use permission allow-lists. Pipe context: `git diff | claude "review"`.

**Advanced:** Build custom agents. Use the router pattern. Agent teams for complex work. Instincts for persistent behavior. Memory for cross-session context.

### Real-world speedups

| Task | Manual | Claude Code | Speedup |
|---|---|---|---|
| Company research | 2-4 hrs | ~45 sec | 160-320x |
| Resume tailoring | 45-60 min | ~3 min | 15-20x |
| Code review | 30-60 min | ~2 min | 15-30x |
| Bug diagnosis | 15-60 min | ~2 min | 7-30x |

### Do NOT

- Skip CLAUDE.md
- Say "make it better" -- be specific
- Ignore diffs
- Put secrets in CLAUDE.md
- Use bypassPermissions on prod repos
- Over-engineer agents -- start with zero

---

## Quick Reference

```
INSTALL:  irm https://claude.ai/install.ps1 | iex
VERIFY:   claude --version && claude doctor
START:    cd your-project && claude
ONE-SHOT: claude "your task"
PIPE:     git diff | claude "review"

CONFIG:   ~/.claude/settings.json   (settings)
          ~/.claude/.mcp.json       (MCP servers)
          ~/.claude/CLAUDE.md       (global instructions)
          ./CLAUDE.md               (project instructions)
          ~/.claude/agents/         (custom agents)
          ~/.claude/commands/       (slash commands)
```

---

## Troubleshooting

| Problem | Fix |
|---|---|
| claude: command not found | Close all terminals, reopen. Reinstall if needed |
| Auth fails | `claude /login` |
| MCP won't connect | Check .mcp.json, test command standalone |
| Slow | `/compact` to reduce context |
| Keeps asking permission | Add tools to `permissions.allow` |
| Teams won't spawn | Check `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` |

```bash
claude doctor    # Diagnose everything
```

Docs: https://docs.anthropic.com/en/docs/claude-code
Issues: https://github.com/anthropics/claude-code/issues
