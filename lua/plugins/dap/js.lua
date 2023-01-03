local dap = require('dap')

dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath('config') .. '/vendor/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js' }
}

local config = {
  {  
      name = 'Debug with Firefox',
      type = 'firefox',
      request = 'launch',
      reAttach = true,
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
      firefoxExecutable = '/usr/bin/firefox'
  }
}

dap.configurations.typescript = config
dap.configurations.typescriptreact = config
dap.configurations.javascript = config
dap.configurations.javascriptreact = config
