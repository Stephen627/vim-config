local utils = require("util")

local globalSettingsPath = vim.fn.stdpath('config') .. '/.vscode/settings.json'
local globalSettings = vim.fn.json_decode(vim.fn.readfile(globalSettingsPath) or {})

local settingsPath = vim.fn.getcwd() .. '/.vscode/settings.json';
if not utils.fileExists(settingsPath) or settingsPath == globalSettingsPath then
    return globalSettings
end

return utils.merge(globalSettings, vim.fn.json_decode(vim.fn.readfile(settingsPath)) or {})

