local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require "telescope.actions"

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
			vertical = { mirror = false },
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		color_devicons = true,
		use_less = true,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
	},
}
