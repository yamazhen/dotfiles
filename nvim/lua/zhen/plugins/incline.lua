return {
	"b0o/incline.nvim",
	config = function()
		local highlight_color = "#f3be7c"
		local background_color = "#141415"

		require("incline").setup({
			render = function(props)
				local bufname = vim.api.nvim_buf_get_name(props.buf)
				local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
				local modified = vim.bo[props.buf].modified

				local icon = "\u{f15b}"

				local dot_color = props.focused and background_color or highlight_color

				if modified then
					return { icon, " ", filename, { " ●", guifg = dot_color } }
				else
					return { icon, " ", filename }
				end
			end,
			window = {
				margin = { horizontal = 0, vertical = 0 },
				padding = 1,
				placement = { horizontal = "right", vertical = "top" },
			},
			highlight = {
				groups = {
					InclineNormal = { guibg = highlight_color, guifg = background_color },
					InclineNormalNC = { guibg = "none", guifg = highlight_color },
				},
			},
		})
	end,
	event = "VeryLazy",
}
