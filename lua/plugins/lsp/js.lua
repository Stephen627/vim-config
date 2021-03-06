-- npm i -g tsserver typescript
local utils = require 'utils'
local projectSettings = require 'settings'

local config = {
    on_attach = function (client, bufnr)
        require'lsp_signature'.on_attach()
    end
}

if globalSettings and globalSettings.lsp and globalSettings.lsp.tsserver then
    config = utils.merge(config, globalSettings.lsp.tsserver)
end

if projectSettings.lsp and projectSettings.lsp.tsserver then
    config = utils.merge(config, projectSettings.lsp.tsserver)
end

require'lspconfig'.tsserver.setup(config)
