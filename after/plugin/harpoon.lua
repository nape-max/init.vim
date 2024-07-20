local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add to" })
vim.keymap.set("n", "<leader>c", mark.clear_all, { desc = "Harpoon: Clear all" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon: Open UI" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
