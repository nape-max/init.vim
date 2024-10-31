local status, nvim_lsp = pcall(require, "lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")
if not status then
    return
end

require("vim.lsp.protocol")

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

-- Inject vacuum LSP
if not configs.vacuum then
    configs.vacuum = {
        default_config = {
            cmd = { 'vacuum', 'language-server' },
            filetypes = { 'yaml.openapi', 'json.openapi' },
            root_dir = util.find_git_ancestor,
            single_file_support = true,
        },
        settings = {},
    }
end

local initialize_lsp_which_keys
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

    initialize_lsp_which_keys()

    vim.keymap.set("n", "<leader>gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>g[", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "<leader>g]", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>gs", function()
        vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set("", "<leader>gi", function()
        vim.lsp.buf.implementation()
    end, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- TypeScript
nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    single_file_support = false,
})
nvim_lsp.denols.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})
-- Svelte
nvim_lsp.svelte.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- JSON server
nvim_lsp.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        filetypes = { "json", "jsonc" },
        init_options = { provideFormatter = true },
    },
})

-- CSS
nvim_lsp.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Golang
nvim_lsp.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            gofumpt = true,
            codelenses = {
                gc_details = true,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
            -- Required for correct LSP work inside Integrations tests.
            buildFlags = { "-tags=integration" },
        },
    },
})

-- OpenAPI
vim.filetype.add {
    pattern = {
        ['openapi.*%.ya?ml'] = 'yaml.openapi',
        ['schema.ya?ml'] = 'yaml.openapi',
        ['openapi.*%.json'] = 'json.openapi',
    },
}
nvim_lsp.vacuum.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.filetype.add({ extension = { brief = "brief" } })
-- Setup server
nvim_lsp.briefls.setup({
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities,
})

-- nvim_lsp.sqlls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

function initialize_lsp_which_keys()
    local wk = require("which-key")

    wk.add({
        {
            "<leader>v",
            group = "Code",
            {
                "<leader>vd",
                function()
                    vim.diagnostic.open_float()
                end,
                desc = "Open Float",
            },
            {
                "<leader>vc",
                group = "Code",
                {
                    "<leader>vca",
                    function()
                        vim.lsp.buf.code_action()
                    end,
                    desc = "Actions",
                },
            },
            {
                "<leader>vi",
                desc = "Toggle inlay hints",
            },
            {
                "<leader>vr",
                group = "Element",
                {
                    "<leader>vrr",
                    function()
                        vim.lsp.buf.references()
                    end,
                    desc = "References",
                },
                {
                    "<leader>vrn",
                    function()
                        vim.lsp.buf.rename()
                    end,
                    desc = "Rename",
                },
            },
            {
                "<leader>vw",
                group = "Workspace",
                {
                    "<leader>vws",
                    function()
                        vim.lsp.buf.workspace_symbol()
                    end,
                    desc = "Find Symbol",
                },
            },
        },
    })
end
