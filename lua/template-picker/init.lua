local popup = require "popup"
local templatePicker = {}
local a = vim.api

function templatePicker.onSelect(id, option)
    a.nvim_command('wincmd p')
    if     option == 'React TS' then a.nvim_command('call ReactTypescriptFunction()')
    elseif option == 'React JS' then a.nvim_command('call ReactFunction()')
    elseif option == 'PHP class' then a.nvim_command('call PHPClass()')
    elseif option == 'PHP function' then a.nvim_command('call PHPFunction()')
    elseif option == 'HTML' then a.nvim_command('call HTML()')
    end
end

function templatePicker.setup()
    local popup_win, popup_opts = popup.create({
        "React TS",
        "React JS",
        "PHP class",
        "PHP function",
        "HTML",
    }, {
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
