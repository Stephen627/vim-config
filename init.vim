set nocompatible              " be iMproved, required
filetype off                  " required

let $VIMHOME = expand('<sfile>:p:h:h') . '/nvim'

function IncludeFile(file)
    if filereadable($VIMHOME . '/' . a:file)
        execute "source $VIMHOME/" . a:file
    endif
endfunction

:call IncludeFile('plugins.vim')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setting up editor options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ' '

:call IncludeFile('util/util.vim')
:call IncludeFile('coc.vim')
:call IncludeFile('templates.vim')

" Setting up searching
set smartcase
set ignorecase
set hlsearch
set incsearch

" Setting the correct color scheme
syntax enable
set background=dark
set termguicolors

" buffer opts
set autoread
set autowrite

" display opts
set number
set relativenumber
set title

" tab opts
set autoindent
set smartindent
set expandtab
set ts=4 sts=4 sw=4

autocmd Filetype yaml            setlocal ts=2 sts=2 sw=2
autocmd Filetype html            setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript      setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript      setlocal ts=2 sts=2 sw=2
autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2
autocmd Filetype typescriptreact setlocal ts=2 sts=2 sw=2
autocmd Filetype css             setlocal ts=2 sts=2 sw=2
autocmd Filetype scss            setlocal ts=2 sts=2 sw=2

set history=400

" turning on fuzzy finding of files
set path+=**
set wildmenu

set clipboard=unnamed
set so=7
set ruler
set cmdheight=1
set textwidth=85
set colorcolumn=+1

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set lazyredraw
set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

map <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $LANG='en'
set langmenu='en'
map <leader>ss :setlocal spell!<cr>

""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""

let vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set pastetoggle=<F4>

" Common re-mappings
" for common :w miss-spellings
:command WQ wq
:command Wq wq
:command W w
:command Q q

"Can search on visually selected text with // .
vnoremap // y/<C-R>"<CR>

" Navigation tabs
nmap <C-l> gt
nmap <C-h> gT

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
    require("github-theme").setup({
        commentStyle = "NONE",
        keywordStyle = "NONE",
        functionStyle = "NONE",
        variableStyle = "NONE",
        darkSidebar = false,
        darkFloat = true
    })
EOF

lua require('gitsigns').setup()
lua << EOF
    require('nvim-web-devicons').setup({
        default = true
    })
EOF
lua << EOF
  require("lualine").setup {
      options = {
          theme = 'github'
      }
  }
EOF

lua << EOF
require('telescope').setup{
    defaults = {
        file_ignore_patterns = { '.git', 'node_modules', 'vendor', 'logs' }
    }
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-n> :NvimTreeToggle<CR>


:call IncludeFile('override.vim')

