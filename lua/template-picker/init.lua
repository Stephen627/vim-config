local popup = require "popup"
local templatePicker = {}
local a = vim.api

function templatePicker.onSelect(id, option)
    a.nvim_command('wincmd p')
    if     option == 'React class' then a.nvim_command('call ReactClass()')
    elseif option == 'React function' then a.nvim_command('call ReactFunction()')
    elseif option == 'PHP class' then a.nvim_command('call PHPClass()')
    elseif option == 'PHP function' then a.nvim_command('call PHPFunction()')
    elseif option == 'HTML' then a.nvim_command('call HTML()')
    end
end

function templatePicker.setup()
    local popup_win, popup_opts = popup.create({
        "React class",
        "React function",
        "PHP class",
        "PHP function",
        "HTML",
    }, {
        title = 'Please select a template to use',
        callback = templatePicker.onSelect
    })
    local popup_bufnr = a.nvim_win_get_buf(popup_win)

    templatePicker.popup_win = popup_win
    templatePicker.popup_opts = popup_bufnr

    a.nvim_win_set_option(popup_win, "wrap", false)
end

return templatePicker
