return {
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	config = function()
	-- 		require("luasnip.loaders.from_vscode").lazy_load({
	-- 			paths = vim.fn.getcwd(),
	-- 		})
	-- 	end,
	-- },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.getcwd() })
			end,
		},
	},

	{
		"benfowler/telescope-luasnip.nvim",
	},
}
