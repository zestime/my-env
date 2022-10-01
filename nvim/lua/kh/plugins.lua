local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd "colorscheme tokyonight"
    end,
    disable = true,
  }
  use {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_better_performance = 1
      vim.cmd "colorscheme everforest"
    end,
    disable = false,
  }
  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd "colorscheme gruvbox-material"
    end,
    disable = true,
  }
  use {
    "arcticicestudio/nord-vim",
    config = function()
      vim.cmd "colorscheme nord"
    end,
    disable = true,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
    end,
  }

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  -- Autocompletion
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP

  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs

  use 'L3MON4D3/LuaSnip' -- Snippets

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  -- use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- WhichKey : show possible key bindings of the command
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("kh/whichkey").setup()
    end,
  }

  -- IndentLine
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("kh/indentblankline").setup()
    end,
  }
  -- Better Comment
  use {
    "numToStr/Comment.nvim",
    opt = true,
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup {}
    end,
  }

  -- Easy hopping
  use {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopChar1" },
    config = function()
      require("hop").setup {}
    end,
  }

  -- Easy motion
  use {
    "ggandor/lightspeed.nvim",
    keys = { "s", "S", "f", "F", "t", "T" },
    config = function()
      require("lightspeed").setup {}
    end,
  }

  -- IDE
  use {
    "antoinemadec/FixCursorHold.nvim",
    event = "BufReadPre",
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  }
  use {
    "max397574/better-escape.nvim",
    event = { "InsertEnter" },
    config = function()
      require("better_escape").setup {
        mapping = { "jk" },
        timeout = vim.o.timeoutlen,
        keys = "<ESC>",
      }
    end,
  }
  use {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    config = function()
      require("config.neoscroll").setup()
    end,
    disable = true,
  }
  use { "google/vim-searchindex", event = "BufReadPre" }
  use { "tyru/open-browser.vim", event = "BufReadPre" }


  -- Java
  use { "mfussenegger/nvim-jdtls", ft = { "java"}}

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    keys = { [[<C-\>]]},
    cmd = { "ToggleTerm", "TermExec"},
    module = {"toggleterm", "toggleterm.terminal"},
    config = function()
      require("kh.toggleterm").setup()
    end,
  }

  -- Test
  use {
    "nvim-neotest/neotest",
    opt = true,
    wants = {
      "plenary.nvim",
      "nvim-treesitter",
      "FixCursorHold.nvim",
      "neotest-python",
      "neotest-plenary",
      "neotest-go",
      "neotest-jest",
      "neotest-vim-test",
      "neotest-rust",
      "vim-test",
      "overseer.nvim",
    },
    requires = {
      "vim-test/vim-test",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "rouge8/neotest-rust",
    },
    module = { "neotest", "neotest.async" },
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
      "TestVisit",
    },
    config = function()
      require("config.neotest").setup()
    end,
    disable = false,
  }

end)
