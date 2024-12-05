return {
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason.nvim', opts = { registries = {'github:nvim-java/mason-registry', 'github:mason-org/mason-registry'} } },
    {"williamboman/mason-lspconfig.nvim"},
    {'stevearc/conform.nvim'},
    {'neovim/nvim-lspconfig',
        config = function()
            require("mason").setup({})
            require("conform").setup({
                formatters_by_ft = {
                    python = {"black"},
                },
            })
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf, noremap = true, silent = true}
                    local keymap = vim.keymap
                    keymap.set('n', '<leader>sd', vim.lsp.buf.definition, opts)
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    keymap.set("n", "<leader>md", vim.diagnostic.open_float, opts)
                    keymap.set("n", '<leader>mD', require('fzf-lua').diagnostics_document, { noremap = true, silent = true })
                end,
            })
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        if server_name == "jdtls" then
                            return
                        end
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end,
    },
}


