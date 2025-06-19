local opt = vim.opt
local o = vim.o

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.fillchars = { eob = " ", fold = " " }

o.foldenable = true
o.foldlevel = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
opt.foldcolumn = "0"

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = true
opt.linebreak = true
opt.breakindent = true

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

o.scrolloff = 10

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.autowriteall = true

vim.o.cmdheight = 0
