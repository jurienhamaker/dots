return {
	{ "mason-org/mason.nvim", version = "^1.0.0" },
	{
		"mason-org/mason-lspconfig.nvim",
		version = "^1.0.0",
		opts = {
			ensure_installed = { "angularls@18.2.0" },
		},
	},
}
