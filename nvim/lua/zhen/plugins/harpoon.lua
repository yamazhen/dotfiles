return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local keymap = vim.keymap.set
		keymap("n", "<leader>A", function()
			harpoon:list():prepend()
		end)
		keymap("n", "<leader>a", function()
			harpoon:list():add()
		end)
		keymap("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		keymap("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		keymap("n", "<C-j>", function()
			harpoon:list():select(2)
		end)
		keymap("n", "<C-k>", function()
			harpoon:list():select(3)
		end)
		keymap("n", "<C-l>", function()
			harpoon:list():select(4)
		end)
		keymap("n", "<leader><C-h>", function()
			harpoon:list():replace_at(1)
		end)
		keymap("n", "<leader><C-j>", function()
			harpoon:list():replace_at(2)
		end)
		keymap("n", "<leader><C-k>", function()
			harpoon:list():replace_at(3)
		end)
		keymap("n", "<leader><C-l>", function()
			harpoon:list():replace_at(4)
		end)
	end,
}
