local utils = require("util")

local globalSettingsPath = vim.fn.stdpath('config') .. '/.vscode/settings.json'
local globalSettings = vim.fn.json_decode(vim.fn.readfile(globalSettingsPath) or {})

globalSettings.lsp.sumneko_lua.settings.Lua.runtime.path = vim.split(package.path, ";")
globalSettings.lsp.sumneko_lua.settings.Lua["workspace.library"][vim.fn.expand("$VIMRUNTIME/lua")] = true
globalSettings.lsp.sumneko_lua.settings.Lua["workspace.library"][vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true

local settingsPath = vim.fn.getcwd() .. '/.vscode/settings.json';
if not utils.fileExists(settingsPath) or settingsPath == globalSettingsPath then
    return globalSettings
end

return utils.merge(globalSettings, vim.fn.json_decode(vim.fn.readfile(settingsPath)) or {})

--globalSettingString = globalSettingsString:gsub("%{{package_path}}", vim.fn.json_encode(vim.split(package.path, ";")))
--globalSettingString = globalSettingsString:gsub("%{{lua_path}}", vim.fn.expand("$VIMRUNTIME/lua"))
--globalSettingString = globalSettingsString:gsub("%{{lsp_path}}", vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"))
--
--local globalSettings = vim.fn.json_decode(globalSettingsString) or {}

