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
	vim.cmd("colorscheme vague")

	function _G.statusline_mode()
		return get_mode()
	end

	vim.api.nvim_set_hl(0, "WinSeperator", { fg = "#252530", bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

	vim.opt.statusline = " %{v:lua.statusline_mode()} • %<%t%{&modified ? ' ●' : ''} %= %l:%c • %p%% "
end

return {
	"vague2k/vague.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		color()
	end,
}
