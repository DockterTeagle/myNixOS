local map = vim.keymap.set
map("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", { desc = "Window Left" })
map("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", { desc = "windowup" })
