return {
  "vim-test/vim-test",
  dependencies = { "kassio/neoterm" },
  init = function()
    vim.g.neoterm_default_mod = "botright"
    vim.g.neoterm_size = 15
    vim.g.neoterm_autoscroll = 1
  end,
  config = function()
    vim.g["test#strategy"] = "neoterm"
    vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Run file tests" })
    vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Run test suite" })
    vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Run last test" })
  end,
}
