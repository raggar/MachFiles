local opt = vim.opt

-- line wrapping
opt.wrap = false

-- search settings
opt.smartcase = true
opt.incsearch = true
opt.ignorecase = true
opt.hlsearch = false -- highlight all matches on previous search pattern

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- allow mouse
-- opt.mouse = ""

-- appearance
opt.cursorline = true -- highlight the current line
opt.termguicolors = true -- helps with themes
opt.background = "dark" -- make themes with light and dark options default to dark
opt.signcolumn = "yes"
opt.showtabline = 0
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.showmode = false -- see things like -- INSERT --
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.pumheight = 10 -- pop up menu height
opt.laststatus = 0

opt.shortmess = opt.shortmess
	+ {
		c = true, -- Do not show completion messages in command line
		F = true, -- Do not show file info when editing a file, in the command line
		W = true, -- Do not show "written" in command line when writing
		I = true, -- Do not show intro message when starting Vim
	}

-- backups
opt.hidden = true -- persist background buffers on close
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.undofile = true -- enable persistent undo
opt.swapfile = false -- creates a swapfile
opt.updatecount = 0

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append "unnamedplus" -- tell neovim to use system clipboard

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
