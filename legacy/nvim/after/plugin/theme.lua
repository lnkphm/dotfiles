vim.cmd('highlight Normal guibg=None')
vim.cmd('highlight NonText guibg=None')

-- Github
-- require('github-theme').setup({
--     options = {
--         transparent = true,
--     }
-- })
-- vim.cmd('colorscheme github_dark_high_contrast')


-- Gruvbox
require('gruvbox').setup({
    transparent_mode = true,
})
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
