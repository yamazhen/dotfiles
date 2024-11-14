return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon.setup()

        local keymap = vim.keymap

        -- harpoon keymap
        keymap.set({"n","t"}, "<leader>hA", function() harpoon:list():prepend() end)
        keymap.set({"n","t"}, "<leader>ha", function() harpoon:list():add() end)
        keymap.set({"n","t"}, "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        keymap.set({"n","t"}, "<leader>h1", function() harpoon:list():select(1) end)
        keymap.set({"n","t"}, "<leader>h2", function() harpoon:list():select(2) end)
        keymap.set({"n","t"}, "<leader>h3", function() harpoon:list():select(3) end)
        keymap.set({"n","t"}, "<leader>h4", function() harpoon:list():select(4) end)

        keymap.set({"n","t"}, "<leader>hr1", function() harpoon:list():replace_at(1) end)
        keymap.set({"n","t"}, "<leader>hr2", function() harpoon:list():replace_at(2) end)
        keymap.set({"n","t"}, "<leader>hr3", function() harpoon:list():replace_at(3) end)
        keymap.set({"n","t"}, "<leader>hr4", function() harpoon:list():replace_at(4) end)
    end
}
