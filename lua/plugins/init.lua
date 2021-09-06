-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()


-- Possible new plugins
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/nvim-treesitter/nvim-treesitter

return require('packer').startup(function()
    use 'mattn/emmet-vim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'folke/lsp-colors.nvim'
    use 'folke/trouble.nvim' 
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'projekt0n/github-nvim-theme'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'hoob3rt/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
