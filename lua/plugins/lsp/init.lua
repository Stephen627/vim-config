local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

require 'plugins.lsp.php'
require 'plugins.lsp.js'
require 'plugins.lsp.css'
