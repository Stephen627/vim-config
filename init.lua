require 'general'
require 'template-picker'
require 'plugins'
require 'plugins.lsp'
require 'plugins.compe-config'
require 'plugins.github-theme'
require 'plugins.gitsigns'
require 'plugins.nvim-web-devicons'
require 'plugins.lualine'
require 'plugins.telescope'
require 'plugins.trouble'
require 'plugins.nvim-tree'


-- Ignore errors when trying to import the override file
function includeOverride ()
  require 'override'
end
pcall(includeOverride)