return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
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
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.confirm({ select = false }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
            })
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- autotag
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },

}
