return {
	-- Core DAP plugin
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
		},
	},
	-- Python adapter for DAP
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		config = function()
			-- It's crucial to point this to a Python path that can import `debugpy`.
			-- This can be the Python in your project's `uv` virtual environment.
			local python = vim.fn.getcwd() .. "/.venv/bin/python"
			require("dap-python").setup(python)
		end,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	-- UI for DAP
	{
		"rcarriga/nvim-dap-ui",
		config = true,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle Debug UI",
			},
		},
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
