return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = { "LazyGit" },
		keys = { {
			"<leader>lg",
			"<cmd>LazyGit<cr>",
			desc = "LazyGit",
		} },
	},
}
