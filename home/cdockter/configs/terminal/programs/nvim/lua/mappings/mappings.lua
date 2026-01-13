local map = vim.keymap.set

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- Basic command macros
map(
  { "n", "v" },
  "\\y",
  [["+y]],
  { silent = true, desc = "Copy to System Clipboard" }
)
map("n", "\\Y", [["+Y]], { silent = true, desc = "Copy to system clipboard" })

-- Delete to void register
map(
  { "n", "v" },
  "\\D",
  [["_d]],
  { silent = true, desc = "Delete to void register" }
)

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "next Todo Comment" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
map(
  "n",
  "<leader>tqt",
  "<cmd>Trouble qflist toggle<CR>",
  { desc = "Toggle qflist with trouble" }
)
map(
  "n",
  "<leader>tdt",
  "<CMD>Trouble diagnostics toggle<CR>",
  { desc = "toggle diagnostics through trouble" }
)

-- vim.keymap.del("n", "<C-]>")
-- vim.keymap.del("n", "<C-t>", { buffer = bufnr })
map(
  { "n", "x" },
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { desc = "Down", expr = true, silent = true }
)
map(
  { "n", "x" },
  "<Down>",
  "v:count == 0 ? 'gj' : 'j'",
  { desc = "Down", expr = true, silent = true }
)
map(
  { "n", "x" },
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { desc = "Up", expr = true, silent = true }
)
map(
  { "n", "x" },
  "<Up>",
  "v:count == 0 ? 'gk' : 'k'",
  { desc = "Up", expr = true, silent = true }
)
map("n", "<leader>-", "<CMD>Yazi<CR>")
map(
  "n",
  "<leader>tt",
  "<CMD>Trouble todo<CR>",
  { desc = "toggle trouble todo" }
)
map("n", '"', function()
  Snacks.picker.registers()
end)
vim.api.nvim_create_autocmd("User", {
  pattern = "ObsidianNoteEnter",
  callback = function(ev)
    map(
      "n",
      "<localleader>ch",
      "<CMD>Obsidian toggle_checkbox<CR>",
      { buffer = ev.buf, desc = "Toggle Checkbox" }
    )
    map(
      "n",
      "<leader>fw",
      "<CMD>Obsidian search<CR>",
      { buffer = ev.buf, desc = "search with obsidian", noremap = true }
    )
    map(
      "n",
      "<leader>ft",
      "<CMD>Obsidian tags<CR>",
      { buffer = ev.buf, desc = "Find Tags with Obsidian" }
    )
    map(
      "n",
      "<leader>ff",
      "<CMD>Obsidian quick_switch<CR>",
      { buffer = ev.buf, desc = "Quickly find a note" }
    )
  end,
})
-- vim.keymap.set("n", "K", "<CMD>LspUI hover<CR>")
map("n", "<leader>ou", "<CMD>Outline<CR>", { desc = "toggle outline" })
