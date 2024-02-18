local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
			vim.cmd "quit"
		end
	end,
})

function NvimTreeTrash()
	local lib = require "nvim-tree.lib"
	local node = lib.get_node_at_cursor()
	local trash_cmd = "rip "

	local function get_user_input_char()
		local c = vim.fn.getchar()
		return vim.fn.nr2char(c)
	end

	print("Trash " .. node.name .. " ? y/n")

	if get_user_input_char():match "^y" and node then
		vim.fn.jobstart(trash_cmd .. node.absolute_path, {
			detach = true,
			on_exit = function(job_id, data, event)
				lib.refresh_tree()
			end,
		})
	end

	vim.api.nvim_command "normal :esc<CR>"
end

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr) -- include defaults
	vim.keymap.set("n", "d", ":lua NvimTreeTrash()<CR>", opts "Delete")
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "",
					ignored = "◌",
				},
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	open_on_tab = false,
	hijack_cursor = false,
	respect_buf_cwd = false,
	sync_root_with_cwd = true,
	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	filters = {
		dotfiles = false,
		custom = {
			"node_modules",
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	on_attach = my_on_attach,
	view = {
		width = 40,
		side = "left",
		number = false,
		relativenumber = false,
	},
}
