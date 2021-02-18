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

" Plug 'sainnhe/sonokai'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'voldikss/vim-floaterm'

call plug#end()

" Coc Settings
let g:coc_global_extensions = ['coc-prettier', 'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-emmet', 'coc-phpls', 'coc-explorer'] 
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
" colorscheme sonokai
" let g:lightline = {'colorscheme' : 'sonokai'}
" let g:sonokai_enable_italic = 1
" set background=dark
colorscheme tokyonight 
let g:lightline = {'colorscheme' : 'tokyonight'}
let g:tokyonight_enable_italic= 1
let g:tokyonight_style='night'

" moves cursor to new line and TABS after () [] {}
let delimitMate_expand_cr = 1

" Nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
" Coc-explorer
nmap <C-n> :CocCommand explorer<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Indent line distinct characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Floaterm 
nnoremap <C-t> :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>

" TAB to move between buffers
nnoremap <TAB> :bnext<CR>
" SHIFT + TAB go back
nnoremap <S-TAB> :bprevious<CR>

" Better way to save
nnoremap <C-s> :w<CR>

" VIM Keymaps
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

" setup mapping to call :LazyGit
nnoremap <silent> <C-g> :LazyGit<CR>

let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
