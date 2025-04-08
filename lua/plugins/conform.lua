return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      typescript = { "prettier" },
      javascript = { "prettier" },
      svelte = { "prettier" },
      go = { "goimports", "gofmt" },
    },
  },
}
