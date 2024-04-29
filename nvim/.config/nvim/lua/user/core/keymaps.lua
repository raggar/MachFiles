local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Center cursor upon movements
keymap("n", "N", "Nzzzv", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Undo breakpoints
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Tab code block in visual select
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)

keymap("n", "J", "mzJ`z", opts) -- Keep cursor at beginning of line when appending to end

keymap("n", "<leader>+", "<C-a>", opts) -- increment number
keymap("n", "<leader>-", "<C-x>", opts) -- decrement number

keymap("v", "<leader>p", "\"_dP", opts) -- preserve paste register upon paste
keymap("n", "x", "\"_x", opts) -- preserve paste register upon single deletion

keymap("n", "<leader>sv", ":vsplit<CR>", opts) -- vertical split
keymap("n", "<leader>sh", ":split<CR>", opts) -- horizontal split
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal size
keymap("n", "<leader>sx", ":close<CR>", opts)

-- Cursor won't jump back to original position when yanking
keymap("v", "y", "ygv<esc>", opts)

-- Quit
keymap("n", "<leader>q", ":q!<CR>", opts)

keymap("n", "<leader>sl", ":SymbolsOutline<CR>", opts)

-- Git
keymap("n", "<leader>gs", ":lua require(\"telescope.builtin\").git_status()<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)

-- Git repo
keymap("n", "<leader>gr", ":OpenInGHRepo<CR>", opts)
keymap("n", "<leader>gf", ":OpenInGHFile<CR>", opts)
keymap("n", "<leader>gl", ":OpenInGHFileLines<CR>", opts)

-- Lazy Git
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)

-- Debugging
-- keymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", opts)
-- keymap("n", "<leader>dp", ":lua require'dap-go'.debug_last_test()<CR>", opts)
-- keymap("n", "<leader>dc", ":lua require'dap'.close()<CR> <BAR>:lua require('dapui').close()<CR>", opts)
-- keymap("n", "<leader>dn", ":lua require'dap'.continue()<CR>", opts)
-- keymap("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", opts)
-- keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint()<CR>", opts)
-- keymap("n", "<leader>so", ":lua require'dap'.step_over()<CR>", opts)
-- keymap("n", "<leader>si", ":lua require'dap'.step_into()<CR>", opts)
-- keymap("n", "<leader>su", ":lua require'dap'.step_out()<CR>", opts)
