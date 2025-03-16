return {
  {
    "mattn/emmet-vim",
    lazy = false, -- Ensures it's loaded immediately
    init = function()
      vim.g.user_emmet_leader_key = "," -- Change to your preferred key
      vim.g.user_emmet_install_global = 1
    end,
  },
}
