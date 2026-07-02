---@type vim.lsp.Config
return {
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = { "ty.toml", "pyproject.toml", ".git" },
	-- ty owns types/hover/go-to-def/completion. ruff (lsp/ruff.lua) owns
	-- lint/format/imports with its hover disabled, so no overlap.
	init_options = {
		settings = {
			-- "openFilesOnly" (default) or "workspace" to check the whole project.
			-- diagnosticMode = "workspace",
			-- experimental = { rename = true, autoImport = true },
			-- logLevel = "info",
		},
	},
}
