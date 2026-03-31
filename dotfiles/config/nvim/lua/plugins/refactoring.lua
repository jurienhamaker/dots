return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		keys = {
			{ "<leader>re", "<cmd>Refactor extract<cr>", desc = "Refactor extract", mode = { "x" } },
			{ "<leader>rf", "<cmd>Refactor extract_to_file<cr>", desc = "Refactor extract to file", mode = { "x" } },

			{ "<leader>rv", "<cmd>Refactor extract_var<cr>", desc = "Refactor extract var", mode = { "x" } },

			{ "<leader>ri", "<cmd>Refactor inline_var<cr>", desc = "Refactor inline var", mode = { "x", "n" } },

			{ "<leader>rI", "<cmd>Refactor inline_func<cr>", desc = "Refactor inline func", mode = { "n" } },

			{ "<leader>rb", "<cmd>Refactor extract_block<cr>", desc = "Refactor extract block", mode = { "n" } },
			{
				"<leader>rbf",
				"<cmd>Refactor extract_block_to_file<cr>",
				desc = "Refactor extract block to file",
				mode = { "n" },
			},
		},
	},
}
