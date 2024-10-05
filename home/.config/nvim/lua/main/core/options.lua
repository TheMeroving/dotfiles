--vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.hlsearch = false
opt.signcolumn = "yes"
opt.mouse = ""
opt.clipboard = "unnamedplus"

vim.diagnostic.config({
	float = { border = "rounded" },
})
