set nocompatible              " be iMproved, required
filetype off                  " required

let $VIMHOME = expand('<sfile>:p:h:h') . '/nvim'

function IncludeFile(file)
    execute "source $VIMHOME/" . a:file
endfunction

:call IncludeFile('plugins.vim')
:call IncludeFile('util/util.vim')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setting up editor options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = '~'

" Setting up searching
set smartcase
set ignorecase
set hlsearch
set incsearch

" Setting the correct color scheme
syntax enable
set background=dark

try
    colorscheme PaperColor
catch
endtry

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 9
    endif
endif

" buffer opts
set autoread
set autowrite

" display opts
set number
set relativenumber
set title
set tags+=./.vim/tags

" tab opts
set autoindent
set smartindent
set expandtab
set ts=4 sts=4 sw=4

autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2
autocmd Filetype html       setlocal ts=2 sts=2 sw=2

set history=400

" turning on fuzzy finding of files
set path+=**
set wildmenu

set clipboard=unnamed
set so=7
let $LANG='en'
set langmenu='en'
set ruler
set cmdheight=1
set textwidth=90
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

set tags+=./tags
set completeopt=longest,menuone

map <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $5 ''<esc>i
inoremap $6 ""<esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""

let vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set pastetoggle=<F4>

" Common remappings
" for common :w mis-spellings
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
" => Templates
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>html :-1read $VIMHOME/templates/skeleton.html<CR>3jwf>a
nnoremap <leader>reactc :call ReplaceTemplatePlaceholders("$VIMHOME/templates/react-class.js", {'name': 'Enter the name of the class'})<CR>
nnoremap <leader>reactf :call ReplaceTemplatePlaceholders("$VIMHOME/templates/react-function.js", {'name': 'Enter the name of the function'})<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [ 'coc-omnisharp', '@yaegassy/coc-intelephense' ]

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
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
require('telescope').setup{
    file_ignore_patterns = { '%.git/.*' }
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

