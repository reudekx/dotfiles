local map_key = require 'utils.key-mapper'.map_key

return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require 'dap'
			map_key('<leader>d1', '<Cmd>lua require"dap".continue()<CR>')
			map_key('<leader>d2', '<Cmd>lua require"dap".step_over()<CR>')
			map_key('<leader>d3', '<Cmd>lua require"dap".step_into()<CR>')
			map_key('<leader>d4', '<Cmd>lua require"dap".step_out()<CR>')
			map_key('<leader>d5', '<Cmd>lua require"dap".toggle_breakpoint()<CR>')
			map_key('<leader>d6', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
			map_key('<leader>d7', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
			map_key('<leader>d8', '<Cmd>lua require"dap".repl.open()<CR>')
			map_key('<leader>d9', '<Cmd>lua require"dap".run_last()<CR>')
		end
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
		},
		config = function()
			require("dapui").setup()
			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'mfussenegger/nvim-dap',
		},
		config = function()
			require 'mason-nvim-dap'.setup {
				ensure_installed = { 'python', 'cppdbg' }
			}
		end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		requires = { 'mfussenegger/nvim-dap' },
		config = function()
			require("nvim-dap-virtual-text").setup()
		end
	},

	{
		'nvim-telescope/telescope-dap.nvim',
		requires = { 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap' },
		config = function()
			require('telescope').load_extension('dap')
		end
	},
}
