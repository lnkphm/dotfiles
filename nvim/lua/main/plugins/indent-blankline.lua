return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = { 'Whitespace' }
            require('ibl').setup({
                indent = {
                    highlight = highlight,
                    char = '│'
                },
            })
        end
    }
}
