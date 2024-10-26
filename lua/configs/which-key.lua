local wk = require("which-key")
local harpoon = require("harpoon")

-- "+y -> a lot of helpers to work with Yank
-- " -> system buffer access

wk.add({
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
    {
        "<leader>f",
        group = "File",
        mode = { "n" },
        {
            "<leader>fg",
            mode = { "n" },
            group = "Git",
            { "<leader>fgb", "<cmd>GitBlameToggle<cr>", desc = "Blame" },
        },
    },
    {
        "<leader>g",
        group = "Going to",
        {
            "<leader>gd",
            desc = "Definition",
        },
        {
            "<leader>gi",
            desc = "Implementations",
        },
        {
            "<leader>gs",
            desc = "Signature help",
        },
        {
            "<leader>g[",
            desc = "Diagnostic: next",
        },
        {
            "<leader>g]",
            desc = "Diagnostic: prev",
        },
    },
    {
        "<leader>p",
        group = "Project",
        { "<leader>pv", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer" },
        {
            "<leader>pf",
            group = "Search",
            {
                "<leader>pff",
                desc = "Find Files",
            },
            {
                "<leader>pfs",
                desc = "Live Grep",
            },
            {
                "<leader>pfc",
                desc = "Live Grep (case sensitive)",
            },
            {
                "<leader>pfg",
                desc = "Git Files",
            },
        },
    },
})
