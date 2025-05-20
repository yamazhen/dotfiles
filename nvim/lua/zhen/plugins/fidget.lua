return {
	"j-hui/fidget.nvim",
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
				view = {
					render_message = function(msg, cnt)
						local content = type(msg) == "string" and msg or tostring(msg)
						if #content > 30 then
							content = content:sub(1, 27) .. "..."
						end
						return cnt == 1 and content or string.format("(%dx) %s", cnt, content)
					end,
				},
			},
		})
	end,
}
