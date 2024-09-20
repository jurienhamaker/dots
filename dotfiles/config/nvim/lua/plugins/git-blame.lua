return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = true, -- if you want to enable the plugin
		message_template = "<author> • <date> • <summary>", -- template for the blame message, check the Message template section for more options
		-- date_format = "%Y-%m-%d %H:%M:%S", -- template for the date, check Date format section for more options
		date_format = "%Y-%m-%d", -- template for the date, check Date format section for more options
	},
}
