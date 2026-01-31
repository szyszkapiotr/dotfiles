return {
	"cuducos/yaml.nvim",
	ft = { "yaml" }, -- optional
	dependencies = {
		"folke/snacks.nvim", -- optional
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = function()
		require("yaml_nvim").setup({ ft = { "yaml", "other yaml filetype" } })
	end,
}
