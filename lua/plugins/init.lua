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
  use 'onsails/lspkind-nvim'
  -- Go utils
  use(
    'ray-x/go.nvim',
    require('go').setup()
  )
  use 'ray-x/guihua.lua'
  -- Errors
  use {
    'folke/trouble.nvim',
    config = function()
      require('plugins.trouble')
    end
  }
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
  -- Color theme
  use 'ellisonleao/gruvbox.nvim'
  use 'Mofiqul/vscode.nvim'
  use { 'VladPetriv/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' }
  use 'https://gitlab.com/__tpb/monokai-pro.nvim'
  -- git
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
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
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  use 'p00f/nvim-ts-rainbow'
  --statusbar
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end
  }
  --File managing
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope')
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    config = function()
      require('plugins.nvim-tree')
    end
  }
  -- Tabs
  use 'romgrk/barbar.nvim'
  -- Debug tool
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  -- TODO comments
  use {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end
  }
  --  Icons
  use 'kyazdani42/nvim-web-devicons'
end)
