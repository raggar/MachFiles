return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>tm", ":lua require(\"telescope.builtin\").marks()<CR>", {})

		-- Buffers
		keymap.set("n", "<leader>tb", ":lua require(\"telescope.builtin\").buffers()<CR>", {})

		-- Git
		keymap.set("n", "<leader>ts", ":lua require(\"telescope.builtin\").git_status()<CR>", {})
	end,
}
