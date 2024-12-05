return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        init = function ()
            require("rose-pine").setup({
                styles = {
                    transparency = true,
                    italic = false,
                },
            })

            vim.cmd.colorscheme("rose-pine-moon")

            -- transparency fix
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            vim.cmd("highlight Pmenu guibg=NONE")

            -- same color as tmux
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#ffffff" })
        end
    },
}
