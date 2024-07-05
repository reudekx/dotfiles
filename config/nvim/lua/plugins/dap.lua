local map_key = require 'utils.key-mapper'.map_key

return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',
		'theHamsta/nvim-dap-virtual-text',
		'nvim-telescope/telescope.nvim',
		'nvim-telescope/telescope-dap.nvim',
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'
		local mason_dap = require 'mason-nvim-dap'
		local dap_virtual_txt = require 'nvim-dap-virtual-text'
		local telescope = require 'telescope'

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		mason_dap.setup({
			ensure_installed = {
				'python', 'cppdbg',
			},
			handlers = {},
		})

		telescope.load_extension('dap')

		map_key('<leader>d1', '<Cmd>lua require"dap".continue()<CR>')
		map_key('<leader>d2', '<Cmd>lua require"dap".step_over()<CR>')
		map_key('<leader>d3', '<Cmd>lua require"dap".step_into()<CR>')
		map_key('<leader>d4', '<Cmd>lua require"dap".step_out()<CR>')
		map_key('<leader>d5', '<Cmd>lua require"dap".toggle_breakpoint()<CR>')
		map_key('<leader>d6', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
		map_key('<leader>d7',
			'<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
		map_key('<leader>d8', '<Cmd>lua require"dap".repl.open()<CR>')
		map_key('<leader>d9', '<Cmd>lua require"dap".run_last()<CR>')
	end,
}
