return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require "fzf-lua"
		local actions = fzf.actions

		fzf.setup {
			files = {
				previewer = "bat", -- uncomment to override previewer
				-- (name from 'previewers' table)
				-- set to 'false' to disable
				multiprocess = true, -- run command in a separate process
				git_icons = true, -- show git icons?
				file_icons = false, -- show file icons?
				color_icons = true, -- colorize file|git icons
				fd_opts = os.getenv "FD_DEFAULT_OPTS",
				-- cwd_header = true,
				cwd_prompt = true,
				cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
				cwd_prompt_shorten_val = 1, -- shortened path parts length
				toggle_ignore_flag = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
				actions = {
					-- inherits from 'actions.files', here we can override
					-- or set bind to 'false' to disable a default action
					-- action to toggle `--no-ignore`, requires fd or rg installed
					["ctrl-g"] = false,
					-- uncomment to override `actions.file_edit_or_qf`
					--   ["default"]   = actions.file_edit,
					-- custom actions are available too
					["ctrl-y"] = false,
				},
			},
			grep = {
				prompt = "Rg❯ ",
				multiprocess = true, -- run command in a separate process
				git_icons = true, -- show git icons?
				file_icons = true, -- show file icons?
				color_icons = true, -- colorize file|git icons
				-- executed command priority is 'cmd' (if exists)
				-- otherwise auto-detect prioritizes `rg` over `grep`
				-- default options are controlled by 'rg|grep_opts'
				-- cmd            = "rg --vimgrep",
				rg_opts = os.getenv "RIP_OPTS",
				-- set to 'true' to always parse globs in both 'grep' and 'live_grep'
				-- search strings will be split using the 'glob_separator' and translated
				-- to '--iglob=' arguments, requires 'rg'
				-- can still be used when 'false' by calling 'live_grep_glob' directly
				rg_glob = false, -- default to glob parsing?
				glob_flag = "--iglob", -- for case sensitive globs use '--glob'
				glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
				-- advanced usage: for custom argument parsing define
				-- 'rg_glob_fn' to return a pair:
				--   first returned argument is the new search query
				--   second returned argument are additional rg flags
				-- rg_glob_fn = function(query, opts)
				--   ...
				--   return new_query, flags
				-- end,
				actions = {
					-- actions inherit from 'actions.files' and merge
					-- this action toggles between 'grep' and 'live_grep'
					["ctrl-g"] = { actions.grep_lgrep },
					-- uncomment to enable '.gitignore' toggle for grep
					-- ["ctrl-r"]   = { actions.toggle_ignore }
				},
				no_header = false, -- hide grep|cwd header?
				no_header_i = false, -- hide interactive header?
			},
		}

		local keymap = vim.keymap

		-- Find Files
		keymap.set("n", "<leader>f", ":lua require'fzf-lua'.files()<CR>", {})
		-- Live Grep
		keymap.set("n", "<leader>F", ":lua require'fzf-lua'.live_grep()<CR>", {})
	end,
}
