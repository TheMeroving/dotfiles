return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Debug Breakpoint toggle" },
		{ "<leader>ds", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
		{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
		{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
		{ "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Debug terminate" },
	},
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
	end,
}
