local keymap = function(mode, from, to, opts)
	opts = opts or {}
	opts.noremap = opts.noremap == nil or opts.noremap
	opts.silent = opts.silent == nil or opts.silent
	return vim.keymap.set(mode, from, to, opts)
end

-- Swap semicolon and colon
keymap({'n', 'v'}, ';', ':', { silent = false })
keymap({'n', 'v'}, ':', ';')

-- No highlight search
keymap('n', '<leader>hl', ':nohlsearch<CR>')

-- Show netwr directory listing
keymap('n', '<leader>e', ':Ex<CR>')

-- Pane navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Buffer navigation
keymap('n', '<leader>n', ':bnext<CR>')
keymap('n', '<leader>p', ':bprev<CR>')
keymap('n', '<leader>d', ':bdelete<CR>')

-- Exit insert mode
keymap('i', 'jk', '<Esc>')

-- Indent
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
