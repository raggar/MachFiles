vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]]

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "~/.config/tmux/tmux.conf" },
	command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
	pattern = { "*.mdx", "*.md" },
	callback = function()
		vim.cmd [[set filetype=markdown wrap linebreak nolist nospell]]
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { ".yabairc" },
	command = "!yabai --restart-service",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { ".skhdrc" },
	command = "!brew services restart skhd",
})
