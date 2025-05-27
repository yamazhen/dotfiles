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

return {
	"vague2k/vague.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		require("vague").setup({})
		vim.cmd("colorscheme vague")

		function _G.statusline_mode()
			return get_mode()
		end

		vim.cmd("highlight WinSeparator guifg=#252530 guibg=NONE")

		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

		vim.opt.statusline = " %{v:lua.statusline_mode()} • %<%t%{&modified ? ' ●' : ''} %= %l:%c • %p%% "
	end,
}
