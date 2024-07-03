local map_key = require 'utils.key-mapper'.map_key

return {
	{
		'williamboman/mason.nvim',
		config = function()
			require 'mason'.setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require 'mason-lspconfig'.setup({
				ensure_installed = {
					'lua_ls',
					'clangd',
					'pyright',
					'autotools_ls',
					'marksman',
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require 'lspconfig'
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.pyright.setup({})
			map_key('K', vim.lsp.buf.hover)
			map_key('gd', vim.lsp.buf.definition)
			map_key('<leader>ca', vim.lsp.buf.code_action)
		end
	}
}
