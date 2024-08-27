return {
	{
		"yetone/avante.nvim",
		enabled = false,
		event = "VeryLazy",
		build = "make",
		opts = {
			provider = "gemini",
			-- behaviour = {
			-- 	auto_apply_diff_after_generation = true,
			-- },
			hints = {
				enabled = false,
			},
			-- add any opts here
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			{
				"grapp-dev/nui-components.nvim",
				dependencies = {
					"MunifTanjim/nui.nvim",
				},
			},
			--- The below is optional, make sure to setup it properly if you have lazy=true
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
