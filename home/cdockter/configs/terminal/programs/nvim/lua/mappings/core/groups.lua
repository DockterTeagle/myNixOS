local wk = require "which-key"
wk.add {
  { "<leader>f", group = "find" },
  { "<leader>n", group = "Neo" },
  { "<leader>t", group = "trouble" },
  { "\\", group = "Core" },
  { "<leader>l", group = "lsp" },
  { "<leader>ls", group = "signature" },
  { "<leader>lc", group = "code" },
}
