@echo off
setlocal
rem Safe installer: copy missing files from this package into the current project directory.
rem Run this BAT by its full path while the terminal's current directory is the target project root.
set "INSTALLER_DIR=%~dp0"
where powershell.exe >nul 2>nul
if errorlevel 1 (
  echo ERROR: Windows PowerShell was not found.
  pause
  exit /b 10
)
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%INSTALLER_DIR%install-to-existing-project.ps1"
set "INSTALLER_EXIT=%ERRORLEVEL%"
echo.
if not "%INSTALLER_EXIT%"=="0" echo Installer exited with code %INSTALLER_EXIT%.
pause
exit /b %INSTALLER_EXIT%
