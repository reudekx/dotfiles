local map_key = require 'utils.key-mapper'.map_key

return {
	{
		'mfussenegger/nvim-dap'
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
		}
	},
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'mfussenegger/nvim-dap',
		}
	}
}
