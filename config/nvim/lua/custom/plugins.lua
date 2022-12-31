
return function(use)

  -- Which Key
  use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({
      })
      end
  })

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
      }
    end
  }

  -- Neogit
  use {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
          diff_binaries = false,
          use_icons = false
      }
    end
  }
  use {
    'TimUntersberger/neogit',
    config = function()
      require('neogit').setup {
          disable_context_highlighting = false,
          integrations = {
            diffview = true
          }
      }
    end
  }

  -- Bufdel
  use {
    'ojroques/nvim-bufdel',
    config = function ()
      require('bufdel').setup {
        next = 'alternate',
        quit = false,
      }
    end
  }

  -- Nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function ()
        require('nvim-tree').setup {
          disable_netrw = false,
          view = {
            side = 'left',
            width = 30,
          },
          git = {
            ignore = true,
          },
      }
    end
  }

  -- LSP
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }

  -- Navigation
  use 'ctrlpvim/ctrlp.vim'
  use 'theprimeagen/harpoon'

  -- Auto complete extensions
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Automatic pairs
  -- use 'jiangmiao/auto-pairs'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {

      }
    end
  }

  -- Navigation
  use 'ggandor/lightspeed.nvim'

  -- Colorschemes
  use 'https://gitlab.com/yorickpeterse/nvim-grey.git'
  use {
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_style = 'maia'
      vim.g.sonokai_better_performance = 1
    end
  }

end
