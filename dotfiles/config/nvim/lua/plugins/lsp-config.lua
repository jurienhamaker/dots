return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      server = {
        vtsls = {
          root_dir = require("lspconfig").util.root_pattern(".git"),
          settings = {
            typescript = {
              sortImports = true,
              removeUnusedImports = true,
            },
            javascript = {
              sortImports = true,
              removeUnusedImports = true,
            },
          },
        },
      },
    },
  },
}
