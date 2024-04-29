return {
	"lmburns/lf.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local lf = require "lf"

		lf.setup {
			winblend = 0,
			border = "rounded", -- border kind: single double shadow curved
			escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
			highlights = { -- highlights passed to toggleterm
				Normal = { link = "Normal" },
				NormalFloat = { link = "Normal" },
			},
		}

		local keymap = vim.keymap

		-- Lf
		keymap.set("n", "<leader>lf", ":lua require('lf').start()<CR>", {})
	end,
}
