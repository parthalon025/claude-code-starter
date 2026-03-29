# Claude Code Starter Kit

Everything you need to go from a fresh Windows install to a fully configured Claude Code setup.

## What's Included

| File | Description |
|---|---|
| `setup-claude-code.bat` | One-click installer -- installs Git, Node.js, and Claude Code |
| `claude-code-guide.md` | Complete guide from beginner to advanced (CLAUDE.md, agents, MCP, teams) |
| `github-guide.md` | GitHub quick start -- setup, commands, workflows, and Claude Code integration |

## Quick Start

1. Download or clone this repo
2. Right-click `setup-claude-code.bat` > **Run as administrator**
3. Follow the prompts
4. Close all terminals, open a new one
5. Run `claude` -- sign in when the browser opens
6. Read `claude-code-guide.md` to level up

## Requirements

- Windows 10 (1809+) or Windows 11
- Internet connection
- Anthropic account (Pro, Max, Teams, or Enterprise) -- sign up at [claude.ai](https://claude.ai)

## What the Setup Script Does

1. Checks for `winget` (Windows Package Manager)
2. Installs **Git for Windows** if missing
3. Installs **Node.js LTS** if missing
4. Installs **Claude Code** via the official installer
5. Verifies everything is on PATH
6. Prints next steps

The script is safe to run multiple times -- it skips anything already installed.

## License

MIT
