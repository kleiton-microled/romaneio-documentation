#!/usr/bin/env bash
# Roda mkdocs serve na raiz do repo (Git Bash / WSL)
set -e
cd "$(dirname "$0")"
exec ./.venv/Scripts/mkdocs.exe serve "$@"
