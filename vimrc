syntax on
colorscheme dracula

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set incsearch
set laststatus=2
set termguicolors
set mouse=a
set wildmenu
set wildmode=list:full

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Go highlighting 
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1
