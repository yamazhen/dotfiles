return {
    -- LSPZero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
            { 'williamboman/mason.nvim', config = true},
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            local keymap = vim.keymap

            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                keymap.set("n", "<leader>md", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = 'Show buffer diagnostics' })
                keymap.set("n", "<leader>mD", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Smart rename' })
            end)

            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
            keymap.set('n', '<leader>mm', '<cmd>Mason<CR>', { desc = 'Open Mason' })
            keymap.set('n', '<leader>ml', '<cmd>LspInstall<CR>', { desc = 'Install LSP for this filetype' })
            keymap.set('n', '<leader>mr', '<cmd>LspRestart<CR>', { desc = 'Restart LSP for this file' })
        end
    },
}
