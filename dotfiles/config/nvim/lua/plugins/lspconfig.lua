return {
	"neovim/nvim-lspconfig",
	opts = {
		setup = {
			eslint = function(_, opts)
				opts.filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
					"svelte",
					"astro",
					"html",
					"htmlangular",
				}

				local formatter = LazyVim.lsp.formatter({
					name = "eslint: lsp",
					primary = false,
					priority = 200,
					filter = "eslint",
				})

				-- register the formatter with LazyVim
				LazyVim.format.register(formatter)
			end,
		},
	},
}
