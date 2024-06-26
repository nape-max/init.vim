require('nvim_comment').setup({line_mapping = "<leader>/l", operator_mapping = "<leader>/", comment_chunk_text_object = "ic"})

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
    -- displayed as / (// for escaping character)
    ["/"] = {
        name = "Toggle Comment",
    }
}
require('which-key').register(mappings, opts)
