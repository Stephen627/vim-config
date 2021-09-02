" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)

nnoremap <silent><leader>ac :Lspsaga code_action<CR>
vnoremap <silent><leader>ac :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>

nnoremap <silent> gs :Lspsaga signature_help<CR>

nnoremap <leader>rn :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>

luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/lsp/php.lua
luafile ~/.config/nvim/lua/lsp/js.lua
