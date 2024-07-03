return {
	map_key = function(from, to, modes, options)
		if type(modes or 'n') == 'string' then
			modes = { modes or 'n' }
		end
		for _, mode in ipairs(modes) do
			vim.keymap.set(
				mode or 'n', from, to,
				options or { noremap = true, silent = true }
			)
		end
	end
}
