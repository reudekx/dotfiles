local map_key = require('utils.key-mapper').map_key

local langs = {
	'lua_ls',
	'clangd',
	'pyright',
	'autotools_ls',
	'marksman',
	'gopls',
}

local function get_python_path()
	local venv_path = os.getenv("VIRTUAL_ENV")
	if venv_path then
		return venv_path .. 'bin/python'
	else
		local handle = io.popen('which python')
		if not handle then
			return 'usr/sbin/python'
		end
		local result = handle:read("*a")
		handle:close()
		return result:gsub("%s+", "")
	end
end

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
				ensure_installed = langs
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

			-- require('mason-lspconfig').setup_handlers({
			-- 	function(server_name)
			-- 		require('lspconfig')[server_name].setup({
			-- 			capabilities = capabilities,
			-- 		})
			-- 	end,
			-- })

			local lspconfig = require 'lspconfig'

			for i, lang in ipairs(langs) do
				local lang_config = {
					capabilities = capabilities,
				}

				if lang == 'pyright' then
					lang_config.settings = {
						python = {
							pythonPath = get_python_path(),
						},
					}
				end

				lspconfig[lang].setup(lang_config)
			end

			-- Key mappings
			map_key('n', '<leader>lh', vim.lsp.buf.hover, 'lsp hover')
			map_key('n', '<leader>ld', vim.lsp.buf.definition, 'lsp definition')
			map_key('n', '<leader>lca', vim.lsp.buf.code_action, 'lsp code action')
		end
	}
}
