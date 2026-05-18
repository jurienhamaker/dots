-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.ts*", "*.js", "*.jsx" },
-- 	command = ":VtsExec remove_unused_imports", -- added `sync` here
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.ts*", "*.js", "*.jsx" },
-- 	command = "normal \\co", -- added `sync` here
-- })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local clients = vim.lsp.get_clients({ buf = bufnr })
		for _, client in ipairs(clients) do
			if client.name == "eslint" then
				vim.b.autoformat = false
				vim.cmd("silent! LspEslintFixAll")
				return
			end
		end
	end,
})
