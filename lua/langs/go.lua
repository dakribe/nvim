---@type LazySpec[]
return {
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {},
			},
		},
	},
}
