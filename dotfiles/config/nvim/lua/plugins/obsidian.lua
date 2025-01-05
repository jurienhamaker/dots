return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = false,
		-- ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		event = {
			-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
			"BufReadPre /home/jurien/vault/**.md",
			"BufNewFile /home/jurien/vault/**.md",
		},
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "/home/jurien/vault",
				},
			},

			notes_subdir = "inbox",
			new_notes_location = "notes_subdir",

			disable_frontmatter = true,
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M:%S",
			},
			mappings = {
				-- overrides the 'gf' mapping to work on markdown/wiki links within your vault
				["or"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- toggle check-boxes
				-- ["<leader>ch"] = {
				--   action = function()
				--     return require("obsidian").util.toggle_checkbox()
				--   end,
				--   opts = { buffer = true },
				-- },
			},
			completion = {
				nvim_cmp = false,
				min_chars = 2,
			},
			ui = {
				-- Disable some things below here because I set these manually for all Markdown files using treesitter
				-- checkboxes = {},
				-- bullets = {},
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "saghen/blink.compat", branch = "main" },
		},
		opts = {
			sources = {
				default = { "obsidian", "obsidian_new", "obsidian_tags" },
				providers = {
					obsidian = {
						name = "obsidian",
						module = "blink.compat.source",
					},
					obsidian_new = {
						name = "obsidian_new",
						module = "blink.compat.source",
					},
					obsidian_tags = {
						name = "obsidian_tags",
						module = "blink.compat.source",
					},
				},
			},
		},
	},
}
