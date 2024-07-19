local map_key = require 'utils.key-mapper'.map_key

return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require 'telescope.builtin'
			map_key('n', '<leader>ff', builtin.find_files, 'telescope find files')
			map_key('n', '<leader>fg', builtin.live_grep, 'telescope live grep')
			map_key('n', '<leader>fb', builtin.buffers, 'telescope buffers')
			map_key('n', '<leader>fh', builtin.help_tags, 'telescope help tags')
		end,
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require 'telescope'.setup({
				extensions = {
					['ui-select'] = {
						require 'telescope.themes'.get_dropdown {
						}
					}
				}
			})
			require 'telescope'.load_extension 'ui-select'
		end
	}
}
