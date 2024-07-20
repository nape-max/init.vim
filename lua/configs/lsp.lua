local status, nvim_lsp = pcall(require, "lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")
if not status then
	return
end

-- Inject Brief LSP
if not configs.briefls then
	configs.briefls = {
		default_config = {
			cmd = { "briefls" },
			filetypes = { "brief" },
			root_dir = function(fname)
				return util.root_pattern(".git")(fname)
			end,
			single_file_support = true,
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
		},
		settings = {},
	}
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Tailwind
--nvim_lsp.tailwindcss.setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--})

-- Golang
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.filetype.add({ extension = { brief = 'brief' } })
-- Setup server
nvim_lsp.briefls.setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
})
