return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
	config = function()
		require("auto-session").setup({
			pre_save_cmds = { "NvimTreeClose" },
			save_extra_cmds = {
				"NvimTreeOpen",
			},
		})
	end,
}
