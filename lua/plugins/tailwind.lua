return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes = {
            "eruby",
            "handlebars",
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "svelte",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
            "vue",
          },
        },
      },
    },
  },
}
