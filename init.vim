syntax on

set noerrorbells
set completeopt=menuone,noinsert,noselect
set shortmess+=c
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
" set showtabline=2
set scrolloff=8
set termguicolors
set mouse=a
set wildmenu
set wildmode=list:full
set autoindent
set cmdheight=1
set hidden
set signcolumn=yes
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-tree.lua'

" Plug 'rebelot/kanagawa.nvim'
" Plug 'ronwoch/hotline-vim'
Plug 'sainnhe/sonokai'

Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua'


call plug#end()

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colorscheme sonokai

set background=dark

lua << END
require('lualine').setup()
END

lua << EOF
    -- css colouriser
    require'colorizer'.setup()

    -- nvim-treesitter
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained",
      highlight = {
        enable = true
      },
      rainbow = {
        enable = true
      },
      indent = {
        enable = true
      },
    }
EOF


" Coc Settings
let g:coc_global_extensions = ['coc-prettier', 'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-emmet', 'coc-eslint', 'coc-solargraph'] 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" leader key mapped to SPACEBAR
let mapleader= " "

" Important!!
if has('termguicolors')
  set termguicolors
endif

" moves cursor to new line and TABS after () [] {}
let delimitMate_expand_cr = 1

" Keybindings

" Nvim Tree
nnoremap <C-n> :NvimTreeToggle<CR>

" Better way to save
nnoremap <C-s> :w<CR>
" Better way to quit 
nnoremap <C-q> :q<CR>
" Better way to close buffers
nnoremap <leader>c :close<CR>

" VIM Keymaps
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

" clear highlited search results
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" CoC keybindings
nmap <silent><C-p> <Plug>(coc-diagnostic-prev)
" nmap <silent><C-n> <Plug>(coc-diagnostic-next)

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
