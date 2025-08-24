---@type vim.lsp.ClientConfig
return {
  cmd = { "basedpyright-langserver", "--stdio" },
  capabilities = {
    general = { positionEncodings = { "utf-8" } },
  },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  filetypes = { "python" },
}
