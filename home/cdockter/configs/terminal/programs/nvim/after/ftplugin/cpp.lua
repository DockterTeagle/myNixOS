vim.lsp.enable { "clangd", "harper_ls" }
vim.keymap.set(
  "n",
  "<localleader>ch",
  "<cmd>ClangdSwitchSourceHeader<cr>",
  { desc = "Switch Source/Header", buffer = true }
)
