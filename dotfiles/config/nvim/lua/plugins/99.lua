return {
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

			vim.fn.setenv("OPENCODE_PERMISSION", '{"edit": "allow"}')

			_99.setup({
				show_in_flight_requests = true,
				md_files = { "AGENT.md" },
				provider = _99.Providers.ClaudeCodeProvider,
				model = "claude-opus-4-6",
				completion = {
					custom_rules = { "~/skills/skills" },
					source = "blink",
				},
				display_errors = true,
			})

			require("which-key").add({ { "<leader>9", group = "+99 AI", mode = "n" } })

			vim.keymap.set("v", "<leader>9", _99.visual, { desc = "visual selection with prompt" })
			vim.keymap.set("n", "<leader>9x", _99.stop_all_requests, { desc = "stop all requests" })
			vim.keymap.set("n", "<leader>9s", _99.search, { desc = "search" })
		end,
	},
}
