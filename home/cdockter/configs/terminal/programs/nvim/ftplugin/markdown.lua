local map = vim.keymap.set
vim.lsp.enable { "harper_ls", "markdown_oxide" }
map("n", "gO", "<cmd>Trouble loclist<CR>", { desc = "Symbols (Trouble)" })
vim.treesitter.start()
