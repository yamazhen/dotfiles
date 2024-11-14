local lspconfig = require('lspconfig')

local M = {}

M.setup = function (on_attach, default_capabilities)
    lspconfig['cssls'].setup {
        on_attach = on_attach,
        capabilities = default_capabilities,
        settings = {
            css = {
                validate = false,
            },
            scss = {
                validate = false,
            },
            less = {
                validate = false,
            },
            tailwind = {
                classAttributes = { 'class', 'className', 'classList' },
            }
        }
    }
end

return M
