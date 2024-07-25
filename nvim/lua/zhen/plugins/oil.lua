return {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
        -- oil keymap
        require('oil').setup({
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },
            float = {
                padding = 2,
                max_width = 90,
                max_height = 0,
            },
            win_options = {
                wrap = true,
                winblend = 0,
            },
        })
        vim.keymap.set('n', '<leader>ee', function()
            if vim.bo.filetype == 'oil' then
                vim.cmd('close')
            else
                require('oil').open_float()
            end
        end)
        vim.keymap.set('n', '<leader>ep', function()
            if vim.bo.filetype == 'oil' then
                vim.cmd('Oil')
            else
                print "Oil Is Not Opened"
            end
        end)
    end
}
