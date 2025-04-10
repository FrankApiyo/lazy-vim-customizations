return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      typescript = { "prettier" },
      javascript = { "prettier" },
      svelte = { "prettier" },
      go = { "goimports", "gofmt" },
      clojure = { "zprint" }, -- Add zprint here
    },
    formatters = {
      zprint = {
        command = "sh",
        args = { "-c", "cat | zprint" },
        stdin = true,
      },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 1000,
    },
  },
}
