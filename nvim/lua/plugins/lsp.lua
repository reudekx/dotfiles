local map_key = require('utils.key-mapper').map_key

return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		config = function()
			require('mason-lspconfig').setup({
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
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					require('lspconfig')[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			-- Key mappings
			map_key('K', vim.lsp.buf.hover)
			map_key('gd', vim.lsp.buf.definition)
			map_key('<leader>ca', vim.lsp.buf.code_action)
		end
	}
}
