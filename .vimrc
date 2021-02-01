syntax on

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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sainnhe/sonokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'

call plug#end()


" coc settings
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set hidden " TextEdit might fail if hidden is not set.
set cmdheight=2 " Give more space for displaying messages.
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

let g:coc_global_extensions = ['coc-prettier', 'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-emmet'] 
let g:coc_disable_startup_warning = 1
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" moves cursor to new line and TABS after () [] {}
let delimitMate_expand_cr = 1

" Important!!
if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:lightline = {'colorscheme' : 'sonokai'}

" sonokai
let g:sonokai_enable_italic = 1
colorscheme sonokai 

" leader key mapped to SPACEBAR
let mapleader= " "

" NERDTree toggle
map <leader>n :NERDTreeToggle<CR>
