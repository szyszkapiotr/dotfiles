---@type vim.lsp.Config
return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	-- Ruff = linter + formatter + import sorter only. It has no type info,
	-- so let a real type checker (basedpyright / pyright / ty) own these.
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
		-- conform.nvim already runs ruff_format on save; avoid two formatters.
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	init_options = {
		settings = {
			-- Respect on-disk pyproject.toml/ruff.toml; editor settings only fill gaps.
			configurationPreference = "filesystemFirst",
			-- Auto-fix + organize imports as code actions / on fixAll.
			fixAll = true,
			organizeImports = true,
			showSyntaxErrors = true,
			lineLength = 88,
			lint = {
				enable = true,
				-- Uncomment to opt into unstable rules:
				-- preview = true,
				-- Only applied when project has no ruff config of its own:
				-- select = { "E", "F", "I", "UP", "B", "SIM" },
			},
			format = {
				-- preview = true,
			},
			codeAction = {
				disableRuleComment = { enable = true },
				fixViolation = { enable = true },
			},
		},
	},
}
