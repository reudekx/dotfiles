local map_key = require 'utils.key-mapper'.map_key

-- No highlight search
map_key('n', ',<leader>', ':nohlsearch<CR>')

-- Pane navigation
map_key('n', '<C-h>', '<C-w>h')
map_key('n', '<C-j>', '<C-w>j')
map_key('n', '<C-k>', '<C-w>k')
map_key('n', '<C-l>', '<C-w>l')

-- Exit insert mode
map_key('i', 'jk', '<Esc>')

-- Move one character in insert mode
map_key('i', '<C-h>', '<Left>')
map_key('i', '<C-j>', '<Down>')
map_key('i', '<C-k>', '<Up>')
map_key('i', '<C-l>', '<Right>')

-- Backspace and Delete
map_key('i', '<C-d>', '<BS>')
map_key('i', '<C-s>', '<Del>')

-- Indent
map_key('v', '<', '<gv')
map_key('v', '>', '>gv')

-- Buffer navigation
map_key('n', '<Tab>', ':bn<CR>')
