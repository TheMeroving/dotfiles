return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		-- Imposta l'icona del breakpoint

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
	keys = {
		{ "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", desc = "Debug toggle" },
		{ "<leader>dh", "<cmd>lua require('dapui').eval()<cr>", desc = "Debug variable evaluation" },
	},
}
