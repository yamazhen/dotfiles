return {
    {
        'slugbyte/lackluster.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            local lackluster = require('lackluster')

            lackluster.setup({
                tweak_background = {
                    normal = 'none',
                    menu = lackluster.color.gray3,
                    popup = 'default',
                },
            })

            vim.cmd.colorscheme("lackluster-mint")

            -- transparency fix
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            vim.cmd("highlight Pmenu guibg=NONE")

            -- same color as tmux
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#ffffff" })
        end
    },
}
