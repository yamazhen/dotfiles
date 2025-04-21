return {
	"b0o/incline.nvim",
	config = function()
		require("incline").setup({
			render = function(props)
				local bufname = vim.api.nvim_buf_get_name(props.buf)
				local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
				local modified = vim.bo[props.buf].modified

				local icon = "\u{f15b}"

				local dot_color = props.focused and "#1e232b" or "#f9af4f"

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
					InclineNormal = { guibg = "#f9af4f", guifg = "#1e232b" },
					InclineNormalNC = { guibg = "none", guifg = "#f9af4f" },
				},
			},
		})
	end,
	event = "VeryLazy",
}
