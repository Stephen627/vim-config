return {
  {
      'neovim/nvim-lspconfig',
      event = "LspAttach",
      config = function ()
        require('util').on_attach(function (client, buffer)
          require("config.lsp.inlayhints").attach(client, buffer)
          require("config.lsp.gitsigns").attach(client, buffer)
        end)

        -- diagnostics
        for name, icon in pairs(require("util.icons").diagnostics) do
          name = "DiagnosticSign" .. name
          vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
        end
        require("config.lsp.general").setup({})
        vim.diagnostic.config(require("config.lsp.diagnostics")["on"])

        vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.references()<cr>', { desc='Find all reference' })
        vim.api.nvim_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc='Show code actions' })
        vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc='Rename class, variable, or function' })
        vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("goto-preview").goto_preview_definition()<cr>', { desc='Peek the definition' })
        vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc='Go to the definition' })
        vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc='Open preview for the highlighted function definition' })
      end
  },
  {
    'williamboman/mason.nvim',
    config = function ()
      require('mason').setup({
        install_root_dir = require("util").vendorpath .. '/mason',
      })
      require('mason-lspconfig').setup_handlers {
        function (server_name) -- default handler
          local settings = {}
          local projectSettings = require("settings")
          if (projectSettings and projectSettings.lsp and projectSettings.lsp[server_name]) then
            settings = projectSettings.lsp[server_name]
          end
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          if (capabilities) then
            settings.capabilities = capabilities
          end
          settings.handlers = require("config.lsp.handlers")
          require('lspconfig')[server_name].setup(settings)
        end,
      }
    end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
  },

  -- Completion engine with sources
  {
    'hrsh7th/nvim-cmp',
    config = function ()
      require 'config.nvim-cmp'
    end,
    ft = require("util").programmingfiletypes,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    }
  },

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    dependencies = { 
      'rafamadriz/friendly-snippets',
    },
    ft = require("util").programmingfiletypes,
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
      local luasnip = require("luasnip")

      vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
      -- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
      -- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, {silent = true})
    end
  },
}
