return {
	"leath-dub/snipe.nvim",
	lazy = false,
	config = function()
		local snipe = require("snipe")
		-- setup
		snipe.setup({
			ui = {
				position = "center",
				text_align = "file-first",
			},
			hints = {
				dictionary = "1234567890",
			},
		})
		-- code actions
		snipe.ui_select_menu = require("snipe.menu"):new({ position = "center" })
		snipe.ui_select_menu:add_new_buffer_callback(function(m)
			vim.keymap.set("n", "<esc>", function()
				m:close()
			end, { nowait = true, buffer = m.buf })
		end)
		vim.ui.select = snipe.ui_select
		-- keymap
		vim.keymap.set("n", "<leader>n", function()
			snipe.open_buffer_menu()
		end)
	end,
}
