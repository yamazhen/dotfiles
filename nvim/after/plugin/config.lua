require("blink.cmp").setup({ completion = { documentation = { auto_show = true } } })
require("rose-pine").setup({ styles = { transparency = true, italic = false } })
require("oil").setup({ view_options = { show_hidden = true }, delete_to_trash = true })
require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } } })
require("trouble").setup({ auto_preview = false, keys = { ["<cr>"] = "jump_close" }, warn_no_results = false })

require("fidget").setup({
	progress = { display = { render_limit = 0 } },
	notification = { override_vim_notify = true, window = { align = "top" } },
})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	auto_install = true,
	sync_install = false,
	ensure_installed = "",
	ignore_install = {},
	modules = {},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		html = {"prettierd"},
		css = {"prettierd"},
		json = {"prettierd"}
	},
})

vim.lsp.enable({
	"lua_ls",
	"emmet_language_server",
	"html",
	"cssls",
	"kotlin_lsp",
	"vtsls",
	"eslint",
	"tailwindcss",
	"rust_analyzer",
	"jsonls",
})

vim.cmd("colorscheme rose-pine-moon")
vim.cmd("highlight Comment cterm=italic gui=italic")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#252530" })
vim.opt.diffopt:append("vertical")
