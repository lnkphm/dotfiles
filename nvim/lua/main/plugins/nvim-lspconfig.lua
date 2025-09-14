local user = {}

function user.on_attach()
    local bufmap = function(mode, lhs, rhs)
        local opts = { buffer = true }
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    bufmap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<leader>gn', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '<leader>g[', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', '<leader>g]', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = group,
                desc = 'LSP actions',
                callback = user.on_attach
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            checkThirdParty = false
                        },
                        telemetry = {
                            enable = false
                        },
                    }
                }
            })
        end,
    },
}
