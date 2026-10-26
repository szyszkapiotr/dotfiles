-- LSP rename edits many buffers, but `u` only undoes the current one.
-- Remember which buffers the last rename touched; :RenameUndo reverts them all.
local last = {}

local orig = vim.lsp.handlers["textDocument/rename"]
vim.lsp.handlers["textDocument/rename"] = function(err, result, ctx, config)
	if result then
		local uris = vim.tbl_keys(result.changes or {})
		for _, change in ipairs(result.documentChanges or {}) do
			if change.textDocument then
				table.insert(uris, change.textDocument.uri)
			end
		end
		last = vim.tbl_map(vim.uri_to_bufnr, uris)
	end
	return orig(err, result, ctx, config)
end

vim.api.nvim_create_user_command("RenameUndo", function()
	for _, buf in ipairs(last) do
		if vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_call(buf, function()
				vim.cmd("silent undo")
			end)
		end
	end
	vim.notify(("Reverted rename in %d buffer(s)"):format(#last))
	last = {}
end, { desc = "Undo last LSP rename in every buffer it touched" })
