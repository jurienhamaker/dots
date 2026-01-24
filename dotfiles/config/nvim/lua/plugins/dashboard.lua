return {
	{
		"folke/snacks.nvim",
		opts = function(_, opts)
			local ascii = require("ascii")

			local logo = ascii.art.text.neovim.sharp
			local joined = table.concat(logo, "\n")

			opts.dashboard.preset.header = joined
			return opts
		end,
	},
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
