-- LSP config (the mappings used in the default file don't quite work right)
vim.api.nvim_set_keymap('n', ' gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ' gr', '<cmd>lua vim.lsp.buf.references()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ' gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ' <C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ' <C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ' <C-p>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', { noremap = true })

-- auto-format
vim.api.nvim_command('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.api.nvim_command('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.api.nvim_command('autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.api.nvim_command('autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)')

vim.api.nvim_set_keymap('n', '<leader>ac', ':Lspsaga code_action<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>ac', ':<C-U>Lspsaga range_code_action<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gs', ':Lspsaga signature_help<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rn', ':Lspsaga rename<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Lspsaga preview_definition<cr>', { noremap = true })

require 'plugins.lsp.php'
require 'plugins.lsp.js'
require 'plugins.lsp.css'
