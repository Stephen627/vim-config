vim.g.mapleader = ' '

-- Disabling showing the mode as this is handled by lualine
vim.opt.showmode = false

-- Setting up searching
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Setting the correct color scheme
vim.g.syntax = 'enable'
vim.opt.background = 'dark'
vim.opt.termguicolors = true

-- buffer opts
vim.opt.autoread = true
vim.opt.autowrite = true

-- display opts
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true

-- tab opts
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

vim.api.nvim_command('autocmd Filetype yaml            setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype html            setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype javascript      setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype typescript      setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype typescriptreact setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype css             setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype scss            setlocal ts=2 sts=2 sw=2')
vim.api.nvim_command('autocmd Filetype lua             setlocal ts=2 sts=2 sw=2')

-- disable mouse mode
vim.api.nvim_command('set mouse=')

vim.opt.history = 400

vim.opt.clipboard = 'unnamed'
vim.opt.so = 7
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.textwidth = 120
vim.opt.colorcolumn = '+1'
vim.opt.completeopt = 'menu,menuone,noselect'

vim.opt.foldcolumn = '1'

vim.opt.encoding = 'utf8'
vim.opt.ffs = 'unix,dos,mac'

-- Spelling

vim.opt.langmenu = 'en'

-- Markdown

vim.g.vim_markdown_folding_disabled = 1

-- Key Bindings

vim.opt.pastetoggle = '<F4>'

vim.api.nvim_set_keymap('v', '//', 'y/<C-R>"<cr>', { noremap = true })

-- Stop using repeated movement keys
require('util.stop-it').setup({
  mode = { "n", "v" },
  keys = { "h", "j", "k", "l" },
  limit = 5,
})

-- Stop using Ctrl + c all together
require('util.stop-it').setup({
  mode = { "i" },
  keys = { "<C-c>" },
  limit = 1,
  message = "Don't use Ctrl+c use Esc",
})

-- Never use arrow keys
require('util.stop-it').setup({
  mode = { "i", "n", "v" },
  keys = { "<Left>", "<Right>", "<Up>", "<Down>" },
  limit = 1,
  message = [[Don't use arrow keys.
    h = Left
    j = Down
    k = Up
    l = Right]],
  ignoreFileTypes = {},
})
