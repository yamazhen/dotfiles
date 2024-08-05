return {
    {'williamboman/mason.nvim', lazy = false, config = true},
    {'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            local keymap = vim.keymap
            local lspconfig = require('lspconfig')
            local lombok_jar = "/Users/zhen/.local/share/nvim/mason/bin/lombok.jar"
            lspconfig.jdtls.setup({
                cmd = {
                    '/Users/zhen/.local/share/nvim/mason/bin/jdtls',
                    '--jvm-arg=-javaagent:' .. lombok_jar,
                },
                root_dir = lspconfig.util.root_pattern('pom.xml'),
            })
            lspconfig.dartls.setup({
                cmd = {'dart', 'language-server', '--protocol=lsp'},
            })
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        if server_name == 'jdtls' then
                            return
                        end
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
            keymap.set('n', '<leader>mm', '<cmd>Mason<CR>', { desc = 'Open Mason' })
            keymap.set('n', '<leader>mg', vim.lsp.buf.definition)
            keymap.set('n', '<leader>ml', '<cmd>LspInstall<CR>', { desc = 'Install LSP for this filetype' })
            keymap.set('n', '<leader>mr', '<cmd>LspRestart<CR>', { desc = 'Restart LSP for this file' })
            keymap.set("n", "<leader>md", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = 'Show buffer diagnostics' })
            keymap.set("n", "<leader>mD", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Smart rename' })
        end
    },
}
