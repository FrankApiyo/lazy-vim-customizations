return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.experimental = opts.experimental or {}
    -- Disable ghost text (inline suggestions)
    opts.experimental.ghost_text = false

    -- Add emoji to completion sources
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "emoji" })

    return opts
  end,
}
