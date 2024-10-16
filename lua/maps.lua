vim.keymap.set("n", "<C-w>", "<cmd>:wincmd w<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>:wincmd p<cr>")

-- Упрощение перевода inline аргументов в многострочные в Golang,
-- но происходит только вызов Code Actions в нужном месте
vim.keymap.set("n", "<leader>s", "_/[a-zA-Z](<CR>vi(<Esc>%<Right>:lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
