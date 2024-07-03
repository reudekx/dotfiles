local map_key = require 'utils.key-mapper'.map_key

-- No highlight search
map_key(',<leader>', ':nohlsearch<CR>')

-- Pane navigatin
map_key('<C-h>', '<C-w>h')
map_key('<C-j>', '<C-w>j')
map_key('<C-k>', '<C-w>k')
map_key('<C-l>', '<C-w>l')

-- Exit insert mode
map_key('jk', '<Esc>', 'i')

-- Move one character in insert mode
map_key('<C-h>', '<Left>', 'i')
map_key('<C-j>', '<Down>', 'i')
map_key('<C-k>', '<Up>', 'i')
map_key('<C-l>', '<Right>', 'i')

-- Backspace and Delete
map_key('<C-d>', '<BS>', 'i')
map_key('<C-s>', '<Del>', 'i')

-- Indent
map_key('<', '<gv', 'v')
map_key('>', '>gv', 'v')

-- Fold
-- za, zM, zR
