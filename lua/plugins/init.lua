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
  use {
    'tzachar/cmp-tabnine', 
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }

  -- Snippets
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

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspconfig')
    end
  }

  -- Go tools
  use{
    'ray-x/go.nvim',
    require('go').setup{
      run_in_floaterm = true
    }
  }
  use 'ray-x/guihua.lua'

  -- Color themes
  use 'ellisonleao/gruvbox.nvim'

  --Git
  use { 
    'sindrets/diffview.nvim', 
    requires = 'nvim-lua/plenary.nvim' 
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  --Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  }

  --Brackets
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  use 'p00f/nvim-ts-rainbow'

  --Status bar
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

  --Debug 
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  --Comments
  use {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Zen mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end
  }
  
  --Icons
  use 'kyazdani42/nvim-web-devicons'
  use('onsails/lspkind-nvim')
end)
