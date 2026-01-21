return {
	{
		"folke/snacks.nvim",
		opts = function()
			local ascii = require("ascii")

			local logo = ascii.art.text.neovim.sharp
			local joined = table.concat(logo, "\n")

			return {
				dashboard = {
					preset = {
						header = joined,
					},
				},
			}
		end,
	},
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
