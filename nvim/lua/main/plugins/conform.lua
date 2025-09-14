return {
    {
        'stevearc/conform.nvim',
        keys = {
            {
                "<leader>i",
                function()
                    require("conform").format({ timeout_ms = 3000 })
                end,
                mode = { "n", "v" },
                desc = "Format",
            },
        },
        opts = {
            formatters_by_ft = {
                ["*"] = { "trim_whitespace" },
            },
        },
    }
}
