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

-- Undo breakpoints
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)

-- Keep cursor at beginning of line when appending to end
keymap("n", "J", "mzJ`z", opts)

-- Preserve paste register
keymap("v", "<leader>p", "\"_dP", opts) -- upon paste
keymap("n", "x", "\"_x", opts) -- upon single deletion

-- Vertical and horizontal splits
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)
keymap("n", "<leader>sx", ":close<CR>", opts)
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

keymap("n", "<leader>sl", ":SymbolsOutline<CR>", opts)

-- Cursor won't jump back to original position when yanking
keymap("v", "y", "ygv<esc>", opts)

-- Quit
keymap("n", "<leader>q", ":q!<CR>", opts)

-- Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Find Files
keymap("n", "<leader>f", ":lua require'fzf-lua'.files()<CR>", opts)

-- Live Grep
keymap("n", "<leader>F", ":lua require'fzf-lua'.live_grep()<CR>", opts)

-- List Marks
keymap("n", "<leader>m", ":lua require(\"telescope.builtin\").marks()<CR>", opts)

-- Buffers
keymap("n", "<leader>c", ":bd<CR>", opts)
keymap("n", "<leader>b", ":lua require(\"telescope.builtin\").buffers()<CR>", opts)

-- Vimux
keymap("n", "<leader>to", ":VimuxOpenRunner<CR>", opts)
keymap("n", "<leader>tc", ":VimuxCloseRunner<CR>", opts)

-- Git
keymap("n", "<leader>gs", ":lua require(\"telescope.builtin\").git_status()<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)

-- Git repo
keymap("n", "<leader>gr", ":OpenInGHRepo<CR>", opts)
keymap("n", "<leader>gf", ":OpenInGHFile<CR>", opts)
keymap("n", "<leader>gl", ":OpenInGHFileLines<CR>", opts)

-- Lf
keymap("n", "<leader>lf", ":lua require('lf').start()<CR>", opts)

-- Lazy Git
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

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
