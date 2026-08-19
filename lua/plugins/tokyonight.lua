return {
  "folke/tokyonight.nvim",
  opts = {
    on_highlights = function(hl, c)
      hl.CursorLine = { bg = c.bg_highlight }
      hl.CursorColumn = { bg = c.bg_highlight }
      hl.CursorLineNr = { fg = c.orange, bold = true }
      hl.Comment = { fg = "#7a83ac", italic = true }

      hl.TreesitterContext = { bg = c.bg_highlight }
      hl.TreesitterContextLineNumber = { fg = c.dark5, bg = c.bg_highlight }
      hl.TreesitterContextBottom = { underline = true, sp = c.blue0 }

      hl.WinSeparator = { fg = c.blue0 }

      hl.DiagnosticVirtualTextError = { fg = c.error, italic = true }
      hl.DiagnosticVirtualTextWarn = { fg = c.warning, italic = true }
      hl.DiagnosticVirtualTextInfo = { fg = c.info, italic = true }
      hl.DiagnosticVirtualTextHint = { fg = c.hint, italic = true }

      hl.Search = { bg = c.blue0, fg = c.fg }
      hl.CurSearch = { bg = c.orange, fg = c.black, bold = true }
      hl.IncSearch = { bg = c.orange, fg = c.black, bold = true }
    end,
  },
}
