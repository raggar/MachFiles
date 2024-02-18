local setup, lf = pcall(require, "lf")
if not setup then
	return
end

lf.setup {
	winblend = 0,
	border = "rounded", -- border kind: single double shadow curved
	escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
	highlights = { -- highlights passed to toggleterm
		Normal = { link = "Normal" },
		NormalFloat = { link = "Normal" },
	},
}
