call plug#begin('~/.vim/plugged')

" Plugins

" Functional
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
" Plug 'joonty/vdebug'

" Autocomplete
" https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ervandew/supertab'
endif

" File Explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

let g:nvim_tree_ignore = [ '.git', 'node_modules', 'vendor', '.cache' ]

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors

" Visual
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'projekt0n/github-nvim-theme'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'


call plug#end()
