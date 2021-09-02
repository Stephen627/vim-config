call plug#begin('~/.vim/plugged')

" Possible new plugins
" https://github.com/mfussenegger/nvim-dap
" https://github.com/nvim-treesitter/nvim-treesitter

" Plugins

" Functional
Plug 'mattn/emmet-vim'

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'folke/lsp-colors.nvim'
    Plug 'folke/trouble.nvim' 
endif

" File Explorer
Plug 'kyazdani42/nvim-tree.lua'

let g:nvim_tree_ignore = [ '.git', 'node_modules', 'vendor', '.cache' ]

" Visual
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'projekt0n/github-nvim-theme'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" File Finder
Plug 'nvim-telescope/telescope.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()
