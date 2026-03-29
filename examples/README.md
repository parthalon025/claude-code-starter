# Example Configurations

Ready-to-use config files, agents, and slash commands for Claude Code. Copy them to the right location and customize.

**Or let Claude do it:** Open Claude Code and say:
```
look at the examples folder in this starter kit and set up the settings, MCP servers, agents, and commands for me
```

## Files and Where They Go

| File | Copy To | What It Does |
|---|---|---|
| `settings-example.json` | `C:\Users\YourName\.claude\settings.json` | Permissions, model, plugins |
| `mcp-example.json` | `C:\Users\YourName\.claude\.mcp.json` | GitHub, docs, and filesystem integrations |

## Agents (copy to `C:\Users\YourName\.claude\agents\`)

| File | What It Does |
|---|---|
| `agents/code-reviewer.md` | Reviews code for bugs, style, and security issues |
| `agents/explain-code.md` | Explains code in plain English for beginners |
| `agents/doc-writer.md` | Writes README files and technical documentation |

## Slash Commands (copy to `C:\Users\YourName\.claude\commands\`)

| File | Usage | What It Does |
|---|---|---|
| `commands/review-pr.md` | `/review-pr` | Reviews a pull request for bugs and security |
| `commands/daily-summary.md` | `/daily-summary` | Summarizes yesterday's git activity for standup |
| `commands/explain-this.md` | `/explain-this` | Explains a project or file for someone new |

## Customizing

After copying, open Claude Code and say things like:
- "update my settings to also auto-approve Python commands"
- "add a new agent for reviewing TypeScript code"
- "create a slash command that runs my test suite"

Claude will edit the config files for you -- no manual JSON editing needed.
