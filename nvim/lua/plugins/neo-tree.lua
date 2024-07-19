local map_key = require 'utils.key-mapper'.map_key

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup {
			window = {
				position = "left",
				width = 35,
			},
			filesystem = {
				hijack_netrw_behavior = "disabled",
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				}
			},
		}

		map_key('n', '<leader>e', ':Neotree toggle<CR>', 'neotree toggle')
	end
}
