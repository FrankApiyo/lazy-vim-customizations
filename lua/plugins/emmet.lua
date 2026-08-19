return {
  {
    "mattn/emmet-vim",
    commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d", -- Pin to version before treesitter issues
    lazy = false,
    init = function()
      vim.g.user_emmet_leader_key = "," -- Expand with ,, in insert mode
      vim.g.user_emmet_install_global = 1
      -- Only enable for specific filetypes
      vim.g.user_emmet_mode = "inv" -- enable in insert, normal, visual modes
    end,
  },
}
