---@module "lazy"
---@type LazySpec
return {
  {
    "yannvanhalewyn/jujutsu.nvim",
    cmd = { "JJ" },
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function()
      require("jujutsu-nvim").setup {
        diff_preset = "diffview",
      }
    end,
  },
}
