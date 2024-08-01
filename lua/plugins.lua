-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use({ "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" })

	-- Icons
	use({ "nvim-tree/nvim-web-devicons", commit = "5be6c4e685618b99c3210a69375b38a1202369b4" })

	-- Colorschema
	use({ "rose-pine/neovim", as = "rose-pine", commit = "e4b08d74b7272cb21e4e9c71b8b9e0830fd722fe" })

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		commit = "544dd1583f9bb27b393f598475c89809c4d5e86b",
		requires = { "nvim-web-devicons" },
	})

	-- Git Blame
	use({
		"f-person/git-blame.nvim",
		commit = "50543e3993f4b996eea01ff5ccc8fe2a354c5388",
		config = function()
			require("configs.gitblame")
		end,
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
		commit = "f197a15b0d1e8d555263af20add51450e5aaa1f0",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
		commit = "a0bbec21143c7bc5f8bb02e0005fa0b982edc026",
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
		commit = "cf3dd4a290084a868fac0e2e876039321d57111c",
	})

	use({ "onsails/lspkind-nvim", commit = "cff4ae321a91ee3473a92ea1a8c637e3a9510aec" })
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		commit = "03c8e67eb7293c404845b3982db895d59c0d1538",
	})

	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		as = "cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
		commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
	})

	use({ "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" })

	use({ "hrsh7th/cmp-path", after = "cmp", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" })

	use({ "hrsh7th/cmp-buffer", after = "cmp", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })

	-- LSP diagnostics, code actions, and more via Lua.
	-- @DEPRECATED
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
		commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7",
	})

	-- Harpoon (Buffer Manager)
	use({
		"ThePrimeagen/harpoon",
		config = function()
			require("configs.harpoon")
		end,
		requires = { { "nvim-lua/plenary.nvim" } },
		commit = "0378a6c428a0bed6a2781d459d7943843f374bce",
	})

	-- Toggle comment
	use({
		"terrortylor/nvim-comment",
		config = function()
			require("configs.nvim-comment")
		end,
		commit = "e9ac16ab056695cad6461173693069ec070d2b23",
	})

	-- Which-Key
	use({
		"folke/which-key.nvim",
		config = function()
			require("configs.which-key")
		end,
		commit = "6c1584eb76b55629702716995cca4ae2798a9cca",
	})
end)
