return {
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

}
