vim.keymap.set("n", "<C-w>", "<cmd>:wincmd w<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>:wincmd p<cr>")

-- Перенос параметров на отдельные строки в Golang
vim.keymap.set(
    "n",
    "<leader>s",
    "_/[a-zA-Z](<CR>vi(<Esc>%v$:s/\\%V(\\(.*\\))\\( [^{]\\)\\?/(\\r\\1,\\r)\\2<CR>v%:s/\\%V, /,\\r<CR>vi):s/\\%V\\([a-z]\\)/\\t\\1<CR>"
)
