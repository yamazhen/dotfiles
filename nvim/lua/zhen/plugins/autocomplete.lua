return {
    -- autocomplete
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode').lazy_load()
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }),
                window = {
                    completion = {
                        border = 'rounded',
                        scrollbar = false,
                    },
                    documentation = {
                        border = 'rounded',
                        scrollbar = false,
                    },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                }
            })
        end,
    },
    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        dependencies = {'hrsh7th/nvim-cmp'},
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
