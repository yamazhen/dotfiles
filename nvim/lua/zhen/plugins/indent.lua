return {
	"echasnovski/mini.indentscope",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mini_indentscope = require("mini.indentscope")
		mini_indentscope.setup({
			symbol = "│",
			draw = {
				animation = mini_indentscope.gen_animation.none(),
			},
		})
	end,
}
