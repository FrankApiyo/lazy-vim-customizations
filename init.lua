-- Set the leader key to a space
vim.g.mapleader = " "

-- Set the local leader key to a comma
vim.g.maplocalleader = ","

vim.g.user_emmet_leader_key = "<C-Y>"

-- Set an insert mode mapping to escape using 'ii'
vim.api.nvim_set_keymap("i", "ii", "<Esc>", { noremap = true, silent = true })

-- set spell
vim.o.spell = true
vim.o.spelllang = "en_us"

vim.g["zprint#options_map"] = "{:search-config? true}"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "┃" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signs_staged = {
    add = { text = "+" },
    change = { text = "┃" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signs_staged_enable = true,
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true,
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
})
require("hlslens").setup()
local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
  show = true,
  show_in_active_only = false,
  set_highlights = true,
  folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
  max_lines = false, -- disables if no. of lines in buffer exceeds this
  hide_if_all_visible = false, -- Hides everything if all lines are visible
  throttle_ms = 100,
  handle = {
    text = " ",
    blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
    color = colors.bg_highlight,
    color_nr = nil, -- cterm
    highlight = "CursorColumn",
    hide_if_all_visible = true, -- Hides handle if all lines are visible
  },
  marks = {
    Cursor = {
      text = "•",
      priority = 0,
      gui = nil,
      color = nil,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "Normal",
    },
    Search = {
      text = { "-", "=" },
      priority = 1,
      gui = nil,
      color = colors.orange,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "Search",
    },
    Error = {
      text = { "-", "=" },
      priority = 2,
      gui = nil,
      color = colors.error,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "DiagnosticVirtualTextError",
    },
    Warn = {
      text = { "-", "=" },
      priority = 3,
      gui = nil,
      color = colors.warning,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "DiagnosticVirtualTextWarn",
    },
    Info = {
      text = { "-", "=" },
      priority = 4,
      gui = nil,
      color = colors.info,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "DiagnosticVirtualTextInfo",
    },
    Hint = {
      text = { "-", "=" },
      priority = 5,
      gui = nil,
      color = colors.hint,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "DiagnosticVirtualTextHint",
    },
    Misc = {
      text = { "-", "=" },
      priority = 6,
      gui = nil,
      color = colors.purple,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "Normal",
    },
    GitAdd = {
      text = "┆",
      priority = 7,
      gui = nil,
      color = colors.green,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "GitSignsAdd",
    },
    GitChange = {
      text = "┆",
      priority = 7,
      gui = nil,
      color = colors.yellow,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "GitSignsChange",
    },
    GitDelete = {
      text = "▁",
      priority = 7,
      gui = nil,
      color = colors.red,
      cterm = nil,
      color_nr = nil, -- cterm
      highlight = "GitSignsDelete",
    },
  },
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "cmp_docs",
    "cmp_menu",
    "noice",
    "prompt",
    "TelescopePrompt",
  },
  autocmd = {
    render = {
      "BufWinEnter",
      "TabEnter",
      "TermEnter",
      "WinEnter",
      "CmdwinLeave",
      "TextChanged",
      "VimResized",
      "WinScrolled",
    },
    clear = {
      "BufWinLeave",
      "TabLeave",
      "TermLeave",
      "WinLeave",
    },
  },
  handlers = {
    cursor = true,
    diagnostic = true,
    gitsigns = true, -- Requires gitsigns
    handle = true,
    search = true, -- Requires hlslens
    ale = false, -- Requires ALE
  },
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "%F" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "%F" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})

-- Highlight the cursor column
vim.o.cursorcolumn = true
vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = "darkgrey", bg = "#3c3c3c", blend = 20 })

-- Highlight the cursor line
vim.o.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "darkgrey", bg = "#3c3c3c", blend = 20 })

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.json",
  callback = function()
    vim.cmd("%!jq --indent 4 .")
  end,
})
