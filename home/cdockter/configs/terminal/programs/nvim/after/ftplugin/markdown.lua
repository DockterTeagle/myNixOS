local map = vim.keymap.set
vim.lsp.enable { "markdown_oxide", "vale_ls", "harper_ls" }
map("n", "gO", "<cmd>Trouble loclist<CR>", { desc = "Symbols (Trouble)" })
vim.treesitter.start()
