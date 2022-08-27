vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Full lua support
  use 'nvim-lua/plenary.nvim'
  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.cmp')
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- LSF
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspconfig')
    end
  }
  use('onsails/lspkind-nvim')
  -- Go utils
  use(
    'ray-x/go.nvim',
    require('go').setup()
  )
  use 'ray-x/guihua.lua'
  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = function()
      require('luasnip/loaders/from_vscode').load({
        paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
      })
    end
  }
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- gruvbox theme
  use { "ellisonleao/gruvbox.nvim" }
  -- git
  use {
    'TimUntersberger/neogit',
    config = function()
      require('neogit').setup()
    end
  }
  --syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  }
  --brackets
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }
  use "p00f/nvim-ts-rainbow"

  --statusbar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('plugins.lualine')
    end
  }
  --file manager
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope')
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly',
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 54,
        },
      }
    end
  }
  -- Zenmode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end
  }
  -- tabs
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'mfussenegger/nvim-dap'
end)
