-- Install lazy if it doesn't already exist
local vendorpath = vim.fn.stdpath('config') .. '/vendor'
local modulepath = vendorpath .. '/modules'
local lazypath = vendorpath .. '/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end
vim.opt.rtp:prepend(lazypath)

local programmingfiletypes = {
    'php', 'typescript', 'javascript', 'html', 'typescriptreact', 'javascriptreact', 'scss', 'css', 'lua',
}

require('lazy').setup({
    -- Disabling because they need more setup
    -- {
    --     'mfussenegger/nvim-dap',
    --     config = function ()
    --         require 'plugins.dap'
    --     end
    -- },
    -- 'rcarriga/nvim-dap-ui',
    
    -- Libraries basically everything relies on
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',

    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        name = 'catppuccin',
        config = function ()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },

    -- LSP features and setup
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'glepnir/lspsaga.nvim',
            'folke/lsp-colors.nvim',
        },
        ft = programmingfiletypes
    },
    {
        'williamboman/mason.nvim',
        config = function ()
            require('mason').setup({
                install_root_dir = vendorpath .. '/lsp',
            })
            require('mason-lspconfig').setup()

            require('mason-lspconfig').setup_handlers {
                function (server_name) -- default handler
                    require('lspconfig')[server_name].setup {}
                end,
            }
        end,
        dependencies = {
            'williamboman/mason-lspconfig.nvim'
        },
        fp = programmingfiletypes
    },

    {
        'shortcuts/no-neck-pain.nvim',
        version = '*'
    },

    -- Completion engine with sources
    {
        'hrsh7th/nvim-cmp',
        config = function ()
            require 'plugins.nvim-cmp'
        end,
        ft = programmingfiletypes,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        }
    },

    -- Snippets
    {
        'rafamadriz/friendly-snippets',
        dependencies = {
           'hrsh7th/vim-vsnip',
           'hrsh7th/cmp-vsnip',
        },
        ft = programmingfiletypes,
    },

    -- Nice icons
    {
        'kyazdani42/nvim-web-devicons',
        config = function ()
            require 'plugins.nvim-web-devicons'
        end
    },

    -- File navigation
    {
        'kyazdani42/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        config = function ()
            require 'plugins.nvim-tree'
        end
    },

    -- Popup terminal
    {
        'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
        config = function ()
            require 'plugins.toggleterm'
        end
    },

    -- Easier buffer commands
    'moll/vim-bbye',

    -- File and buffer status line
    {
        'hoob3rt/lualine.nvim',
        config = function ()
            require 'plugins.lualine'
        end
    },
    {
        'akinsho/bufferline.nvim',
        config = function ()
            require 'plugins.bufferline'
        end
    },

    -- Git signs in files
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require 'plugins.gitsigns'
        end,
        cond = function ()
            return vim.loop.fs_stat(vim.fn.getcwd() .. '/.git')
        end
    },

    -- File finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        dependencies = {
            'nvim-telescope/telescope-live-grep-args.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            require('telescope').load_extension('live_grep_args')
            require 'plugins.telescope'
        end
    },

    -- Command helper
    {
        'mrjones2014/legendary.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
        },
        config = function ()
            require 'plugins.legendary'
        end
    },

    -- Notifications 
    {
        'rcarriga/nvim-notify',
        config = function ()
            require("notify").setup {
                stages = 'fade_in_slide_out',
                background_colour = 'FloatShadow',
                timeout = 3000,
            }
            vim.notify = require('notify')
        end
    },

    -- Laravel helpers
    {
        'noahfrederick/vim-laravel',
        cond = function ()
            return vim.loop.fs_stat(vim.fn.getcwd() .. '/artisan')
        end
    }
}, {
    root = modulepath,
})

