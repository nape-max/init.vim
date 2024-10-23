local global = vim.g
local o = vim.o

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.scriptencoding = "utf-8"

-- Map <leader>
global.mapleader = " "
global.maplocalleader = " "

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Wrap Line
vim.opt.wrap = false

-- Some settings which i do not know what is it
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "98" -- 3 символа это служебные колонки, код начинается с 3

-- Folding
local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
