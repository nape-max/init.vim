vim.keymap.set("n", "<C-w>", "<cmd>:wincmd w<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>:wincmd p<cr>")

-- Перевод inline аргументов в многострочные в Golang
vim.keymap.set(
	"n",
	"<leader>s",
	"_/[a-zA-Z](<CR>vi(<Esc>%v$:s/\\%V(\\(.*\\))\\( [^{]\\)\\?/(\\r\\1,\\r)\\2<CR>v%:s/\\%V, /,\\r/g<CR>vi):s/\\%V\\([a-z]\\)/\\t\\1<CR>"
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
