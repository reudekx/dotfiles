local api = vim.api

api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove("c")
		vim.opt_local.formatoptions:remove("r")
	end,
})
