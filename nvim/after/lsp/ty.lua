---@type vim.lsp.Config
return {
	-- Prefer the project's pinned ty (.venv) so the editor matches `just check`; fall back to Mason.
	cmd = function(dispatchers, config)
		local venv = config.root_dir and config.root_dir .. "/.venv/bin/ty"
		local exe = venv and vim.fn.executable(venv) == 1 and venv or "ty"
		return vim.lsp.rpc.start({ exe, "server" }, dispatchers, { cwd = config.root_dir })
	end,
	filetypes = { "python" },
	root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
	-- ty owns types/hover/go-to-def/completion. ruff (after/lsp/ruff.lua) owns
	-- lint/format/imports with its hover disabled, so no overlap.
	-- ty has no LSP `settings` init option; configure via ty.toml or
	-- [tool.ty] in pyproject.toml instead.
}
