return {
	"stevearc/oil.nvim",
	-- enabled = false,
	keys = {
		{ "<leader>e", "<cmd>Oil --float<CR>", desc = "Explorer", remap = true },
	},
	opts = {
		keymaps = {
			["<C-s>"] = false,
			["<Esc>"] = "actions.close",
			["q"] = "actions.close",
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 5,
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-mini/mini.icons" },
}
