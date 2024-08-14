return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>tc",
			"<cmd>TodoTelescope<CR>",
			desc = "Open todo-comments for project in telescope",
		},
		{
			"<leader>tx",
			"<cmd>Trouble todo<CR>",
			desc = "Open todo-comments for project in Trouble",
		},
		{
			"<leader>]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Todo-comments jump next",
		},
		{
			"<leader>[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Todo-comments jump previous",
		},
	},
}
