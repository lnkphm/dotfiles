return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        update_focused_file = {
            enable = true,
        }
    },
    keys = {
        {
            "<leader>fp",
            function()
                require("nvim-tree.api").tree.open()
            end,
            mode = { "n" },
            desc = "Open file explorer",
        },
        {
            "<leader>fP",
            function()
                require("nvim-tree.api").tree.close()
            end,
            mode = { "n" },
            desc = "Close file explorer",
        },
    },
}
