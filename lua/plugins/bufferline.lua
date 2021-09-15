require("bufferline").setup{
    diagnostics = 'nvim_lsp'
}

vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<cr>', { noremap = true })
