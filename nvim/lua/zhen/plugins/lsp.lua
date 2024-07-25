return {
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
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode').lazy_load()
            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            local keymap = vim.keymap

            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })

            keymap.set('n', '<leader>mm', '<cmd>Mason<CR>', { desc = 'Open Mason' })
            keymap.set('n', '<leader>ml', '<cmd>LspInstall<CR>', { desc = 'Install LSP for this filetype' })
            keymap.set('n', '<leader>mr', '<cmd>LspRestart<CR>', { desc = 'Restart LSP for this file' })
            keymap.set("n", "<leader>md", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = 'Show buffer diagnostics' })
            keymap.set("n", "<leader>mD", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Smart rename' })
        end
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require('null-ls')
            local keymap = vim.keymap
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                }
            })
            keymap.set('n', '<leader>mp', '<cmd>lua vim.lsp.buf.format()<CR>',
                { noremap = true, silent = true, desc = 'Format with Prettier' })
        end
    },
    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
        config = function()
            local autopairs = require('nvim-autopairs')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            autopairs.setup({})
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
    },
    -- autotag
    {
        'windwp/nvim-ts-autotag',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-ts-autotag').setup({})
        end,
    },
}
