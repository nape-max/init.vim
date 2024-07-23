-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- Colorschema
    use({ "rose-pine/neovim", as = "rose-pine" })

    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        event = "BufEnter",
        config = function()
            require("configs.lualine")
        end,
        requires = { "nvim-web-devicons" },
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("configs.treesitter")
        end,
    })

    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lsp")
        end,
    })

    use("onsails/lspkind-nvim")
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.3.0",
    })

    -- cmp: Autocomplete
    use({
        "hrsh7th/nvim-cmp",
        as = "cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
    })

    use("hrsh7th/cmp-nvim-lsp")

    use({ "hrsh7th/cmp-path", after = "cmp" })

    use({ "hrsh7th/cmp-buffer", after = "cmp" })

    -- LSP diagnostics, code actions, and more via Lua.
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("configs.null-ls")
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Harpoon (Buffer Manager)
    use({
        "ThePrimeagen/harpoon",
        config = function()
            require("configs.harpoon")
        end,
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Toggle comment
    use({
        "terrortylor/nvim-comment",
        config = function()
            require("configs.nvim-comment")
        end,
    })

    -- Which-Key
    use({
        "folke/which-key.nvim",
        config = function()
            require("configs.which-key")
        end,
    })
end)
