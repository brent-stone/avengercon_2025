@echo off
SETLOCAL EnableDelayedExpansion

WHERE uv >nul 2>&1
IF ERRORLEVEL 0 (
    ECHO uv may not always self-update cleanly. Run 'uv self update' manually
) ELSE (
    ECHO uv not found: https://docs.astral.sh/uv/getting-started/installation/#standalone-installer
)

WHERE uv >nul 2>&1
IF ERRORLEVEL 0 (
    uv self update
    uv sync --upgrade
) ELSE (
    ECHO uv is not installed. Please install uv then retry.
    ECHO https://docs.astral.sh/uv/getting-started/installation/#standalone-installer
    EXIT /B 1
)

pre-commit autoupdate

@REM Output a success notice to the developer.
ECHO "Your dev environment is on the latest hotness."
ECHO "Run tox before committing to verify nothing broke."