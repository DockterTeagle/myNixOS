local wk = require "which-key"
local map = vim.keymap.set

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

wk.add {
  { "<leader>f", group = "find" },
  { "<leader>n", group = "Neo" },
  { "<leader>gh", group = "(g)it (h)unk" },
  { "<leader>t", group = "trouble" },
  { "\\", group = "Core" },
  { "<leader>l", group = "lsp" },
  { "<leader>ls", group = "signature" },
  { "<leader>lc", group = "code" },
}
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
vim.keymap.set("n", "zR", function()
  require("ufo").openAllFolds()
end, { desc = "open All Folds(ufo)" })
map("n", "zM", function()
  require("ufo").closeAllFolds()
end, { desc = "close all Folds(UFO)" })
vim.keymap.set("n", "zr", function()
  require("ufo").openFoldsExceptKinds()
end, { desc = "open Folds Except Kinds" })
vim.keymap.set("n", "zm", function()
  require("ufo").closeFoldsWith()
end, { desc = "closed all folds with simlair properties " })
-- vim.keymap.set("n", "K", function()
--   local winid = require("ufo").peekFoldedLinesUnderCursor()
--   if not winid then
--     require("LspUI").api.hover
--   end
-- end, { desc = "super key for LSP and fold" })
vim.keymap.set(
  "n",
  "<leader>tqt",
  "<cmd>Trouble qflist toggle<CR>",
  { desc = "Toggle qflist with trouble" }
)
vim.keymap.set(
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
map("n", "-", "<CMD>Yazi<CR>")
map(
  "n",
  "<leader>tt",
  "<CMD>Trouble todo<CR>",
  { desc = "toggle trouble todo" }
)
vim.keymap.set("n", '"', function()
  Snacks.picker.registers()
end)
vim.api.nvim_create_autocmd("User", {
  pattern = "ObsidianNoteEnter",
  callback = function(ev)
    vim.keymap.set(
      "n",
      "<localleader>ch",
      "<CMD>Obsidian toggle_checkbox<CR>",
      { buffer = ev.buf, desc = "Toggle Checkbox" }
    )
    vim.keymap.set(
      "n",
      "<leader>ff",
      "<CMD>Obsidian search<CR>",
      { buffer = ev.buf, desc = "search with obsidian", noremap = false }
    )
    vim.keymap.set(
      "n",
      "<leader>ft",
      "<CMD>Obsidian tags<CR>",
      { buffer = ev.buf, desc = "Find Tags with Obsidian" }
    )
    vim.keymap.set(
      "n",
      "<leader>fF",
      "<CMD>Obsidian quick_switch<CR>",
      { buffer = ev.buf, desc = "Quickly find a note" }
    )
  end,
})
vim.keymap.set("n", "K", "<CMD>LspUI hover<CR>")
vim.keymap.set(
  "n",
  "<leader>ou",
  "<CMD>Outline<CR>",
  { desc = "toggle outline" }
)
