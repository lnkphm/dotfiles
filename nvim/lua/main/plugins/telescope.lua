return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                mode = { "n" },
                desc = "Find files",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                mode = { "n" },
                desc = "Live grep",
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                mode = { "n" },
                desc = "Buffers",
            },
        },
    },
}
