return {
    {'williamboman/mason.nvim', lazy = false, config = true,
    opts = {
            registries = {
                'github:nvim-java/mason-registry',
                'github:mason-org/mason-registry'
            },
        },
    },
    {'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            local keymap = vim.keymap
            local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- keymaps when lsp attach
            local on_attach = function (client, bufnr)
                local opts = {noremap=true, silent=true, buffer=bufnr}
                keymap.set('n', '<leader>sd', vim.lsp.buf.definition, opts)
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                keymap.set("n", "<leader>md", vim.diagnostic.open_float, opts)
                keymap.set("n", '<leader>mD', require('fzf-lua').diagnostics_document, { noremap = true, silent = true })
            end
            -- diagnostic float
            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
            -- general keymaps
            keymap.set('n', '<leader>mm', '<cmd>Mason<CR>', { desc = 'Open Mason' })
            keymap.set('n', '<leader>ml', '<cmd>LspInstall<CR>', { desc = 'Install LSP for this filetype' })
            keymap.set('n', '<leader>mr', '<cmd>LspRestart<CR>', { desc = 'Restart LSP for this file' })
            -- custom setup
            require('zhen.plugins.lsp.lua_ls').setup(on_attach, default_capabilities)
            require('zhen.plugins.lsp.ts_ls').setup(on_attach, default_capabilities)
            require('zhen.plugins.lsp.cssls').setup(on_attach, default_capabilities)
            require('zhen.plugins.lsp.html').setup(on_attach, default_capabilities)
            -- auto setup
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        if server_name ~= 'jdtls'
                            and server_name ~= 'ts_ls'
                            and server_name ~= 'cssls'
                            and server_name ~= 'lua_ls'
                            and server_name ~= 'html'
                        then
                            require('lspconfig')[server_name].setup({
                                on_attach = on_attach,
                            })
                        end
                    end,
                }
            })
        end
    },
}
