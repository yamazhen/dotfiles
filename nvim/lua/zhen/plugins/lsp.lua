return {
    -- Mason
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- LSP Setup
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local keymap = vim.keymap

            local on_attach = function(client, bufnr)
                keymap.set("n", "<leader>md", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = 'Show buffer diagnostics' })
                keymap.set("n", "<leader>mD", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Smart rename' })
            end

            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            on_attach = on_attach,
                        })
                    end,
                }
            })
            require('lspconfig').dartls.setup{
                cmd = {'dart', 'language-server', '--protocol=lsp'},
            }
            keymap.set('n', '<leader>mm', '<cmd>Mason<CR>', { desc = 'Open Mason' })
            keymap.set('n', '<leader>ml', '<cmd>LspInstall<CR>', { desc = 'Install LSP for this filetype' })
            keymap.set('n', '<leader>mr', '<cmd>LspRestart<CR>', { desc = 'Restart LSP for this file' })
        end
    },
}
