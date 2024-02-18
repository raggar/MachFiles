local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
	sections = {
		lualine_a = {},
		lualine_b = { "branch" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}
