local utils = require 'utils'

local current_dir = io.popen"cd":read'*l'

local settingsPath = './.vim/settings.json';
if not utils.fileExists(settingsPath) then
    return {}
end

return vim.fn.json_decode(vim.fn.readfile(settingsPath)) or {}

