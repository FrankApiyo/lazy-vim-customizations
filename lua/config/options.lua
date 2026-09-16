-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Conjure starts its Python REPL as soon as a Python buffer opens. Prefer the
-- project's .venv interpreter when nvim is launched from a project root.
local venv_python = vim.fn.getcwd() .. "/.venv/bin/python"
if vim.fn.executable(venv_python) == 1 then
  vim.g["conjure#client#python#stdio#command"] = venv_python .. " -iq"
end
