local opt = vim.opt
local o = vim.o

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = true
opt.foldlevel = 99

o.winborder = "single"

opt.fillchars = { eob = " " }

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

opt.colorcolumn = "80"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.numberwidth = 2

opt.updatetime = 500

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	float = { enable = false },
})

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.cursorline = true

o.cmdheight = 0

opt.autowriteall = true
