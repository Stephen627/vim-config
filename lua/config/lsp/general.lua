
local M = {}

M.setupDocumentHighlight = function (client)
  if (not client.server_capabilities.documentHighlightProvider) then
    return
  end

  -- vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.hover()]])
  vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
  vim.cmd([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
  vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
end

M.setup = function()
  require("util").on_attach(function (client)
    vim.notify("LSP Attached")
    M.setupDocumentHighlight(client)
  end)
end

return M
