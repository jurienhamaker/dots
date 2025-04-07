return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			server = {
				tailwindcss = {
					experimental = {
						classRegex = {
							{ "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
							{ "cx\\(((?:[^()]|\\([^()]*\\))*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
						},
					},
				},
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	-- {
	-- 	"saghen/blink.cmp",
	-- 	dependencies = {
	-- 		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
	-- 	},
	-- 	opts = function(_, opts)
	-- 		-- local format_kinds = opts.formatting.format --  lazy vim icons formatter
	-- 		-- opts.formatting.format = function(entry, item)
	-- 		-- 	format_kinds(entry, item) -- add icons
	-- 		-- 	return require("tailwindcss-colorizer-cmp").formatter(entry, item)
	-- 		-- end
	-- 	end,
	-- },
	{
		"laytan/tailwind-sorter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
		build = "cd formatter && npm i && npm run build",
		config = function()
			require("tailwind-sorter").setup({
				on_save_pattern = { "*.html", "*.jsx", "*.tsx" },
			})
		end,
	},
}
