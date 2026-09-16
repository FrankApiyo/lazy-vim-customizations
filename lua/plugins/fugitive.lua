return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "GBrowse", "Gdiffsplit", "Gread", "Gwrite", "Gedit" },
    dependencies = {
      -- GitHub support for :GBrowse (permalinks, issue/PR omnicompletion)
      "tpope/vim-rhubarb",
    },
    keys = {
      { "<leader>gb", "<cmd>GBrowse<cr>", mode = "n", desc = "Open current line on GitHub" },
      { "<leader>gb", ":GBrowse<cr>", mode = "x", desc = "Open selected lines on GitHub" },
      { "<leader>gy", "<cmd>GBrowse!<cr>", mode = "n", desc = "Copy GitHub URL for current line" },
      { "<leader>gy", ":GBrowse!<cr>", mode = "x", desc = "Copy GitHub URL for selected lines" },
    },
  },
}
