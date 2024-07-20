local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fc", telescope.git_commits)

	map('n', '<leader>pff', telescope.find_files, "Project Search: Find Files")
	map('n', '<leader>pfs', telescope.live_grep, "Project Search: Live Grep")
	map('n', '<leader>pfg', telescope.git_files, "Project Search: Git Files")
else
	print("Telescope not found")
end

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project Explorer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
