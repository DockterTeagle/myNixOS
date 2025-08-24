vim.keymap.set(
  "n",
  "<localleader>K",
  "<plug>(vimtex-doc-package)",
  { desc = "open vimtex Docs" }
)
vim.lsp.enable { "texlab" }
