-- vim-test runs pytest through whatever python3 the neoterm shell finds.
-- Prefer the project's .venv when there is one, so tests use the same
-- interpreter as the project. Only Python buffers touch this setting.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  group = vim.api.nvim_create_augroup("project_venv_pytest", { clear = true }),
  callback = function()
    local venv_python = vim.fn.getcwd() .. "/.venv/bin/python"
    if vim.fn.executable(venv_python) == 1 then
      vim.g["test#python#pytest#executable"] = venv_python .. " -m pytest"
    else
      vim.g["test#python#pytest#executable"] = nil
    end
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off", -- "off", "basic", or "strict"
                diagnosticSeverityOverrides = {
                  reportUnreachable = "none", -- Disable unreachable code warnings
                },
              },
            },
          },
        },
      },
    },
  },
}
