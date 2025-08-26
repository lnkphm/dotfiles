local util = require('formatter.util')

local prettierd = function()
    return {
        exe = 'prettierd',
        args = { util.escape_path(util.get_current_buffer_file_path()) },
        stdin = true,
    }
end

require('formatter').setup {
    filetype = {
        javascript = { prettierd },
        html = { prettierd },
        css = { prettierd },
        markdown = { prettierd },
        yaml = { prettierd },
        ['*'] = {
            require('formatter.filetypes.any').remove_trailing_whitespace,
        },

    }
}

vim.keymap.set('n', '<leader>i', ':Format<CR>')
vim.keymap.set('n', '<leader>I', ':FormatWrite<CR>')
