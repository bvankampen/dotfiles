local packer = require 'lib.packer-init'

return packer.startup(function(use)
  use {'wbthomason/packer.nvim'}

  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-eunuch' }
  -- use { 'bronson/vim-trailing-whitespace' }
  use { 'tpope/vim-sleuth' }
  use { 'jessarcher/vim-heritage' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-live-grep-raw.nvim' },
    },
    config = function()
      require('user.plugins.telescope')
    end
  }

  use {
    'dracula/vim',
    as = 'dracula',
   config = function()
     require('user.plugins.dracula')
   end
  }

  use {
    'sickill/vim-pasta',
    config = function()
      require('user.plugins.pasta')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.nvim-tree')
    end
  }
  
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.bufferline')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup { sign_priority = 20 }
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.lualine')
    end
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'b0o/schemastore.nvim',
      'folke/lsp-colors.nvim',
      'weilbith/nvim-code-action-menu',
    },
    config = function ()
      require('user.plugins.lspconfig')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'lewis6991/spellsitter.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('user.plugins.treesitter')
      require('spellsitter').setup()
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'jessarcher/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      require('user.plugins.cmp')
    end
  }
  end)
