local bufnr = vim.api.nvim_get_current_buf()
vim.treesitter.start()
vim.keymap.set("n", "<leader>ca", function()
  vim.cmd.RustLsp "codeAction"
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "J", function()
  vim.cmd.RustLsp "joinLines"
end, { desc = "better join Lines for rust", remap = true })
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { "hover", "actions" }
  end,
  { silent = true, buffer = bufnr }
)
local on_attach = require("configs.lsp.lspconfigDefaults").on_attach
vim.g.rustaceanvim = {
  tools = {
    test_executor = "background",
    inlay_hints = {
      enable = true,
    },
  },
  server = {
    on_attach = on_attach,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          autoreload = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        checkOnSave = true,
        diagnostics = {
          enable = true,
        },
        procMacro = { enable = true },
        files = {
          excludeDirs = {
            ".direnv",
            ".git",
            ".github",
            ".gitlab",
            "bin",
            "node_modules",
            "target",
            "venv",
            ".venv",
            ".jj",
          },
        },
        completion = {
          addCallArgumentSnippets = true,
          addCallParenthesis = true,
          autoimport = { enable = true },
        },
      },
    },
  },
}
