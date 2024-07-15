-- vimwiki
vim.g.vimwiki_list = {
	{
		path = '~/reudekx.github.io/wiki/',
		syntax = 'markdown',
		ext = '.md'
	}
}

vim.g.vimwiki_conceallevel = 0

-- others
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'lazy-nvim'
require 'settings'

vim.lsp.set_log_level("debug")
