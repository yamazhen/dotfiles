local lspconfig = require('lspconfig')

local M = {}

M.setup = function (on_attach, default_capabilities)
    lspconfig['lua_ls'].setup {
        on_attach = on_attach,
        capabilities = default_capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    globals = {'vim'},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                    checkThirdParty = false,
                },
                telemetry = {enable=false},
            },
        },
    }
end

return M
