vim.g.completeopt = 'menu,menuone,noselect,noinsert'

local cmp = require'cmp'

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
snippet = {
  expand = function(args)
    vim.fn['vsnip#anonymous'](args.body)
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif vim.fn['vsnip#jumpable'](1) == 1 then
            feedkey('<Plug>(vsnip-jump-next)', '')
        else
            fallback()
        end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_prev_item()
        elseif vim.fn['vsnip#jumpable'](-1) == 1 then
            feedkey('<Plug>(vsnip-jump-prev)', '')
        else
            fallback()
        end
    end, {'i', 's'}),

    ['<C-l>'] = cmp.mapping(function(fallback)
        if vim.fn['vsnip#expandable']() then
            feedkey('<Plug>(vsnip-expand-or-jump)', '')
        else
            fallback()
        end
    end, {'i', 's'}),

    ['<C-j>'] = cmp.mapping(function(fallback)
        if vim.fn['vsnip#expandable']() then
            feedkey('<Plug>(vsnip-expand)', '')
        else
            fallback()
        end
    end, {'i', 's'})
}),
sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
