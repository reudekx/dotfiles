local map_key = require 'utils.key-mapper'.map_key

return {
	"preservim/tagbar",
	config = function()
		vim.g.tagbar_position = 'rightbelow'
		map_key('<leader>w', ':TagbarToggle<CR>')
	end
}
