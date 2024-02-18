local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",

		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	"nvim-lua/plenary.nvim", -- Useful lua functions used by many plugins,
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- filetree
	"nvim-tree/nvim-tree.lua",

	-- bufferline
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	-- icons
	{ "nvim-tree/nvim-web-devicons", cmd = "NvimTree" },

	-- bracket keymaps (for buffers, quickfix etc.)
	{ "tpope/vim-unimpaired" },

	-- indentation
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- editing
	"tpope/vim-surround", -- Change surrounding quotes, brackets, etc.

	-- colorscheme
	{ "catppuccin/nvim", name = "catppuccin" },

	-- tmux synergy
	"christoomey/vim-tmux-navigator",
	"preservim/vimux",

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	-- autocompletion
	{
		"hrsh7th/nvim-cmp", -- The completion plugin
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-nvim-lsp", -- for autocompletion
			-- snippets
			"L3MON4D3/LuaSnip", --snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		},
	},

	-- lsp
	{
		"neovim/nvim-lspconfig", -- easily configure language servers
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"glepnir/lspsaga.nvim", -- managing & installing lsp servers, linters, and formatters
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	{
		"simrat39/symbols-outline.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- maximize vim splits
	"szw/vim-maximizer",

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update { with_sync = true })
		end,
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- telescope
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- git
	"lewis6991/gitsigns.nvim", -- view diff
	"f-person/git-blame.nvim", -- blame
	{
		"almo7aya/openingh.nvim",
	},

	-- lazy git
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- debugging
	-- "mfussenegger/nvim-dap",
	-- { "leoluz/nvim-dap-go", dependencies = { "mfussenegger/nvim-dap" } },
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	-- { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },

	-- lf file tree search
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"lmburns/lf.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
