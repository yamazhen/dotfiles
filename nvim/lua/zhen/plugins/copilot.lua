return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cond = function()
		local handle = io.popen("ping -c 1 -W 1 github.com 2>/dev/null")
		if not handle then
			return false
		end
		local result = handle:read("*a")
		handle:close()
		return result:find("1 packets transmitted") ~= nil and result:find("0.0%% packet loss") ~= nil
	end,
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
			},
			panel = {
				enabled = false,
			},
			server_opts_overrides = {
				settings = {
					advanced = {
						inlineSuggestCount = 1,
						listCount = 0,
					},
				},
			},
		})
	end,
}
