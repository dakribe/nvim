return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					max_lines = 3,
				},
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				endwise = {
					enable = true,
				},
			})
		end,
	},
	{ "bezhermoso/tree-sitter-ghostty", ft = "ghostty" },
}
