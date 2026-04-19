@echo off
set "NVIM_ROOT=%~dp0"

:: Remove trailing backslash from NVIM_ROOT if exists
if "%NVIM_ROOT:~-1%"=="\" set "NVIM_ROOT=%NVIM_ROOT:~0,-1%"

:: Set XDG Environment Variables to NVIM_ROOT
set "XDG_CONFIG_HOME=%NVIM_ROOT%"
set "XDG_DATA_HOME=%NVIM_ROOT%"
set "XDG_STATE_HOME=%NVIM_ROOT%"
set "XDG_CACHE_HOME=%NVIM_ROOT%"

:: Add all portable tools to PATH for this session
set "PATH=%NVIM_ROOT%\tools\node;%NVIM_ROOT%\tools\python;%NVIM_ROOT%\tools\python\Scripts;%NVIM_ROOT%\tools\zig;%NVIM_ROOT%\tools\ripgrep;%NVIM_ROOT%\tools\fd;%NVIM_ROOT%\tools\utils;%NVIM_ROOT%\tools\lazygit;%NVIM_ROOT%\tools\fzf;%NVIM_ROOT%\tools\luarocks;%NVIM_ROOT%\tools\go\bin;%NVIM_ROOT%\nvim-bin\bin;%PATH%"

:: Launch Neovim
"%NVIM_ROOT%\nvim-bin\bin\nvim.exe" %*
