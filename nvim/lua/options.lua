local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smarttab = true
opt.wrap = false

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.ttyfast = true
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.scrolloff = 10

cmd("syntax on")
cmd("colorscheme cyberdream")

api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove("c")
		vim.opt_local.formatoptions:remove("r")
	end,
})
