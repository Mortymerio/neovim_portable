@echo off
set "NVIM_ROOT=%~dp0"
if "%NVIM_ROOT:~-1%"=="\" set "NVIM_ROOT=%NVIM_ROOT:~0,-1%"

:: Launch WezTerm using the local config
start "" "%NVIM_ROOT%\tools\wezterm\wezterm-gui.exe" --config-file "%NVIM_ROOT%\tools\wezterm\wezterm.lua" start --cwd "%NVIM_ROOT%"
