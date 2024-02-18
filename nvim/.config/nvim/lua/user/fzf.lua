local actions = require "fzf-lua.actions"
local status, fzf = pcall(require, "fzf-lua")

if not status then
	return
end

local RIP_OPTS =
	"--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!{**/raycast/*, **/tmux/plugins/*, **/karabiner/automatic_backups/**}'"

fzf.setup {
	files = {
		previewer = "bat", -- uncomment to override previewer
		-- (name from 'previewers' table)
		-- set to 'false' to disable
		multiprocess = true, -- run command in a separate process
		git_icons = true, -- show git icons?
		file_icons = true, -- show file icons?
		color_icons = true, -- colorize file|git icons
		fd_opts = "${FD_DEFAULT_OPTS}",
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
	fzf_opts = {
		-- options are sent as `<left>=<right>`
		-- set to `false` to remove a flag
		-- set to '' for a non-value flag
		-- for raw args use `fzf_args` instead
		["--ansi"] = "",
		["--info"] = "inline",
		["--height"] = "100%",
		["--layout"] = "reverse",
		["--border"] = "none",
	},
	-- Only used when fzf_bin = "fzf-tmux", by default opens as a
	-- popup 80% width, 80% height (note `-p` requires tmux > 3.2)
	-- and removes the sides margin added by `fzf-tmux` (fzf#3162)
	-- for more options run `fzf-tmux --help`
	fzf_tmux_opts = { ["-p"] = "80%,80%", ["--margin"] = "0,0" },
	grep = {
		prompt = "Rg❯ ",
		multiprocess = true, -- run command in a separate process
		git_icons = true, -- show git icons?
		file_icons = false, -- show file icons?
		color_icons = true, -- colorize file|git icons
		-- executed command priority is 'cmd' (if exists)
		-- otherwise auto-detect prioritizes `rg` over `grep`
		-- default options are controlled by 'rg|grep_opts'
		-- cmd            = "rg --vimgrep",
		grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
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
