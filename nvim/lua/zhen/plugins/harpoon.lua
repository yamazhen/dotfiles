return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon.setup()

        local keymap = vim.keymap

        -- harpoon keymap
        keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
        keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
        keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
        keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
        keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end)
        keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
        keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
    end
}
