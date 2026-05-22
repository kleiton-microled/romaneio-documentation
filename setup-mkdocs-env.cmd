@echo off
setlocal
cd /d "%~dp0"

set "TMPPS1=%TEMP%\mkdocs-setup-%RANDOM%.ps1"
copy /Y "%~dp0scripts\setup-mkdocs-env.ps1.txt" "%TMPPS1%" >nul
if errorlevel 1 (
  echo Erro ao copiar script para %TEMP%
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%TMPPS1%" %*
set "EC=%ERRORLEVEL%"

del "%TMPPS1%" 2>nul
if %EC% neq 0 (
  echo.
  echo Falha no setup. Veja mensagens acima.
  exit /b %EC%
)
endlocal
