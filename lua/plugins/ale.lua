return {
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_fixers = {
        elixir = { "mix_format" },
      }
      vim.g.ale_linters_explicit = 1
    end,
  },
}
