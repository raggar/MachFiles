local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local configure_on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- show definition, references
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	-- keymap.set("n", "dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	-- keymap.set("n", "dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	-- keymap.set("n", "dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
		keymap.set("n", "<leader>ri", ":TypescriptOrganizeImports<CR>") -- organize imports
	end

	if client.name == "ccls" then
		client.offset_encoding = "utf-16"
	end
end

local file_exists = function(path)
	local f = io.open(path, "r")
	if f ~= nil then
		f.close()
		return true
	else
		return false
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["gopls"].setup {
	capabilities = capabilities,
	on_attach = configure_on_attach,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- Disable virtual_text
			virtual_text = false,
			underline = false,
			update_in_insert = false,
		}),
	},
	settings = {
		gopls = {
			codelenses = {
				gc_details = false,
				generate = false,
				regenerate_cgo = false,
				test = false,
				tidy = false,
				upgrade_dependency = false,
				vendor = false,
			},
			directoryFilters = {
				"-console/node_modules",
				"-e2e-tests/node_modules",
				"-node_modules",
				"-pkg/ui/node_modules",
				"-pkg/ui/workspaces/cluster-ui/node_modules",
				"-pkg/ui/workspaces/db-console/node_modules",
				"-bazel-bin",
				"-bazel-out",
				"-bazel-testlogs",
				"-bazel-mypkg",
			},
			linksInHover = false,
		},
	},
}

typescript.setup {
	server = {
		capabilities = capabilities,
		on_attach = configure_on_attach,
	},
}

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup {
	capabilities = capabilities,
	on_attach = configure_on_attach,
	settings = {
		-- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
		},
	},
}
