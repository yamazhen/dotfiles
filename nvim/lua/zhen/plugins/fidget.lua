return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	config = function()
		require("fidget").setup({
			progress = {
				display = {
					render_limit = 0,
				},
			},
			notification = {
				override_vim_notify = true,
				window = {
					align = "top",
					relative = "editor",
				},
			},
		})
	end,
}
