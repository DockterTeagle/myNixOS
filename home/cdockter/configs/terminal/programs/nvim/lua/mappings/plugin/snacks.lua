local map = vim.keymap.set
-- Snacks Picker
map("n", "<leader>fm", function()
	Snacks.picker.marks()
end, { desc = "find marks" })
map("n", "<leader>ff", function()
	Snacks.picker.smart()
end, { desc = "find files using snacks" })
map("n", "<leader>fw", function()
	Snacks.picker.grep()
end, { desc = "Snacks grep" })
