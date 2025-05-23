return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.getcwd() })
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = vim.fn.expand("$HOME/.config/nvim/snippets"),
				})
			end,
		},
	},

	{
		"benfowler/telescope-luasnip.nvim",
	},
}
