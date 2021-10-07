local popup = require "popup"
local utils = require "utils"
local projectSettings = require 'settings'
local a = vim.api

local config = {
    ReactTS = {
        name = 'React TS',
        path = vim.fn.stdpath('config') .. '/templates/react-typescript.tsx',
        questions = {
            name = 'Enter the name of the function'
        }
    },
    ReactJS = {
        name = 'React JS',
        path = vim.fn.stdpath('config') .. '/tmeplate/react-function.js',
        questions = {
            name = 'Enter the name of the function'
        }
    },
    PHPClass = {
        name = 'PHP Class',
        path = vim.fn.stdpath('config') .. '/templates/php-class.php',
        phpClass = true
    },
    PHPfunction = {
        name = 'PHP function',
        path = vim.fn.stdpath('config') .. '/template/php-class-no-namespace.php',
        questions = {
            name = 'Enter the name of the class'
        }
    },
    HTML = {
        name = 'HTML',
        path = vim.fn.stdpath('config') .. '/template/skeleton.html',
        questions = {}
    }
}

if globalSettings and globalSettings.templates then
    config = utils.merge(config, globalSettings.templates)
end

if projectSettings and projectSettings.templates then
    config = utils.merge(config, projectSettings.templates)
end

vim.api.nvim_set_keymap('n', '<leader>tt', ':lua require("template-picker").open()<cr>', { noremap = true  })

local templatePicker = {}
function templatePicker.ReplacePHPTemplatePlaceholders(templatePath)
    if not utils.fileExists(vim.cmd('pwd') .. '/composer.json') then
        templatePicker.ReplaceTemplatePlaceholders(templatePath, {
            namespace = 'Enter the namespace of the class',
            name = 'Enter the name of the class'
        })
        return
    end

    local replacements = {}
    local composerFile = vim.fn.json_decode(vim.fn.readfile(vim.cmd('pwd') .. '/composer.json'))
    if not composerFile.autoload or not composerFile.autoload['psr-4'] then
        templatePicker.ReplaceTemplatePlaceholders(templatePath, {
            namespace = 'Enter the namespace of the class',
            name = 'Enter the name of the class'
        })
        return
    end
    local autoload = composerFile.autoload['psr-4']
    local filePath = vim.fn.expand('%:r')
    local fileName = vim.fn.expand('%:t:r')
    replacements.name = fileName

    for k,v in pairs(autoload) do
        if not filePath.find('^' .. v) then
            goto continue
        end

        local path = filePath.gsub(k, '')
        local splitPath = templatePicker.split(path, '/')
        replacements.namespace = table.concat(splitPath, '\\')
        ::continue::
    end

    a.nvim_command('execute "-1read ' .. templatePath .. '"')
    templatePicker.replaceParameters(replacements)
    a.nvim_command('1')
end

function templatePicker.split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end


function templatePicker.ReplaceTemplatePlaceholders(templatePath, questions)
  local replacements = {}
  vim.fn.inputsave()
  for k,v in pairs(questions) do
    replacements[k] = vim.fn.input(v .. ':')
    replacements[k] = string.gsub(replacements[k], '\\', '\\\\\\\\')
  end
  vim.fn.inputrestore()

  a.nvim_command('execute "-1read ' .. templatePath .. '"')
  templatePicker.replaceParameters(replacements)
  a.nvim_command('1')
end

function templatePicker.replaceParameters(replace)
  for k,v in pairs(replace) do
    a.nvim_command('execute "%s/{' .. k .. '}/' .. v .. '/g"')
  end
end

function templatePicker.onSelect(id, option)
    a.nvim_command('wincmd p')

    for k,v in pairs(config) do
        if (v.name == option) then
            if (v.phpClass) then
                templatePicker.ReplacePHPTemplatePlaceholders(v.path)
            else
                templatePicker.ReplaceTemplatePlaceholders(
                    v.path,
                    v.questions
                )
            end
        end
    end
end

function templatePicker.open()
    local options = utils.map(config, function(item) return item.name end)
    local popup_win, popup_opts = popup.create(options, {
        col = 5,
        line = 2,
        filtermode = 'n',
        posinvert = false,
        zindex = 200,
        border = { 1, 1, 1, 1 },
        padding = { 0, 0, 0, 0 },
        minheight =  20,
        minwidth = 40,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        title = 'Please select a template to use',
        callback = templatePicker.onSelect
    })
    a.nvim_win_set_option(popup_win, "wrap", false)
end

return templatePicker
