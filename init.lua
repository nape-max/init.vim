require("settings")
require("plugins")
require("maps") -- key mappings
require("autocommands")

require("catppuccin").setup({ flavour = "macchiato" })

-- colorscheme config: kanagawa
-- local themeStatus, kanagawa = pcall(require, "rose-pine")

--if themeStatus then
vim.cmd("colorscheme catppuccin")
--else
--    return
--end
