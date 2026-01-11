-- Autocmds are automatically loaded on the VeryLazy event.
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local cursorline_group = vim.api.nvim_create_augroup("cursorline", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = cursorline_group,
	callback = function()
		vim.opt_local.cursorline = true
	end,
})
vim.api.nvim_create_autocmd("WinLeave", {
	group = cursorline_group,
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- Fix indentation if a . comes before end such as when using "self.".
-- Source: https://github.com/tree-sitter/tree-sitter-ruby/issues/230
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "ruby" },
	callback = function()
		vim.opt_local.indentkeys:remove(".")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "make" },
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.yaml", "*.yml" },
	callback = function()
		if vim.fn.getline(1):match("^apiVersion:") or vim.fn.getline(2):match("^apiVersion:") then
			vim.opt_local.filetype = "helm"
		end
	end,
})

-- Line number colors: white in active window, grey in inactive
vim.api.nvim_set_hl(0, "ActiveLineNr", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "ActiveCursorLineNr", { fg = "#ff9e64", bold = true })
vim.api.nvim_set_hl(0, "InactiveLineNr", { fg = "#565f89" })

-- Apply to current window immediately
vim.wo.winhighlight = "LineNr:ActiveLineNr,CursorLineNr:ActiveCursorLineNr"

local ln_group = vim.api.nvim_create_augroup("linenr_focus", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = ln_group,
	callback = function()
		vim.wo.winhighlight = "LineNr:ActiveLineNr,CursorLineNr:ActiveCursorLineNr"
	end,
})

vim.api.nvim_create_autocmd("WinLeave", {
	group = ln_group,
	callback = function()
		vim.wo.winhighlight = "LineNr:InactiveLineNr,CursorLineNr:InactiveLineNr"
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = ln_group,
	callback = function()
		vim.api.nvim_set_hl(0, "ActiveLineNr", { fg = "#ffffff" })
		vim.api.nvim_set_hl(0, "ActiveCursorLineNr", { fg = "#ff9e64", bold = true })
		vim.api.nvim_set_hl(0, "InactiveLineNr", { fg = "#565f89" })
	end,
})
