local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/opt/vscode-php-debug/out/phpDebug.js' }
}

-- dap.configurations.php = {
--   {
--     type = 'php',
--     request = 'launch',
--     name = 'Listen for Xdebug',
--     port = 9003,
--     pathMapping = { ['/var/www/html'] = '/home/stephen/Documents/HDD/gloversure/projects/m2-docker-test/src/' }
--   }
-- }
