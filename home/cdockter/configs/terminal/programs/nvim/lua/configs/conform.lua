---@module "conform"
---@type conform.setupOpts
local options = {
  formatters = {
    treefmt = {
      require_cwd = false,
    },
    injected = {
      options = {
        ignore_errors = true,
        lang_to_ft = {
          bash = "sh",
        },
        lang_to_ext = {
          bash = "sh",
          c_sharp = "cs",
          elixir = "exs",
          javascript = "js",
          julia = "jl",
          latex = "tex",
          plaintex = "tex",
          markdown = "md",
          python = "py",
          ruby = "rb",
          rust = "rs",
          teal = "tl",
          typescript = "ts",
          yaml = "yaml",
        },
      },
    },
  },
  formatters_by_ft = {
    markdown = { "injected" },
    ["*"] = { "treefmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
return options
