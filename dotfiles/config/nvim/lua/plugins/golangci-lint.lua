return {
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = { ensure_installed = { "golangci-lint" } },
			},
		},
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				nls.builtins.diagnostics.golangci_lint,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				go = { "golangci-lint" },
			},
		},
	},
}
