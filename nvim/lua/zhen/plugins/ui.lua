return {
    {
        -- colorscheme
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                }
            })
            vim.cmd('colorscheme carbonfox')
            -- makes everything transparent
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
            vim.cmd('highlight Pmenu guibg=NONE')
        end,
    },
    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    theme = {
                        normal = {
                            a = { fg = '#ffffff', bg = 'NONE' },
                            b = { fg = '#ffffff', bg = 'NONE' },
                            c = { fg = '#ffffff', bg = 'NONE' },
                        },
                        insert = {
                            a = { fg = '#ffffff', bg = 'NONE' },
                            b = { fg = '#ffffff', bg = 'NONE' },
                            c = { fg = '#ffffff', bg = 'NONE' },
                        },
                        visual = {
                            a = { fg = '#ffffff', bg = 'NONE' },
                            b = { fg = '#ffffff', bg = 'NONE' },
                            c = { fg = '#ffffff', bg = 'NONE' },
                        },
                        replace = {
                            a = { fg = '#ffffff', bg = 'NONE' },
                            b = { fg = '#ffffff', bg = 'NONE' },
                            c = { fg = '#ffffff', bg = 'NONE' },
                        },
                        command = {
                            a = { fg = '#ffffff', bg = 'NONE' },
                            b = { fg = '#ffffff', bg = 'NONE' },
                            c = { fg = '#ffffff', bg = 'NONE' },
                        },
                        inactive = {
                            a = { fg = '#ffffff', bg = 'NONE' },
                            b = { fg = '#ffffff', bg = 'NONE' },
                            c = { fg = '#ffffff', bg = 'NONE' },
                        },
                    },
                    component_separators = '',
                    section_separators = '',
                },
                sections = {
                    lualine_c = { 'harpoon2' },
                },
            })
        end,
    },
    {
        'letieu/harpoon-lualine',
        dependencies = {
            {
                'ThePrimeagen/harpoon',
                branch = 'harpoon2'
            }
        },
    }
}
