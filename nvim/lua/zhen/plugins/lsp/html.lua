local lspconfig = require('lspconfig')
local M = {}
M.setup = function (on_attach, default_capabilities)
    default_capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig['html'].setup {
        on_attach = on_attach,
        capabilities = default_capabilities,
    }
end

return M
