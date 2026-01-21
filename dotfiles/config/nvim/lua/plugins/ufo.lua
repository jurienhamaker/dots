return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "BufRead",
		opts = {},
		config = function()
			-- add folding range to capabilities
			local original_make_capabilities = vim.lsp.protocol.make_client_capabilities
			vim.lsp.protocol.make_client_capabilities = function()
				local capabilities = original_make_capabilities()
				capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}
				return capabilities
			end

			-- Fold options
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			require("ufo").setup()
		end,
		-- init = function()
		--   -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		--   vim.keymap.set("n", "zR", function()
		--     require("ufo").openAllFolds()
		--   end)
		--   vim.keymap.set("n", "zM", function()
		--     require("ufo").closeAllFolds()
		--   end)
		-- end,
	},
}
