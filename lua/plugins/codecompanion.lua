return {
	"olimorris/codecompanion.nvim",
	cmd = { "CodeCompanionChat", "CodeCompanion" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			deepseek = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "Deepseek reasoning",
					env = vim.env.OLLAMA_URL,
					schema = {
						model = {
							default = "deepseek-r1:7b",
						},
					},
				})
			end,
			llama3 = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "llama3",
					env = vim.env.OLLAMA_URL,
					schema = {
						model = {
							default = "llama3.2:latest",
						},
					},
				})
			end,
			qwen = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "qwen",
					env = vim.env.OLLAMA_URL,
					schema = {
						model = {
							default = "qwen2.5-coder:7b",
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "qwen",
				slash_commands = {
					["file"] = {
						callback = "strategies.chat.slash_commands.file",
						description = "Select a file using Fzf",
						opts = {
							provider = "snacks",
							contains_code = true,
						},
					},
				},
			},
		},
	},
}
