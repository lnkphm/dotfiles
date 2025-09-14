return {
    {
        'MagicDuck/grug-far.nvim',
        config = true,
        keys = {
            {
                "<leader>fr",
                function()
                    require("grug-far").open()
                end,
                mode = { "n" },
                desc = "Find and replace",
            },
        },
    },
}
