require('github-theme').setup({
    options = {
        transparent = true,
    }
})

vim.cmd('colorscheme github_dark_high_contrast')
vim.cmd('highlight Normal guibg=None')
vim.cmd('highlight NonText guibg=None')
