local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePre", {
    callback = function()
        if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" }) > 0 then
            vim.lsp.buf.format()
        end
    end
})
autocmd("FileType", {
    pattern = "fugitive",
    callback = function()
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd("Git pull --rebase")
        end, { buffer = true })
    end,
})
