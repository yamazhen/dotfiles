return
    {
        "nvim-java/nvim-java",
        ft = "java",
        config = function ()
            local keymap = vim.keymap
            local on_attach = function (client, bufnr)
                local opts = {noremap=true, silent=true, buffer=bufnr}
                keymap.set('n', '<leader>sd', vim.lsp.buf.definition, opts)
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                keymap.set("n", "<leader>md", vim.diagnostic.open_float, opts)
                keymap.set("n", '<leader>mD', require('fzf-lua').diagnostics_document, { noremap = true, silent = true })
            end

            require("java").setup({
                java_test = { enable = false },
                java_debug_adapter = { enable = false },
                jdk = { auto_install = false },
                notifications = { dap = false },
            })
            require("lspconfig").jdtls.setup({
                on_attach = on_attach,
            })
        end
    }
