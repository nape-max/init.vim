-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} }
  }

  use ({
	  "rose-pine/neovim",
	  as = "rose-pine",
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- comments
  use('terrortylor/nvim-comment')

  --use('saadparwaiz1/cmp_luasnip')
  --use('rafamadriz/friendly-snippets')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
          {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
		  {
              'L3MON4D3/LuaSnip',
              after = 'friendly-snippets',
              config = function()
                  require('luasnip/loaders/from_vscode').load({
                      paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
                  })
              end
          },
		  {'rafamadriz/friendly-snippets'},

--		  {'hrsh7th/nvim-cmp'},
--		  {'hrsh7th/cmp-nvim-lsp'},
--		  {'L3MON4D3/LuaSnip', after = 'friendly-snippets',
  --            config = function()
    --              require('luasnip/loaders/from_vscode').load({
      --                paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
        --          })
          --    end
         -- },
	  }
  }

  use {
      'mfussenegger/nvim-dap',
      requires = {
          -- Creates a beautiful debugger UI
          'rcarriga/nvim-dap-ui',

          -- Required dependency for nvim-dap-ui
          'nvim-neotest/nvim-nio',

          -- Installs the debug adapters for you
          'williamboman/mason.nvim',
          'jay-babu/mason-nvim-dap.nvim',

          -- Add your own debuggers here
          'leoluz/nvim-dap-go',
      }
  }
  use {
      "folke/which-key.nvim",
      opts = {
           triggers = {
               { "<leader>", mode = { "n", "v" } },
           }
      },
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 0
          require("which-key").setup({})
          end,
      requires = {
          'echasnovski/mini.nvim',
          'nvim-tree/nvim-web-devicons',
      }
  }

 -- use {'nape-max/ntutorial', branch='master'}
end)
