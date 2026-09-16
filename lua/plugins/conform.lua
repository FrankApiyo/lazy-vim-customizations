return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
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
      prettier = {},
    },
    format_on_save = function(bufnr)
      local ignore_filetypes = { "markdown" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      return {
        lsp_fallback = true,
        timeout_ms = 1000,
      }
    end,
  },
}
