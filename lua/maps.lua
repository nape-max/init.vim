vim.keymap.set("n", "<C-h>", "<cmd>:wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>:wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>:wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>:wincmd l<cr>")

-- Упрощение перевода inline аргументов в многострочные в Golang,
-- но происходит только вызов Code Actions в нужном месте
vim.keymap.set("n", "<leader>s", "_/[a-zA-Z](<CR>vi(<Esc>%<Right>:lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
