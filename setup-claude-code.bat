@echo off
setlocal EnableDelayedExpansion
title Claude Code - Full Setup for Windows
color 0A

echo ============================================================
echo    Claude Code - Automated Setup for Fresh Windows Install
echo ============================================================
echo.
echo  WHAT IS CLAUDE CODE?
echo    An AI coding assistant that lives in your terminal.
echo    You type what you want in plain English, and it writes
echo    code, edits files, runs commands, and builds projects.
echo.
echo  This script will install everything you need:
echo    1. Git for Windows    (tracks code changes)
echo    2. Node.js LTS        (runs JavaScript tools)
echo    3. GitHub CLI          (manages code on GitHub)
echo    4. Claude Code         (the AI assistant)
echo.
echo  PREREQUISITES:
echo    - Windows 10 (1809+) or Windows 11
echo    - An Anthropic account (free to create, paid to use)
echo      Sign up at: https://claude.ai
echo.
echo  PRICING (check claude.ai for latest):
echo    Pro:        $20/mo  (casual use, great for learning)
echo    Max (5x):  $100/mo  (heavy daily use)
echo    Max (20x): $200/mo  (professional / power user)
echo    Teams:      $30/user/mo (organizations)
echo    Enterprise: Custom pricing
echo.
echo ============================================================
echo.
echo  Press any key to begin the installation...
pause >nul

:: ---------------------------------------------------------------
:: CHECK FOR ADMIN (winget sometimes needs it on first run)
:: ---------------------------------------------------------------
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] WARNING: Not running as Administrator.
    echo     Some installs may prompt for elevation.
    echo     If anything fails, right-click this script
    echo     and choose "Run as administrator".
    echo.
)

:: ---------------------------------------------------------------
:: STEP 1: Check if winget is available
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 1 of 6: Checking for winget (Windows Package Manager)
echo ============================================================
echo.
echo  WHAT: winget is Windows' built-in app installer.
echo  WHY:  It lets us install Git, Node, and Claude automatically.
echo.
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo [X] winget is NOT installed.
    echo.
    echo     winget comes with "App Installer" from the Microsoft Store.
    echo     Opening Microsoft Store now...
    start ms-windows-store://pdp/?ProductId=9NBLGGH4NNS1
    echo.
    echo     WHAT TO DO:
    echo       1. Click "Install" in the Store window that opened
    echo       2. Wait for it to finish
    echo       3. Close this script
    echo       4. Run this script again
    echo.
    pause
    exit /b 1
)
echo [OK] winget is available.
echo.

:: ---------------------------------------------------------------
:: STEP 2: Install Git for Windows
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 2 of 6: Installing Git for Windows
echo ============================================================
echo.
echo  WHAT: Git tracks every change to your code.
echo  WHY:  Claude Code uses Git to manage your project history
echo        and create commits, branches, and pull requests.
echo.
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo     Git is not installed. Installing now...
    echo     (This may take a minute or two)
    echo.
    winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo.
        echo [X] Git installation failed.
        echo     Try installing manually from: https://git-scm.com/download/win
        echo.
        pause
        exit /b 1
    )
    echo.
    echo [OK] Git installed successfully.
) else (
    for /f "tokens=3" %%v in ('git --version') do echo [OK] Git is already installed ^(version %%v^)
)
echo.

:: ---------------------------------------------------------------
:: STEP 3: Install Node.js LTS
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 3 of 6: Installing Node.js
echo ============================================================
echo.
echo  WHAT: Node.js runs JavaScript outside a browser.
echo  WHY:  Claude Code and many dev tools are built on Node.
echo.
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo     Node.js is not installed. Installing now...
    echo     (This may take a minute or two)
    echo.
    winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo.
        echo [X] Node.js installation failed.
        echo     Try installing manually from: https://nodejs.org
        echo.
        pause
        exit /b 1
    )
    echo.
    echo [OK] Node.js installed successfully.
) else (
    for /f "tokens=1" %%v in ('node --version') do echo [OK] Node.js is already installed ^(version %%v^)
)
echo.

:: ---------------------------------------------------------------
:: STEP 4: Install GitHub CLI
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 4 of 6: Installing GitHub CLI (gh)
echo ============================================================
echo.
echo  WHAT: The official GitHub command-line tool.
echo  WHY:  Create repos, pull requests, and manage issues from
echo        your terminal. Claude Code uses it for GitHub integration.
echo.
where gh >nul 2>&1
if %errorlevel% neq 0 (
    echo     GitHub CLI is not installed. Installing now...
    echo     (This may take a minute)
    echo.
    winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo.
        echo [X] GitHub CLI installation failed.
        echo     Try installing manually from: https://cli.github.com
        echo.
        echo     NOTE: This is optional -- Claude Code will still work
        echo     without it, but you won't have GitHub integration.
        echo.
    ) else (
        echo.
        echo [OK] GitHub CLI installed successfully.
    )
) else (
    for /f "tokens=1" %%v in ('gh --version') do echo [OK] GitHub CLI is already installed
)
echo.

:: ---------------------------------------------------------------
:: STEP 5: Install Claude Code
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 5 of 6: Installing Claude Code
echo ============================================================
echo.
echo  WHAT: Your AI coding assistant.
echo  WHY:  This is the tool that writes, edits, and explains code
echo        using natural language. It's what this whole setup is for!
echo.
echo     Running the official Claude Code installer from claude.ai...
echo     (This uses PowerShell, a built-in Windows tool. May take a minute.)
echo.
powershell -ExecutionPolicy Bypass -Command "irm https://claude.ai/install.ps1 | iex"
if %errorlevel% neq 0 (
    echo.
    echo     Primary installer had an issue. Trying winget as backup...
    echo.
    winget install --id Anthropic.ClaudeCode -e --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo.
        echo [X] Claude Code installation failed.
        echo     Try installing manually from: https://claude.ai/download
        echo.
        pause
        exit /b 1
    )
)
echo.
echo [OK] Claude Code installed.
echo.

:: ---------------------------------------------------------------
:: STEP 6: Verify installations
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 6 of 6: Verifying everything is installed
echo ============================================================
echo.

:: Refresh PATH so newly installed tools are detected
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do set "SYS_PATH=%%B"
for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USR_PATH=%%B"
set "PATH=!SYS_PATH!;!USR_PATH!"

set ISSUES=0

echo  Checking Git...
where git >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=3" %%v in ('git --version') do echo    [OK] git %%v
) else (
    echo    [--] git not on PATH yet (will work after restarting terminal^)
    set ISSUES=1
)

echo  Checking Node.js...
where node >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=1" %%v in ('node --version') do echo    [OK] node %%v
) else (
    echo    [--] node not on PATH yet (will work after restarting terminal^)
    set ISSUES=1
)

echo  Checking GitHub CLI...
where gh >nul 2>&1
if %errorlevel% equ 0 (
    echo    [OK] gh (GitHub CLI^) is installed
) else (
    echo    [--] gh not on PATH yet (will work after restarting terminal^)
    set ISSUES=1
)

echo  Checking Claude Code...
where claude >nul 2>&1
if %errorlevel% equ 0 (
    echo    [OK] claude is installed
) else (
    echo    [--] claude not on PATH yet (will work after restarting terminal^)
    set ISSUES=1
)

echo.
if !ISSUES! equ 1 (
    echo  NOTE: Some tools show [--] because this terminal doesn't
    echo  have the updated PATH yet. They WILL work after you close
    echo  this window and open a new terminal. This is normal.
    echo.
)

echo.
echo ============================================================
echo.
echo    ALL DONE! Setup is complete.
echo.
echo ============================================================
echo.
echo  IMPORTANT: You MUST close this window and open a fresh terminal.
echo  Your computer needs a new terminal to find the tools we just
echo  installed. This is normal -- just close and reopen.
echo.
echo  ============================================================
echo   WHAT TO DO NEXT (step by step):
echo  ============================================================
echo.
echo   1. Press any key below, then CLOSE this window
echo.
echo   2. Open a NEW terminal:
echo      - Press the Windows key on your keyboard
echo      - Type "Terminal"
echo      - Press Enter
echo.
echo   3. Verify Claude Code is installed:
echo.
echo        claude --version
echo.
echo   4. Run the health check:
echo.
echo        claude doctor
echo.
echo   5. Configure Git (first time only):
echo      (Replace "Your Name" and email with YOUR actual info)
echo.
echo        git config --global user.name "Your Name"
echo        git config --global user.email "your@email.com"
echo.
echo   6. Log in to GitHub CLI (first time only):
echo.
echo        gh auth login
echo.
echo      It asks questions. Use arrow keys and press Enter:
echo        - "Where do you use GitHub?" ^> GitHub.com
echo        - "Preferred protocol?" ^> HTTPS
echo        - "Authenticate?" ^> Login with a web browser
echo        - It shows a code. Press Enter, paste in browser.
echo.
echo      NOTE: Your GitHub account (github.com) and Anthropic
echo      account (claude.ai) are SEPARATE. Different companies.
echo.
echo   7. Start Claude Code for the first time:
echo.
echo        claude
echo.
echo      A browser window will open. Sign in with your
echo      ANTHROPIC account (not GitHub -- they are different).
echo.
echo   8. Once logged in, try your first project:
echo.
echo        mkdir my-first-project
echo        cd my-first-project
echo        claude
echo.
echo   9. Say these things to Claude (one at a time):
echo.
echo        "create a simple Python hello world program"
echo        "explain what you just wrote"
echo        "add a function that greets someone by name"
echo        "run it with the name 'World'"
echo.
echo  ============================================================
echo   OTHER WAYS TO USE CLAUDE CODE
echo  ============================================================
echo.
echo   Besides the terminal (CLI), Claude Code is also available as:
echo.
echo   - Desktop App (Windows/Mac):  https://claude.ai/download
echo   - VS Code Extension:          Search "Claude Code" in Extensions
echo   - JetBrains Plugin:           Search "Claude Code" in Plugins
echo   - Web App:                    https://claude.ai/code
echo.
echo   All versions share the same AI -- pick what's comfortable.
echo.
echo  ============================================================
echo   HANDY REFERENCE
echo  ============================================================
echo.
echo   Inside Claude Code:
echo     /help       Show all commands
echo     /clear      Reset the conversation
echo     /compact    Free up context space
echo     /cost       See token usage
echo     Shift+Tab   Cycle permission modes
echo     Ctrl+C      Cancel current action
echo     exit        Quit Claude Code
echo.
echo   Troubleshooting:
echo     claude doctor           Check for problems
echo     claude --version        Show installed version
echo     claude /login           Re-authenticate
echo.
echo   Links:
echo     Account:  https://claude.ai
echo     Docs:     https://docs.anthropic.com/en/docs/claude-code
echo     Issues:   https://github.com/anthropics/claude-code/issues
echo.
echo ============================================================
echo.
pause
