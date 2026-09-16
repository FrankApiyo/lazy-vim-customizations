return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          prefix = "●",
          -- Show full error message in virtual text
          format = function(diagnostic)
            return diagnostic.message
          end,
        },
        signs = true, -- Show signs in the gutter
        underline = true, -- Underline problematic code
        update_in_insert = false, -- Don't update while typing
        severity_sort = true, -- Sort by severity
        float = {
          border = "rounded",
          source = "always", -- Show source (e.g., "pyright")
          header = "",
          prefix = "",
          max_width = 80, -- Increase float window width
          wrap = true, -- Wrap long lines
        },
      })
    end,
  },
}
