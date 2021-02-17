syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set filetype=on
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
set autoindent
filetype plugin indent on

" Pluggins
call plug#begin('~/.config/nvim/plugged')

Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Coc Settings
let g:coc_global_extensions = ['coc-prettier', 'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-emmet', 'coc-phpls'] 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set hidden " TextEdit might fail if hidden is not set.
set cmdheight=1 " Give more space for displaying messages.
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time
set shortmess+=c

" leader key mapped to SPACEBAR
let mapleader= " "

" open explorer
nnoremap <leader>n :Ex<CR>

" Important!!
if has('termguicolors')
  set termguicolors
endif

" colorscheme
colorscheme sonokai
let g:sonokai_enable_italic = 1
let g:lightline = {'colorscheme' : 'sonokai'}
set background=dark

" moves cursor to new line and TABS after () [] {}
let delimitMate_expand_cr = 1

" Nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Indent line distinct characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
