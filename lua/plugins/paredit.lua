return {
  "julienvincent/nvim-paredit",
  ft = { "clojure", "fennel", "scheme" },
  config = function()
    require("nvim-paredit").setup({
      -- Use default keybindings
      use_default_keys = true,
      -- Automatically indent after operations
      indent = {
        enabled = true,
      },
    })
  end,
}
