---@type vim.lsp.ClientConfig
return {
	capabilities = { general = { positionEncodings = { "utf-16" } } },
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = { "ty.toml", "pyproject.toml", ".git" },
}
