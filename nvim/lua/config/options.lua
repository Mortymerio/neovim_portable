-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Portable Python configuration
local nvim_root = vim.env.NVIM_ROOT
if nvim_root then
  vim.g.python3_host_prog = nvim_root .. "/tools/python/python.exe"
end
