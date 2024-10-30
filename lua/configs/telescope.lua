local status, telescope = pcall(require, "telescope.builtin")
if not status then
    print("Telescope not found")
    return
end

vim.keymap.set("n", "<leader>fgc", function()
    telescope.git_commits()
end)

vim.keymap.set("n", "<leader>fh", function()
    telescope.help_tags()
end)

vim.keymap.set("n", "<leader>pff", function()
    telescope.find_files()
end)

vim.keymap.set("n", "<leader>pfs", function()
    telescope.live_grep()
end)

vim.keymap.set("n", "<leader>pfc", function()
    -- if you want something, search by keyword: "vimgrep_arguments"
    telescope.live_grep({ additional_args = { "-s" } })
end)

vim.keymap.set("n", "<leader>pfg", function()
    telescope.git_files()
end)
