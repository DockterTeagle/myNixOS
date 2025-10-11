---@type vim.lsp.ClientConfig
return {
  capabilities = { general = { positionEncodings = { "utf-8" } } },
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", ".git" },
}
