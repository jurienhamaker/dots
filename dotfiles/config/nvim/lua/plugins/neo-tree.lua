return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
		keys = {
			{ "<leader>e", "<cmd>Oil --float<CR>", desc = "Explorer" },
			{ "<leader>E", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
		},
		opts = {
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.cmd([[
              setlocal relativenumber
            ]])
					end,
				},
			},
		},
	},
}
