-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use FZF
-- vim.g.lazyvim_picker = "fzf"

-- Use tabs instead of spaces
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.autochdir = true
-- vim.g.root_spec = { "cwd" }

vim.o.shell = "fish"

vim.opt.clipboard:append("unnamedplus")

-- root dir
vim.g.root_spec = { "cwd" }

-- folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"

-- disable scroll
vim.g.snacks_scroll = false

-- Fix "waiting for osc52 response from terminal" message
-- https://github.com/neovim/neovim/issues/28611

if vim.env.SSH_TTY ~= nil then
	-- Set up clipboard for ssh

	local function my_paste(_)
		return function(_)
			local content = vim.fn.getreg('"')
			return vim.split(content, "\n")
		end
	end

	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			-- No OSC52 paste action since wezterm doesn't support it
			-- Should still paste from nvim
			["+"] = my_paste("+"),
			["*"] = my_paste("*"),
		},
	}
end
