local map = vim.keymap.set
map("n", "<leader>ng", "<CMD>Neogit<CR>", { desc = "open Neogit" })
map("n", "<leader>gh", function()
  Snacks.picker.gh_issue()
end, { desc = "github issues" })
