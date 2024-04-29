return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>ma", ":lua require('harpoon.mark').add_file()<CR>", {})
		keymap.set("n", "<leader>ml", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
		keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", {})
		keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", {})
		keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", {})
		keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", {})
		keymap.set("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", {})
	end,
}
