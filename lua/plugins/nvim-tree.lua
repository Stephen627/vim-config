vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'vendor', '.cache' }
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<cr>', { noremap = true })
