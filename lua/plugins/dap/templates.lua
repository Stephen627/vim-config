require('dressing').setup({})

local vscodeDirPath = vim.fn.getcwd() .. '/.vscode'
local launchJson = vscodeDirPath .. '/launch.json'
local masterTemplate = vim.fn.stdpath('config') .. '/debug/master-template.json'

local PromptMap = {
    ['Copy PHP debug template'] = vim.fn.stdpath('config') .. '/debug/php.json',
    ['Copy JS debug template'] = vim.fn.stdpath('config') .. '/debug/js.json',
}


local function checkIfVsCodeExists ()
    return vim.loop.fs_stat(vim.fn.getcwd() .. '/.vscode')
end

local function writeContentsToFile (contents, filePath)
    local handle = io.open(filePath, 'w')
    io.output(handle)
    io.write(contents)
    io.close(handle)
end

local function getFileContents (filePath)
    local handle = io.open(filePath, 'r')
    io.input(handle)
    local contents = io.read('*all')
    io.close(handle)

    return contents
end

local function copyTemplate (selected)
    local vsCodeExists = vim.loop.fs_stat(vscodeDirPath)
    local launchJsonExists = vim.loop.fs_stat(launchJson)

    if (not vsCodeExists) then
        vim.fn.system({ 'mkdir', vscodeDirPath })
    end

    if (not launchJsonExists) then
        vim.fn.system({ 'touch', launchJson })
        local masterContents = getFileContents(masterTemplate)
        writeContentsToFile(masterContents, launchJson)
    end

    local debugPath = PromptMap[selected]
    local debugContent = getFileContents(debugPath)
    local debugTable = vim.json.decode(debugContent)

    local launchContent = getFileContents(launchJson)
    local launchTable = vim.json.decode(launchContent)
    table.insert(launchTable.configurations, debugTable)

    writeContentsToFile(vim.json.encode(launchTable), launchJson)
end

function CopyTemplatePrompt ()
    vim.ui.select(
        {
            'Copy PHP debug template',
            'Copy JS debug template',
        },
        {
            prompt = 'Choose',
        },
        copyTemplate
    )
end

require('legendary').keymap({
    '<leader>dt', '<cmd>lua CopyTemplatePrompt()<cr>', description = 'Open copy debug template prompt'
})
