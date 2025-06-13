return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			server = {
				tailwindcss = {
					settings = {
						tailwindCSS = {
							classFunctions = { "cva", "cn", "cx" },
						},
					},
				},
			},
		},
	},
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
