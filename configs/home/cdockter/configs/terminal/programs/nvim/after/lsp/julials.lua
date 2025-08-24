---@type vim.lsp.ClientConfig
return {
  cmd = { "julia", "--startupfile=no", "--history-file=no" },
  filetypes = { "julia" },
  root_markers = { "Project.toml", "JuliaProject.toml" },
}
