local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	vim.keymap.set("n", "<leader>fb", telescope.buffers)
	vim.keymap.set("n", "<leader>fh", telescope.help_tags)
	vim.keymap.set("n", "<leader>fc", telescope.git_commits)

	vim.keymap.set('n', '<leader>pff', telescope.find_files, { desc = "Project Search: Find Files" })
	vim.keymap.set('n', '<leader>pfs', telescope.live_grep, { desc = "Project Search: Live Grep" })
	vim.keymap.set('n', '<leader>pfg', telescope.git_files, { desc = "Project Search: Git Files" })
else
	print("Telescope not found")
end

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project Explorer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
