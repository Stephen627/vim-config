
vim.api.nvim_set_keymap('n', '<F4>', '<cmd>lua require\'dapui\'.toggle()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require\'dap\'.continue()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require\'dap\'.step_over()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require\'dap\'.toggle_breakpoint()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>B', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require\'dap\'.repl.open()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require\'dap\'.run_last()<cr>', { noremap = true })


require 'plugins.dap.ui'
require 'plugins.dap.php'

require('dap.ext.vscode').load_launchjs()
