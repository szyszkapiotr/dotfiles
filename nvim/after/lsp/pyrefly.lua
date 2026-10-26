---@type vim.lsp.Config
return {
	cmd = { "pyrefly", "lsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
}
