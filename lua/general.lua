vim.g.mapleader = ' '
vim.opt.updatetime = 500

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
vim.api.nvim_command('autocmd Filetype javascript      setlocal ts=2 sts=2 sw=2 noexpandtab')
vim.api.nvim_command('autocmd Filetype typescript      setlocal ts=2 sts=2 sw=2 noexpandtab')
vim.api.nvim_command('autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2 noexpandtab')
vim.api.nvim_command('autocmd Filetype typescriptreact setlocal ts=2 sts=2 sw=2 noexpandtab')
vim.api.nvim_command('autocmd Filetype css             setlocal ts=2 sts=2 sw=2 noexpandtab')
vim.api.nvim_command('autocmd Filetype scss            setlocal ts=2 sts=2 sw=2 noexpandtab')
vim.api.nvim_command('autocmd Filetype lua             setlocal ts=2 sts=2 sw=2')

-- disable mouse mode
vim.api.nvim_command('set mouse=')

vim.opt.history = 400

vim.opt.clipboard = 'unnamed'
vim.opt.so = 200
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

vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - nvim"

vim.api.nvim_set_keymap('n', 'gb', '<cmd>BufferlinePick<cr>', {desc='Go to another buffer, the buffers at the top of the window will show the character(s) to use'})
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>bnext<cr>', {desc='Go to the next buffer'})
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>bprevious<cr>', {desc='Go to the previous buffer'})
vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>Telescope projects<cr>', {desc='Change projects'})
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc='Find files'})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<cr>', {desc='Grep files'})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {desc='Find buffer'})

vim.api.nvim_set_keymap('n', '<leader><cr>', '<cmd>noh<cr>', {desc='Clears all highlighed text'})
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>Bdelete<cr>', {desc='Deletes the current buffer'})
vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>setlocal spell!<cr>', {desc='Toggles spell checking on active buffer'})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {desc='Exit insert, visual, or command mode'})
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w<cr>', {desc='Save current buffer'})


require("util.references").setup({
    anchor= "NW", -- Popup position ancho
    relative = "cursor", -- Popup relative position
    row = 1, -- Popup x position
    col = 0, -- Popup y position
    border = "rounded", -- Popup borderstyle
    winblend = 0, -- Popup transaparency 0-100, where 100 is transparent
    max_width = 120, -- Max width of the popup
    max_height = 10, -- Max height of the popup
    auto_choose = false, -- Go to reference if there is only one
})

vim.lsp.handlers["textDocument/references"] = require("util.references").reference_handler
