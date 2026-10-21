@echo off

:: 1. Reload Flow Launcher by force-killing and restarting it
taskkill /f /im "Flow.Launcher.exe" >nul 2>&1
timeout /t 1 /nobreak >nul
start "" "C:\Users\Somrat\AppData\Local\FlowLauncher\Flow.Launcher.exe"

:: 2. Instantly reload Nilesoft Shell without crashing Windows Explorer
if exist "C:\Program Files\Nilesoft Shell\shell.exe" (
    "C:\Program Files\Nilesoft Shell\shell.exe" -register -silent
)
