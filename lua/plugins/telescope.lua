-- Remembers toggle state across the picker's lifecycle (like NERDTree)
local flags = { hidden = false, no_ignore = false }

-- Returns an in-picker action that flips one flag and reloads find_files,
-- preserving whatever you've already typed.
local function toggle(flag)
  return function(prompt_bufnr)
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local current = action_state.get_current_line()
    flags[flag] = not flags[flag]
    actions.close(prompt_bufnr)
    require("telescope.builtin").find_files({
      hidden = flags.hidden,
      no_ignore = flags.no_ignore,
      default_text = current,
    })
  end
end

-- live_grep that accepts ripgrep flags in the prompt, e.g.
--   "create_instance" -g !*test*
-- Quote the pattern (or press <C-k> to quote it for you) before adding flags.
local function grep_args(cwd)
  return function()
    require("telescope").extensions.live_grep_args.live_grep_args({ cwd = cwd() })
  end
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
  keys = {
    { "<leader>/", grep_args(LazyVim.root), desc = "Grep (Root Dir)" },
    { "<leader>sg", grep_args(LazyVim.root), desc = "Grep (Root Dir)" },
    { "<leader>sG", grep_args(vim.uv.cwd), desc = "Grep (cwd)" },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      file_ignore_patterns = { "%.git/" },
      mappings = {
        i = {
          ["<C-h>"] = toggle("hidden"), -- show/hide dotfiles (like NERDTree Ctrl+h)
          ["<C-i>"] = toggle("no_ignore"), -- show/hide gitignored (like NERDTree Ctrl+i)
        },
        n = {
          ["<C-h>"] = toggle("hidden"),
          ["<C-i>"] = toggle("no_ignore"),
        },
      },
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-k>"] = function(...)
              return require("telescope-live-grep-args.actions").quote_prompt()(...)
            end,
          },
        },
      },
    },
  },
}
