local opt = vim.opt
local o = vim.o

opt.nu = true
opt.relativenumber = true

opt.foldmethod = "manual"

opt.fillchars = { eob = " " }

o.foldenable = true
o.foldlevel = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
opt.foldcolumn = "0"
opt.fillchars:append({ fold = " " })

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

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

o.scrolloff = 10

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	float = { enable = false },
})

opt.autowriteall = true

opt.splitbelow = true
opt.splitright = true
