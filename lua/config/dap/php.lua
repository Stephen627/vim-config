local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath('config') .. '/vendor/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
    pathMappings = { ['/var/www/html'] = '${workspaceFolder}' }
  }
}
