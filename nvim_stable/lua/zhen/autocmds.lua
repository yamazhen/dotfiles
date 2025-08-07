local autocmd = vim.api.nvim_create_autocmd
local opts = { buffer = true, silent = true }
local keymap = vim.keymap.set

-- helper to disable pickers
local function disablePicker()
	keymap({ "n", "v" }, "<leader>pf", "<nop>", opts)
	keymap({ "n", "v" }, "<C-e>", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>pws", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>pWs", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>ps", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>vh", "<nop>", opts)
end

-- prevent auto commenting new lines
autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- prevent opening buffers in plugin windows
-- by unmapping fzf-lua keybinds in these filetypes
autocmd("FileType", {
	pattern = { "lazy", "oil", "mason", "trouble" },
	callback = function()
		disablePicker()
	end,
})

autocmd("FileType", {
	pattern = { "dap-view-term", "gitcommit", "fugitive", "dap-view" },
	callback = function()
		keymap("n", "q", "<cmd>close<cr>", { buffer = true, silent = true })
	end,
})

-- wrap lines in markdown
autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

-- list of languages that use 2 spaces for indentation
local two_indent = {
	"typescriptreact",
	"javascript",
	"typescript",
	"javascriptreact",
	"html",
	"css",
	"json",
	"jsonc",
	"dart",
	"swift",
	"yaml",
	"c",
	"sql",
}

-- follow indent convention of the language
autocmd("FileType", {
	pattern = two_indent,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

autocmd("WinLeave", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "trouble" then
			require("trouble").close()
		end
	end,
})

autocmd("LspAttach", {
	desc = "Set LSP folding if available",
	callback = function(ctx)
		local client = assert(vim.lsp.get_client_by_id(ctx.data.client_id))
		if client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})

vim.g.python3_host_prog = vim.fn.exepath("python3")
