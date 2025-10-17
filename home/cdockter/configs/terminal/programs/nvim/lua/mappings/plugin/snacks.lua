local map = vim.keymap.set
-- Snacks Picker
map("n", "<leader>fm", function()
  Snacks.picker.marks()
end, { desc = "find marks" })
map("n", "<leader>ff", function()
  require("fff").find_files()
end, { desc = "find files fast" })
map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "Snacks grep" })
map("n", "<leader>ft", function()
  Snacks.picker.todo_comments()
end, { desc = "find todo" })
