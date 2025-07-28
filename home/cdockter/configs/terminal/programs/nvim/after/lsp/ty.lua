---@type vim.lsp.ClientConfig
return {
	cmd = { "uv", "run", "ty", "server" },
	filetypes = { "python" },
	root_markers = { "ty.toml", "pyproject.toml", ".git" },
}
