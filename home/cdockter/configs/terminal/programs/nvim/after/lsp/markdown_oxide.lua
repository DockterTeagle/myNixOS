---@type vim.lsp.ClientConfig
return {
  capabilities = { general = { positionEncodings = { "utf-8" } } },
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  root_markers = {
    ".git",
    ".obsidian",
    ".moxide.toml",
  },
}
