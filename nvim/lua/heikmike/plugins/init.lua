return {
  { "isobit/vim-caddyfile" },
  { "mfussenegger/nvim-jdtls" },
  { "eraserhd/parinfer-rust", build = "cargo build --release" },
  { "elkowar/yuck.vim" },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require('heikmike.plugins.configurations.tiny-inline-diagnostic')
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("heikmike.plugins.configurations.neoscroll")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("heikmike.plugins.configurations.dapui")
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },
  { 'RRethy/base16-nvim' },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("heikmike.plugins.configurations.symbols-outline")
    end,
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("heikmike.plugins.configurations.harpoon")
    end,
  },
  {
    'leoluz/nvim-dap-go',
    config = function()
      require("heikmike.plugins.configurations.dap-go")
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require("heikmike.plugins.configurations.lint")
    end,
  },
  { 'gpanders/nvim-parinfer' },
  { 'jalvesaq/Nvim-R' },
  {
    'mxsdev/nvim-dap-vscode-js',
    config = function()
      require("heikmike.plugins.configurations.dap-vscode-js")
    end,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_command("source $HOME/.config/nvim/lua/heikmike/plugins/configurations/copilot.vim")
    end
  },
  {
    'scalameta/nvim-metals',
    config = function() require("heikmike.plugins.configurations.metals") end,
  },
  { 'junegunn/seoul256.vim' },
  { 'folke/lsp-colors.nvim' },
  { "MunifTanjim/nui.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("heikmike.plugins.configurations.neotree")
    end
  },
  { 'preservim/vim-pencil' },
  {
    'sindrets/diffview.nvim',
    config = function() require("heikmike.plugins.configurations.diffview") end,
  },
  {
    'junegunn/vim-easy-align',
    config = function() require("heikmike.plugins.configurations.align") end,
  },
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("heikmike.plugins.configurations.flutter-tools")
    end,
  },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'vimwiki/vimwiki',
    config = function()
      vim.api.nvim_command("source $HOME/.config/nvim/lua/heikmike/plugins/configurations/vimwiki.vim")
    end
  },
  {
    'catppuccin/nvim',
    config = function() require("heikmike.plugins.configurations.catppuccin") end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("heikmike.plugins.configurations.alpha")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("heikmike.plugins.configurations.dap")
    end,
  },
  { 'tree-sitter/tree-sitter-scala' },
  { 'jiangmiao/auto-pairs' },
  { "xiyaowong/nvim-transparent" },
  {
    "projekt0n/github-nvim-theme",
    config = function() require("heikmike.plugins.configurations.github-theme") end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function() require("heikmike.plugins.configurations.lualine") end,
  },
  {
    'tpope/vim-fugitive',
    config = function() require("heikmike.plugins.configurations.fugitive") end,
  },
  { 'tpope/vim-surround' },
  { 'tikhomirov/vim-glsl' },
  { 'Pocco81/auto-save.nvim' },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("heikmike.plugins.configurations.treesitter")
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  { 'elkowar/yuck.vim' },
  {
    'lervag/vimtex',
    config = function()
      vim.api.nvim_command("source $HOME/.config/nvim/lua/heikmike/plugins/configurations/vimtex.vim")
    end,
  },
  { 'Fymyte/rasi.vim' },
  -- { 'preservim/nerdcommenter',
  --     config = function()
  --         vim.api.nvim_command("source $HOME/.config/nvim/lua/heikmike/plugins/configurations/nerdcommenter.vim")
  --     end
  -- },
  { 'rose-pine/neovim' },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require("heikmike.plugins.configurations.telescope")
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  -- LSP Support
  { 'neovim/nvim-lspconfig' },                 -- Required
  { 'williamboman/mason.nvim' },               -- Optional
  { 'williamboman/mason-lspconfig.nvim' },     -- Optional

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require("heikmike.plugins.configurations.cmp")
    end,
  },     -- Required
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  { 'hrsh7th/cmp-nvim-lsp' },         -- Required
  { 'hrsh7th/cmp-buffer' },           -- Optional
  { 'hrsh7th/cmp-path' },             -- Optional
  { 'saadparwaiz1/cmp_luasnip' },     -- Optional
  { 'hrsh7th/cmp-nvim-lua' },         -- Optional
  { 'onsails/lspkind.nvim' },         -- Optional

  -- Snippets
  { 'L3MON4D3/LuaSnip' },                 -- Required
  { 'rafamadriz/friendly-snippets' },     -- Optional

  -- Others
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'simrat39/rust-tools.nvim' },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("heikmike.plugins.configurations.todo-comments")
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require("heikmike.plugins.configurations.comment")
    end,
  }
}
