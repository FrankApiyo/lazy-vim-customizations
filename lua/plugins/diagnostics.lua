return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = true, -- Show diagnostics inline
        signs = true, -- Show signs in the gutter
        underline = true, -- Underline problematic code
        update_in_insert = false, -- Don't update while typing
        severity_sort = true, -- Sort by severity
      })
    end,
  },
}
