@echo off
setlocal EnableDelayedExpansion
title Claude Code - Full Setup for Windows
color 0A

echo ============================================================
echo    Claude Code - Automated Setup for Fresh Windows Install
echo ============================================================
echo.
echo  This script will install everything you need:
echo    1. Git for Windows  (required dependency)
echo    2. Node.js LTS      (required dependency)
echo    3. Claude Code       (the main tool)
echo.
echo  PREREQUISITES:
echo    - Windows 10 (1809+) or Windows 11
echo    - An Anthropic account (Pro, Max, Teams, or Enterprise)
echo      Sign up at: https://claude.ai
echo.
echo ============================================================
echo.
echo  Press any key to begin...
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
echo  STEP 1 of 5: Checking for winget (Windows Package Manager)
echo ============================================================
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
    echo       1. Install "App Installer" from the Store window that opened
    echo       2. Close this script
    echo       3. Run this script again
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
echo  STEP 2 of 5: Installing Git for Windows
echo ============================================================
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
echo  STEP 3 of 5: Installing Node.js
echo ============================================================
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
:: STEP 4: Install Claude Code
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 4 of 5: Installing Claude Code
echo ============================================================
echo.
echo     Running the official Claude Code installer...
echo     (This may take a minute)
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
:: STEP 5: Verify installations
:: ---------------------------------------------------------------
echo ============================================================
echo  STEP 5 of 5: Verifying everything is installed
echo ============================================================
echo.

:: Refresh PATH so newly installed tools are detected
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do set "SYS_PATH=%%B"
for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USR_PATH=%%B"
set "PATH=!SYS_PATH!;!USR_PATH!"

echo  Checking Git...
where git >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=3" %%v in ('git --version') do echo    [OK] git %%v
) else (
    echo    [--] git not on PATH yet (will work after restarting terminal^)
)

echo  Checking Node.js...
where node >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=1" %%v in ('node --version') do echo    [OK] node %%v
) else (
    echo    [--] node not on PATH yet (will work after restarting terminal^)
)

echo  Checking Claude Code...
where claude >nul 2>&1
if %errorlevel% equ 0 (
    echo    [OK] claude is installed
) else (
    echo    [--] claude not on PATH yet (will work after restarting terminal^)
)

echo.
echo.
echo ============================================================
echo.
echo    ALL DONE! Setup is complete.
echo.
echo ============================================================
echo.
echo  IMPORTANT: Close ALL open terminals/command prompts now.
echo  New installs won't be recognized until you open a fresh one.
echo.
echo  ============================================================
echo   WHAT TO DO NEXT (step by step):
echo  ============================================================
echo.
echo   1. CLOSE this window
echo.
echo   2. Open a NEW terminal:
echo      - Press Windows key, type "Terminal", press Enter
echo      - Or press Windows key, type "cmd", press Enter
echo.
echo   3. Verify Claude Code is installed:
echo.
echo        claude --version
echo.
echo   4. Run the health check:
echo.
echo        claude doctor
echo.
echo   5. Start Claude Code for the first time:
echo.
echo        claude
echo.
echo      A browser window will open. Sign in with your
echo      Anthropic account (Pro, Max, Teams, or Enterprise).
echo.
echo   6. Once logged in, go to any project folder:
echo.
echo        cd C:\Users\YourName\Projects\my-app
echo        claude
echo.
echo   7. Try saying these things to Claude:
echo.
echo        "what does this project do?"
echo        "explain the folder structure"
echo        "help me write a hello world program in Python"
echo        "create a simple webpage with HTML and CSS"
echo.
echo  ============================================================
echo   HANDY REFERENCE
echo  ============================================================
echo.
echo   Inside Claude Code:
echo     /help       Show all commands
echo     /clear      Reset the conversation
echo     Ctrl+C      Cancel current action
echo     exit        Quit Claude Code
echo.
echo   Troubleshooting:
echo     claude doctor           Check for problems
echo     claude --version        Show installed version
echo.
echo   Links:
echo     Account:  https://claude.ai
echo     Docs:     https://docs.anthropic.com/en/docs/claude-code
echo.
echo ============================================================
echo.
pause
