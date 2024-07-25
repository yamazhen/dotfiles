return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        local keymap = vim.keymap

        -- telescope keymap
        keymap.set('n', '<leader>ff', builtin.find_files, {})
        keymap.set('n', '<leader>fs', builtin.live_grep, {})
        keymap.set('n', '<leader>fg', builtin.git_files, {})
        keymap.set('n', '<leader>fb', builtin.buffers, {})

    end,
}
