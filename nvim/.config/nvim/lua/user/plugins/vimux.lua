return {
	"preservim/vimux",
	config = function()
		vim.g.VimuxHeight = "35"
		vim.g.VimuxOrientation = "v"
		vim.g.VimuxUseNearest = 0

		local keymap = vim.keymap

		keymap.set("n", "<leader>to", ":VimuxOpenRunner<CR>", {})
		keymap.set("n", "<leader>tc", ":VimuxCloseRunner<CR>", {})
	end,
}
