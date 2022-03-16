local o = vim.o

o.errorbells = false
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.number = true
o.smartindent = true
o.autoindent = true
o.wrap = false
o.swapfile = false
o.mouse = "a"
o.termguicolors = true
o.completeopt = "menuone,noinsert,noselect"
o.smartcase = true
o.incsearch = true

-- Package Manager
require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- treesitter
        use {
          'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate'
        }

        -- lualine
        use {
         'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        use "rebelot/kanagawa.nvim"

        use "Raimondi/delimitMate"

        use {
           'kyazdani42/nvim-tree.lua',
           requires = {
           'kyazdani42/nvim-web-devicons', -- optional, for file icon
           },
                config = function() require'nvim-tree'.setup {} end
        }

        use "norcalli/nvim-colorizer.lua"

        use {
           'neovim/nvim-lspconfig',
           'williamboman/nvim-lsp-installer',
        }
end)

require('lualine').setup()

require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",

        highlight = {
                enable = true
        }
}

require'colorizer'.setup()

vim.cmd('colorscheme kanagawa')
vim.cmd('syntax enable')

vim.g['delimitMate_expand_cr'] = 1

-- Keybindings
local keymap = vim.api.nvim_set_keymap
keymap('n', '<C-s>', ':w<CR>', {})
keymap('n', '<C-q>', ':wq<CR>', {})
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {})

-- LSP Installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

-- LSP keybindings
local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end
