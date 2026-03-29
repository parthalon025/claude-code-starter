# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A Windows-focused starter kit for getting Claude Code installed and configured. It contains no application code -- only documentation and a setup script.

## Contents

- `setup-claude-code.bat` -- Windows batch installer that uses `winget` to install Git, Node.js, GitHub CLI, and Claude Code. Safe to run repeatedly (skips already-installed tools). Requires admin for first run.
- `claude-code-guide.md` -- End-to-end Claude Code guide from "what's a terminal?" to agent teams, industry best practices, and social media tips.
- `github-guide.md` -- GitHub beginner guide covering setup, cloning, branches, PRs, `gh` CLI, profile optimization, and Claude Code integration.
- `LICENSE` -- MIT license.
- `.gitignore` -- Standard ignores for OS files, secrets, dependencies, and build output.
- `templates/` -- Copy-paste CLAUDE.md files for common stacks (React, Python, Next.js, general).
- `examples/` -- Ready-to-use configs:
  - `settings-example.json` -- Recommended `~/.claude/settings.json`
  - `mcp-example.json` -- Recommended `~/.claude/.mcp.json`
  - `agents/` -- Starter agent definitions (code-reviewer, explain-code, doc-writer)
  - `commands/` -- Starter slash commands (review-pr, daily-summary, explain-this)

## Editing Guidelines

- Keep all docs in sync -- if the setup script changes steps, update the README and guides accordingly.
- The setup script targets Windows 10 (1809+) and Windows 11. Do not add Unix-only instructions without noting the platform.
- The guides use plain Markdown tables and fenced code blocks. Maintain that style.
- The README quick-start must stay concise (under 10 steps).
- Always include "why" explanations alongside "how" instructions -- this repo targets beginners.
- Emphasize "let Claude do it" -- after install, users should ask Claude Code to set up configs, agents, and commands rather than manually editing files.
- Templates and examples are starting points. Encourage users to customize via Claude Code prompts.
