--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local utils = require 'utils'
local projectSettings = require 'settings'

local config = {
    capabilities = capabilities
}

if globalSettings and globalSettings.lsp and globalSettings.lsp.cssls then
    config = utils.merge(config, globalSettings.lsp.cssls)
end

if projectSettings.lsp and projectSettings.lsp.cssls then
    config = utils.merge(config, projectSettings.lsp.cssls)
end

require'lspconfig'.cssls.setup(config)
