local wk = require("which-key")
local harpoon = require("harpoon")

local status, telescope = pcall(require, "telescope.builtin")
if not status then
	print("Telescope not found")
	return
end

-- "+y -> a lot of helpers to work with Yank
-- " -> system buffer access

wk.add({
	{ "<leader>g", mode = { "n" }, group = "Git" },
	{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Blame" },
	{
		"<leader>a",
		function()
			harpoon:list():add()
		end,
		mode = "n",
		desc = "Harpoon: Add file",
	},
	{
		"<leader>c",
		function()
			harpoon:list():clear()
		end,
		mode = "n",
		desc = "Harpoon: Clear",
	},
	{ "<leader>f", group = "File" },
	{
		mode = { "n" },
		desc = "File",
		{
			"<leader>fb",
			function()
				telescope.find_files()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				telescope.help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fc",
			function()
				telescope.git_commits()
			end,
			desc = "Commits",
		},
	},
	{ "<leader>p", group = "Project" },
	{ "<leader>pv", "<cmd>Ex<cr>", desc = "Explorer" },
	{ "<leader>pf", group = "Search" },
	{
		{
			"<leader>pff",
			function()
				telescope.find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>pfs",
			function()
				telescope.live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>pfc",
			function()
				-- if you want something, search by keyword: "vimgrep_arguments"
				telescope.live_grep({ additional_args = { "-s" } })
			end,
			desc = "Live Grep (case sensitive)",
		},
		{
			"<leader>pfg",
			function()
				telescope.git_files()
			end,
			desc = "Git Files",
		},
	},
})
