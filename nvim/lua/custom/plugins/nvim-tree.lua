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
	end,
}
