local lspconfig = require('lspconfig')
local M = {}
M.setup = function (on_attach, default_capabilities)
    lspconfig['ts_ls'].setup {
        on_attach = on_attach,
        capabilities = default_capabilities,
    }
end

return M
