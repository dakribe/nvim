return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
			options = {
				theme = "auto",
				disabled_filetypes = {
					statusline = {
						"dashboard",
					},
				},
			},
		})
	end,
}
