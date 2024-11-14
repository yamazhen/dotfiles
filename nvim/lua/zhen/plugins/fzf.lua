return {
    "ibhagwan/fzf-lua",
    config = function ()
        local fzf = require("fzf-lua")
        local keymap = vim.keymap

        fzf.setup({
            winopts = {
                preview = {
                    vertical = "down:40%",
                    horizontal = "right:50%"
                }
            },
        })

        -- keymaps
        keymap.set({"n","t"}, '<leader>ff', fzf.files, { noremap = true, silent = true })
        keymap.set({"n","t"}, '<leader>fs', fzf.grep, { noremap = true, silent = true })
        keymap.set({"n","t"}, '<leader>fg', fzf.git_files, { noremap = true, silent = true })
        keymap.set({"n","t"}, '<leader>fb', fzf.buffers, { noremap = true, silent = true })
        keymap.set({"n","t"}, '<leader>fl', fzf.lsp_workspace_symbols, { noremap = true, silent = true })
    end
}
