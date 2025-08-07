vim.cmd("colorscheme rose-pine-moon | hi statusline guibg=NONE")
vim.lsp.enable({ "lua_ls", "ts_ls" })
vim.opt.completeopt = "menu,menuone,noinsert"

local lint = require("lint")

lint.linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    javascriptreact = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end
})
vim.opt.diffopt:append("vertical")
