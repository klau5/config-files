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
Plug 'Raimondi/delimitMate'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'

call plug#end()


" coc settings
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set hidden " TextEdit might fail if hidden is not set.
set cmdheight=2 " Give more space for displaying messages.
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-emmet']
let g:coc_disable_startup_warning = 1

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


" delimitMate expand <CR> 
" moves cursor to new line and TABS after () [] {}
let delimitMate_expand_cr = 1

" Important!!
if has('termguicolors')
  set termguicolors
endif

" gruvbox 
let g:gruvbox_italic=1
let g:lightline = {'colorscheme' : 'gruvbox'}

set background=dark

" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'hard'

colorscheme gruvbox

" leader key mapped to SPACEBAR
let mapleader= " "

" NERDTree toggle
map <leader>n :NERDTreeToggle<CR>
