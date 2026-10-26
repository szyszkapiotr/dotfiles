return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- update_cwd = true,
			-- open_on_setup_file = true,
			-- actions = {
			--   open_file = {
			--     resize_window = true,
			--   },
			-- },
			--
			git = {
				enable = false,
				ignore = false,
				timeout = 500,
			},

			view = {
				side = "left",
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			filters = {
				dotfiles = false,
			},
			diagnostics = {
				enable = true,
			},
		})
		-- :q on the last file window would leave the tree as the only window; close it so nvim exits.
		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				if vim.bo.filetype == "NvimTree" then
					return
				end
				local wins = vim.tbl_filter(function(w)
					return vim.api.nvim_win_get_config(w).relative == ""
				end, vim.api.nvim_list_wins())
				if #wins == 2 and require("nvim-tree.api").tree.is_visible() then
					require("nvim-tree.api").tree.close()
				end
			end,
		})
	end,
}
