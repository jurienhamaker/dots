return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = { eslint = {} },
			setup = {
				eslint = function()
					require("lazyvim.util").lsp.on_attach(function(client)
						if client.name == "eslint" then
							client.server_capabilities.documentFormattingProvider = true
						end

						if client.name == "tsserver" then
							client.server_capabilities.documentFormattingProvider = true
						end
					end)
				end,
			},
		},
	},
}
