call plug#begin('~/.vim/plugged')

" Plugins

" Functional
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
" Plug 'joonty/vdebug'

" Autocomplete
" https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
if has('nvim') && has('python3')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim',   { 'do': ':UpdateRemotePlugins' }
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    let g:deoplete#enable_at_startup = 1

    " Autocomplete languages
    Plug 'deoplete-plugins/deoplete-tag'                              " Tags
    Plug 'ervandew/supertab'
endif

" File Explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

let g:nvim_tree_ignore = [ '.git', 'node_modules', 'vendor', '.cache' ]
let g:nvim_tree_auto_open = 1

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors

" Visual
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'projekt0n/github-nvim-theme'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'


call plug#end()
