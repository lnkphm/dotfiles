return {
    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            lazy = true
        }
    },

    -- Colorscheme
    { 'projekt0n/github-nvim-theme' },
    { 'ellisonleao/gruvbox.nvim' },

    -- Icons
    { 'nvim-tree/nvim-web-devicons' },

    -- Git
    { 'tpope/vim-fugitive' },

    -- Git Sign
    { 'lewis6991/gitsigns.nvim' },

    -- Comment
    { 'numToStr/Comment.nvim' },

    -- File Navigation
    { 'ThePrimeagen/harpoon' },

    -- Indent Line
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'tpope/vim-sleuth' },

    -- Auto-close Bracket
    { 'windwp/nvim-autopairs' },

    -- Markdown Preview
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'
    },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'L3MON4D3/LuaSnip' },
    { 'onsails/lspkind.nvim' },

    -- Linter
    { 'mfussenegger/nvim-lint' },

    -- Formatter
    { 'mhartington/formatter.nvim' },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    }
}
