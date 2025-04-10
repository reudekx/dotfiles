" file
set noswapfile
set hidden

" number, line
set number
set relativenumber
set cursorline
set nowrap

" tab, indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" scroll
set scrolloff=8

" visuality
set termguicolors

" syntax
syntax on

" comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r
