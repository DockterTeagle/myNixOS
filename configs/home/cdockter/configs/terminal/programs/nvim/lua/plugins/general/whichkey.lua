---@module "lazy"
---@type LazySpec
return {
  "folke/which-key.nvim",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
    },
  },
  event = "VeryLazy",
  opts = { preset = "modern" },
  keys = {
    "<leader>",
    "<c-r>",
    "<c-w>",
    '"',
    "'",
    "`",
    "c",
    "v",
    "g",
  },
}
