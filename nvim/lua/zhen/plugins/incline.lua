return {
	"b0o/incline.nvim",
	config = function()
		require("incline").setup({
			render = function(props)
				local bufname = vim.api.nvim_buf_get_name(props.buf)
				local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
				local modified = vim.bo[props.buf].modified

				local icon = "\u{f15b}"

				if modified then
					return { icon, " ", filename, { " ●", guifg = "#7fd962" } }
				else
					return { icon, " ", filename }
				end
			end,
			window = {
				margin = { horizontal = 0, vertical = 0 },
				padding = 1,
				placement = { horizontal = "right", vertical = "top" },
			},
		})
	end,
	event = "VeryLazy",
}
