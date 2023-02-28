return {
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    { 'tikhomirov/vim-glsl' },
    { 'Pocco81/auto-save.nvim' },
    { 'savq/melange-nvim' },
    { 'github/copilot.vim',
        config = function()
            vim.api.nvim_command("source $HOME/.config/nvim/lua/heikmike/plugins/configurations/copilot.vim")
        end
    },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-lua/plenary.nvim' },
    { 'ThePrimeagen/harpoon',
        config = function()
            require("heikmike.plugins.configurations.harpoon")
        end,
    },
    { 'iamcco/markdown-preview.nvim' },
    { 'elkowar/yuck.vim' },
    { 'lervag/vimtex',
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
    {
        'rose-pine/neovim',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end,
    },
    { 'nvim-telescope/telescope.nvim',
        config = function()
            require("heikmike.plugins.configurations.telescope")
        end,
    },
    { 'nvim-lua/plenary.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp',
                config = function()
                    require("heikmike.plugins.configurations.cmp")
                end,
            }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            { 'onsails/lspkind.nvim' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- Others
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'simrat39/rust-tools.nvim' }
        },
        config = function()
            require("heikmike.plugins.configurations.lsp")
        end,
    },

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
