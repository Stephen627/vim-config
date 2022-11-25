-- Ignore errors when trying to import the setup file
function includeSetup ()
    require 'lifecycle.setup'
end
pcall(includeSetup)

require 'general'
require 'plugins'
require 'plugins.lsp'
require 'plugins.colorscheme'
require 'plugins.gitsigns'
require 'plugins.nvim-web-devicons'
require 'plugins.lualine'
require 'plugins.telescope'
require 'plugins.nvim-tree'
require 'plugins.bufferline'
require 'plugins.lsp_signature'
-- require 'plugins.dap'
require 'plugins.toggleterm'
require 'plugins.nvim-cmp'


-- Ignore errors when trying to import the override file
function includeOverride ()
    require 'lifecycle.override'
end
pcall(includeOverride)
