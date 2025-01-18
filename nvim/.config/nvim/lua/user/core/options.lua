local opt = vim.opt

-- search settings
opt.smartcase = true -- if you include mixed case in your search, assumes case-sensitive
opt.incsearch = true -- while typing search pattern, highlight matches so far
opt.ignorecase = true -- ignore case when searching
opt.hlsearch = false -- highlight all matches on previous search pattern

opt.number = true -- get absolute line of cursor
opt.relativenumber = true -- set relative line numbers

-- tabs & indentation
opt.tabstop = 2 -- spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = false -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

opt.wrap = false -- line wrapping

-- appearance
opt.cursorline = false -- highlight the current line
opt.termguicolors = true -- helps with themes
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.showtabline = 0
opt.showmode = false -- see things like -- INSERT --
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.laststatus = 0 -- last window will not have a status line

opt.shortmess = opt.shortmess
	+ {
		c = true, -- Do not show completion messages in command line
		F = true, -- Do not show file info when editing a file, in the command line
		W = true, -- Do not show "written" in command line when writing
		I = true, -- Do not show intro message when starting Vim
	}

-- backups
opt.hidden = false -- persist background buffers on close
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.undofile = true -- enable persistent undo
opt.swapfile = false -- creates a swapfile
opt.updatecount = 0

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard as default register

-- split windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8" -- the encoding written to a file

-- scrolling
opt.scrolloff = 16
opt.sidescrolloff = 8

-- misc
opt.ruler = false
opt.iskeyword:append "-" -- considers hyphens part of a word
opt.updatetime = 0 -- faster completion (4000ms default)
opt.timeoutlen = 1000
