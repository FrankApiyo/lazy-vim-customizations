return {
  {
    "vim-test/vim-test",
    dependencies = { "kassio/neoterm" },
    config = function()
      vim.g["test#strategy"] = "neoterm"
      vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Run file tests" })
      vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Run test suite" })
      vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Run last test" })
    end,
  },
}
