require("settings")
require("plugins")
require("maps") -- key mappings

-- colorscheme config: kanagawa
local themeStatus, kanagawa = pcall(require, "rose-pine")

if themeStatus then
	vim.cmd("colorscheme rose-pine")
else
	return
end
