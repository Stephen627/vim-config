-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()


-- Possible new plugins
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/nvim-treesitter/nvim-treesitter

vim.opt.packpath = vim.fn.stdpath('config') .. '/vendor'

-- Install packer if it doesn't exist
local fn = vim.fn
local install_path = fn.stdpath('config')..'/vendor/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


local packer = require('packer')
packer.init({
    package_root = vim.fn.stdpath('config') .. '/vendor/pack'
})


return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'mfussenegger/nvim-dap'
    use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
    use 'mattn/emmet-vim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'folke/lsp-colors.nvim'
    use 'folke/trouble.nvim' 
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'akinsho/toggleterm.nvim'
    use 'nvim-lua/popup.nvim'
    use 'moll/vim-bbye'
    use 'nvim-lua/plenary.nvim'
    use 'hoob3rt/lualine.nvim'
    use 'folke/which-key.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'ray-x/lsp_signature.nvim'
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
          { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = function()
          require('telescope').load_extension('live_grep_args')
        end
    }
end)
