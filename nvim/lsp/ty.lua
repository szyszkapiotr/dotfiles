---@type vim.lsp.Config
return {
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = { "ty.toml", "pyproject.toml", ".git" },
	-- ty owns types/hover/go-to-def/completion. ruff (lsp/ruff.lua) owns
	-- lint/format/imports with its hover disabled, so no overlap.
	-- ty has no LSP `settings` init option; configure via ty.toml or
	-- [tool.ty] in pyproject.toml instead.
}
