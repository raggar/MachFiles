return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require "mason"

		-- import mason-lspconfig
		local mason_lspconfig = require "mason-lspconfig"

		local mason_tool_installer = require "mason-tool-installer"

		-- enable mason and configure icons
		-- NOTE: mason is used to install lsp, linters, formatters but they should be used in formatting.lua and linting.lua
		mason.setup {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		}

		mason_lspconfig.setup {
			-- lsp servers
			ensure_installed = {
				"lua_ls",
			},
		}

		-- formatters and linters
		mason_tool_installer.setup {
			ensure_installed = {
				"stylua", -- lua formatter
			},
		}
	end,
}
