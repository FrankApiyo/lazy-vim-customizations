-- Set the leader key to a space
vim.g.mapleader = " "

-- Set the local leader key to a comma
vim.g.maplocalleader = ","

-- Set an insert mode mapping to escape using 'ii'
vim.api.nvim_set_keymap("i", "ii", "<Esc>", { noremap = true, silent = true })

-- Spell-check only in prose filetypes
vim.o.spelllang = "en_us"
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text", "rst" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.g["zprint#options_map"] = "{:search-config? true}"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Cursor crosshair (colors come from the tokyonight spec in lua/plugins/tokyonight.lua)
vim.o.cursorcolumn = true
vim.o.cursorline = true

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.json",
  callback = function()
    vim.cmd("%!jq --indent 4 .")
  end,
})
