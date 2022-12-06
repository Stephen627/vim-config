require('legendary').setup({
    keymaps = {
        { '<leader>?', '<cmd>Legendary<cr>', description = 'Opens command help' },
        { '<leader><cr>', '<cmd>noh<cr>', description = 'Clears all highlighed text' },
        { '<leader>q', '<cmd>Bdelete<cr>', description = 'Deletes the current buffer' },
        { '<leader>ss', '<cmd>setlocal spell!<cr>', description = 'Toggles spell checking on active buffer' },
        { 'gh', '<cmd>Lspsaga lsp_finder<cr>', description = 'Find all definitions and referneces' },
        { '<leader>ca', '<cmd>Lspsaga code_action<cr>', description = 'Show code actions' },
        { 'gr', '<cmd>Lspsaga rename<cr>', description = 'Rename class, variable, or function' },
        { 'gd', '<cmd>Lspsaga peek_definition<cr>', description = 'Peek the definition' },
        { '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', description = 'Go to the definition' },
        { '<leader>cd', '<cmd>Lspsaga show_line_diagnositics<cr>', description = 'Show diagnostics for the current line' },
        { '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>', description = 'Jump to the previous diagnostic event' },
        { ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>', description = 'Jump to the next diagnostic event' },
        { '[E', function()
            require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, description = 'Jump to the previous diagnostic error event' },
        { ']E', function()
            require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, description = 'Jump to the next diagnostic error event' },
        { '<leader>o', '<cmd>LSoutlineToggle<cr>', description = 'Toggle the file outline' },
        { 'K', '<cmd>Lspsaga hover_doc<cr>', description = 'Open preview for the highlighted function definition' },
        { '<A-d>', {
            n = '<cmd>Lspsaga open_floaterm lazygit<cr>',
            t = [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]]
        }, description = 'Toggle lazy git' },
        { '<leader>gsd', '<cmd>Gitsigns diffthis<cr>', description = 'Show git diff for the current buffer' },
        { 'gb', '<cmd>BufferlinePick<cr>', description = 'Go to another buffer, the buffers at the top of the window will show the character(s) to use' },
        { '<C-l>', '<cmd>BufferLineCycleNext<cr>', description = 'Go to the next buffer' },
        { '<C-h>', '<cmd>BufferLineCyclePrev<cr>', description = 'Go to the previous buffer' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', description = 'Find files' },
        { '<leader>fg', '<cmd>lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<cr>', description = 'Grep files' }
        --{
        --    itemgroup = 'General',
        --    description = 'General key bindings',
        --    icon = '',
        --    keymaps = {
        --        { '<leader><cr>', '<cmd>noh<cr>', description = 'Clears all highlighed text' },
        --        { '<leader>q', '<cmd>Bdelete<cr>', description = 'Deletes the current buffer' },
        --        { '<leader>ss', '<cmd>setlocal spell!<cr>', description = 'Toggles spell checking on active buffer' },
        --    }
        --},
        --{
        --    itemgroup = 'Code Completion and Static Code Analysis',
        --    description = 'Commands that help you code',
        --    icon = '',
        --    keymaps = {
        --        { 'gh', '<cmd>Lspsaga lsp_finder<cr>', description = 'Find all definitions and referneces' },
        --        { '<leader>ca', '<cmd>Lspsaga code_action<cr>', description = 'Show code actions' },
        --        { 'gr', '<cmd>Lspsaga rename<cr>', description = 'Rename class, variable, or function' },
        --        { 'gd', '<cmd>Lspsaga peek_definition<cr>', description = 'Peek the definition' },
        --        { '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', description = 'Go to the definition' },
        --        { '<leader>cd', '<cmd>Lspsaga show_line_diagnositics<cr>', description = 'Show diagnostics for the current line' },
        --        { '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>', description = 'Jump to the previous diagnostic event' },
        --        { ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>', description = 'Jump to the next diagnostic event' },
        --        { '[E', function()
        --            require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
        --        end, description = 'Jump to the previous diagnostic error event' },
        --        { ']E', function()
        --            require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
        --        end, description = 'Jump to the next diagnostic error event' },
        --        { '<leader>o', '<cmd>LSoutlineToggle<cr>', description = 'Toggle the file outline' },
        --        { 'K', '<cmd>Lspsaga hover_doc<cr>', description = 'Open preview for the highlighted function definition' },
        --    }
        --},
        --{
        --    itemgroup = 'Git',
        --    description = 'Git commands',
        --    icon = '',
        --    keymaps = {
        --        { '<A-d>', {
        --            n = '<cmd>Lspsaga open_floaterm lazygit<cr>',
        --            t = [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]]
        --        }, description = 'Toggle lazy git' },
        --        { '<leader>gsd', '<cmd>Gitsigns diffthis<cr>', description = 'Show git diff for the current buffer' }
        --    }
        --},
        --{
        --    itemgroup = 'Navigation',
        --    description = 'Commands that help you navigate the code',
        --    icon = '',
        --    keymaps = {
        --        { 'gb', '<cmd>BufferlinePick<cr>', description = 'Go to another buffer, the buffers at the top of the window will show the character(s) to use' },
        --        { '<C-l>', '<cmd>BufferLineCycleNext<cr>', description = 'Go to the next buffer' },
        --        { '<C-h>', '<cmd>BufferLineCyclePrev<cr>', description = 'Go to the previous buffer' },
        --        { '<leader>ff', '<cmd>Telescope find_files<cr>', description = 'Find files' },
        --        { '<leader>fg', '<cmd>lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<cr>', description = 'Grep files' },
        --    }
        --}
    },
    select_prompt = ' Command Search ',
    -- Character to use to separate columns in the UI
    col_separator_char = '│',
    include_legendary_cmds = false,
    include_builtin = true,
    cache_path = string.format('%s/legendary/', vim.fn.stdpath('cache')),
})
