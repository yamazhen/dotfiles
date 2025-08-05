local function get_mode()
	local mode_map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		R = "REPLACE",
		t = "TERMINAL",
	}
	return mode_map[vim.fn.mode()] or vim.fn.mode():upper()
end

local function color()
	local background = "#141415"

	require("rose-pine").setup({
		styles = {
			italic = false,
		},
		palette = {
			moon = {
				base = background,
				surface = background,
				overlay = background,
			},
		},
	})
	vim.cmd("colorscheme rose-pine-moon")

	function _G.statusline_mode()
		return get_mode()
	end

	vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#252530" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

	vim.opt.statusline = " %{v:lua.statusline_mode()} • %<%t%{&modified ? ' ●' : ''} %= %l:%c • %p%% "
end

return {
	"rose-pine/neovim",
	name = "rose-pine",
	init = function()
		color()
	end,
}
