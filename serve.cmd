@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\mkdocs.exe" (
  echo Execute primeiro: setup-mkdocs-env.cmd
  exit /b 1
)
".venv\Scripts\mkdocs.exe" serve %*
