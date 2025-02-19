-- LspZero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

-- LspConfig
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

require("lspconfig").terraformls.setup({
    init_options = {
        terraform = {
            path = "/usr/bin/terraform",
        }
    }
})

require("lspconfig").yamlls.setup({
    settings = {
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                printWidth = 120,
            },
            hover = true,
            completion = true,
            validate = false,
            schemas = {
                kubernetes = "*.{yml,yaml}",
                ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec"] = "*docker-compose*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",

            }
        }
    }
})

-- Mason
require('mason').setup({
    ui = {
        border = 'rounded'
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

-- CMP
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    }
})
