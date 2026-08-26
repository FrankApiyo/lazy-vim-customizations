return {
  "folke/tokyonight.nvim",
  opts = {
    -- Brightened to meet WCAG contrast on the #1e1e1e terminal background
    on_colors = function(c)
      c.fg = "#dde5ff"
      c.blue = "#91b4ff"
      c.comment = "#9aa5ce"
      c.fg_gutter = "#8089b3"
      c.dark3 = "#8089b3"
      c.dark5 = "#a9b1d6"
    end,
    on_highlights = function(hl, c)
      hl.CursorLine = { bg = c.bg_highlight }
      hl.CursorColumn = { bg = c.bg_highlight }
      hl.CursorLineNr = { fg = c.orange, bold = true }
      hl.Comment = { fg = c.comment, italic = true }

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
