local map = vim.keymap.set
map("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "previous buffer" })
map(
  "n",
  "<S-tab>",
  "<Cmd>BufferLineCyclePrev<CR>",
  { desc = "previous buffer" }
)

map("n", "<leader>x", function()
  require("snacks").bufdelete.delete()
end, { desc = "buffer close" })
