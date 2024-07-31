return {
    'stevearc/oil.nvim',
    opts = {},
    config = function ()
        require('oil').setup({
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            float = {
                padding = 2,
                max_width = 60,
                max_height = 30,
                border = 'rounded',
                win_options = {
                    winblend = 0,
                },
            },
        })
        vim.keymap.set("n", "<leader>ee", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end
}
