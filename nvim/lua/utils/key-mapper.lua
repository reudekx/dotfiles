return {
	-- map_key = function(from, to, description, modes, options)
	-- 	modes = modes or 'n'
	-- 	if type(modes) == 'string' then
	-- 		modes = { modes }
	-- 	end
	-- 	for _, mode in ipairs(modes) do
	-- 		options = options or {}
	-- 		options.noremap = options.noremap or true
	-- 		options.silent = options.silent or true
	-- 		options.description = description or nil
	-- 		vim.keymap.set(
	-- 			mode or 'n', from, to,
	-- 			options
	-- 		)
	-- 	end
	-- end

	map_key = function(mode, from, to, desc, options)
		options = options or {}
		options.noremap = options.noremap or true
		options.silent = options.silent or true
		options.desc = desc or (function()
			if type(to) == "string" then return to end
			return nil
		end)()
		vim.keymap.set(
			mode, from, to, options
		)
	end
}
