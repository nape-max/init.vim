local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pff', builtin.find_files, {desc = "Project Search: Find Files"})
vim.keymap.set('n', '<leader>pfs', builtin.live_grep, {desc = "Project Search: Live Grep"})
vim.keymap.set('n', '<leader>pfg', builtin.git_files, {desc = "Project Search: Git Files"})
--vim.keymap.set('n', '<leader>', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") });
--end)
