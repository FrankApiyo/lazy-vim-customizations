return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      typescript = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      svelte = { "prettier" },
      go = { "goimports", "gofmt" },
      clojure = { "zprint" },
    },
    formatters = {
      zprint = {
        command = "sh",
        args = { "-c", "cat | zprint" },
        stdin = true,
      },
      prettier = {
        prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
      },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 1000,
    },
  },
}
