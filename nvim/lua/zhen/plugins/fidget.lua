return {
	"j-hui/fidget.nvim",
	opts = {
		progress = {
			ignore_empty_message = true,
			display = {
				render_limit = 3,
				done_ttl = 2,
				overrides = {
					jdtls = { name = "Java" },
				},
				format_message = function(msg)
					if msg.message and #msg.message > 30 then
						return msg.message:sub(1, 47) .. "..."
					end
					return msg.message
				end,
			},
		},
	},
}
